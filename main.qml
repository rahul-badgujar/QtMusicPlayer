import QtQuick 2.12
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

ApplicationWindow {
    visible: true
    id: application
    width: Screen.width*(2/5)
    height: Screen.height*(2/3)
    //flags: Qt.FramelessWindowHint
    title: qsTr("Music Player")
    Material.theme: lightThemeOn ? Material.Light : Material.Dark
    Material.primary: Material.Indigo
    Material.background: lightThemeOn ? "#f2f2f2" : "#262626"
    Material.accent: Material.Indigo
    //Material.foreground: Material.color(Material.Grey,Material.Shade100)

    property bool lightThemeOn: true
    property var barsColor: Material.color(Material.Grey,Material.Shade200)

    function changeTheme() {
        //console.log("in changeTheme()");
        lightThemeOn=!lightThemeOn;
    }

    Rectangle {
        id: appRect
        anchors.fill: parent

        color: parent.Material.background

        focus: true
        Keys.onPressed: {
            if ((event.key === Qt.Key_T) && (event.modifiers & Qt.ControlModifier))
                application.changeTheme()
        }

        OptionBar {
            id: optionBar
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.right: contentArea.left
        }

        ContentArea {
            id: contentArea
            visible: true
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom

        }

        MiniPlayer {
            id: miniPlayer
            visible: true
            anchors.bottom: parent.bottom
        }


    }

}
