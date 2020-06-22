import QtQuick 2.0
import QtQuick.Controls 2.5

Item {
    property alias openAction: open
    property alias aboutAction: about
    property alias exitAction: exit
    property alias mediaStartAction: mediaStart
    property alias mediaPauseAction: mediaPause
    property alias mediaPreviousAction: mediaPrevious
    property alias mediaNextAction: mediaNext

    Action {
        id: open
        text: qsTr("&Add songs")
        icon.name: "document-open"
        shortcut: "StandarKey.Open"
    }

    Action {
        id: exit
        text: qsTr("E&xit")
        icon.name: "application-exit"
    }

    Action {
        id: about
        text: qsTr("&About")
        icon.name: "help-about"
    }

    Action{
        id:mediaStart
        icon.name:"media-playback-start"
    }

    Action{
        id:mediaPause
        icon.name: "media-playback-pause"
    }

    Action{
        id:mediaPrevious
        icon.name: "media-skip-backward"
    }

    Action{
        id:mediaNext
        icon.name: "media-skip-forward"
    }
}
