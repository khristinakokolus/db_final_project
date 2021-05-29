#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QList>
#include <QString>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QDebug>
#include <QSqlQueryModel>
#include "QSqlError"
#include <QComboBox>
#include <QDateTimeEdit>
#include <QLabel>
#include <QSpinBox>
#include <QPushButton>
#include <QCommandLinkButton>
#include "result.h"
#include "dialog.h"

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void on_tableBox_currentTextChanged(const QString &arg1);

    void on_pushButton_clicked();

    void on_alcoholic_clicked();

    void on_alcoholic_1_clicked();

    void on_alcoholic_1_start_clicked();

    void on_alcoholic_2_clicked();

    void on_alcoholic_2_start_clicked();

    void on_bed_clicked();

    void on_bed_1_clicked();

    void on_bed_1_start_clicked();

    void on_bed_2_clicked();

    void on_bed_2_start_clicked();

    void on_bed_3_clicked();

    void on_bed_3_start_clicked();

    void on_officer_clicked();

    void on_officer_1_clicked();

    void on_officer_1_start_clicked();

    void on_officer_2_clicked();

    void on_officer_2_start_clicked();

    void on_officer_3_clicked();

    void on_officer_3_start_clicked();

    void on_events_clicked();

    void on_events_1_clicked();

    void on_events_1_start_clicked();

    void on_events_2_clicked();

    void on_events_2_start_clicked();

    void on_events_3_clicked();

    void on_events_3_start_clicked();

    void on_drinks_clicked();

    void on_drinks_1_clicked();

    void on_drinks_1_start_clicked();

    void clean_layout(QString name);

    void add_time();

    void add_alcoholic();

    void add_officer();

    QCommandLinkButton* add_button(QString text);

    void on_honorBox_currentIndexChanged(const QString &arg1);

private:
    Ui::MainWindow *ui;
    Result *results;
    Dialog *adder;
    QList<QString> tables = {"alcoholic", "alcohol", "bed", "bed_status", "capture", "escaped", "fainted",
                             "incident", "incident_info", "officer", "released", "trailed"};
    QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");
    QSqlQueryModel* model = new QSqlQueryModel();
    QComboBox* combox;
    QComboBox* combox_2;
    QDateTimeEdit *date_after;
    QDateTimeEdit *date_before;
    QSpinBox *spin;
};
#endif // MAINWINDOW_H
