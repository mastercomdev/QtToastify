import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Shapes 1.15
import QtGraphicalEffects 1.15

Item{
    id: root
    Layout.fillWidth: true
    Layout.preferredHeight: Math.max(64, label.height+24)+12

    //Properties
    property int borderMargin: 12

    QtObject{
        id: privateProperty

        property real progress: 0
    }

    Component.onCompleted: {
        toastAnimation.start()
    }

    Rectangle{
        id: mainRect
        x: -width-borderMargin
        y: 12
        width: parent.width
        height: parent.height-12
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
        Rectangle{
            id: progressbar
            width: parent.width
            height: 4
            radius: 2
            anchors.bottom: parent.bottom
            color: "lightgrey"

            Rectangle{
                width: parent.width*(1-privateProperty.progress)
                height: 4
                radius: 2
                anchors.bottom: parent.bottom
                color: "#3498db"
            }
        }
    }

    //Animations
    SequentialAnimation{
        id: toastAnimation

        PauseAnimation {
            duration: 200
        }
        NumberAnimation{
            target: mainRect
            property: "x"
            to: 0
            //// Candidates for easing types
            // easing.type: "InOutExpo"
            // easing.type: "OutBounce"
            // easing.type: "OutElastic"
            easing.type: "OutBack"
            duration: 500
        }
        NumberAnimation{
            target: privateProperty
            property: "progress"
            to: 1
            duration: 5000
        }
        ScriptAction{
            script: exitAnimation.start()
        }
    }

    SequentialAnimation{
        id: exitAnimation

        NumberAnimation{
            target: mainRect
            property: "x"
            to: -mainRect.width-borderMargin
            easing.type: "OutQuint"
            duration: 500
        }
        NumberAnimation{
            target: root
            property: "Layout.preferredHeight"
            to: 0
            easing.type: "OutQuint"
            duration: 500
        }
        ScriptAction{
            script: root.destroy()
        }
    }
}
