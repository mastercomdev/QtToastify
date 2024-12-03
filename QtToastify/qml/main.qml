import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "qrc:/qml/Toastify/"

ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Toastify")
    font.family: "Montserrat"

    ColumnLayout{
        anchors.centerIn: parent
        spacing: 12

        Label{
            text: "Welcome to QtToastify"
            font.pointSize: 24
        }

        RowLayout{
            spacing: 12

            Button{
                Layout.alignment: Qt.AlignHCenter
                text: "Create Message"
                highlighted: true

                onClicked: {
                    //Simple
                    toastify.createMessage("Simple message example")
                }
            }
            Button{
                Layout.alignment: Qt.AlignHCenter
                text: "Custom click action"
                highlighted: true

                onClicked: {
                    //With Click Action
                    const customAction= function(messageContainer){
                        console.log("Custom action!")
                        messageContainer.close()
                    }
                    const options = {
                        clickAction: customAction
                    }

                    toastify.createMessage("Custom click action message!", options)
                }
            }
        }
    }

    //Toast display module
    Toastify{
        id: toastify
    }
}
