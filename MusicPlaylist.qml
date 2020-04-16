import QtQuick 2.12
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2
import Qt.labs.settings 1.1
import QtMultimedia 5.12

ColumnLayout {

    id: container
    anchors.fill: parent

    property Playlist playlist: null
    property MediaPlayer musicPlayer: null
    property string playlistName: "Playlist Name"
    property int holdPosition: 0

    ListView {
            id: songslist
            Layout.fillHeight: true
            Layout.fillWidth: true
            leftMargin: 30
            spacing: 5
            model: container.playlist
            property int currIndex: currentIndex
            delegate: RoundButton {
                id: songItem
                width: songslist.width*(8.5/10)
                height: songslist.height/10
                radius: 15

                contentItem: Text {
                    id: songName

                    font.pixelSize: 14;
                    color: application.Material.foreground
                    text: filesLoader.basename(source)
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                    leftPadding: 20
                    z: 2

                }

                background: Rectangle {
                    id: delegateBackground
                    radius: songItem.radius
                    color: "Transparent"
                    anchors.fill: parent
                }

                MouseArea {
                    id: mouseHandle
                    anchors.fill: parent
                    acceptedButtons: Qt.RightButton | Qt.LeftButton
                    hoverEnabled: true
                    onDoubleClicked: {
                        songslist.currentIndex=index
                        container.playlist.currentIndex=songslist.currentIndex
                        musicPlayer.source= container.playlist.currentItemSource
                    }
                    onClicked: {
                        if (mouse.button & Qt.RightButton) {

                            actionsMenu.popup()
                        }

                    }
                }
                Menu {
                    id: actionsMenu
                    width: songslist.width/4
                    font.pointSize: 11

                    MenuItem {
                        text: "Play"
                        height: songItem.height*(2/3)
                        onTriggered: {

                            songslist.currentIndex=index
                            container.playlist.currentIndex=songslist.currentIndex
                        }
                    }
                    MenuItem {
                         text: "Play Next"
                         height: songItem.height*(2/3)
                         onTriggered: {
                             var i= container.playlist.currentIndex
                             if(index>i) {
                                container.playlist.moveItem(index,i+1)
                             }
                             else if(index<i) {
                                 container.playlist.moveItem(index,i)
                                 container.playlist.currentIndex= i-1

                             }

                         }
                     }
                     MenuItem {
                         text: "Remove"
                         height: songItem.height*(2/3)
                         onTriggered: {
                             var i= container.playlist.currentIndex
                             if(index>i) {
                                container.playlist.removeItem(index)
                             }
                             else if(index<i) {
                                 container.playlist.removeItem(index)
                                 container.playlist.currentIndex= i-1

                             }

                         }

                     }

                }

                states: [

                    State {
                        name: "hovered"
                        when: mouseHandle.containsMouse && source!=container.playlist.currentItemSource
                        PropertyChanges {
                            target: delegateBackground
                            color: application.lightThemeOn ? "#bfbfbf" : "#404040"

                        }
                    },

                    State {
                        name: "active"
                        when: source==container.playlist.currentItemSource
                        PropertyChanges {
                            target: delegateBackground
                            color: application.Material.primary
                            opacity: 0.9
                        }
                        PropertyChanges {
                            target: songName
                            color: "white"
                            font.bold: true

                        }
                        PropertyChanges {
                            target: songslist
                            currentIndex: index

                        }
                    }

                ]

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
                height: title.height+songslist.spacing
                width: parent.width
            }
            footer: Rectangle {
                id: foot
                color: "transparent"
                height: miniPlayer.height+songslist.spacing
                width: parent.width
            }

            Component.onCompleted: {
                positionViewAtIndex(currentIndex,ListView.Center)
            }

            Connections {
                target: audioPlaylist
                onCurrentIndexChanged: {
                    songslist.positionViewAtIndex(songslist.currentIndex,ListView.Center)

                }
            }

            Settings {
                id: listSettings
                category: "Playlist Settings"
                property alias currentItemIndex: songslist.currIndex
            }

    }
    Component.onCompleted: {
        songslist.currentIndex= songslist.currIndex
        songslist.positionViewAtIndex(songslist.currentIndex,ListView.Center)
    }


}


