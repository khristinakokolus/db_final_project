-- DROPING ALL TABLES:
-- drop table capture;
-- drop table escaped;
-- drop table released;
-- drop table fainted;
-- drop table incident_info;
-- drop table bed_status;
-- drop table bed;
-- drop table alcohol;
-- drop table officer;
-- drop table trailed;
-- drop table alcoholic;
-- drop table incident;

CREATE TABLE alcoholic (
  alcoholic_id SERIAL PRIMARY KEY,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

INSERT INTO alcoholic(first_name, last_name, created_at, updated_at) VALUES
('Lucas', 'Smith', '2021-01-15 08:01:00', CURRENT_TIMESTAMP),
('Oliver', 'Taylor', '2021-04-24 17:25:44', CURRENT_TIMESTAMP),
('James', 'Martin', '2021-03-14 14:28:25', CURRENT_TIMESTAMP),
('Henry', 'Clark', '2021-03-16 02:27:03', CURRENT_TIMESTAMP),
('Michael', 'Walker', '2021-01-09 15:41:35', CURRENT_TIMESTAMP),
('Jack', 'Thompson', '2021-04-25 21:44:58', CURRENT_TIMESTAMP),
('Matthew', 'Brown', '2021-03-01 09:58:18', CURRENT_TIMESTAMP),
('David', 'Johnson', '2021-04-12 13:30:12', CURRENT_TIMESTAMP),
('Luke', 'Williams', '2021-04-08 10:05:47', CURRENT_TIMESTAMP),
('Leo', 'Jones', '2021-02-11 08:41:29', CURRENT_TIMESTAMP);

CREATE TABLE officer (
  officer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

INSERT INTO officer(first_name, last_name, created_at, updated_at) VALUES
('Adrian', 'Lopez', '2020-03-23 13:17:50', CURRENT_TIMESTAMP),
('Colton', 'Wilson', '2020-02-10 23:28:57', CURRENT_TIMESTAMP),
('Cameron', 'Moore', '2020-04-10 09:28:27', CURRENT_TIMESTAMP),
('Ezra', 'Lee', '2020-03-28 21:53:31', CURRENT_TIMESTAMP),
('Leonardo', 'White', '2020-01-02 06:47:39', CURRENT_TIMESTAMP),
('Adam', 'Harris', '2020-01-25 19:52:30', CURRENT_TIMESTAMP),
('Wesley', 'Clark', '2020-04-20 10:45:40', CURRENT_TIMESTAMP),
('Waylon', 'Lewis', '2020-04-20 10:47:50', CURRENT_TIMESTAMP),
('Bennett', 'Young', '2020-02-20 03:48:17', CURRENT_TIMESTAMP),
('George', 'Allen', '2020-02-29 09:51:23', CURRENT_TIMESTAMP);

CREATE INDEX officer_idx
ON officer(first_name, last_name);

CREATE TABLE alcohol (
  alco_id SERIAL PRIMARY KEY,
  title VARCHAR(20) UNIQUE NOT NULL,
  kind VARCHAR(20) NOT NULL,
  additional_info TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

INSERT INTO alcohol(title, kind, created_at, updated_at) VALUES
('Grey Goose', 'vodka', '2019-01-20 19:09:59', CURRENT_TIMESTAMP),
('Ciroc', 'vodka', '2019-03-22 21:43:55', CURRENT_TIMESTAMP),
('Absolut', 'vodka', '2019-01-20 17:02:41', CURRENT_TIMESTAMP),
('Masseto', 'wine', '2019-02-22 03:27:38', CURRENT_TIMESTAMP),
('Zubrovka', 'vodka', '2019-01-26 20:50:47', CURRENT_TIMESTAMP),
('Crystal Head', 'vodka', '2019-04-07 00:58:38', CURRENT_TIMESTAMP),
('Svedka', 'vodka', '2019-01-20 01:04:01', CURRENT_TIMESTAMP),
('Lagunitas', 'beer', '2019-03-22 22:54:16', CURRENT_TIMESTAMP),
('Bertoux', 'brandy', '2019-03-06 19:44:01', CURRENT_TIMESTAMP),
('Patrón Silver', 'tequila', '2019-03-15 20:54:01', CURRENT_TIMESTAMP);

CREATE INDEX alcohol_idx
ON alcohol(title, kind);

CREATE TABLE bed (
  bed_id SERIAL PRIMARY KEY,
  bed_type VARCHAR(20),
  aditional_info TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

INSERT INTO bed(bed_type, created_at, updated_at) VALUES
('single','2016-04-03 09:13:38', CURRENT_TIMESTAMP),
('bunk', '2016-01-28 11:52:40', CURRENT_TIMESTAMP),
('single','2016-03-11 18:30:46', CURRENT_TIMESTAMP),
('bunk', '2016-03-10 09:48:34', CURRENT_TIMESTAMP),
('single','2016-03-08 22:57:37', CURRENT_TIMESTAMP),
('bunk', '2016-04-08 21:34:05', CURRENT_TIMESTAMP),
('bunk', '2016-01-20 09:40:32', CURRENT_TIMESTAMP),
('single','2016-02-07 10:54:39', CURRENT_TIMESTAMP),
('bunk', '2016-03-12 08:36:32', CURRENT_TIMESTAMP),
('single','2016-02-14 18:54:52', CURRENT_TIMESTAMP);

CREATE TABLE incident (
  incident_id SERIAL PRIMARY KEY,
  additional_info TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE TABLE incident_info (
  incident_info_id SERIAL PRIMARY KEY,
  alco_id INT,
  incident_id INT,
  drank_at DATE NOT NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  FOREIGN KEY(alco_id) REFERENCES alcohol(alco_id),
  FOREIGN KEY(incident_id) REFERENCES incident(incident_id)
);

CREATE TABLE fainted (
  fainted_id SERIAL PRIMARY KEY,
  alcoholic_id INT,
  happened_at DATE NOT NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  FOREIGN KEY(alcoholic_id) REFERENCES alcoholic(alcoholic_id)
);

CREATE TABLE trailed (
  trailed_id SERIAL PRIMARY KEY,
  incident_id INT,
  alcoholic_id INT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  FOREIGN KEY(incident_id) REFERENCES incident(incident_id),
  FOREIGN KEY(alcoholic_id) REFERENCES alcoholic(alcoholic_id)
);

CREATE TABLE bed_status (
  exhange_id SERIAL PRIMARY KEY,
  bed_id INT,
  alcoholic_id INT,
  officer_id INT,
  stay_start DATE NOT NULL,
  stay_end DATE NOT NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  FOREIGN KEY(bed_id) REFERENCES bed(bed_id),
  FOREIGN KEY(alcoholic_id) REFERENCES alcoholic(alcoholic_id),
  FOREIGN KEY(officer_id) REFERENCES officer(officer_id)
);

CREATE TABLE released (
  released_id SERIAL PRIMARY KEY,
  old_bed_id INT,
  alcoholic_id INT,
  officer_id INT,
  happened_at DATE NOT NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  FOREIGN KEY(old_bed_id) REFERENCES bed(bed_id),
  FOREIGN KEY(alcoholic_id) REFERENCES alcoholic(alcoholic_id),
  FOREIGN KEY(officer_id) REFERENCES officer(officer_id)
);

CREATE TABLE capture (
  capture_id SERIAL PRIMARY KEY,
  officer_id INT,
  alcoholic_id INT,
  bed_id INT,
  caught_at DATE NOT NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  FOREIGN KEY(alcoholic_id) REFERENCES alcoholic(alcoholic_id),
  FOREIGN KEY(officer_id) REFERENCES officer(officer_id),
  FOREIGN KEY(bed_id) REFERENCES bed(bed_id)
);

CREATE TABLE escaped (
  escaped_id SERIAL PRIMARY KEY,
  old_bed_id INT,
  alcoholic_id INT,
  happened_at DATE NOT NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  FOREIGN KEY(old_bed_id) REFERENCES bed(bed_id),
  FOREIGN KEY(alcoholic_id) REFERENCES alcoholic(alcoholic_id)	
);