import QtQuick 2.12
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

Pane {
    id: optionBar
    width: parent.width/10
    height: parent.height*(7.7/10)
    padding: 0


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
                colorPicker.open()
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
