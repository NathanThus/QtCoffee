#ifndef COFFEEITEM_H
#define COFFEEITEM_H
#include <QtQmlIntegration/qqmlintegration.h>
#include <qobject.h>

class CoffeeItem : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString Name READ Name WRITE SetName NOTIFY nameChanged)
    Q_PROPERTY(int CoffeeAmount READ CoffeeAmount WRITE SetCoffeeAmount NOTIFY coffeeAmountChanged)

public:
    explicit CoffeeItem(QObject *parent = nullptr);

    QString Name() const {return this->m_Name;}
    int CoffeeAmount() const {return this->m_CoffeeAmount;}

    void SetName(QString name);
    void SetCoffeeAmount(int amount);

signals:
    void nameChanged();
    void coffeeAmountChanged();

private:
    QString m_Name;
    int m_CoffeeAmount;
};

#endif // COFFEEITEM_H
