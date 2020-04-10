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
        //padding:


        background :RowLayout {
            anchors.fill: parent
            Layout.margins: 0
            Text {
                id: currentTime
                text: qsTr("0:00")
                font.pointSize: 9
                Layout.alignment: Qt.AlignRight
                color: "white"

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
                color: "white"
            }
        }

    }



}

