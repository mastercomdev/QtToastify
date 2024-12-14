import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "qrc:/qml/Toastify/"

Item{
    id: root

    ColumnLayout{
        id: mainColumn
        anchors.centerIn: parent
        spacing: 12

        Label{
            text: "Welcome to QtToastify"
            font.pointSize: 24
        }

        ColumnLayout{
            Label{
                text: "Actions:"
                font.weight: Font.DemiBold
            }

            Button{
                text: "🚀 Show Toast"
                highlighted: true
                Material.accent: Material.Indigo

                onClicked: {
                    toastify.createMessage("Simple message example")
                }
            }

            Button{
                text: "⚡ Switch to advance"
                highlighted: true
                Material.accent: Material.Indigo

                onClicked: {
                    root.parent.source= "qrc:/qml/ShowcaseAdvanced.qml"
                }
            }
        }
    }

}
