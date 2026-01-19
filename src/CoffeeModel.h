#ifndef COFFEEMODEL_H
#define COFFEEMODEL_H

#include <QObject>
#include <QAbstractListModel>

#include "CoffeeItem.h"

class CoffeeModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit CoffeeModel(QObject *parent = nullptr);

    enum
    {
        NameRole = Qt::UserRole + 1
    };
    void setCoffees(const QList<CoffeeItem> &coffees);

    int rowCount(const QModelIndex &) const override;
    QVariant data(const QModelIndex &index, int role) const override;

protected:
    QHash<int, QByteArray> roleNames() const override;

private:
    QList<CoffeeItem> m_coffees;
};

#endif