#pragma one

#include <QMap>
#include <QObject>

class ResizableCellSizes : public QObject {
	Q_OBJECT

	Q_PROPERTY(double defaultCellWidth READ defaultCellWidth WRITE setDefaultCellWidth NOTIFY defaultCellWidthChanged)
	Q_PROPERTY(double defaultCellHeight READ defaultCellHeight WRITE setDefaultCellHeight NOTIFY defaultCellHeightChanged)

	Q_PROPERTY(double minCellWidth READ minCellWidth WRITE setMinCellWidth NOTIFY minCellWidthChanged)
	Q_PROPERTY(double minCellHeight READ minCellHeight WRITE setMinCellHeight NOTIFY minCellHeightChanged)

public:
	explicit ResizableCellSizes(QObject* parent = nullptr);

	Q_INVOKABLE double rowHeight(int row);
	Q_INVOKABLE double columnWidth(int column);

	Q_INVOKABLE void setRowHeight(int row, double height);
	Q_INVOKABLE void setColumnWidth(int column, double width);

	double defaultCellWidth() const;
	double defaultCellHeight() const;

	double minCellWidth() const;
	double minCellHeight() const;

signals:
	void defaultCellWidthChanged(double defaultCellWidth);
	void defaultCellHeightChanged(double defaultCellHeight);

	void minCellWidthChanged(double minCellWidth);
	void minCellHeightChanged(double minCellHeight);

public slots:
	void setDefaultCellWidth(double defaultCellWidth);
	void setDefaultCellHeight(double defaultCellHeight);

	void setMinCellWidth(double minCellWidth);
	void setMinCellHeight(double minCellHeight);

private:
	QMap<int, double> m_heights;
	QMap<int, double> m_widths;

	double m_defaultCellWidth;
	double m_defaultCellHeight;
	double m_minCellWidth;
	double m_minCellHeight;
};
