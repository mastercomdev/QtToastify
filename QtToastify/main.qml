import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

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

        Button{
            Layout.alignment: Qt.AlignHCenter
            text: "Start"
            highlighted: true
        }
    }
}
