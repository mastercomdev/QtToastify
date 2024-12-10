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

    //Properties
    property string selectedType: "info"

    ColumnLayout{
        anchors.centerIn: parent
        spacing: 12

        Label{
            text: "Welcome to QtToastify"
            font.pointSize: 24
        }

        Label{
            text: "Message:"
            font.weight: Font.DemiBold
        }

        TextField{
            id: messageTextfield
            Layout.fillWidth: true
            text: "Simple message example"
        }

        Label{
            text: "Type:"
            font.weight: Font.DemiBold
        }

        ButtonGroup{
            id: toastTypeGroup
        }
        Flow{
            RadioButton {
                id: infoCheckBox
                text: "info"
                ButtonGroup.group: toastTypeGroup
                checked: selectedType==="info"

                onClicked: {
                    selectedType= "info"
                }
            }
            RadioButton {
                id: successCheckBox
                text: "success"
                ButtonGroup.group: toastTypeGroup
                checked: selectedType==="success"

                onClicked: {
                    selectedType= "success"
                }
            }
            RadioButton {
                id: warningCheckBox
                text: "warning"
                ButtonGroup.group: toastTypeGroup
                checked: selectedType==="warning"

                onClicked: {
                    selectedType= "warning"
                }
            }
            RadioButton {
                id: errorCheckBox
                text: "error"
                ButtonGroup.group: toastTypeGroup
                checked: selectedType==="error"

                onClicked: {
                    selectedType= "error"
                }
            }
        }

        Label{
            text: "Actions:"
            font.weight: Font.DemiBold
        }

        Button{
            text: "🚀 Show Toast"
            highlighted: true
            Material.accent: Material.Indigo

            onClicked: {
                toastify.createMessage(messageTextfield.text, {type: selectedType})
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
        position: topLeft
    }
}
