#include "CoffeeModel.h"

CoffeeModel::CoffeeModel(QObject *parent) : QAbstractListModel(parent) {}

void CoffeeModel::setCoffees(const QList<CoffeeItem> &coffees)
{
    beginResetModel();
    m_coffees = coffees;
    endResetModel();
}

int CoffeeModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) return 0;
    return m_coffees.count();
}

QVariant CoffeeModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) return {};
    const CoffeeItem &coffee = m_coffees.at(index.row());
    if (role == NameRole) return coffee.Name;
    return {};
}

QHash<int, QByteArray> CoffeeModel::roleNames() const
{
    return {{NameRole, "name"}};
}
