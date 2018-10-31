#include "ResizeCellSizes.h"

#include <QtDebug>

ResizableCellSizes::ResizableCellSizes(QObject* parent) :
	QObject(parent),
	m_defaultCellWidth(100),
	m_defaultCellHeight(100),
	m_minCellWidth(100),
	m_minCellHeight(100) {
}

double ResizableCellSizes::rowHeight(int row) {
	return m_heights.value(row, m_defaultCellHeight);
}

double ResizableCellSizes::columnWidth(int column) {
	return m_widths.value(column, m_defaultCellWidth);
}

void ResizableCellSizes::setRowHeight(int row, double height) {
	m_heights.insert(row, qMax(height, m_minCellHeight));
}

void ResizableCellSizes::setColumnWidth(int column, double width) {
	m_widths.insert(column, qMax(width, m_minCellWidth));
}

double ResizableCellSizes::defaultCellWidth() const {
	return m_defaultCellWidth;
}

double ResizableCellSizes::defaultCellHeight() const {
	return m_defaultCellHeight;
}

double ResizableCellSizes::minCellWidth() const {
	return m_minCellWidth;
}

double ResizableCellSizes::minCellHeight() const {
	return m_minCellHeight;
}

void ResizableCellSizes::setDefaultCellWidth(double defaultCellWidth) {
//	qWarning("Floating point comparison needs context sanity check");
	if (qFuzzyCompare(m_defaultCellWidth, defaultCellWidth))
		return;

	m_defaultCellWidth = defaultCellWidth;
	emit defaultCellWidthChanged(m_defaultCellWidth);
}

void ResizableCellSizes::setDefaultCellHeight(double defaultCellHeight) {
//	qWarning("Floating point comparison needs context sanity check");
	if (qFuzzyCompare(m_defaultCellHeight, defaultCellHeight))
		return;

	m_defaultCellHeight = defaultCellHeight;
	emit defaultCellHeightChanged(m_defaultCellHeight);
}

void ResizableCellSizes::setMinCellWidth(double minCellWidth) {
//	qWarning("Floating point comparison needs context sanity check");
	if (qFuzzyCompare(m_minCellWidth, minCellWidth))
		return;

	m_minCellWidth = minCellWidth;
	emit minCellWidthChanged(m_minCellWidth);
}

void ResizableCellSizes::setMinCellHeight(double minCellHeight) {
//	qWarning("Floating point comparison needs context sanity check");
	if (qFuzzyCompare(m_minCellHeight, minCellHeight))
		return;

	m_minCellHeight = minCellHeight;
	emit minCellHeightChanged(m_minCellHeight);
}
