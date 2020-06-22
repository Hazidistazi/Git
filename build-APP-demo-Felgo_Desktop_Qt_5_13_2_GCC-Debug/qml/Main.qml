import Felgo 3.0
import QtQuick 2.0
import "ListView"


App {

  Navigation {
    // enable both tabs and drawer for this demo
    // by default, tabs are shown on iOS and a drawer on Android
    navigationMode: navigationModeTabsAndDrawer

    NavigationItem {
      title: "Home"
      icon: IconType.home
      NavigationStack {
        Page {
         title: "相冊"
         Image {
             id: main_background
             source: "../assets/main.jpg"
             anchors.fill: parent
         }
         AppButton {
           id: add_file
           anchors.horizontalCenter: parent.horizontalCenter
           text: "Add file"
//           action{
//           //id: add_file
//           text: "&Open"
//           shortcut: "Ctrl+O"
//           onTriggered: fileDialog.open()
//           tooltip: "Open an Image"
//           }
           flat:true
           onClicked: {
               //to do
           }


        }
      }
      }
    }

    NavigationItem {
      title: "Lists"
      icon: IconType.list
      NavigationStack {
        Page {
         title: "Lists"
         Image {
             id: list_background
             source: "../assets/list.jpg"
             anchors.fill: parent
         }
         AppButton {
           id: add_picture
           anchors.horizontalCenter: parent.horizontalCenter
           flat:true
           text: "add picture"
           onClicked: {
               //to do
           }
        }
        }
      }
    }

    NavigationItem {
      title: "search"
      icon: IconType.search

      NavigationStack {

        Page {
         title: "search"
         Image {
             id: search_background
             source: "../assets/1.jpg"
             anchors.fill: ffff
         }

         AppTextField{
           // anchors.centerIn: parent
             id:textEdited
             width:dp(180)
             height:dp(45)
             //echoMode: TextInput.PasswordEchoOnEdit
            onAccepted: console.debug(text)
         }


//         ButtonBarItem{
//         id:search
//         Text {
//             id: name
//             text: qsTr("Search")
//                     visible:false
//                     opacity: 200
//                     //anchors.centerIn: parent
//}
         AppButton{
             id:searchButton
             text: qsTr("Search")
             width:dp(160)
             height: dp(50)//textEdited.height
            //anchors.right: search.right
            x:textEdited.width; }

         NavigationStack {
            ListPage {
              id: listPage
              title: "Search"

              // add dummy entries for list page
              model: {
                var model = []
                for(var i = 0; i < 26; i++) {
                  for(var j = 0; j < 1; j++) {
                    var entry = {
                     // text: String.fromCharCode(65 + i) + " " + j,
                      section: String.fromCharCode(65 + i), // for section display in list
                      letter: String.fromCharCode(65 + i) // only for SectionSelect, the actual sections all start with 'Section ...'
                    }
                    model.push(entry)
                  }
                }
                return model
              }
              delegate: SimpleRow { }

              // activate sections
              section.property: "section"

              // add section select
              SectionSelect {
                id: sectionSelect
                anchors.right: parent.right
                target: listPage.listView
                sectionProperty: "letter"
              }

            } // ListPage
             }
      }
    }
  }
}


}
