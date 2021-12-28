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

    // Always display the full view. Never show the compact icon view
    // like it does by default when shown in the panel.
    Plasmoid.preferredRepresentation: plasmoid.fullRepresentation

    Image {
        id: image
        source: plasmoid.configuration.url
        fillMode: Image.PreserveAspectFit
        anchors.fill: parent
        Timer {
            interval: plasmoid.configuration.minutesIntervalValue*60*1000
            running: true
            repeat: true
            onTriggered: { image.source = ""; image.source = plasmoid.configuration.url }
        }
    }
}
