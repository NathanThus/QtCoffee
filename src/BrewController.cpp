#include "BrewController.h"
#include <qdebug.h>

BrewController::BrewController() {}

// Yes, in an ideal world these would be seperated on a different thread
// allowing the user interface to continue, while the machine actually
// produces coffee. But because it's pseudocode, it's more important
// That the actions happen, rather than the exact multi-threaded implementation.

void PrepareCoffee(int quantity)
{
    qDebug() << "Coffee!";
}
void AddMilk(int quantity)
{
    qDebug() << "Milk!";
}
void AddSugar(int quantity)
{
    qDebug() << "Sugar!";
}

void BrewController::Brew(const CoffeeItem coffee)
{
    PrepareCoffee(coffee.CoffeeAmount);
    AddMilk(coffee.MilkAmount);
    AddSugar(coffee.SugarAmount);
}
