import QtQuick 2.12
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import QtMultimedia 5.12
import Qt.labs.settings 1.1

Pane {
    id: contentArea
    padding: 0

    property string contentTitle: musicList.title

    Pane {
        id: title
        width: parent.width
        height: parent.height/10
        leftPadding: height/5
        rightPadding: height/5
        topPadding: height/10
        bottomPadding: height/10
        opacity: 0.93
        z: 10
        Material.background: application.lightThemeOn ? "#e6e6e6" : "#1a1a1a"
        Label {
            id: titleText
            text: contentArea.contentTitle
            opacity: 1
            //font.bold: true
            color: application.Material.foreground
            font.pointSize: 18
        }

    }

    MusicPlaylist {
        id: musicList
        musicPlayer: audioPlayer
        playlist: audioPlaylist
        playlistName: "Now Playing"
        property string title: "Playlist : "+playlistName

    }


}
