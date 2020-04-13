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
        z: 10
        Material.background: application.lightThemeOn ? "#e6e6e6" : "#1a1a1a"
        Label {
            id: titleText
            text: contentArea.contentTitle
            opacity: 1
            //font.bold: true
            color: application.Material.foreground
            font.pointSize: 20
        }

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
                highlightFollowsCurrentItem: true
                leftMargin: 30
                spacing: 5
                model: parent.playlist
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
                            audioPlaylist.currentIndex=songslist.currentIndex
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
                                audioPlaylist.currentIndex=songslist.currentIndex
                            }
                        }
                        MenuItem {
                             text: "Play Next"
                             height: songItem.height*(2/3)
                         }
                         MenuItem {
                             text: "Remove"
                             height: songItem.height*(2/3)

                         }

                    }

                    states: [

                        State {
                            name: "hovered"
                            when: mouseHandle.containsMouse && index!=songslist.currentIndex
                            PropertyChanges {
                                target: delegateBackground
                                color: application.lightThemeOn ? "#bfbfbf" : "#404040"

                            }
                        },

                        State {
                            name: "active"
                            when: index==songslist.currentIndex
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


        }
        Component.onCompleted: {
            contentArea.contentTitle="Playlist : "+container.playlistName
        }

    }

}
