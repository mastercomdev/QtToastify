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
    Material.theme: Material.Light

    //Properties
    property string selectedType: "info"
    property int selectedPosition: Qt.TopLeftCorner
    property string selectedTheme: "Light"
    property bool selectedCloseOnClick: true
    property int selectedAutoClose: 5000
    property bool selectedHideProgressBar: false

    //Dynamic content loader
    Loader{
        anchors.fill: parent
        source: "qrc:/qml/ShowcaseSimple.qml"
    }

    //Toast display module
    Toastify{
        id: toastify
    }

    ToolButton{
        text: window.Material.theme===Material.Light ? "☀" : "☾"
        Material.foreground: window.Material.theme===Material.Light ? "black" : "white"

        onClicked: {
            if(window.Material.theme===Material.Light){
                window.Material.theme= Material.Dark
            }else{
                window.Material.theme= Material.Light
            }
        }
    }
}
