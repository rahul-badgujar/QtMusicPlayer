import QtQuick 2.12
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

Rectangle {
    id: rect

    property string lightIcon: ""
    property string darkIcon: ""
    //Material.background: parent.Material.background
    color: parent.Material.background
    opacity: 0.8
    enabled: true
    border.color: application.Material.primary
    border.width: 0
    Control {
        id: ctr
        anchors.fill: parent
        padding: parent.height/4
        contentItem:  Image {
            id: button
            fillMode: Image.PreserveAspectFit
            source: application.lightThemeOn ? darkIcon: lightIcon
            sourceSize.width: parent.width
            sourceSize.height: parent.height/optionBar.totalOptions
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Material.elevation: 100

        }
    }
    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            parent.border.width=1
            parent.opacity=1
        }
        onExited: {
            parent.border.width=0
            parent.opacity=0.8
        }

        onClicked: parent.onButtonClicked()
    }
}
