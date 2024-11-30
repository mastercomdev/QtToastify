import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Shapes 1.15
import QtGraphicalEffects 1.15

Item {
    id: root
    anchors.fill: parent
    parent: Overlay.overlay

    ColumnLayout{
        x: 12
        y: 12
        width: 300

        Rectangle{
            Layout.fillWidth: true
            Layout.preferredHeight: Math.max(64, label.height+24)
            color: "white"
            radius: 6
            layer.enabled: true
            layer.effect: DropShadow{
                horizontalOffset: 0
                verticalOffset: 0
                radius: 8.0
                samples: 16
                color: "#1A000000"
            }

            RowLayout{
                y: parent.height/2-height/2
                width: parent.width
                spacing: 12

                Image {
                    Layout.alignment: Qt.AlignTop
                    Layout.leftMargin: 12
                    Layout.preferredWidth: 24
                    Layout.preferredHeight: 24
                    sourceSize.width: 24
                    sourceSize.height: 24
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/resources/icons/info.svg"
                }

                Label{
                    id: label
                    Layout.fillWidth: true
                    Layout.rightMargin: 12
                    wrapMode: "WordWrap"
                    horizontalAlignment: "AlignLeft"
                    text: "Wow! so easy"
                }
            }
        }
    }
}
