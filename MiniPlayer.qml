import QtQuick 2.12
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12


Pane {
    id: miniPlayer
    z: 1

    width: parent.width
    height: parent.height*(1/6)
    visible: true
    opacity: 0.7


    Material.background: application.Material.primary
    Material.elevation: 10
}

