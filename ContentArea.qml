import QtQuick 2.12
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

Pane {
    id: contentArea
    width: parent.width*(9/10)
    height: parent.height

    Material.background: application.Material.background

    ListView {
            model: audioPlaylist
            delegate: Text {
                font.pixelSize: 16;
                text: source;
            }
        }
}
