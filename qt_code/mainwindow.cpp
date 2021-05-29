#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QCommandLinkButton>


MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    //******** connect database ********//
    db.setHostName("localhost");
    db.setDatabaseName("sobering_up_station");
    db.setPassword("postgres");
    db.setUserName("postgres");

    //******** PAGE 1 ********//
    ui->tabWidget->setTabText(0, "Search");
    QVBoxLayout *vbox = new QVBoxLayout;
    //vbox->addStretch(1);
    ui->infoBox->setLayout(vbox);
    QVBoxLayout *fbox = new QVBoxLayout;
    fbox->addStretch(1);
    ui->selectBox->setLayout(fbox);

    //******** PAGE 2 ********//
    ui->tabWidget->setTabText(1, "Tables");
    // fill in the combo box with names of tables
    for (auto &t : tables) {
        ui->tableBox->addItem(t);
    }

    // write the table to the table view
    if(db.open()) {
        QSqlQuery* query = new QSqlQuery(db);
        query->prepare("SELECT * FROM alcoholic");
        query->exec();
        model->setQuery(*query);
        ui->tableView->setModel(model);
     } else {
        qDebug() << db.lastError().text();
        exit(1);
     }
    ui->tableView->horizontalHeader()->setSectionResizeMode(QHeaderView::Stretch);
    ui->tableView->setSelectionMode(QAbstractItemView::MultiSelection);
    ui->tableView->setEditTriggers(QAbstractItemView::NoEditTriggers);
    ui->tableView->setSelectionBehavior(QAbstractItemView::SelectRows);
    ui->tableView->verticalHeader()->setVisible(false);

    //******** PAGE 3 ********//
    ui->tabWidget->setTabText(2, "Honors");
    ui->honorBox->addItem("The most dangerous alcoholics");
    ui->honorBox->addItem("The most skilful alcoholics");
    ui->honorBox->addItem("The biggest losers");
    ui->honorBox->addItem("The most industrious officers");

    ui->honor_table->horizontalHeader()->setSectionResizeMode(QHeaderView::Stretch);
    ui->honor_table->setSelectionMode(QAbstractItemView::MultiSelection);
    ui->honor_table->setEditTriggers(QAbstractItemView::NoEditTriggers);
    ui->honor_table->setSelectionBehavior(QAbstractItemView::SelectRows);
    ui->honor_table->verticalHeader()->setVisible(false);

    if(db.open()) {
        QSqlQuery* query = new QSqlQuery(db);
        query->prepare("SELECT alc.first_name, alc.last_name, count(*) as fights \
                        FROM alcoholics_fight as alc_f INNER JOIN alcoholic as alc \
                        ON alc_f.aggressor_id = alc.alcoholic_id \
                        GROUP BY alc.alcoholic_id \
                        ORDER BY fights DESC \
                        LIMIT 10;");
        query->exec();
        model->setQuery(*query);
        ui->honor_table->setModel(model);
     } else {
        qDebug() << db.lastError().text();
        exit(1);
     }
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::clean_layout(QString name)
{
    QLayout* vbox;
    if (name == "select")
        vbox = ui->selectBox->layout();
    else
        vbox = ui->infoBox->layout();
    QLayoutItem *wItem;
    while ((wItem = vbox->takeAt(0)) != 0)
    {
        if (wItem->widget())
        wItem->widget()->setParent(NULL);
        delete wItem;
    }
}


void MainWindow::on_tableBox_currentTextChanged(const QString &arg1)
{
    if(db.open()) {
        QSqlQuery* query = new QSqlQuery(db);
        query->prepare("SELECT * FROM " + arg1);
        query->exec();
        model->setQuery(*query);
        ui->tableView->setModel(model);
     } else {
        qDebug() << db.lastError().text();
        exit(1);
     }
}

QCommandLinkButton* MainWindow::add_button(QString text)
{
    QCommandLinkButton *button = new QCommandLinkButton();
    QLabel * label = new QLabel(button);
    label->setText(text);
    label->setStyleSheet("QLabel {color : #616161;}");
    label->setWordWrap(true);
    label->setAlignment(Qt::AlignCenter);
    label->setMouseTracking(false);
    label->setTextInteractionFlags(Qt::NoTextInteraction);
    button->setLayout(new QVBoxLayout(button));
    button->layout()->setMargin(10);
    button->layout()->addWidget(label);
    button->setIcon(QIcon());
    return button;
}

void MainWindow::on_alcoholic_clicked()
{
    // clean layout
    clean_layout("select");
    clean_layout("info");
    auto* vbox = ui->selectBox->layout();
    // add new items
    QCommandLinkButton *button1 = add_button("<strong>For officer I select all alcoholics that he took "
"to the sobering-up station at least N times for the given period - from date F to date T</strong>");
    connect(button1, SIGNAL(clicked()), this, SLOT(on_alcoholic_1_clicked()));
    vbox->addWidget(button1);
    QCommandLinkButton *button2 = add_button("<strong>Alcoholics that were taken to the SU-station \n"
"at least N times in a given period F to T</strong>");
    connect(button2, SIGNAL(clicked()), this, SLOT(on_alcoholic_2_clicked()));
    vbox->addWidget(button2);
}

void MainWindow::on_alcoholic_1_clicked()
{
    // clean layout
    clean_layout("info");
    auto* vbox = ui->infoBox->layout();
    // add new items
    add_officer();
    add_time();
    QLabel *times = new QLabel("Least times:");
    spin = new QSpinBox();
    vbox->addWidget(times);
    vbox->addWidget(spin);
    QPushButton *find = new QPushButton(tr("Find"));
    vbox->addWidget(find);
    connect(find, SIGNAL(clicked()), this, SLOT(on_alcoholic_1_start_clicked()));
    ui->infoBox->setLayout(vbox);
}

void MainWindow::on_alcoholic_1_start_clicked()
{
    QString first_n = "'" + combox_2->currentText().split(' ')[0] + "'";
    QString last_n = "'" + combox_2->currentText().split(' ')[1] + "'";
    QString date_a = "'" + date_after->dateTime().toString(date_after->displayFormat()) + "'";
    QString date_b = "'" + date_before->dateTime().toString(date_after->displayFormat()) + "'";
    QString N = QString::number(spin->value());
    QSqlQuery* query = new QSqlQuery(db);

    query->prepare("SELECT alcoholic.first_name, alcoholic.last_name \
                    FROM (SELECT * \
                        FROM officer JOIN capture ON capture.officer_id = officer.officer_id \
                        WHERE officer.first_name = " + first_n +
                        "AND officer.last_name = " + last_n +
                        "AND capture.caught_at >= " + date_a +
                        "AND capture.caught_at <= " + date_b + ") AS table_3 \
                        JOIN alcoholic ON alcoholic.alcoholic_id = table_3.alcoholic_id \
                        GROUP BY alcoholic.first_name, alcoholic.last_name \
                        HAVING COUNT(alcoholic.alcoholic_id) >= " + N);
    query->exec();
    QSqlQueryModel *res_model = new QSqlQueryModel();
    res_model->setQuery(*query);
    hide();
    results = new Result(res_model);
    results->exec();
    show();
}

void MainWindow::on_alcoholic_2_clicked()
{
    // clean layout
    clean_layout("info");
    auto* vbox = ui->infoBox->layout();
    // add new items
    add_time();
    QLabel *times = new QLabel("Least times:");
    spin = new QSpinBox();
    vbox->addWidget(times);
    vbox->addWidget(spin);
    QPushButton *find = new QPushButton(tr("Find"));
    vbox->addWidget(find);
    connect(find, SIGNAL(clicked()), this, SLOT(on_alcoholic_2_start_clicked()));
    ui->infoBox->setLayout(vbox);
}

void MainWindow::on_alcoholic_2_start_clicked()
{
    QString date_a = "'" + date_after->dateTime().toString(date_after->displayFormat()) + "'";
    QString date_b = "'" + date_before->dateTime().toString(date_after->displayFormat()) + "'";
    QString N = QString::number(spin->value());
    QSqlQuery* query = new QSqlQuery(db);

    query->prepare("SELECT table_7.first_name, table_7.last_name \
                    FROM (SELECT * \
                          FROM alcoholic JOIN capture ON alcoholic.alcoholic_id = capture.alcoholic_id \
                          WHERE capture.caught_at >= " + date_a + "\
                          AND capture.caught_at <= " + date_b + ") AS table_7 \
                    GROUP BY table_7.first_name, table_7.last_name \
                    HAVING COUNT(*) >= " + N);
    query->exec();
    QSqlQueryModel *res_model = new QSqlQueryModel();
    res_model->setQuery(*query);
    hide();
    results = new Result(res_model);
    results->exec();
    show();
}

void MainWindow::on_bed_clicked()
{
    // clean layout
    clean_layout("select");
    clean_layout("info");
    auto* vbox = ui->selectBox->layout();
    // add new items
    QCommandLinkButton *button1 = add_button("<strong>All beds of the sobering-up station where a given "
"alcoholic A has been from date F to date T</strong>");
    connect(button1, SIGNAL(clicked()), this, SLOT(on_bed_1_clicked()));
    vbox->addWidget(button1);
    QCommandLinkButton *button2 = add_button("<strong>All beds of the sobering-up station where a given "
"alcoholic A escaped for the given period from date F to date T</strong>");
    connect(button2, SIGNAL(clicked()), this, SLOT(on_bed_2_clicked()));
    vbox->addWidget(button2);
    QCommandLinkButton *button3 = add_button("<strong>All beds in decsending order considering the average number of "
"faints for all alcoholics that were taken in a given period F to T by a given inspector I</strong>");
    connect(button3, SIGNAL(clicked()), this, SLOT(on_bed_3_clicked()));
    vbox->addWidget(button3);
}

void MainWindow::on_bed_1_clicked()
{
    // clean layout
    clean_layout("info");
    auto* vbox = ui->infoBox->layout();
    // add new items
    add_alcoholic();
    add_time();

    QPushButton *find = new QPushButton(tr("Find"));
    vbox->addWidget(find);
    connect(find, SIGNAL(clicked()), this, SLOT(on_bed_1_start_clicked()));
    ui->infoBox->setLayout(vbox);
}

void MainWindow::on_bed_1_start_clicked()
{
    QString first_n = "'" + combox->currentText().split(' ')[0] + "'";
    QString last_n = "'" + combox->currentText().split(' ')[1] + "'";
    QString date_a = "'" + date_after->dateTime().toString(date_after->displayFormat()) + "'";
    QString date_b = "'" + date_before->dateTime().toString(date_after->displayFormat()) + "'";
    QSqlQuery* query = new QSqlQuery(db);

    query->prepare("SELECT bed.bed_id \
                    FROM (SELECT * \
                          FROM alcoholic JOIN bed_status ON bed_status.alcoholic_id = alcoholic.alcoholic_id \
                          WHERE alcoholic.first_name = " + first_n + " AND alcoholic.last_name = " + last_n + \
                          "AND bed_status.stay_start >= " + date_a + \
                          "AND bed_status.stay_end <= " + date_b + ") AS table_2 \
                    JOIN bed on bed.bed_id = table_2.bed_id");
    query->exec();
    QSqlQueryModel *res_model = new QSqlQueryModel();
    res_model->setQuery(*query);
    hide();
    results = new Result(res_model);
    results->exec();
    show();
}

void MainWindow::on_bed_2_clicked()
{
    // clean layout
    clean_layout("info");
    auto* vbox = ui->infoBox->layout();
    // add new items
    add_alcoholic();
    add_time();

    QPushButton *find = new QPushButton(tr("Find"));
    vbox->addWidget(find);
    connect(find, SIGNAL(clicked()), this, SLOT(on_bed_2_start_clicked()));
    ui->infoBox->setLayout(vbox);
}

void MainWindow::on_bed_2_start_clicked()
{
    QString first_n = "'" + combox->currentText().split(' ')[0] + "'";
    QString last_n = "'" + combox->currentText().split(' ')[1] + "'";
    QString date_a = "'" + date_after->dateTime().toString(date_after->displayFormat()) + "'";
    QString date_b = "'" + date_before->dateTime().toString(date_after->displayFormat()) + "'";
    QSqlQuery* query = new QSqlQuery(db);

    query->prepare("SELECT bed.bed_id \
                    FROM (SELECT * \
                          FROM alcoholic JOIN escaped ON escaped.alcoholic_id = alcoholic.alcoholic_id \
                          WHERE alcoholic.first_name = " + first_n +
                          "AND alcoholic.last_name = " + last_n + \
                          "AND escaped.happened_at >= " + date_a + \
                          "AND escaped.happened_at <= " + date_b + ") AS table_4 \
                    JOIN bed on table_4.bed_id = bed.bed_id;");
    query->exec();
    QSqlQueryModel *res_model = new QSqlQueryModel();
    res_model->setQuery(*query);
    hide();
    results = new Result(res_model);
    results->exec();
    show();
}

void MainWindow::on_bed_3_clicked()
{
    // clean layout
    clean_layout("info");
    auto* vbox = ui->infoBox->layout();
    // add new items
    add_officer();
    add_time();
    QPushButton *find = new QPushButton(tr("Find"));
    vbox->addWidget(find);
    connect(find, SIGNAL(clicked()), this, SLOT(on_bed_3_start_clicked()));
    ui->infoBox->setLayout(vbox);
}

void MainWindow::on_bed_3_start_clicked()
{
    QString first_n = "'" + combox_2->currentText().split(' ')[0] + "'";
    QString last_n = "'" + combox_2->currentText().split(' ')[1] + "'";
    QString date_a = "'" + date_after->dateTime().toString(date_after->displayFormat()) + "'";
    QString date_b = "'" + date_before->dateTime().toString(date_after->displayFormat()) + "'";
    QSqlQuery* query = new QSqlQuery(db);

    query->prepare("SELECT fainted.bed_id, COUNT(*) AS avarage_num_faints \
                    FROM fainted JOIN capture ON fainted.bed_id = capture.bed_id JOIN officer ON officer.officer_id = capture.officer_id \
                    WHERE fainted.happened_at >= " + date_a + " AND fainted.happened_at <= " + date_b + " \
                    AND officer.first_name = " + first_n + " AND officer.last_name = " + last_n + " \
                    GROUP BY fainted.bed_id \
                    ORDER BY COUNT(fainted.alcoholic_id) DESC;");
    query->exec();
    QSqlQueryModel *res_model = new QSqlQueryModel();
    res_model->setQuery(*query);
    hide();
    results = new Result(res_model);
    results->exec();
    show();
}

void MainWindow::on_officer_clicked()
{
    // clean layout
    clean_layout("select");
    clean_layout("info");
    auto* vbox = ui->selectBox->layout();
    // add new items
    QCommandLinkButton *button1 = add_button("<strong>Officers that took a given alcoholic "
"to the sobering-up station at least N times from date F to T</strong>");
    connect(button1, SIGNAL(clicked()), this, SLOT(on_officer_1_clicked()));
    vbox->addWidget(button1);
    QCommandLinkButton *button2 = add_button("<strong>Officers that took a given alcoholic "
"to the SU-station less than they let him go</strong>");
    connect(button2, SIGNAL(clicked()), this, SLOT(on_officer_2_clicked()));
    vbox->addWidget(button2);
    QCommandLinkButton *button3 = add_button("<strong>Officers that took at least N distinct "
"alcoholics in a given period F to T</strong>");
    connect(button3, SIGNAL(clicked()), this, SLOT(on_officer_3_clicked()));
    vbox->addWidget(button3);
}

void MainWindow::on_officer_1_clicked()
{
    // clean layout
    clean_layout("info");
    auto* vbox = ui->infoBox->layout();
    // add new items
    add_alcoholic();
    add_time();
    QLabel *times = new QLabel("Least times:");
    spin = new QSpinBox();
    vbox->addWidget(times);
    vbox->addWidget(spin);
    QPushButton *find = new QPushButton(tr("Find"));
    vbox->addWidget(find);
    connect(find, SIGNAL(clicked()), this, SLOT(on_officer_1_start_clicked()));
    ui->infoBox->setLayout(vbox);
}

void MainWindow::on_officer_1_start_clicked()
{
    QString first_n = "'" + combox->currentText().split(' ')[0] + "'";
    QString last_n = "'" + combox->currentText().split(' ')[1] + "'";
    QString date_a = "'" + date_after->dateTime().toString(date_after->displayFormat()) + "'";
    QString date_b = "'" + date_before->dateTime().toString(date_after->displayFormat()) + "'";
    QString N = QString::number(spin->value());
    QSqlQuery* query = new QSqlQuery(db);

    query->prepare("SELECT officer.first_name, officer.last_name \
                FROM (SELECT first_name, last_name, officer_id \
                      FROM alcoholic JOIN capture ON alcoholic.alcoholic_id = capture.alcoholic_id \
                      WHERE alcoholic.first_name = " + first_n +
                      "AND alcoholic.last_name = " + last_n +
                      "AND capture.caught_at >= " + date_a +
                      "AND capture.caught_at <= " + date_b  + ") AS table_1 \
                JOIN officer on officer.officer_id = table_1.officer_id \
                GROUP BY officer.first_name, officer.last_name \
                HAVING COUNT(table_1.officer_id) >= " + N);
    query->exec();
    QSqlQueryModel *res_model = new QSqlQueryModel();
    res_model->setQuery(*query);
    hide();
    results = new Result(res_model);
    results->exec();
    show();
}

void MainWindow::on_officer_2_clicked()
{
    // clean layout
    clean_layout("info");
    auto* vbox = ui->infoBox->layout();
    // add new items
    add_alcoholic();
    QPushButton *find = new QPushButton(tr("Find"));
    vbox->addWidget(find);
    connect(find, SIGNAL(clicked()), this, SLOT(on_officer_2_start_clicked()));
    ui->infoBox->setLayout(vbox);
}

void MainWindow::on_officer_2_start_clicked()
{
    QString first_n = "'" + combox->currentText().split(' ')[0] + "'";
    QString last_n = "'" + combox->currentText().split(' ')[1] + "'";
    QSqlQuery* query = new QSqlQuery(db);

    query->prepare("SELECT officer.first_name, officer.last_name \
                    FROM ( \
                    SELECT table_5_1.officer_id, capture_number, release_number \
                    FROM (SELECT officer_id, COUNT(*) AS capture_number \
                    FROM (SELECT officer_id, capture.alcoholic_id, bed_id, caught_at FROM capture \
                    JOIN (SELECT alcoholic_id FROM alcoholic \
                    WHERE alcoholic.first_name = " + first_n + " AND alcoholic.last_name = " + last_n +") AS alcoid_by_names \
                    ON alcoid_by_names.alcoholic_id = capture.alcoholic_id) AS specific_captures \
                    GROUP BY officer_id) AS table_5_1 \
                    INNER JOIN (SELECT officer_id, COUNT(*) AS release_number \
                    FROM (SELECT bed_id, released.alcoholic_id, officer_id, happened_at FROM released \
                    JOIN (SELECT alcoholic_id FROM alcoholic \
                    WHERE alcoholic.first_name = " + first_n + " AND alcoholic.last_name = " + last_n +") \
                    AS alcoid_by_names ON alcoid_by_names.alcoholic_id = released.alcoholic_id) AS specific_releases \
                    GROUP BY officer_id) AS table_5_2 \
                    ON table_5_1.officer_id = table_5_2.officer_id \
                    WHERE capture_number < release_number) AS inspectors_satisfying_1 \
                    JOIN officer ON officer.officer_id = inspectors_satisfying_1.officer_id");
    query->exec();
    QSqlQueryModel *res_model = new QSqlQueryModel();
    res_model->setQuery(*query);
    hide();
    results = new Result(res_model);
    results->exec();
    show();
}

void MainWindow::on_officer_3_clicked()
{
    // clean layout
    clean_layout("info");
    auto* vbox = ui->infoBox->layout();
    // add new items
    add_time();
    QLabel *times = new QLabel("Least distinct alcoholics:");
    spin = new QSpinBox();
    vbox->addWidget(times);
    vbox->addWidget(spin);
    QPushButton *find = new QPushButton(tr("Find"));
    vbox->addWidget(find);
    connect(find, SIGNAL(clicked()), this, SLOT(on_officer_3_start_clicked()));
    ui->infoBox->setLayout(vbox);
}

void MainWindow::on_officer_3_start_clicked()
{
    QString date_a = "'" + date_after->dateTime().toString(date_after->displayFormat()) + "'";
    QString date_b = "'" + date_before->dateTime().toString(date_after->displayFormat()) + "'";
    QString N = QString::number(spin->value());
    QSqlQuery* query = new QSqlQuery(db);

    query->prepare("SELECT officer.first_name, officer.last_name \
                    FROM (SELECT first_name, last_name, officer.officer_id, capture.alcoholic_id \
                       FROM officer JOIN capture ON officer.officer_id = capture.officer_id \
                       WHERE capture.caught_at >= " + date_a + " \
                       AND capture.caught_at <= "+ date_b + ") AS table_6 \
                    JOIN officer ON officer.officer_id = table_6.officer_id \
                    GROUP BY officer.first_name, officer.last_name \
                    HAVING COUNT (DISTINCT table_6.alcoholic_id) >= " + N);
    query->exec();
    QSqlQueryModel *res_model = new QSqlQueryModel();
    res_model->setQuery(*query);
    hide();
    results = new Result(res_model);
    results->exec();
    show();
}

void MainWindow::on_events_clicked()
{
    // clean layout
    clean_layout("select");
    clean_layout("info");
    auto* vbox = ui->selectBox->layout();
    // add new items
    QCommandLinkButton *button1 = add_button("<strong>Common events for an alcoholic A and "
"officer I in a given period - F to T</strong>");
    connect(button1, SIGNAL(clicked()), this, SLOT(on_events_1_clicked()));
    vbox->addWidget(button1);
    QCommandLinkButton *button2 = add_button("<strong>Number of times a given alcoholic A drank "
"each alcoholic drink with at least N other alcoholics in a given period F to T</strong>");
    connect(button2, SIGNAL(clicked()), this, SLOT(on_events_2_clicked()));
    vbox->addWidget(button2);
    QCommandLinkButton *button3 = add_button("<strong>Total number of times alcoholics escaped "
"from the given SU-station by months</strong>");
    connect(button3, SIGNAL(clicked()), this, SLOT(on_events_3_clicked()));
    vbox->addWidget(button3);
}

void MainWindow::on_events_1_clicked()
{
    // clean layout
    clean_layout("info");
    auto* vbox = ui->infoBox->layout();
    // add new items
    add_alcoholic();
    add_officer();
    add_time();
    QPushButton *find = new QPushButton(tr("Find"));
    vbox->addWidget(find);
    connect(find, SIGNAL(clicked()), this, SLOT(on_events_1_start_clicked()));
    ui->infoBox->setLayout(vbox);
}

void MainWindow::on_events_1_start_clicked()
{
    QString first_n = "'" + combox->currentText().split(' ')[0] + "'";
    QString last_n = "'" + combox->currentText().split(' ')[1] + "'";
    QString first_n_o = "'" + combox_2->currentText().split(' ')[0] + "'";
    QString last_n_o = "'" + combox_2->currentText().split(' ')[1] + "'";
    QString date_a = "'" + date_after->dateTime().toString(date_after->displayFormat()) + "'";
    QString date_b = "'" + date_before->dateTime().toString(date_after->displayFormat()) + "'";
    QSqlQuery* query = new QSqlQuery(db);

    query->prepare("SELECT released_id, capture_id FROM \
                    (SELECT released.released_id, capture.capture_id, capture.alcoholic_id, capture.officer_id \
                    FROM released JOIN capture \
                    ON released.alcoholic_id = capture.alcoholic_id AND released.officer_id = capture.officer_id \
                    WHERE capture.caught_at >= " + date_a + " AND capture.caught_at <= " + date_b + " AND \
                    released.happened_at >= " + date_a + " AND released.happened_at <= " + date_b + ") AS table_8_1 \
                    JOIN (SELECT alcoholic_id FROM alcoholic \
                       WHERE first_name = " + first_n + " AND last_name = " + last_n + ") AS alc \
                    ON table_8_1.alcoholic_id = alc.alcoholic_id \
                    JOIN (SELECT officer_id FROM officer \
                      WHERE first_name = " + first_n_o + " AND last_name = " + last_n_o + ") AS offc \
                    ON table_8_1.officer_id = offc.officer_id");
    query->exec();
    QSqlQueryModel *res_model = new QSqlQueryModel();
    res_model->setQuery(*query);
    hide();
    results = new Result(res_model);
    results->exec();
    show();
}

void MainWindow::on_events_2_clicked()
{
    // clean layout
    clean_layout("info");
    auto* vbox = ui->infoBox->layout();
    // add new items
    add_alcoholic();
    add_time();
    QLabel *times = new QLabel("Least times:");
    spin = new QSpinBox();
    vbox->addWidget(times);
    vbox->addWidget(spin);
    QPushButton *find = new QPushButton(tr("Find"));
    vbox->addWidget(find);
    connect(find, SIGNAL(clicked()), this, SLOT(on_events_2_start_clicked()));
    ui->infoBox->setLayout(vbox);
}

void MainWindow::on_events_2_start_clicked()
{
    QString first_n = "'" + combox->currentText().split(' ')[0] + "'";
    QString last_n = "'" + combox->currentText().split(' ')[1] + "'";
    QString date_a = "'" + date_after->dateTime().toString(date_after->displayFormat()) + "'";
    QString date_b = "'" + date_before->dateTime().toString(date_after->displayFormat()) + "'";
    QString N = QString::number(spin->value());
    QSqlQuery* query = new QSqlQuery(db);

    query->prepare("SELECT table_9_1.title, COUNT(*) FROM(SELECT alcohol.title, incident_info.incident_id FROM alcohol JOIN incident_info ON alcohol.alco_id = incident_info.alco_id) AS table_9_1 \
                    JOIN (SELECT trailed.incident_id, trailed.alcoholic_id FROM incident_info JOIN trailed ON \
                    incident_info.incident_id = trailed.incident_id  WHERE incident_info.drank_at >= " + date_a + " \
                    AND incident_info.drank_at <= " + date_b + ") As table_9_2 ON \
                    table_9_1.incident_id = table_9_2.incident_id \
                    JOIN(SELECT trailed.incident_id, alcoholic.alcoholic_id FROM trailed JOIN alcoholic \
                    ON trailed.alcoholic_id = alcoholic.alcoholic_id WHERE alcoholic.first_name = " + first_n + " \
                    AND alcoholic.last_name = " + last_n + ") AS table_9_3 \
                    ON table_9_3.incident_id = table_9_1.incident_id \
                    GROUP BY table_9_1.title \
                    HAVING COUNT (table_9_2.incident_id) > " + N);
    query->exec();
    QSqlQueryModel *res_model = new QSqlQueryModel();
    res_model->setQuery(*query);
    hide();
    results = new Result(res_model);
    results->exec();
    show();
}

void MainWindow::on_events_3_clicked()
{
    // clean layout
    clean_layout("info");
    auto* vbox = ui->infoBox->layout();
    // add new items
    QLabel *label = new QLabel("No additional info is needed");
    vbox->addWidget(label);
    QPushButton *find = new QPushButton(tr("Find"));
    vbox->addWidget(find);
    connect(find, SIGNAL(clicked()), this, SLOT(on_events_3_start_clicked()));
    ui->infoBox->setLayout(vbox);
}

void MainWindow::on_events_3_start_clicked()
{
    QSqlQuery* query = new QSqlQuery(db);

    query->prepare("SELECT to_char(happened_at, 'Mon') AS month, EXTRACT(YEAR FROM happened_at) as year, \
                        COUNT(alcoholic_id) as alcoholic_amount \
                        FROM escaped \
                        GROUP BY month, year");
    query->exec();
    QSqlQueryModel *res_model = new QSqlQueryModel();
    res_model->setQuery(*query);
    hide();
    results = new Result(res_model);
    results->exec();
    show();
}

void MainWindow::on_drinks_clicked()
{
    // clean layout
    clean_layout("select");
    clean_layout("info");
    auto* vbox = ui->selectBox->layout();
    // add new items
    QCommandLinkButton *button1 = add_button("<strong>Alcoholic drinks in descending order considering "
"the total number of alcoholics that drank those drinks with a given alcoholic A in a given period F to T</strong>");
    connect(button1, SIGNAL(clicked()), this, SLOT(on_drinks_1_clicked()));
    vbox->addWidget(button1);

}

void MainWindow::on_drinks_1_clicked()
{
    // clean layout
    clean_layout("info");
    auto* vbox = ui->infoBox->layout();
    // add new items
    add_alcoholic();
    add_time();
    QPushButton *find = new QPushButton(tr("Find"));
    vbox->addWidget(find);
    connect(find, SIGNAL(clicked()), this, SLOT(on_drinks_1_start_clicked()));
    ui->infoBox->setLayout(vbox);
}

void MainWindow::on_drinks_1_start_clicked()
{
    QString first_n = "'" + combox->currentText().split(' ')[0] + "'";
    QString last_n = "'" + combox->currentText().split(' ')[1] + "'";
    QString date_a = "'" + date_after->dateTime().toString(date_after->displayFormat()) + "'";
    QString date_b = "'" + date_before->dateTime().toString(date_after->displayFormat()) + "'";
    QSqlQuery* query = new QSqlQuery(db);

    query->prepare("SELECT table_12_1.title, COUNT(*) AS num_of_alcoholics \
                    FROM(SELECT alcohol.title, incident_info.incident_id FROM alcohol \
                    JOIN incident_info ON alcohol.alco_id = incident_info.alco_id) AS table_12_1 \
                    JOIN (SELECT trailed.incident_id, trailed.alcoholic_id FROM incident_info \
                    JOIN trailed ON incident_info.incident_id = trailed.incident_id  \
                    WHERE incident_info.drank_at >= " + date_a + " AND incident_info.drank_at <= " + date_b + ") As table_12_2 ON \
                    table_12_1.incident_id = table_12_2.incident_id \
                    JOIN(SELECT trailed.incident_id, alcoholic.alcoholic_id FROM trailed \
                    JOIN alcoholic ON trailed.alcoholic_id = alcoholic.alcoholic_id \
                    WHERE alcoholic.first_name = " + first_n + " AND alcoholic.last_name = " + last_n + ") AS table_12_3 \
                    ON table_12_3.incident_id = table_12_1.incident_id \
                    GROUP BY table_12_1.title \
                    ORDER BY COUNT(table_12_3.incident_id) DESC");
    query->exec();
    QSqlQueryModel *res_model = new QSqlQueryModel();
    res_model->setQuery(*query);
    hide();
    results = new Result(res_model);
    results->exec();
    show();
}


void MainWindow::add_time()
{
    auto* vbox = ui->infoBox->layout();
    QLabel *from = new QLabel("Choose date from:");
    QLabel *to = new QLabel("to:");
    date_after = new QDateTimeEdit();
    date_after->setDisplayFormat("yyyy-dd-MM hh:mm:ss");
    date_before = new QDateTimeEdit();
    date_before->setDisplayFormat("yyyy-dd-MM hh:mm:ss");
    vbox->addWidget(from);
    vbox->addWidget(date_after);
    vbox->addWidget(to);
    vbox->addWidget(date_before);
}

void MainWindow::add_alcoholic()
{
    auto* vbox = ui->infoBox->layout();
    combox = new QComboBox();
    QLabel *alcoholic = new QLabel("Choose alcoholic name");
    QSqlQuery query("SELECT (first_name || ' ' || last_name) AS name FROM alcoholic ORDER BY first_name");
    while (query.next()) {
        combox->addItem(query.value(0).toString());
    }

    vbox->addWidget(alcoholic);
    vbox->addWidget(combox);
}

void MainWindow::add_officer()
{
    auto* vbox = ui->infoBox->layout();
    combox_2 = new QComboBox();
    QLabel *officer = new QLabel("Choose officer name");
    QSqlQuery query("SELECT (first_name || ' ' || last_name) AS name FROM officer ORDER BY first_name");
    while (query.next()) {
        combox_2->addItem(query.value(0).toString());
    }

    vbox->addWidget(officer);
    vbox->addWidget(combox_2);
}

void MainWindow::on_pushButton_clicked()
{
    adder = new Dialog(db, ui->tableBox->currentText());
    adder->exec();
    ui->tableBox->currentTextChanged(ui->tableBox->currentText());
}


void MainWindow::on_honorBox_currentIndexChanged(const QString &arg1)
{
    QSqlQuery* query = new QSqlQuery(db);
    if(db.open()) {
        if (arg1 == "The most dangerous alcoholics") {
            query->prepare("SELECT alc.first_name, alc.last_name, count(*) as fights \
                            FROM alcoholics_fight as alc_f INNER JOIN alcoholic as alc \
                            ON alc_f.aggressor_id = alc.alcoholic_id \
                            GROUP BY alc.alcoholic_id \
                            ORDER BY fights DESC \
                            LIMIT 10;");
        } else if (arg1 == "The most skilful alcoholics") {
            query->prepare("SELECT alc.first_name, alc.last_name, count(*) as fights_won \
                            FROM alcoholics_fight as alc_f INNER JOIN alcoholic as alc \
                            ON alc_f.winner_id = alc.alcoholic_id \
                            GROUP BY alc.alcoholic_id \
                            ORDER BY fights_won DESC \
                            LIMIT 10;");
        } else if (arg1 == "The biggest losers") {
            query->prepare("SELECT honor_board_alcoholic.first_name, honor_board_alcoholic.last_name, COUNT(honor_board_alcoholic.alcoholic_id) AS caught_amount \
                            FROM (SELECT alcoholic.first_name, alcoholic.last_name, capture.alcoholic_id  \
                                  FROM alcoholic \
                                  JOIN capture ON alcoholic.alcoholic_id = capture.alcoholic_id) as honor_board_alcoholic \
                            GROUP BY honor_board_alcoholic.first_name, honor_board_alcoholic.last_name \
                            ORDER BY COUNT(honor_board_alcoholic.alcoholic_id) DESC \
                            LIMIT 10;");
        } else if (arg1 == "The most industrious officers") {
            query->prepare("SELECT honor_board_officer.first_name, honor_board_officer.last_name, COUNT(honor_board_officer.officer_id) AS caught_amount \
                            FROM (SELECT officer.first_name, officer.last_name, capture.officer_id \
                                  FROM officer \
                                  JOIN capture ON officer.officer_id = capture.officer_id) as honor_board_officer \
                            GROUP BY honor_board_officer.first_name, honor_board_officer.last_name \
                            ORDER BY COUNT(honor_board_officer.officer_id) DESC \
                            LIMIT 10;");
        }
     } else {
        qDebug() << db.lastError().text();
        exit(1);
     }
    query->exec();
    model->setQuery(*query);
    ui->honor_table->setModel(model);
}
