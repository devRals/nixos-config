import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Pipewire

import "../UI" as UI
import qs.Modules
import qs.Services as Services

UI.Badge {
    id: root
    horizontalPadding: 15
    verticalPadding: 3

    onClicked: {
        if (RightSidePanelState.expanded)
            if (RightSidePanelState.page === RightSidePanelState.Page.Audio)
                RightSidePanelState.close();
            else
                RightSidePanelState.page = RightSidePanelState.Page.Audio;
        else
            RightSidePanelState.open(RightSidePanelState.Page.Audio);
    }

    property var audioOutput: Services.AudioService.sink
    property var audioInput: Services.AudioService.source

    function getAudioState(node) {
        if (!node || !node.ready)
            return {
                volume: 0,
                muted: false,
                ready: false
            };
        return {
            volume: Math.round(node.audio.volume * 100),
            muted: node.audio.muted,
            ready: true
        };
    }

    PwObjectTracker {
        objects: [root.audioInput, root.audioOutput]
    }

    property var sink: getAudioState(audioOutput)
    property var source: getAudioState(audioInput)

    RowLayout {
        spacing: 15
        anchors.centerIn: parent

        UI.Label {
            text: {
                if (!root.sink.ready)
                    return String.fromCodePoint(0xf0581);

                if (root.sink.volume === 0 || root.sink.muted)
                    return String.fromCodePoint(0xf0581);
                if (root.sink.volume <= 30)
                    return String.fromCodePoint(0xf057f);
                if (root.sink.volume > 30 && root.sink.volume <= 70)
                    return String.fromCodePoint(0xf0580);
                if (root.sink.volume > 70)
                    return String.fromCodePoint(0xf057e);

                // Unreachable
                return String.fromCodePoint(0x0);
            }
            font.pixelSize: 18
            font.bold: true
            font.weight: 700
        }

        UI.Label {
            text: {
                if (root.source.muted || root.source.volume === 0)
                    return String.fromCodePoint(0xf036d);
                return String.fromCodePoint(0xec1c);
            }
            font.pixelSize: 18
            font.bold: true
            font.weight: 700
        }
    }
}
