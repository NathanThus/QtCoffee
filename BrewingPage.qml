import QtQuick
import QtQuick.Controls

Page {
    id: brewingPage

    property int brewTime: 0
    property string coffeeName: ""

    signal brewingComplete()

    background: Rectangle
    {
        color:"#777"
    }

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text {
            text: "Brewing " + coffeeName + "..."
            font.pixelSize: 32
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: countdown
            text: brewTime + " seconds"
            font.pixelSize: 48
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

        ProgressBar {
            id: progressBar
            width: 300
            value: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Timer {
        id: brewTimer
        interval: 1000
        repeat: true
        property int remainingTime: brewTime

        onTriggered: {
            remainingTime--
            countdown.text = remainingTime + " seconds"
            progressBar.value = (brewTime - remainingTime) / brewTime

            if (remainingTime <= 0) {
                stop()
                brewingComplete()
            }
        }
    }

    Component.onCompleted: {
        brewTimer.remainingTime = brewTime
        brewTimer.start()
    }
}
