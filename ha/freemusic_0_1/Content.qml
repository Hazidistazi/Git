import QtQuick 2.13
import QtQuick.Dialogs 1.3
import QtQuick.Controls 2.5 as QQC
import QtMultimedia 5.13

ListView {
    property alias mediaPlayer: player

    id: musicPlay
    model:  playList
    anchors.fill: parent

    delegate: Text {
        id:songName
        font.pixelSize: 16
        text:  source
        color: (musicPlay.currentIndex==index)?"red":"black"
        TapHandler {
            onTapped: {
                musicPlay.currentIndex = index;
                player.play()
            }
        }
    }

    //setting up the data model after selecting multi files in multi-musics viewing mode.
    function setFilesModel() {
        playList.addItems(arguments[0])
    }

    //set the previous or next Song
    function setPreviousSong(){
        musicPlay.currentIndex = (musicPlay.currentIndex - 1 + musicPlay.count) % musicPlay.count
        player.play()

    }

    function setNextSong(){
        musicPlay.currentIndex = (musicPlay.currentIndex + 1) % musicPlay.count
         player.play()
    }

    Audio {
        id: player
        source: musicPlay.currentItem.text
        playlist: Playlist {
            id: playList
        }
    }

}
