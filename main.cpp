#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "ResizeCellSizes.h"
#include "TableModel.h"

int main(int argc, char *argv[]) {
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication app(argc, argv);

	qmlRegisterType<ResizableCellSizes>("MyTypes", 0, 1, "ResizableCellSizes");
	qmlRegisterType<TableModel>("MyTypes", 0, 1, "TableModel");

	QQmlApplicationEngine engine;
	engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
	if (engine.rootObjects().isEmpty())
		return -1;

	return app.exec();
}
