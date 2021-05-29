#include "mainwindow.h"

#include <QApplication>
#include <QFile>
#include "qicon.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    a.setWindowIcon(QIcon(":/no-alcohol.png"));
    w.setWindowTitle("Sobering");
    w.show();
    QFile file(":/stylesheet.qss");
    file.open(QFile::ReadOnly);
    QString styleSheet = QLatin1String(file.readAll());
    qApp->setStyleSheet(styleSheet);
    return a.exec();
}
