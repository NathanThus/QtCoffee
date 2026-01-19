#ifndef COFFEEMANAGER_H
#define COFFEEMANAGER_H
#include <QObject>
#include <QVariant>
#include <QVariantList>
#include <QAbstractListModel>

#include "CoffeeItem.h"
#include "CoffeeModel.h"

class CoffeeManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(CoffeeModel* coffeeModel READ coffeeModel CONSTANT)
public:
    explicit CoffeeManager(QObject *parent = nullptr);
    CoffeeModel *coffeeModel() { return &m_coffeeModel; }

    void Brew(int index);

private:
    QList<CoffeeItem> m_coffees;
    CoffeeModel m_coffeeModel;
    QVariantList GetCoffeeList() const;
    void Initialize();
};

#endif // COFFEEMANAGER_H
