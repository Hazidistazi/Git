/*
 *auther:2018051604030lisixiong
 */
import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    id: appWindow
    visible: true
    width: 600
    height: 400
    minimumHeight:400
    minimumWidth:600

    menuBar: MenuBar {
        id: appMenuBar

        Menu {
            title: qsTr("&Add songs")
            contentData: [  actions.openAction,
                actions.exitAction]
        }

        Menu {
            title: qsTr("&Help")
            contentData: [actions.aboutAction]
        }
    }

    header: ToolBar {
        id: appToolBar

        ToolButton {
            action: actions.openAction
        }
    }

    //setting the logic of content
    Content {
        id: content
        anchors.fill: parent
    }

    //setting the logic of footer
    footer:RowLayout{
        spacing: 5

        Row{
            Button{
                action: actions.mediaPreviousAction
            }
            Button{
                id:turnStartAndPause
                action: actions.mediaStartAction

            }
            Button{
                action: actions.mediaNextAction
            }
        }
        Slider{
            id:slider
            to:content.mediaPlayer.duration
            value: content.mediaPlayer.position
            onValueChanged: content.mediaPlayer.seek(value)
        }
    }

    Actions {
        id: actions
        openAction.onTriggered: dialogs.openFileDialog()
        aboutAction.onTriggered: dialogs.openAboutDialog()
        exitAction.onTriggered: appWindow.close()
        mediaStartAction.onTriggered: {
            turnStartAndPause.action = actions.mediaPauseAction
            content.mediaPlayer.play()
        }
        mediaPauseAction.onTriggered: {
            turnStartAndPause.action = actions.mediaStartAction
            content.mediaPlayer.pause()
        }
        mediaPreviousAction.onTriggered: content.setPreviousSong()
        mediaNextAction.onTriggered: content.setNextSong()
    }

    Dialogs {
        id: dialogs

        fileOpenDialog.onAccepted: content.setFilesModel(
                                       fileOpenDialog.fileUrls)
    }


}
