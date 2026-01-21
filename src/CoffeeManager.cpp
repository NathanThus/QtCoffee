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

void CoffeeManager::brewByName(const QString &name)
{
    for (const auto &coffee : std::as_const(m_coffees)) {
        if (coffee.Name == name) {
            Brew(coffee);
            return;
        }
    }
    qWarning() << "Coffee not found:" << name;
}

void CoffeeManager::Brew(CoffeeItem coffee)
{
    m_brewController.Brew(coffee);
}

QVariantList CoffeeManager::GetCoffeeList() const
{
    QVariantList list;
    for (const auto &coffee : m_coffees) {
        QVariantMap map;
        map["name"] = coffee.Name;
        map["CoffeeAmountMillilitres"] = coffee.CoffeeAmountMillilitres;
        map["MilkAmountMillilitres"] = coffee.MilkAmountMillilitres;
        map["SugarAmountGrams"] = coffee.SugarAmountGrams;
        map["BrewTimeSeconds"] = coffee.BrewTimeSeconds;
        list.append(map);
    }
    return list;
}
