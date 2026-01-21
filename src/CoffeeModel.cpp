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

QHash<int, QByteArray> CoffeeModel::roleNames() const
{
    return {
        {NameRole, "name"},
        {CoffeeAmountRole, "CoffeeAmountMillilitres"},
        {MilkAmountRole, "MilkAmountMillilitres"},
        {SugarAmountRole, "SugarAmountGrams"},
        {BrewTimeRole, "BrewTimeSeconds"}
    };
}

QVariant CoffeeModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() >= m_coffees.count())
        return QVariant();

    const CoffeeItem &coffee = m_coffees[index.row()];

    switch (role) {
    case NameRole:
        return coffee.Name;
    case CoffeeAmountRole:
        return coffee.CoffeeAmountMillilitres;
    case MilkAmountRole:
        return coffee.MilkAmountMillilitres;
    case SugarAmountRole:
        return coffee.SugarAmountGrams;
    case BrewTimeRole:
        return coffee.BrewTimeSeconds;
    default:
        return QVariant();
    }
}
