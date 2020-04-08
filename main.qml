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

        Pane {
            id: optionBar
            width: parent.width/10
            height: parent.height*(5/6)
            padding: 0
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.right: contentArea.left


            Material.background: application.lightThemeOn ? "#d9d9d9" : "#333333"
            //Material.elevation: 10

            property int totalOptions: 7


            ColumnLayout {
                anchors.fill: parent
                spacing: 0

                OptionButton {
                    id: search_button
                    darkIcon: "qrc:/Dark/search-dark"
                    lightIcon: "qrc:/Light/search-light"

                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight: parent.height/optionBar.totalOptions

                    function onButtonClicked() {
                        console.log("Search Button Clicked")
                    }
                }

                OptionButton {
                    id: playlist_button
                    darkIcon: "qrc:/Dark/playlist-dark"
                    lightIcon: "qrc:/Light/playlist-light"

                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight: parent.height/optionBar.totalOptions

                    function onButtonClicked() {
                        console.log("Playlist Button Clicked")
                    }
                }

                OptionButton {
                    id: add_button
                    darkIcon: "qrc:/Dark/add-dark"
                    lightIcon: "qrc:/Light/add-light"
                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight: parent.height/optionBar.totalOptions

                    function onButtonClicked() {
                        console.log("Add Button Clicked")
                    }
                }

                OptionButton {
                    id: volume_button
                    darkIcon: "qrc:/Dark/volume-dark"
                    lightIcon: "qrc:/Light/volume-light"
                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight: parent.height/optionBar.totalOptions

                    function onButtonClicked() {
                        console.log("VolumeButton Clicked")
                    }
                }

                OptionButton {
                    id: theme_button
                    darkIcon: "qrc:/Dark/sun"
                    lightIcon: "qrc:/Light/moon"
                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight: parent.height/optionBar.totalOptions

                    function onButtonClicked() {
                        application.changeTheme()
                    }

                }

                OptionButton {
                    id: color_button
                    darkIcon: "qrc:/Dark/color-dark"
                    lightIcon: "qrc:/Light/color-light"
                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight: parent.height/optionBar.totalOptions

                    function onButtonClicked() {
                        console.log("color Button Clicked")
                    }
                }

                OptionButton {
                    id: admin_button
                    darkIcon: "qrc:/Dark/admin-dark"
                    lightIcon: "qrc:/Light/admin-light"
                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight: parent.height/optionBar.totalOptions

                    function onButtonClicked() {
                        console.log("Admin Button Clicked")
                    }
                }
            }
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
