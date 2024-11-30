#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include <QQuickStyle>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    // Set the QML style to Material
    QQuickStyle::setStyle("Material");

    //Register montserrat fonts
    QFontDatabase::addApplicationFont(":/resources/fonts/Montserrat-Black.ttf");
    QFontDatabase::addApplicationFont(":/resources/fonts/Montserrat-BlackItalic.ttf");
    QFontDatabase::addApplicationFont(":/resources/fonts/Montserrat-Bold.ttf");
    QFontDatabase::addApplicationFont(":/resources/fonts/Montserrat-BoldItalic.ttf");
    QFontDatabase::addApplicationFont(":/resources/fonts/Montserrat-ExtraBold.ttf");
    QFontDatabase::addApplicationFont(":/resources/fonts/Montserrat-ExtraBoldItalic.ttf");
    QFontDatabase::addApplicationFont(":/resources/fonts/Montserrat-ExtraLight.ttf");
    QFontDatabase::addApplicationFont(":/resources/fonts/Montserrat-ExtraLightItalic.ttf");
    QFontDatabase::addApplicationFont(":/resources/fonts/Montserrat-Italic.ttf");
    QFontDatabase::addApplicationFont(":/resources/fonts/Montserrat-Light.ttf");
    QFontDatabase::addApplicationFont(":/resources/fonts/Montserrat-LightItalic.ttf");
    QFontDatabase::addApplicationFont(":/resources/fonts/Montserrat-Medium.ttf");
    QFontDatabase::addApplicationFont(":/resources/fonts/Montserrat-MediumItalic.ttf");
    QFontDatabase::addApplicationFont(":/resources/fonts/Montserrat-Regular.ttf");
    QFontDatabase::addApplicationFont(":/resources/fonts/Montserrat-SemiBold.ttf");
    QFontDatabase::addApplicationFont(":/resources/fonts/Montserrat-SemiBoldItalic.ttf");
    QFontDatabase::addApplicationFont(":/resources/fonts/Montserrat-Thin.ttf");
    QFontDatabase::addApplicationFont(":/resources/fonts/Montserrat-ThinItalic.ttf");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
