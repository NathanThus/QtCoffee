import QtQuick
import QtQuick.Controls

Page {
    id: collectPage

    property string coffeeName: ""

    signal collectTimeout()

    background: Rectangle
    {
        color:"#777"
    }

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text {
            text: "☕"
            font.pixelSize: 100
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: coffeeName + " is ready!"
            font.pixelSize: 32
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: "Please collect your coffee"
            font.pixelSize: 18
            font.underline: true
            color: "#000"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Timer {
        id: collectTimer
        interval: 5000
        repeat: false
        onTriggered: collectTimeout()
    }

    Component.onCompleted: {
        collectTimer.start()
    }
}
