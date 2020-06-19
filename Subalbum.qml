import QtQuick 2.12
import QtQuick.Window 2.12

//import QtQuick.Controls 2.12
Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("相册")

    Search {
        id: rect1
        anchors.left: window.left
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Popup {
        width: 20
        id: rect2
        anchors.left: rect1.right
        anchors.leftMargin: 150
        //anchors.top: rect1.bottom
        visible: true
        //anchors.horizontalCenter: parent.horizontalCenter
    }

    Sub {
        id: rect3
        anchors.left: window.left
        anchors.top: rect2.bottom
        anchors.topMargin: 50
    }

    //    Loader {
    //        id: pageLoader1
    //    }
    //    MouseArea {
    //        anchors.fill: parent
    //        onClicked: pageLoader.source = "Sub.qml"
    //    }
}
