import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    width: 1280
    height: 720
    visible: true
    title: qsTr("Nathan's Coffee")

    Rectangle {
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
            item.brewRequested.connect(function() {
                startBrewing({
                    name: item.coffeeName,
                    brewTime: item.brewTime
                })
            })
        }
    }

    Loader {
        id: brewingLoader
        anchors.fill: parent
        visible: false
        onLoaded: {
            item.brewingComplete.connect(showCollectPage)
        }
    }

    Loader {
        id: collectLoader
        anchors.fill: parent
        visible: false
        onLoaded: {
            item.collectTimeout.connect(returnToMain)
        }
    }

    function startBrewing(coffeeData) {
        detailsLoader.visible = false
        brewingLoader.active = true
        coffeeManager.brewByName(coffeeData.name)
        brewingLoader.setSource("BrewingPage.qml", {
                                    "coffeeName": coffeeData.name,
                                    "brewTime": coffeeData.brewTime
                                })
        brewingLoader.visible = true
    }

    function showCollectPage() {
        var coffeeName = brewingLoader.item.coffeeName
        brewingLoader.visible = false
        collectLoader.setSource("CollectPage.qml", {
                                    "coffeeName": coffeeName
                                })
        collectLoader.visible = true
    }

    function returnToMain() {
        collectLoader.visible = false
        brewingLoader.visible = false
        detailsLoader.visible = false
        mainPage.visible = true
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
