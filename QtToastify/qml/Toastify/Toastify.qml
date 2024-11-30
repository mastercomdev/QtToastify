import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    anchors.fill: parent
    parent: Overlay.overlay

    ColumnLayout{
        id: mainColumn
        x: 12
        width: 300
        spacing: 0
    }

    Component.onCompleted: {
        createMessage()
    }

    function createMessage(){
        var component = Qt.createComponent("qrc:/qml/Toastify/ToastifyDelegate.qml")
        var dynamicRectangle = component.createObject(mainColumn);
    }
}
