import QtQuick
import QtQuick.Layouts

Rectangle {
    property color background: "#" + theme.base03

    property int horizontalPadding: 10
    property int verticalPadding: 0

    default property alias content: contentItem.data

    radius: height / 2
    color: background
    antialiasing: true

    implicitWidth: contentItem.implicitWidth + horizontalPadding * 2
    implicitHeight: contentItem.implicitHeight + verticalPadding * 2

    Item {
        id: contentItem

        anchors.centerIn: parent

        implicitWidth: childrenRect.width
        implicitHeight: childrenRect.height
    }
}
