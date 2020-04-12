import QtQuick 2.12
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import QtMultimedia 5.12

Pane {
    id: contentArea
    padding: 0

    property string contentTitle: "Content Title"

    Pane {
        id: title
        width: parent.width
        height: parent.height/10
        leftPadding: height/5
        rightPadding: height/5
        topPadding: height/10
        bottomPadding: height/10
        opacity: 0.93
        z: 2
        Material.background: parent.Material.background
        Label {
            id: titleText
            text: contentArea.contentTitle
            opacity: 1
            //font.bold: true
            color: application.Material.foreground
            font.pointSize: 20
        }
        //Layout.alignment: Qt.AlignHCenter
        //Material.elevation: 10

    }

    ColumnLayout {

        id: container
        anchors.fill: parent
        //spacing: 10


        property var playlist: audioPlaylist
        property string playlistName: "Now Playing"

        ListView {
                id: songslist
                Layout.fillHeight: true
                Layout.fillWidth: true

                leftMargin: 10
                spacing: 5
                Layout.alignment: Qt.AlignHCenter

                model: parent.playlist
                delegate: Pane {
                    id: songItem
                    //radius: 10
                    width: songslist.width
                    //Material.background: application.Material.primary
                    Material.elevation: 10
                    background:  Text {
                        id: songName
                        font.pixelSize: 15;
                        color: application.Material.foreground
                        text: filesLoader.basename(source)
                        anchors.verticalCenter: songItem.verticalCenter
                        anchors.left: songItem.left
                        padding: 5
                    }
                }

                ScrollBar.vertical: ScrollBar{
                    parent: songslist
                    anchors.right: songslist.right
                    anchors.top: songslist.top
                    anchors.bottom: songslist.bottom
                    //z: 3
                }

                header: Rectangle {
                    id: head
                    color: "transparent"
                    height: title.height
                    width: parent.width
                }
                footer: Rectangle {
                    id: foot
                    color: "transparent"
                    height: miniPlayer.height
                    width: parent.width
                }
        }
        Component.onCompleted: {
            contentArea.contentTitle="Playlist : "+container.playlistName
        }

    }

}
