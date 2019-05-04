#include <QGuiApplication>
#include <QQuickView>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickView engine(QUrl(QStringLiteral("qrc:/main.qml")));
    engine.show();

    return app.exec();
}
