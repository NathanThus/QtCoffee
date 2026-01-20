#ifndef BREWCONTROLLER_H
#define BREWCONTROLLER_H

#include "CoffeeItem.h"

// Mostly just a demo class.

class BrewController
{
public:
    BrewController();
    bool Brew(const CoffeeItem coffee);
private:
    bool PrepareCoffee(int quantity);
    bool AddMilk(int quantity);
    bool AddSugar(int quantity);
};

#endif // BREWCONTROLLER_H
