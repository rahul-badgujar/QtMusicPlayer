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

    property MediaPlayer musicPlayer: audioPlayer

    property string contentTitle: "Sounds"
    property int currentContentID: 1

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

    Pane {
        id: soundsControl
        width: parent.width
        anchors.top: title.bottom
        anchors.bottom: parent.bottom
        visible: false

        RowLayout {
            width: parent.width*(2.5/3)
            height: parent.height/10
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Image {
                id: volumedown
                source: application.lightThemeOn ? "qrc:/Dark/volume-down-dark" : "qrc:/Light/volume-down-light"
                sourceSize.height: parent.height/2
                fillMode: Image.PreserveAspectFit

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var v= musicPlayer.volume
                        v-=0.1
                        if(v<0.0) v=0.0
                        musicPlayer.volume=v
                    }
                }
            }

            Slider {
                id: soundsSlider
                from: 0
                to: 100
                stepSize: 1
                value: musicPlayer.volume*100

                Layout.fillWidth: true
                Layout.fillHeight: true

                onMoved: {
                    musicPlayer.volume=value/100
                }
            }
            Image {
                id: volumeadd
                source: application.lightThemeOn ? "qrc:/Dark/volume-add-dark" : "qrc:/Light/volume-add-light"
                sourceSize.height: parent.height/2
                fillMode: Image.PreserveAspectFit

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var v= musicPlayer.volume
                        v+=0.1
                        if(v>1.0) v=1.0
                        musicPlayer.volume=v

                    }
                }
            }

        }

        states: [
            State {
                name: "active"
                when: contentArea.currentContentID== 3
                PropertyChanges {
                    target: contentArea
                    contentTitle: "Sound : "+parseInt(soundsSlider.value)

                }
                PropertyChanges {
                    target: soundsControl
                    visible: true
                }
            }
        ]

    }


    MusicPlaylist {
        id: musicList
        musicPlayer: audioPlayer
        playlist: audioPlaylist
        playlistName: "Now Playing"
        property string title: "Playlist : "+playlistName

        visible: false

        states: [
            State {
                name: "active"
                when: contentArea.currentContentID== 1
                PropertyChanges {
                    target: contentArea
                    contentTitle: "Playlist : "+musicList.playlistName

                }
                PropertyChanges {
                    target: musicList
                    visible: true
                }
            }
        ]

    }

    function hideAll() {
        musicList.visible= false
        soundsControl.visible= false
    }

    function showContent(contentID) {
        currentContentID= contentID
    }


}
