import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    anchors.fill: parent
    parent: Overlay.overlay

    //Properties
    readonly property int topLeft: 0
    readonly property int topRight: 1
    readonly property int bottomLeft: 2
    readonly property int bottomRight: 3
    property int position: topLeft

    ColumnLayout{
        id: mainColumn
        x: position===topLeft ? 12 : position===topRight ? root.width-width-12 : position===bottomLeft ? 12 : position===bottomRight ? root.width-width-12 : -1
        y: position===topLeft ? 0 : position===topRight ? 0 : position===bottomLeft ? root.height-height-12 : position===bottomRight ? root.height-height-12 : -1
        width: 300
        spacing: 0
    }

    function createMessage( message, options = {} ){
        try{
            if(!message){
                throw new Error("Invalid message")
            }

            const { clickAction } = options;
            var component = Qt.createComponent("qrc:/qml/Toastify/ToastifyDelegate.qml")
            var messageContainer = component.createObject(mainColumn, {
                                                              message,
                                                              clickAction
                                                          });
            return messageContainer;
        }
        catch(err){
            console.error(err || "Failed to create toast")
        }
    }
}
