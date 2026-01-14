#include "coffeeitem.h"

CoffeeItem::CoffeeItem(QObject *parent)
    : QObject(parent)
{
}


void CoffeeItem::SetName(QString name)
{
    // if(name == "") throw std::invalid_argument("The name cannot be empty!");
    m_Name = name;
    emit nameChanged();
}

void CoffeeItem::SetCoffeeAmount(int amount)
{
    // if(amount < 0) throw std::invalid_argument("The amount of coffee can't be negative!");
    m_CoffeeAmount = amount;
    emit coffeeAmountChanged();
}
