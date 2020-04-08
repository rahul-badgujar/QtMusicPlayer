import QtQuick 2.12
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

Pane {
    id: button

    property string lightIcon: ""
    property string darkIcon: ""
    padding: 0
    //Material.background: parent.Material.background
    Material.background: parent.Material.background
    enabled: true

    Control {
        id: ctr
        anchors.fill: parent
        padding: parent.height/4
        contentItem:  Image {
            id: img
            fillMode: Image.PreserveAspectFit
            opacity: 0.8
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
        onEntered: {
            img.opacity=1
            img.Material.elevation=500
        }
        onExited: {
            img.opacity=0.8
            img.Material.elevation=100
        }

        onClicked: onButtonClicked()
    }
}
/*
Button {
    id: button

    property string lightIcon: ""
    property string darkIcon: ""
    Material.background: parent.Material.background
    flat: true
    //highlighted: true

    onClicked: {
        onButtonClicked()
    }

    Control {
        id: ctr
        anchors.fill: parent
        padding: parent.height/4
        contentItem:  Image {
            id: img
            opacity: 0.8
            fillMode: Image.PreserveAspectFit
            source: application.lightThemeOn ? darkIcon: lightIcon
            sourceSize.width: parent.width
            sourceSize.height: parent.height/optionBar.totalOptions
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Material.elevation: 100

        }
    }

}
*/

