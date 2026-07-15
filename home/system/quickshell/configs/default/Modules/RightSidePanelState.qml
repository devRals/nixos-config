pragma Singleton

import QtQuick

QtObject {
    id: root
    enum Page {
        Network = 0,
        Audio = 1
    }

    property bool expanded: false
    property int page: RightSidePanelState.Page.Network

    function open(page) {
        root.page = page;
        root.expanded = true;
    }

    function close() {
        root.expanded = false;
    }

    function toggle(page) {
        if (root.expanded) {
            root.expanded = false;
            return;
        }
        root.expanded = true;
        root.page = page;
    }
}
