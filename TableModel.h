#ifndef TABLEMODEL_H
#define TABLEMODEL_H

#include <QAbstractTableModel>

class TableModel : public QAbstractTableModel {
	Q_OBJECT

public:
	int rowCount(const QModelIndex & = QModelIndex()) const override;
	int columnCount(const QModelIndex & = QModelIndex()) const override;

	QVariant data(const QModelIndex &index, int role) const override;

	QHash<int, QByteArray> roleNames() const override;
};

#endif // TABLEMODEL_H
