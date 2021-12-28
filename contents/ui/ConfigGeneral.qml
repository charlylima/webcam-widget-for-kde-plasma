import QtQuick 2.7
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import org.kde.kirigami 2.4 as Kirigami

Kirigami.FormLayout {
    id: page
    property alias cfg_minutesIntervalValue: minutesInterval.value
    property alias cfg_url: textinput_url.text

    SpinBox {
        id: minutesInterval
        from: 0
        to: 60
        editable: true
        Kirigami.FormData.label: i18n("Reload every minutes:")
    }
    TextField {
        id: textinput_url
        Kirigami.FormData.label: i18n("URL:")
        placeholderText: i18n("Placeholder")
    }
}
