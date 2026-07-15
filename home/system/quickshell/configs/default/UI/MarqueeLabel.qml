import QtQuick

Item {
    id: root

    property alias text: label.text
    property alias font: label.font
    property alias color: label.color

    property int pauseDuration: 1000
    property int pixelsPerSecond: 40
    property int spacing: 40
    property real maxWidth: 500

    implicitHeight: label.implicitHeight
    implicitWidth: Math.min(label.implicitWidth, maxWidth)
    clip: true

    Text {
        id: label

        anchors.verticalCenter: parent.verticalCenter
        x: 0
        wrapMode: Text.NoWrap

        SequentialAnimation on x {
            id: marqueeAnimation
            running: label.implicitWidth > root.width
            loops: Animation.Infinite

            PauseAnimation {
                duration: root.pauseDuration
            }

            NumberAnimation {
                from: 0
                to: -(label.implicitWidth + root.spacing)
                duration: ((label.implicitWidth + root.spacing) / root.pixelsPerSecond) * 1000
                easing.type: Easing.Linear
            }

            ScriptAction {
                script: label.x = root.width
            }
        }

        Component.onCompleted: {
            if (implicitWidth <= root.width)
                x = 0;
            else
                x = 0;
        }

        onImplicitWidthChanged: {
            x = 0;
        }
    }
}
