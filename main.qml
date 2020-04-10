import QtQuick 2.12
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2
import Qt.labs.settings 1.1

ApplicationWindow {
    visible: true
    id: application
    width: Screen.width*(2/5)
    height: Screen.height*(2/3)
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width
    //flags: Qt.FramelessWindowHint
    title: qsTr("Music Player")
    Material.theme: lightThemeOn ? Material.Light : Material.Dark
    Material.primary: themeColor
    Material.background: lightThemeOn ? lightBackground : darkBackground
    Material.accent: themeColor
    Material.foreground: lightThemeOn ? darkForeground : lightForeground

    property bool lightThemeOn: true
    property var barsColor: Material.color(Material.Grey,Material.Shade200)
    property color themeColor: "#5900b3"
    property color lightBackground: "#f2f2f2"
    property color darkBackground: "#262626"
    property color lightForeground: "#f2f2f2"
    property color darkForeground: "#0d0d0d"

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
    ColorDialog {
        id: colorPicker
        title: "Select Theme Color"
        showAlphaChannel: false
        onAccepted: {
            application.themeColor=color
            close()
        }
        onRejected: {
            close()
        }
    }
    Settings {
        id: settings
        category: "Application Settings"
        property alias appThemeMode: application.lightThemeOn
        property alias colorTheme: application.themeColor
    }

}
