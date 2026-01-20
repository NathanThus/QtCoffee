import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    width: 1280
    height: 720
    visible: true
    title: qsTr("Nathan's Coffee")

    Rectangle
    {
        width: parent.width
        height: parent.height
        color: "#777"

        id: mainPage
        Label {
            id: labelMain
            anchors.centerIn: parent
            text: "Nathan's Coffee \nMade with love (and code)"
            font.pointSize: 48
            color: "black"
        }

        ListView {
            anchors.top: labelMain.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: labelMain.horizontalCenter
            width: contentWidth
            height: 40

            orientation: ListView.Horizontal
            spacing: 12

            model: coffeeManager.coffeeModel

            delegate: Button {
                text: model.name
                font.pixelSize: 18
                onClicked: {
                    showCoffeeDetails({
                                          "name": model.name,
                                          "coffeeAmount": model.coffeeAmount,
                                          "milkAmount": model.milkAmount,
                                          "sugarAmount": model.sugarAmount,
                                          "brewTime": model.brewTime
                                      })
                }
            }
        }
    }

    Loader {
        id: detailsLoader
        anchors.fill: parent
        active: false
        source: "CoffeeDetailsPage.qml"

        onLoaded: {
            item.closeRequested.connect(hideDetails)
        }
    }

    function showCoffeeDetails(coffeeData) {
        detailsLoader.active = true

        detailsLoader.item.coffeeName = coffeeData.name
        detailsLoader.item.coffeeAmount = coffeeData.coffeeAmount
        detailsLoader.item.milkAmount = coffeeData.milkAmount
        detailsLoader.item.sugarAmount = coffeeData.sugarAmount
        detailsLoader.item.brewTime = coffeeData.brewTime

        detailsLoader.visible = true
    }

    function hideDetails() {
        detailsLoader.active = false
        detailsLoader.visible = false
    }
}
