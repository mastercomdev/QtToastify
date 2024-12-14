import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    anchors.fill: parent
    parent: Overlay.overlay

    //Top-Left
    ColumnLayout{
        id: topLeftColumn
        x: 12
        y: 0
        width: 300
        spacing: 0
    }

    //Top-Right
    ColumnLayout{
        id: topRightColumn
        x: root.width-width-12
        y: 0
        width: 300
        spacing: 0
    }

    //Bottom-Left
    ColumnLayout{
        id: bottomLeftColumn
        x: 12
        y: root.height-height-12
        width: 300
        spacing: 0
    }

    //Bottom-Right
    ColumnLayout{
        id: bottomRightColumn
        x: root.width-width-12
        y: root.height-height-12
        width: 300
        spacing: 0
    }

    function createMessage( message, options = {} ){
        try{
            if(!message){
                throw new Error("Invalid message")
            }

            const { type, position, theme, closeOnClick, clickAction } = options;
            var component = Qt.createComponent("qrc:/qml/Toastify/ToastifyDelegate.qml")
            var messageContainer = component.createObject(determinePosition(position), {
                                                              message,
                                                              type,
                                                              position,
                                                              theme,
                                                              closeOnClick,
                                                              clickAction
                                                          });
            return messageContainer;
        }
        catch(err){
            console.error(err || "Failed to create toast")
        }
    }

    function determinePosition(position){
        switch(position){
        case Qt.TopLeftCorner:
            return topLeftColumn;
        case Qt.TopRightCorner:
            return topRightColumn;
        case Qt.BottomLeftCorner:
            return bottomLeftColumn;
        case Qt.BottomRightCorner:
            return bottomRightColumn;
        case undefined:
            return topLeftColumn;
        default:
            console.log("Invalid position")
        }
    }
}
