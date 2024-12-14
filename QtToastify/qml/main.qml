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
    property int selectedPosition: Qt.TopLeftCorner
    property string selectedTheme: "Light"

    Flickable{
        id: flickable
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        contentWidth: width
        contentHeight: mainColumn.height

        ColumnLayout{
            id: mainColumn
            x: parent.width/2-width/2
            spacing: 12

            Item{
                Layout.fillWidth: true
                Layout.preferredHeight: 48
            }

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
                    text: "info"
                    ButtonGroup.group: toastTypeGroup
                    checked: selectedType==="info"

                    onClicked: {
                        selectedType= "info"
                    }
                }
                RadioButton {
                    text: "success"
                    ButtonGroup.group: toastTypeGroup
                    checked: selectedType==="success"

                    onClicked: {
                        selectedType= "success"
                    }
                }
                RadioButton {
                    text: "warning"
                    ButtonGroup.group: toastTypeGroup
                    checked: selectedType==="warning"

                    onClicked: {
                        selectedType= "warning"
                    }
                }
                RadioButton {
                    text: "error"
                    ButtonGroup.group: toastTypeGroup
                    checked: selectedType==="error"

                    onClicked: {
                        selectedType= "error"
                    }
                }
            }

            Label{
                text: "Position:"
                font.weight: Font.DemiBold
            }

            ButtonGroup{
                id: toastPositionGroup
            }
            Flow{
                RadioButton {
                    text: "Top-Left"
                    ButtonGroup.group: toastPositionGroup
                    checked: selectedPosition===Qt.TopLeftCorner

                    onClicked: {
                        selectedPosition= Qt.TopLeftCorner
                    }
                }
                RadioButton {
                    text: "Top-Right"
                    ButtonGroup.group: toastPositionGroup
                    checked: selectedPosition===Qt.TopRightCorner

                    onClicked: {
                        selectedPosition= Qt.TopRightCorner
                    }
                }
                RadioButton {
                    text: "Bottom-Left"
                    ButtonGroup.group: toastPositionGroup
                    checked: selectedPosition===Qt.BottomLeftCorner

                    onClicked: {
                        selectedPosition= Qt.BottomLeftCorner
                    }
                }
                RadioButton {
                    text: "Bottom-Right"
                    ButtonGroup.group: toastPositionGroup
                    checked: selectedPosition===Qt.BottomRightCorner

                    onClicked: {
                        selectedPosition= Qt.BottomRightCorner
                    }
                }
            }

            Label{
                text: "Theme:"
                font.weight: Font.DemiBold
            }

            ButtonGroup{
                id: themeGroup
            }
            Flow{
                RadioButton {
                    text: "Light"
                    ButtonGroup.group: themeGroup
                    checked: selectedTheme==="Light"

                    onClicked: {
                        selectedTheme= "Light"
                    }
                }
                RadioButton {
                    text: "Dark"
                    ButtonGroup.group: themeGroup
                    checked: selectedTheme==="Dark"

                    onClicked: {
                        selectedTheme= "Dark"
                    }
                }
                RadioButton {
                    text: "Color"
                    ButtonGroup.group: themeGroup
                    checked: selectedTheme==="Color"

                    onClicked: {
                        selectedTheme= "Color"
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
                    const options = {
                        type: selectedType,
                        position: selectedPosition,
                        theme: selectedTheme
                    }
                    toastify.createMessage(messageTextfield.text, options)
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

            Item{
                Layout.fillWidth: true
                Layout.preferredHeight: 48
            }
        }
    }

    //Toast display module
    Toastify{
        id: toastify
    }
}
