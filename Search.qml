import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    focus: true
    Keys.onPressed: {
        if (event.key === Qt.Key_Space) {
            console.log("sure")
            event.accepted = true
        }
    }
    Keys.onReturnPressed: console.log("Pressed return")

    TextField {
        id: control
        placeholderText: qsTr("搜索图片")
        echoMode: TextInput.Normal
        onAccepted: console.debug(text)

        background: Rectangle {
            implicitWidth: 130
            implicitHeight: 40
            color: Control.enabled ? "transparent" : "#a9a9a9"
            border.color: control.enabled ? "#ffffff" : "transparent"
            radius: 15

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.color = "#ffffff"
                    parent.border.color = "#a9a9a9"
                }
            }
        }
    }
}
