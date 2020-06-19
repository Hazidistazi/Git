import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    Button {
        id: searchbutton
        width: 50
        //icon.name: "applications - accessories"
        text: "搜索"
        onClicked: popup.open()
    }

    Popup {
        id: popup
        x: searchbutton.x + 10
        y: searchbutton.y + 10
        //anchors.centerIn: window
        width: 100
        height: 100
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        contentItem: Text {
            id: name
            text: qsTr("尚待开发... \n敬请期待...")
        }
        //radius: 15
    }
}
