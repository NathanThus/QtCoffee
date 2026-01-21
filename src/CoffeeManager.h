#ifndef COFFEEMANAGER_H
#define COFFEEMANAGER_H
#include <QObject>
#include <QVariant>
#include <QVariantList>
#include <QAbstractListModel>

#include "CoffeeItem.h"
#include "CoffeeModel.h"
#include "BrewController.h"

class CoffeeManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(CoffeeModel* coffeeModel READ coffeeModel CONSTANT)

public:
    Q_INVOKABLE void brewByName(const QString &name);
    explicit CoffeeManager(QObject *parent = nullptr);
    CoffeeModel *coffeeModel() { return &m_coffeeModel; }
    void Brew(CoffeeItem coffee);

private:
    QList<CoffeeItem> m_coffees;
    CoffeeModel m_coffeeModel;
    BrewController m_brewController;

    QVariantList GetCoffeeList() const;
    void Initialize();
};

#endif // COFFEEMANAGER_H
