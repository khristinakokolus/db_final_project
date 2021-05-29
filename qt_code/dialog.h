#ifndef DIALOG_H
#define DIALOG_H

#include <QDialog>
#include <QSqlDatabase>
#include <QLineEdit>
#include <QSpinBox>

namespace Ui {
class Dialog;
}

class Dialog : public QDialog
{
    Q_OBJECT

public:
    explicit Dialog(QSqlDatabase &db_, QString table_, QWidget *parent = nullptr);
    ~Dialog();

private slots:
    void on_pushButton_clicked();

    void on_pushButton_2_clicked();

private:
    Ui::Dialog *ui;
    QSqlDatabase db;
    QString table;
    QLineEdit *first_name;
    QLineEdit *last_name;
    QLineEdit *info;
    QSpinBox *id_1;
    QSpinBox *id_2;
    QSpinBox *id_3;
    QDateTimeEdit *date_start;
    QDateTimeEdit *date_end;
};

#endif // DIALOG_H
