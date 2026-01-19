#ifndef COFFEEITEM_H
#define COFFEEITEM_H

#include <QString>

struct CoffeeItem
{
    QString Name;
    int CoffeeAmount;
    int MilkAmount;
    int SugarAmount;
    int brewTime;
};

#endif // COFFEEITEM_H