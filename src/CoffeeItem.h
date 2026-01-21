#ifndef COFFEEITEM_H
#define COFFEEITEM_H

#include <QString>

struct CoffeeItem
{
    QString Name;
    int CoffeeAmountMillilitres;
    int MilkAmountMillilitres;
    int SugarAmountGrams;
    int BrewTimeSeconds;
};

#endif // COFFEEITEM_H
