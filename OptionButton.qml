import QtQuick 2.12
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

Rectangle {
    id: button

    property string lightIcon: ""
    property string darkIcon: ""
    color: parent.Material.background
    opacity: 0.8
    enabled: true

    Control {
        id: ctr
        anchors.fill: parent
        padding: parent.height/3.2
        contentItem:  Image {
            id: img
            fillMode: Image.PreserveAspectFit
            source: application.lightThemeOn ? darkIcon: lightIcon
            sourceSize.width: parent.width
            sourceSize.height: parent.height/optionBar.totalOptions
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Material.elevation: 10

        }
    }
    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        onClicked: onButtonClicked()
    }

    states: State {
        name: "hovered"
        when: mouse.containsMouse
        PropertyChanges {
            target: button
            color: application.lightThemeOn ? "#bfbfbf" : "#4d4d4d"
            opacity: 1
            restoreEntryValues: true

        }
    }
}
