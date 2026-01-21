import QtQuick
import QtQuick.Controls

Page {
    id:detailsPage

    signal closeRequested()
    signal brewRequested()

    property string coffeeName: ""
    property int coffeeAmountMillilitres: 0
    property int milkAmountMillilitres: 0
    property int sugarAmountGrams: 0
    property int brewTimeSeconds: 0

    background:Rectangle
    {
        color: "#777"
    }

    Column
    {
        anchors.centerIn: parent
        spacing: 20

        Text {
            text: "☕"
            font.pixelSize: 100
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text
        {
         text: coffeeName
         font.pixelSize: 32
         font.bold: true
         anchors.horizontalCenter: parent.horizontalCenter
        }

        Text
        {
            text: "Coffee: " + coffeeAmountMillilitres + " ml"
            font.pixelSize: 18
        }

        Text
        {
            text: "Milk: " + milkAmountMillilitres + " ml"
            font.pixelSize: 18
        }

        Text
        {
            text: "Sugar: " + sugarAmountGrams + " g"
            font.pixelSize: 18
        }

        Text
        {
            text: "Brew Time: " + brewTimeSeconds + " seconds"
            font.pixelSize: 18
        }

        Button
        {
            text: "Brew Coffee"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked:
            {
                brewRequested()
            }
        }

        Button {
            text: "Back"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                closeRequested()
            }
        }
    }
}
