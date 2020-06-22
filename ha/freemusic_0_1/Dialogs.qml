import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.2

Item {
    property alias fileOpenDialog: fileOpen

    function openFileDialog() {
        fileOpen.open()
    }
    function openAboutDialog() {
        aboutDialog.open()
    }

    FileDialog {
        id: fileOpen
        title: "Select some songs files"
        selectMultiple: true
        nameFilters: ["Song files (*.mp3 *.flac)"]
    }

    Dialog {
        id: aboutDialog

        title: qsTr("About")
        standardButtons: StandardButton.Ok

        Label {
            anchors.fill: parent
            text: qsTr("A QML Songs player\n")
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
