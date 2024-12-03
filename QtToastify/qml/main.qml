import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "qrc:/qml/Toastify/"

ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Toastify")
    font.family: "Montserrat"
    Material.accent: "#3498db"

    ColumnLayout{
        anchors.centerIn: parent
        spacing: 12

        Label{
            text: "Welcome to QtToastify"
            font.pointSize: 24
        }

        TextField{
            id: messageTextfield
            Layout.fillWidth: true
            text: "Simple message example"
        }

        TextArea{
            id: optionsTextarea
            Layout.fillWidth: true
            text: "{


}"

            MouseArea{
                anchors.fill: parent
                propagateComposedEvents: false
                preventStealing: true
            }
        }


        Button{
            text: "🚀 Show Toast"
            highlighted: true
            Material.accent: Material.Indigo

            onClicked: {
                toastify.createMessage(messageTextfield.text)
            }
        }

        ToolSeparator{
            orientation: Qt.Horizontal
            Layout.fillWidth: true
        }

        Button{
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

    //Toast display module
    Toastify{
        id: toastify
    }
}
