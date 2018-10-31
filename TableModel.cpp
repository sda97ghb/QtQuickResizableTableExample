#include "TableModel.h"

int TableModel::rowCount(const QModelIndex&) const {
	return 200;
}

int TableModel::columnCount(const QModelIndex&) const {
	return 4;
}

QVariant TableModel::data(const QModelIndex& index, int role) const {
	switch (role) {
	case Qt::DisplayRole:
		return QString("%1, %2").arg(index.column()).arg(index.row());
	case Qt::UserRole + 1:
		return index.row();
	case Qt::UserRole + 2:
		return index.column();
	default:
		break;
	}

	return QVariant();
}

QHash<int, QByteArray> TableModel::roleNames() const {
	return {
		{Qt::DisplayRole, "display"},
		{Qt::UserRole + 1, "row"},
		{Qt::UserRole + 2, "column"}
	};
}
