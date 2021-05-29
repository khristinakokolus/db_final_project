#include "dialog.h"
#include "ui_dialog.h"
#include <QSqlQuery>
#include <QDebug>
#include <QLabel>
#include <QDateTimeEdit>
#include <QMessageBox>
#include "QSqlError"

Dialog::Dialog(QSqlDatabase &db_, QString table_, QWidget *parent) :
    db(db_), table(table_), QDialog(parent),
    ui(new Ui::Dialog)
{
    ui->setupUi(this);
    if(db.open())
        {
            qDebug() <<"opened" ;
            QSqlQuery query("SELECT * FROM alcoholic");
                while (query.next()) {
    //                QString country = query.value(0).toString();
                    qDebug() << query.value(0).toString() + "  " + query.value(1).toString() + "  " + query.value(2).toString() + "  " + query.value(3).toString() + "  " + query.value(4).toString();
                }
        } else {
            // qDebug() << db.lastError().text();
            exit(1);
        }

    QVBoxLayout *vbox = new QVBoxLayout;
    if (table == "alcoholic") {
        QLabel *f_name_lable = new QLabel("*Enter first name of alcoholic:");
        QLabel *l_name_lable = new QLabel("*Enter last name of alcoholic:");
        first_name = new QLineEdit();
        last_name = new QLineEdit();
        vbox->addWidget(f_name_lable);
        vbox->addWidget(first_name);
        vbox->addWidget(l_name_lable);
        vbox->addWidget(last_name);
    } else if (table == "alcohol") {
        QLabel *title = new QLabel("*Enter alcohol title:");
        QLabel *kind = new QLabel("*Enter alcohol kind:");
        QLabel *add_info = new QLabel("Enter additional information:");
        first_name = new QLineEdit();
        last_name = new QLineEdit();
        info = new QLineEdit();
        vbox->addWidget(title);
        vbox->addWidget(first_name);
        vbox->addWidget(kind);
        vbox->addWidget(last_name);
        vbox->addWidget(add_info);
        vbox->addWidget(info);
    } else if (table == "bed") {
        QLabel *type = new QLabel("*Enter bed type:");
        QLabel *add_info = new QLabel("Enter additional information:");
        first_name = new QLineEdit();
        info = new QLineEdit();
        vbox->addWidget(type);
        vbox->addWidget(first_name);
        vbox->addWidget(add_info);
        vbox->addWidget(info);
    } else if (table == "bed_status") {
        QLabel *bed_id = new QLabel("*Enter bed id:");
        QLabel *alcoholic_id = new QLabel("*Enter alcoholic id:");
        QLabel *officer_id = new QLabel("*Enter officer id:");
        QLabel *date_s = new QLabel("*Enter stay start:");
        QLabel *date_e = new QLabel("*Enter stay end:");
        id_1 = new QSpinBox();
        id_2 = new QSpinBox();
        id_3 = new QSpinBox();
        date_start = new QDateTimeEdit();
        date_start->setDisplayFormat("yyyy-dd-MM hh:mm:ss");
        date_end = new QDateTimeEdit();
        date_end->setDisplayFormat("yyyy-dd-MM hh:mm:ss");
        vbox->addWidget(bed_id);
        vbox->addWidget(id_1);
        vbox->addWidget(alcoholic_id);
        vbox->addWidget(id_2);
        vbox->addWidget(officer_id);
        vbox->addWidget(id_3);
        vbox->addWidget(date_s);
        vbox->addWidget(date_start);
        vbox->addWidget(date_e);
        vbox->addWidget(date_end);
    } else if (table == "capture") {
        QLabel *officer_id = new QLabel("*Enter officer id:");
        QLabel *alcoholic_id = new QLabel("*Enter alcoholic id:");
        QLabel *bed_id = new QLabel("*Enter bed id:");
        QLabel *date_s = new QLabel("*Enter date of capture:");
        id_1 = new QSpinBox();
        id_2 = new QSpinBox();
        id_3 = new QSpinBox();
        date_start = new QDateTimeEdit();
        date_start->setDisplayFormat("yyyy-dd-MM hh:mm:ss");
        vbox->addWidget(officer_id);
        vbox->addWidget(id_1);
        vbox->addWidget(alcoholic_id);
        vbox->addWidget(id_2);
        vbox->addWidget(bed_id);
        vbox->addWidget(id_3);
        vbox->addWidget(date_s);
        vbox->addWidget(date_start);
    } else if (table == "escaped") {
        QLabel *alcoholic_id = new QLabel("*Enter alcoholic id:");
        QLabel *bed_id = new QLabel("*Enter bed id:");
        QLabel *date_s = new QLabel("*Enter date of escape:");
        id_1 = new QSpinBox();
        id_2 = new QSpinBox();
        date_start = new QDateTimeEdit();
        date_start->setDisplayFormat("yyyy-dd-MM hh:mm:ss");
        vbox->addWidget(alcoholic_id);
        vbox->addWidget(id_1);
        vbox->addWidget(bed_id);
        vbox->addWidget(id_2);
        vbox->addWidget(date_s);
        vbox->addWidget(date_start);
    } else if (table == "fainted") {
        QLabel *alcoholic_id = new QLabel("*Enter alcoholic id:");
        QLabel *bed_id = new QLabel("*Enter bed id:");
        QLabel *date_s = new QLabel("*Enter date of faint:");
        id_1 = new QSpinBox();
        id_2 = new QSpinBox();
        date_start = new QDateTimeEdit();
        date_start->setDisplayFormat("yyyy-dd-MM hh:mm:ss");
        vbox->addWidget(alcoholic_id);
        vbox->addWidget(id_1);
        vbox->addWidget(bed_id);
        vbox->addWidget(id_2);
        vbox->addWidget(date_s);
        vbox->addWidget(date_start);
    } else if (table == "incident") {
        QLabel *add_info = new QLabel("Enter additional information:");
        info = new QLineEdit();
        vbox->addWidget(add_info);
        vbox->addWidget(info);
    } else if (table == "incident_info") {
        QLabel *alco_id = new QLabel("*Enter alcohol id:");
        QLabel *incident_id = new QLabel("*Enter incident id:");
        QLabel *date_s = new QLabel("*Enter date of drinking alcohol:");
        id_1 = new QSpinBox();
        id_2 = new QSpinBox();
        date_start = new QDateTimeEdit();
        date_start->setDisplayFormat("yyyy-dd-MM hh:mm:ss");
        vbox->addWidget(alco_id);
        vbox->addWidget(id_1);
        vbox->addWidget(incident_id);
        vbox->addWidget(id_2);
        vbox->addWidget(date_s);
        vbox->addWidget(date_start);
    } else if (table == "officer") {
        QLabel *f_name_lable = new QLabel("*Enter first name of officer:");
        QLabel *l_name_lable = new QLabel("*Enter last name of officer:");
        first_name = new QLineEdit();
        last_name = new QLineEdit();
        vbox->addWidget(f_name_lable);
        vbox->addWidget(first_name);
        vbox->addWidget(l_name_lable);
        vbox->addWidget(last_name);
    } else if (table == "released") {
        QLabel *bed_id = new QLabel("*Enter bed id:");
        QLabel *alcoholic_id = new QLabel("*Enter alcoholic id:");
        QLabel *officer_id = new QLabel("*Enter officer id:");
        QLabel *date_s = new QLabel("*Enter date of release:");
        id_1 = new QSpinBox();
        id_2 = new QSpinBox();
        id_3 = new QSpinBox();
        date_start = new QDateTimeEdit();
        date_start->setDisplayFormat("yyyy-dd-MM hh:mm:ss");
        vbox->addWidget(bed_id);
        vbox->addWidget(id_1);
        vbox->addWidget(alcoholic_id);
        vbox->addWidget(id_2);
        vbox->addWidget(officer_id);
        vbox->addWidget(id_3);
        vbox->addWidget(date_s);
        vbox->addWidget(date_start);
    } else if (table == "trailed") {
        QLabel *incident_id = new QLabel("*Enter incident id:");
        QLabel *alcoholic_id = new QLabel("*Enter alcoholic id:");
        id_1 = new QSpinBox();
        id_2 = new QSpinBox();
        vbox->addWidget(incident_id);
        vbox->addWidget(id_1);
        vbox->addWidget(alcoholic_id);
        vbox->addWidget(id_2);
    }
    vbox->addStretch(1);
    ui->groupBox->setLayout(vbox);
}

Dialog::~Dialog()
{
    delete ui;
}

void Dialog::on_pushButton_clicked()
{
    this->~Dialog();
}

void Dialog::on_pushButton_2_clicked()
{
    QSqlQuery* query = new QSqlQuery(db);
    if (table == "alcoholic") {
        if (first_name->text() != "" && last_name->text() !="") {
            QString f_name = "('" + first_name->text() + "',";
            QString l_name = "'" + last_name->text() + "');";
            query->prepare("INSERT INTO alcoholic(first_name, last_name) VALUES" + f_name + l_name);
            query->exec();
            this->~Dialog();
        }
        else {
            QMessageBox::warning(this, "Warning", "Fill in all fields!");
        }
    } else if (table == "alcohol") {
        if (first_name->text() != "" && last_name->text() !="") {
            QString f_name = "('" + first_name->text() + "',";
            QString l_name = "'" + last_name->text() + "',";
            QString add_info = "'" + info->text() + "');";
            query->prepare("INSERT INTO alcohol(title, kind, additional_info) VALUES" + f_name + l_name + add_info);
            query->exec();
            this->~Dialog();
        }
        else {
            QMessageBox::warning(this, "Warning", "Fill in all fields!");
        }
    } else if (table == "bed") {
        if (first_name->text() != "" && last_name->text() !="") {
            QString f_name = "('" + first_name->text() + "',";
            QString add_info = "'" + info->text() + "');";
            query->prepare("INSERT INTO bed(bed_type, aditional_info) VALUES" + f_name + add_info);
            query->exec();
            this->~Dialog();
        }
        else {
            QMessageBox::warning(this, "Warning", "Fill in all fields!");
        }
    } else if (table == "bed_status") {
        if (date_start->dateTime() < date_end->dateTime()) {
            QString bed_id = "(" + QString::number(id_1->value()) + ",";
            QString alcoholic_id = QString::number(id_2->value()) + ",";
            QString officer_id = QString::number(id_3->value()) + ",";
            QString stay_start =  "'" + date_start->dateTime().toString(date_start->displayFormat()) + "',";
            QString stay_end = "'" + date_end->dateTime().toString(date_end->displayFormat()) + "');";
            query->prepare("INSERT INTO bed_status(bed_id, alcoholic_id, officer_id, stay_start, stay_end) VALUES" + \
                           bed_id + alcoholic_id + officer_id + stay_start + stay_end);
            query->exec();
            this->~Dialog();
        }
        else {
            QMessageBox::warning(this, "Warning", "Start date should be before end date!");
        }
    } else if (table == "capture") {
        QString officer_id = "(" + QString::number(id_1->value()) + ",";
        QString alcoholic_id = QString::number(id_2->value()) + ",";
        QString bed_id = QString::number(id_3->value()) + ",";
        QString caught =  "'" + date_start->dateTime().toString(date_start->displayFormat()) + "');";
        query->prepare("INSERT INTO capture(officer_id, alcoholic_id, bed_id, caught_at) VALUES" + \
                       officer_id + alcoholic_id + bed_id + caught);
        query->exec();
        this->~Dialog();
    } else if (table == "escaped") {
        QString bed_id = "(" + QString::number(id_2->value()) + ",";
        QString alcoholic_id = QString::number(id_1->value()) + ",";
        QString escape =  "'" + date_start->dateTime().toString(date_start->displayFormat()) + "');";
        query->prepare("INSERT INTO escaped(bed_id, alcoholic_id, happened_at) VALUES" + \
                       bed_id + alcoholic_id + escape);
        query->exec();
        this->~Dialog();
    } else if (table == "fainted") {
        QString alcoholic_id = "(" + QString::number(id_1->value()) + ",";
        QString bed_id = QString::number(id_2->value()) + ",";
        QString faint =  "'" + date_start->dateTime().toString(date_start->displayFormat()) + "');";
        query->prepare("INSERT INTO fainted(alcoholic_id, bed_id, happened_at) VALUES" + \
                       alcoholic_id + bed_id + faint);
        query->exec();
        this->~Dialog();
    } else if (table == "incident") {
        QString add_info = "('" + info->text() + "');";
        query->prepare("INSERT INTO incident(additional_info) VALUES" + add_info);
        query->exec();
        this->~Dialog();
    } else if (table == "incident_info") {
        QString alco_id = "(" + QString::number(id_1->value()) + ",";
        QString incident_id = QString::number(id_2->value()) + ",";
        QString drank =  "'" + date_start->dateTime().toString(date_start->displayFormat()) + "');";
        query->prepare("INSERT INTO incident_info(alco_id, incident_id, drank_at) VALUES" + \
                       alco_id + incident_id + drank);
        query->exec();
        this->~Dialog();
    } else if (table == "officer") {
        if (first_name->text() != "" && last_name->text() !="") {
            QString f_name = "('" + first_name->text() + "',";
            QString l_name = "'" + last_name->text() + "');";
            query->prepare("INSERT INTO officer(first_name, last_name) VALUES" + f_name + l_name);
            query->exec();
            this->~Dialog();
        }
        else {
            QMessageBox::warning(this, "Warning", "Fill in all fields!");
        }
    } else if (table == "released") {
        QString bed_id = "(" + QString::number(id_1->value()) + ",";
        QString alcoholic_id = QString::number(id_2->value()) + ",";
        QString officer_id = QString::number(id_3->value()) + ",";
        QString release =  "'" + date_start->dateTime().toString(date_start->displayFormat()) + "');";
        query->prepare("INSERT INTO released(bed_id, alcoholic_id, officer_id, happened_at) VALUES" \
                   + bed_id + alcoholic_id + officer_id + release);
        query->exec();
        this->~Dialog();
    } else if (table == "trailed") {
        QString incident_id = "(" + QString::number(id_1->value()) + ",";
        QString alcoholic_id = QString::number(id_2->value()) + ");";
        query->prepare("INSERT INTO trailed(incident_id, alcoholic_id) VALUES" \
                   + incident_id + alcoholic_id);
        query->exec();
        this->~Dialog();
    }
}
