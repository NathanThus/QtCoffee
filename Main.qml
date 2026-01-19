import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    width: 1280
    height: 720
    visible: true
    title: qsTr("Nathan's Coffee")

    background:Rectangle
    {
        color: "#777"
    }

    Label
    {
        id:labelMain
        anchors.centerIn: parent
        text:"Nathan's Coffee \nMade with love (and code)"
        font.pointSize: 48
        color: "black"
    }


    ListView
    {
        anchors.top: labelMain.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: labelMain.horizontalCenter
        width: contentWidth
        height: 40

        orientation: ListView.Horizontal
        spacing: 12

        model: coffeeManager.coffeeModel

        delegate: Button {
            text: name   // role from CoffeeModel::roleNames()
            font.pixelSize: 18
            onClicked: {
                coffeeManager.makeCoffee(index)
            }
        }
}   }
