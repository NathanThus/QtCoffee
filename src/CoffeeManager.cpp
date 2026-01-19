#include "CoffeeManager.h"
#include <QVariantMap>
#include <QVariantList>
#include <QDebug>

void CoffeeManager::Initialize()
{
    m_coffees = {
        {"Espresso", 30, 0, 0, 25},
        {"Americano", 30, 0, 0, 30},
        {"Cappuccino", 20, 40, 0, 40},
        {"Latte", 20, 60, 0, 45},
        {"Mocha", 20, 50, 10, 50},
        {"Macchiato", 25, 20, 0, 35}};
}

CoffeeManager::CoffeeManager(QObject *parent)
{
    Initialize();
    m_coffeeModel.setCoffees(m_coffees);
}

void CoffeeManager::Brew(int index)
{
    qDebug() << "BRR";
}

QVariantList CoffeeManager::GetCoffeeList() const
{
    QVariantList list;
    for (const auto &coffee : m_coffees) {
        QVariantMap map;
        map["name"] = coffee.Name;
        map["coffeeAmount"] = coffee.CoffeeAmount;
        map["milkAmount"] = coffee.MilkAmount;
        map["sugarAmount"] = coffee.SugarAmount;
        map["brewTime"] = coffee.brewTime;
        list.append(map);
    }
    return list;
}
