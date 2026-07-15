import QtQuick
import QtQuick.Controls

Slider {
    id: root

    property color activeColor: "#" + theme.base05
    property color handleColor: "#" + theme.base05

    // Expose hover state for child components
    readonly property alias handleHovered: mainInteraction.overHandle
    property color inactiveColor: "#" + theme.base02

    signal wheelDown
    signal wheelUp

    background: Item {
        Rectangle {
            id: leftSide

            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 10
            color: root.activeColor
            implicitWidth: root.handle.x + root.handle.implicitWidth / 2
            radius: 99
        }

        // Inactive track (right side)
        Rectangle {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 11
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 11
            color: root.inactiveColor
            implicitWidth: parent.width - leftSide.implicitWidth
            radius: 99
        }
    }
    handle: Rectangle {
        property int size: root.pressed ? 32 : 28

        anchors.verticalCenter: root.verticalCenter
        border.color: "#" + theme.base01
        border.width: 4
        color: root.handleColor
        implicitHeight: size
        implicitWidth: size
        radius: 99
        x: root.visualPosition * root.availableWidth - implicitWidth / 2

        Behavior on implicitWidth {
            NumberAnimation {
                duration: 100
                easing.type: Easing.InOutQuad
            }
        }
    }

    MouseArea {
        id: mainInteraction

        property bool overHandle: {
            if (!containsMouse)
                return false;
            const handleX = root.handle.x;
            const handleWidth = root.handle.width;
            const localX = mouseX;
            return localX >= handleX && localX <= (handleX + handleWidth);
        }

        acceptedButtons: Qt.NoButton
        anchors.fill: parent
        cursorShape: overHandle ? Qt.PointingHandCursor : Qt.ArrowCursor
        hoverEnabled: true

        onWheel: event => {
            if (event.angleDelta.y > 0)
                root.wheelUp();
            else if (event.angleDelta.y < 0)
                root.wheelDown();
        }
    }
}
