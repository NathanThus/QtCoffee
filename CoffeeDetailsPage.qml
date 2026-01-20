import QtQuick
import QtQuick.Controls

Page {
    id:detailsPage

    signal closeRequested()
    signal brewRequested()

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
            text: "Brew Time: " + brewTime + " seconds"
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
