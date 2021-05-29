#ifndef RESULT_H
#define RESULT_H

#include <QDialog>
#include <QSqlQueryModel>

namespace Ui {
class Result;
}

class Result : public QDialog
{
    Q_OBJECT

public:
    explicit Result(QSqlQueryModel *model, QWidget *parent = nullptr);
    ~Result();

private slots:
    void on_pushButton_clicked();

private:
    Ui::Result *ui;
};

#endif // RESULT_H
