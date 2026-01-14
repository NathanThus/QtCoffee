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

    Label
    {
        id: labelCoffee
        anchors.top: labelMain.bottom
        anchors.horizontalCenter: labelMain.horizontalCenter
        anchors.topMargin: 10
        text: coffeeItem ? coffeeItem.Name : "Coffee Is Null"
        font.pointSize: 24
        color: "red"
    }
}
