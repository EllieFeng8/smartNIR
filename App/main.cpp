// Copyright (C) 2024 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QApplication>
#include <QQmlApplicationEngine>

#include "autogen/environment.h"
#include "Core/SmartnirProxy.h"

int main(int argc, char *argv[])
{
    set_qt_environment();
    QApplication app(argc, argv);
    SmartnirProxy *Sn = new SmartnirProxy();
    qmlRegisterSingletonInstance<SmartnirProxy>("Core", 1, 0, "Sn", Sn);

    QQmlApplicationEngine engine;
    const QUrl url(mainQmlFile);
    QObject::connect(
                &engine, &QQmlApplicationEngine::objectCreated, &app,
                [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.addImportPath(QCoreApplication::applicationDirPath() + "/qml");
    engine.addImportPath(":/");
    engine.load(url);

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
