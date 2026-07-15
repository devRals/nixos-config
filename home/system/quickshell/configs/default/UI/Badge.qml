import QtQuick

Rectangle {
    id: root
    property color background: "#" + theme.base00
    property bool hovered: false

    property int horizontalPadding: 15
    property int verticalPadding: 0

    property int cursorShape: Qt.PointingHandCursor
    property bool clickable: true
    property real maxImplicitWidth: -1 // -1 means no limit

    default property alias content: contentItem.data

    signal clicked

    radius: height / 2
    color: background
    antialiasing: true

    implicitWidth: {
        let w = contentItem.childrenRect.width + horizontalPadding * 2;
        if (maxImplicitWidth > 0 && w > maxImplicitWidth) {
            return maxImplicitWidth;
        }
        return w;
    }
    implicitHeight: contentItem.childrenRect.height + verticalPadding * 2
    border.width: hovered ? 1 : 0
    border.color: hovered ? "#" + theme.base03 : "transparent"

    Item {
        id: contentItem
        anchors.centerIn: parent
    }

    Behavior on border.color {
        ColorAnimation {
            duration: 100
        }
    }

    MouseArea {
        visible: root.clickable
        enabled: root.clickable
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        cursorShape: root.cursorShape
        hoverEnabled: true
        onClicked: root.clicked()

        onEntered: root.hovered = true
        onExited: root.hovered = false
    }
}
