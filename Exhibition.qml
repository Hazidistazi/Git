import QtQuick 2.12
import Qt.labs.folderlistmodel 2.12
import QtQuick.Dialogs 1.3
import QtQuick.Controls 2.5 as QQC

//窗口的内容组件
Item{
    property bool isFullScreen: false

    signal fullScreen()
    signal window()

    //setting up single-picture viewing mode
    function singleView(){
        singlePic.visible = true;
        singlePic.z = 1;
        singlePic.focus=true;
        //        console.log("in singleview")
        //        console.log(multiPics.currentIndex)
        //        console.log(singlePic.source)
        //        console.log(multiPics.currentItem.source)
    }
    //setting up multi-pictures viewing mode.
    function multiView(){
        singlePic.visible = false;
        singlePic.z = -1;
        multiPics.focus = true
    }

    //setting up the picture FillMode in single view
    function setImageFillMode(){
        multiPics.fillMode =  arguments[0]
    }

    //setting up the data model after selecting multi files in multi-pictures viewing mode.
    function setFilesModel(){
        filesModel.clear();
        for(var i = 0; i < arguments[0].length; i++){
            var data = {"filePath": arguments[0][i]};
            filesModel.append(data);
        }
        multiPics.model = filesModel;
        multiPics.currentIndex = 0;//currentIndex equals to -1 default,so it must be set to  0
    }

    //setting up the data model after selecting a folder in multi-pictures viewing mode.
    function setFolderModel(){
        folderModel.folder = arguments[0];
        multiPics.model = folderModel;
        multiPics.currentIndex = 0;//currentIndex equals to -1 default,so it must be set to  0
    }

    //浏览多张图片视图
    GridView {
        id:multiPics
        anchors.fill: parent
        property int fillMode: Image.PreserveAspectFit
        ListModel{
            id:filesModel
        }

        FolderListModel {
            id: folderModel
            //            folder: "/root/images"
            nameFilters: ["*.jpg","*.png"]
        }
        delegate: imageDelegate
    }

    Component {
        id: imageDelegate
        Image {
            id:image
            width: multiPics.cellWidth - 10;
            height: multiPics.cellHeight - 10
            fillMode: multiPics.fillMode
            asynchronous: true
            source: filePath
            //            Text {
            //                id: name
            //                text: qsTr("index:"+index)
            //            }
            MouseArea{
                id:mouseArea
                anchors.fill:parent
                onDoubleClicked: {
                    multiPics.currentIndex = index
                    console.log("currentIndex in multiPics: ", multiPics.currentIndex)
                    singleView()
                }
            }
        }
    }



    //singlePic displays only a single picture
    Image{
        id:singlePic
        anchors.fill:parent
        source: multiPics.currentItem.source
        z:-1
        visible: false

        //显示第一张/最后一张图片的提示
        //msg is the hints dialog
        QQC.Dialog{
            id:msg
            property alias hint: message.text
            anchors.centerIn: parent
            background: Rectangle{
                color: "#00000000"
                radius: 3
                border.width: 3
                border.color: "#00000000"
            }
            modal: true
            contentItem: Text {
                anchors.centerIn: parent
                id:message
                color: "white"
                font.pixelSize: 30
            }
        }
        //view the next/previous picture by pressing Space/Backspace
        Keys.onPressed: {

            if(event.key === Qt.Key_Space){
                console.log("press space")
                multiPics.moveCurrentIndexRight()
                //                source = multiPics.currentItem.source
                if(multiPics.currentIndex === (multiPics.count - 1)){
                    msg.hint="You reached the last picture!";
                    msg.open();
                }else
                    if(msg)
                        msg.close();
            }
            if(event.key === Qt.Key_Backspace){
                console.log("press space")
                multiPics.moveCurrentIndexLeft()
                //                source = multiPics.currentItem.source
                if(multiPics.currentIndex === 0){
                    msg.hint="You reached the first picture!";
                    msg.open();
                }else
                    if(msg)
                        msg.close();

            }
        }

        //clickTimer和mouseArea能够处理单击和双击
        Timer{
            id: clickTimer //超过300ms(典型延时时间)还没有触发第二次点击证明是单击
            property int clickNum: 0

            interval: 300;
            onTriggered: {
                if(isFullScreen){
                    clickNum = 0;
                    clickTimer.stop();
                    window();
                }else{
                    clickNum = 0;
                    clickTimer.stop();
                    multiView();
                }
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                clickTimer.clickNum++
                if(clickTimer.clickNum == 1) {
                    clickTimer.start()
                }
                if(clickTimer.clickNum == 2) {
                    clickTimer.clickNum = 0
                    clickTimer.stop()
                    fullScreen()
                }
            }
        }
    }

}
