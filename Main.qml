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
        anchors.centerIn: parent
        text:"Nathan's Coffee \nMade with love (and code)"
        font.pointSize: 48
        color:black
    }
}
