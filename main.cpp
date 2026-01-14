#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "CoffeeItem.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    CoffeeItem coffee;
    coffee.SetName("Cold Brew");
    coffee.SetCoffeeAmount(330);

    engine.rootContext()->setContextProperty("coffeeItem", &coffee);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("QtCoffee", "Main");

    return app.exec();
}
