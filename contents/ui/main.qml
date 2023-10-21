import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.2

import org.kde.draganddrop 2.0 as DragDrop

import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.kquickcontrolsaddons 2.0

import org.kde.plasma.private.mediaframe 2.0

Item {
    id: main
    width: 500
    height: 300

    // Always display the full view. Never show the compact icon view
    // like it does by default when shown in the panel.
    Plasmoid.preferredRepresentation: plasmoid.fullRepresentation

    Image { // webcam image
        id: image
        source: plasmoid.configuration.url
        fillMode: Image.PreserveAspectFit
        anchors.fill: parent
        function reload() {
            console.log("Reload " + image.source);
            image.source = "view-refresh-symbolic.svg"; 
            timerReload.start();
        }
        Timer {
            id: timerReload
            interval: 1000
            running: false
            repeat: false
            onTriggered: { 
                image.source = plasmoid.configuration.url;
                timer.restart();
            }
        }
        Timer {
            id: timer
            interval: plasmoid.configuration.minutesIntervalValue*60*1000
            running: true
            repeat: true
            onTriggered: image.reload();
        }
        Text { 
            text: image.status == Image.Error ? 'Error' : (image.status == Image.Loading ? 'Loading...' : '')
            color: image.status == Image.Error ? "red" : "grey"
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.margins: 20
        }
        Image { // reload button
            id: reload
            source: "view-refresh-symbolic.svg"
            anchors.right: parent.right
            anchors.top: parent.top
            width: 50
            height: 50
            opacity: 0.5
            MouseArea {
                anchors.fill: parent
                onClicked: image.reload();
            }
        }
    }
}
