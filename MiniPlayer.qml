import QtQuick 2.12
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12


Pane {
    id: miniPlayer
    z: 1

    width: parent.width
    height: parent.height*(2.3/10)
    visible: true
    opacity: 0.87
    padding: height/13


    Material.background: application.Material.primary
    Material.elevation: 100

    Pane {
        id: albumCoverPane
        width: parent.width/5
        height: parent.height
        Material.elevation: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        padding: 0

        background: Image {
            id: albumCover
            source: "qrc:/player/no_album_cover"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: parent.width
            sourceSize.height: parent.height
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Material.elevation: 10
        }
    }

    Pane {
        id: progressBarPane
        width: parent.width*(3.95/5)
        height: parent.height/4
        //Material.background: "green"
        anchors.top: parent.top
        //anchors.left: albumCoverPane.right
        anchors.right: parent.right
        padding: 0


        background :RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 0
            Text {
                id: currentTime
                text: qsTr("0:00")
                font.pointSize: 9
                Layout.alignment: Qt.AlignRight
                color: application.lightForeground

            }
            Slider {
                id: slider
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                Material.foreground: application.lightForeground
                Material.accent: application.lightForeground

            }

            Text {
                id: totalTime
                text: qsTr("3:00")
                font.pointSize: 9
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                color: application.lightForeground
            }
        }

    }

    Pane {
        id: songDetailsPane
        width: parent.width*(1.7/5)
        height: parent.height*(2.5/4)

        anchors.left: albumCoverPane.right
        anchors.bottom: parent.bottom

        background: ColumnLayout {
            spacing: 0
            Label {
                id: songTitle
                text: qsTr("Song Name")
                font.pointSize: 12
                color: application.lightForeground
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            }

            Label {
                id: songAuthor
                text: qsTr("Song Author")
                font.pointSize: 9
                color: application.lightForeground
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            }
        }


    }

    Pane {
        id: contolsPane
        height: parent.height*(2.5/4)
        width: parent.width*(2.25/5)
        anchors.bottom: parent.bottom
        anchors.right: parent.right

        background: RowLayout {
            spacing: 0
            Layout.fillWidth: true
            Layout.fillHeight: true
            Button {
                id: prevButton
                Material.elevation: 20
                background: Image {
                    id: prevButtonImg
                    source: "qrc:/normal/previous"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: parent.width/3
                    sourceSize.height: parent.height
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                }
                onClicked: {
                    console.log("Previous Song Plz")
                }
            }
            Button {
                id: playButton
                Material.elevation: 20
                property string playButtonURL: "qrc:/normal/play"
                property string pauseButtonURL: "qrc:/normal/pause"
                property bool songPlaying: false
                background: Image {
                    id: playButtonImg
                    source: playButton.songPlaying ? playButton.pauseButtonURL : playButton.playButtonURL
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: parent.width/3
                    sourceSize.height: parent.height
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                }
                onClicked: {
                    console.log("Play/Pause Song Plz")
                    songPlaying=!songPlaying
                }
            }
            Button {
                id: nextButton
                Material.elevation: 20
                background: Image {
                    id: nextButtonImg
                    source: "qrc:/normal/next"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: parent.width/3
                    sourceSize.height: parent.height
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                }
                onClicked: {
                    console.log("Next Song Plz")
                }
            }
        }


    }

}

