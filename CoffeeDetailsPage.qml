import QtQuick
import QtQuick.Controls

Page {
    id:detailsPage

    signal closeRequested()

    property string coffeeName: ""
    property int coffeeAmount: 0
    property int milkAmount: 0
    property int sugarAmount: 0
    property int brewTime: 0

    background:Rectangle
    {
        color: "#777"
    }

    Column
    {
        anchors.centerIn: parent
        spacing: 20

        Rectangle
        {
            width: 200
            height: 200
            color: "red"
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
            text: "Coffee: " + coffeeAmount + "ml"
            font.pixelSize: 18
        }

        Text
        {
            text: "Milk: " + milkAmount + "ml"
            font.pixelSize: 18
        }

        Text
        {
            text: "Sugar: " + sugarAmount + "g"
            font.pixelSize: 18
        }

        Text
        {
            text: "Brew Time: " + coffeeAmount + " seconds"
            font.pixelSize: 18
        }

        Button
        {
            text: "Brew Coffee"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked:
            {
                console.log("BRRR")
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
