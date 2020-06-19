import QtQuick 2.0
import QtQuick.Controls 2.12

Rectangle {

    width: 1000
    height: 1000
    ListModel {
        id: model
        ListElement {
            name: "Jim Williams"
            //portrait: "photo/ubuntu.png"
            portrait: "Icon/ma.png"
        }
        ListElement {
            name: "John Brown"
            //portrait: "photo/vim.png"
            portrait: "Icon/ma.png"
        }
        ListElement {
            name: "John.Wise"
            //portrait: "photo/arch"
            portrait: "Icon/ma.png"
        }
        ListElement {
            name: "Sam Wise"
            //portrait: "photo/userdel"
            portrait: "Icon/ma.png"
        }
    }

    Component {
        id: contactDelegate
        Item {
            width: grid.cellWidth
            height: grid.cellHeight
            //Grid {
            Column {
                anchors.fill: parent
                Image {
                    source: portrait
                    //scale: 0.125
                    width: 80
                    height: 80
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    text: name
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            //}
        }
    }

    GridView {
        id: grid
        anchors.fill: parent
        cellWidth: 100
        cellHeight: 100

        model: model
        delegate: contactDelegate
        highlight: Rectangle {
            color: "lightsteelblue"
            radius: 5
            Button {
                text: model.name
                width: 100
                height: 100
            }
        }
        focus: true
    }
}
