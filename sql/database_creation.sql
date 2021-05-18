-- DROPING ALL TABLES:
-- DROP TABLE capture;
-- DROP TABLE escaped;
-- DROP TABLE released;
-- DROP TABLE fainted;
-- DROP TABLE incident_info;
-- DROP TABLE bed_status;
-- DROP TABLE bed;
-- DROP TABLE alcohol;
-- DROP TABLE officer;
-- DROP TABLE trailed;
-- DROP TABLE alcoholic;
-- DROP TABLE incident;

-- creating database

CREATE DATABASE sobering_up_station;

--creating all tables and filling it with data

-- table that contains information about alcoholic
CREATE TABLE alcoholic (
  alcoholic_id SERIAL PRIMARY KEY,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO alcoholic(first_name, last_name, created_at) VALUES
	('Lucas', 'Smith', '2014-01-15 07:50:00'),
	('Oliver', 'Taylor', '2014-02-14 14:15:25'),
	('James', 'Martin', '2014-02-14 14:15:25'),
	('Henry', 'Clark', '2014-01-20 23:56:13'),
	('Michael', 'Walker', '2014-03-09 15:27:23'),
	('Jack', 'Thompson', '2014-01-25 21:35:53'),
	('Matthew', 'Brown', '2014-02-26 09:34:26'),
	('David', 'Johnson', '2014-01-12 13:17:32'),
	('Luke', 'Williams', '2014-03-08 09:55:58'),
	('Leo', 'Jones', '2014-02-24 05:56:02'),
 	('Ben', 'Stone', '2014-09-15 08:01:00'),
    ('Alex', 'Hill', '2014-09-24 17:25:44'),
    ('Liam', 'Nash', '2014-09-30 14:28:25'),
    ('Benjamin', 'Nixon', '2014-10-16 02:27:03'),
    ('Noah', 'Carter', '2014-10-17 15:41:35'),
    ('Everett', 'Vaughn', '2014-10-25 21:44:58'),
    ('Evan', 'Reed', '2015-01-01 09:58:18'),
    ('Kayden', 'Kingsley', '2015-01-12 13:30:12'),
    ('Kai', 'Hendrix', '2015-01-23 10:05:47'),
    ('Jace', 'Harrison', '2015-01-30 08:41:29'),
 	('Luke', 'Quinn', '2015-02-15 08:01:00'),
    ('Gabriel', 'Harper', '2015-02-24 17:25:44'),
    ('Anthony', 'Hunter', '2015-02-30 14:28:25'),
    ('Hudson', 'Avery', '2015-03-16 02:27:03'),
    ('Charles', 'Madison', '2015-03-19 15:41:35'),
    ('Adrian', 'Morgan', '2015-03-25 21:44:58'),
    ('Christian', 'Harisson', '2015-04-01 09:58:18'),
    ('Nathan', 'Wilder', '2015-04-12 13:30:12'),
    ('Colton', 'Riley', '2015-04-18 10:05:47'),
    ('Elias', 'Carter', '2015-04-21 08:41:29'),
 	('Ethan', 'Ryder', '2015-05-15 08:01:00'),
    ('John', 'Lincoln', '2015-05-24 17:25:44'),
    ('Henry', 'Arden', '2015-05-25 14:28:25'),
    ('Daniel', 'Cooper', '2015-05-27 02:27:03'),
    ('Logan', 'Jackson', '2015-05-29 15:41:35'),
    ('Jack', 'Percy', '2015-07-01 21:44:58'),
    ('Aiden', 'Huxley', '2015-07-25 09:58:18'),
    ('Samuel', 'Desmond', '2015-07-26 13:30:12'),
    ('Matthew', 'Cohen', '2015-07-29 10:05:47'),
    ('Levi', 'Brooks', '2015-07-30 08:41:29');

-- creating an index to quickly to find information about alcoholic using first_name and last_name
	
CREATE INDEX alcoholic_idx
	ON alcoholic(first_name, last_name);

-- table that contains information about officer
CREATE TABLE officer (
  officer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO officer(first_name, last_name, created_at) VALUES
	('Adrian', 'Lopez', '2013-01-23 13:17:50'),
	('Colton', 'Wilson', '2013-01-10 23:28:57'),
	('Cameron', 'Moore', '2013-01-10 09:28:27'),
	('Ezra', 'Lee', '2013-02-28 21:53:31'),
	('Leonardo', 'White', '2013-02-02 06:47:39'),
	('Adam', 'Harris', '2013-02-25 19:52:30'),
	('Wesley', 'Clark', '2013-03-20 10:45:40'),
	('Waylon', 'Lewis', '2013-03-20 10:47:50'),
	('Bennett', 'Young', '2013-03-20 03:48:17'),
	('George', 'Allen', '2013-04-28 09:51:23');

-- creating an index to quickly to find information about officer using first_name and last_name

CREATE INDEX officer_idx
	ON officer(first_name, last_name);

-- table that contains information about alcohol
CREATE TABLE alcohol (
  alco_id SERIAL PRIMARY KEY,
  title VARCHAR(20) UNIQUE NOT NULL,
  kind VARCHAR(20) NOT NULL,
  additional_info TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO alcohol(title, kind, created_at) VALUES
	('Grey Goose', 'vodka', '2012-01-20 19:09:59'),
	('Ciroc', 'vodka', '2012-01-22 21:43:55'),
	('Absolut', 'vodka', '2012-01-23 17:02:41'),
	('Masseto', 'wine', '2012-01-24 03:27:38'),
	('Zubrovka', 'vodka', '2012-01-26 20:50:47'),
	('Crystal Head', 'vodka', '2012-01-27 00:58:38'),
	('Svedka', 'vodka', '2012-01-28 01:04:01'),
	('Lagunitas', 'beer', '2012-01-29 22:54:16'),
	('Bertoux', 'brandy', '2012-01-30 19:44:01'),
	('Patrón Silver', 'tequila', '2012-02-15 20:54:01'),
	('Belvedere', 'vodka', '2012-04-20 19:09:59'),
	('Mariette', 'vodka', '2012-04-22 21:43:55'),
	('Chopin Potato', 'vodka', '2012-05-20 17:02:41'),
	('Harlan Estate', 'wine', '2012-04-22 03:27:38'),
	('Haku', 'vodka', '2012-04-26 20:50:47'),
	('Ketel One', 'vodka', '2012-05-07 00:58:38'),
	('Smirnoff', 'vodka', '2012-05-20 01:04:01'),
	('Corona Light', 'beer', '2012-06-22 22:54:16'),
	('Dreher', 'brandy', '2012-06-26 19:44:01'),
	('Casamigos Blanco', 'tequila', '2012-06-27 20:54:01'),
	('Platinka', 'vodka', '2012-07-20 19:09:59'),
	('Iceberg', 'vodka', '2012-07-22 21:43:55'),
	('Pearl', 'vodka', '2012-08-20 17:02:41'),
	('Insignia', 'wine', '2012-08-22 03:27:38'),
	('Blue Diamond', 'vodka', '2012-08-26 20:50:47'),
	('Zaranoff', 'vodka', '2012-09-07 00:58:38'),
	('Rachmaninoff', 'vodka', '2012-09-20 01:04:01'),
	('Guinness', 'beer', '2012-09-22 22:54:16'),
	('Martell', 'brandy', '2012-09-26 19:44:01'),
	('Avión Añejo', 'tequila', '2012-09-27 20:54:01');

-- creating an index to quickly to find information about alcohol using its title

CREATE INDEX alcohol_idx
	ON alcohol(title);
	
-- table that contains information about beds
CREATE TABLE bed (
  bed_id SERIAL PRIMARY KEY,
  bed_type VARCHAR(20),
  aditional_info TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO bed(bed_type, created_at) VALUES
	('single','2011-01-03 09:13:38'),
	('single', '2011-01-28 11:52:40'),
	('single','2011-02-11 18:30:46'),
	('single', '2011-03-10 09:48:34'),
	('single','2011-04-08 22:57:37'),
	('single', '2011-04-09 21:34:05'),
	('single', '2011-05-20 09:40:32'),
	('single','2011-05-27 10:54:39'),
	('single', '2011-05-28 08:36:32'),
	('single','2011-05-28 18:54:52'),
	('single','2011-06-03 09:13:38'),
	('single', '2011-06-04 11:52:40'),
	('single','2011-06-04 18:30:46'),
	('single', '2011-06-04 19:48:34'),
	('single','2011-06-05 12:57:37'),
	('single', '2011-06-05 13:34:05'),
	('single', '2011-06-05 13:40:32'),
	('single','2011-06-05 14:54:39'),
	('single', '2011-06-06 15:36:32'),
	('single','2011-06-06 15:54:52');

-- table that contains the information about incidents of drinking alcohol
CREATE TABLE incident (
  incident_id SERIAL PRIMARY KEY,
  additional_info TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO incident(created_at) VALUES 
	('2014-01-09 22:32:33'),
	('2014-01-12 13:17:32'),
	('2014-01-15 07:50:00'),
	('2014-01-20 23:56:13'),
	('2014-01-25 21:35:53'),
	('2014-02-14 14:15:25'), 
	('2014-02-24 05:56:02'),
	('2014-02-26 09:34:26'),
	('2014-03-08 09:55:58'),
	('2014-03-09 15:27:23'),
	('2014-04-15 07:50:00'),
	('2014-04-20 23:56:13'),
	('2014-04-24 05:56:02'),
	('2014-04-26 09:34:26'),
	('2014-05-09 15:27:23'),
	('2014-05-09 22:32:33'),
	('2014-05-12 13:17:32'),
	('2014-06-08 09:55:58'),
	('2014-06-14 14:15:25'), 
	('2014-06-25 21:35:53');


-- table that contains information about the groups of alcoholics	
CREATE TABLE trailed (
  trailed_id SERIAL PRIMARY KEY,
  incident_id INT,
  alcoholic_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(incident_id) REFERENCES incident(incident_id),
  FOREIGN KEY(alcoholic_id) REFERENCES alcoholic(alcoholic_id)
);

INSERT INTO trailed(incident_id, alcoholic_id) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10),
	(11, 1),
	(12, 2),
	(13, 3),
	(14, 4),
	(15, 5),
	(16, 6),
	(17, 7),
	(18, 8),
	(19, 9),
	(20, 10);

-- table that contains more detailed information about drinking alcohol
CREATE TABLE incident_info (
  incident_info_id SERIAL PRIMARY KEY,
  alco_id INT,
  incident_id INT,
  drank_at TIMESTAMP NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(alco_id) REFERENCES alcohol(alco_id),
  FOREIGN KEY(incident_id) REFERENCES incident(incident_id)
);

INSERT INTO incident_info(alco_id, incident_id, drank_at) VALUES 
	(7, 2, '2014-01-09 22:32:33'),
	(3, 8, '2014-01-12 13:17:32'),
	(1, 1, '2014-01-15 07:50:00'),
	(2, 4, '2014-01-20 23:56:13'),
	(10, 6, '2014-01-25 21:35:53'),
	(4, 3, '2014-02-14 14:15:25'),
	(5, 10, '2014-02-24 05:56:02'),
	(9, 7, '2014-02-26 09:34:26'),
	(6, 9, '2014-03-08 09:55:58'),
	(8, 5, '2014-03-09 15:27:23'),
	(1, 11, '2014-04-15 07:50:00'),
	(2, 14, '2014-04-20 23:56:13'),
	(2, 20, '2014-04-24 05:56:02'),
	(7, 17, '2014-04-26 09:34:26'),
	(8, 15, '2014-05-09 15:27:23'),
	(7, 12, '2014-05-09 22:32:33'),
	(4, 18, '2014-05-12 13:17:32'),
	(3, 19, '2014-06-08 09:55:58'),
	(1, 13, '2014-06-14 14:15:25'),
	(10, 16, '2014-06-25 21:35:53');


-- table that contains information about the capture of the alcoholic by the officer
CREATE TABLE capture (
  capture_id SERIAL PRIMARY KEY,
  officer_id INT,
  alcoholic_id INT,
  bed_id INT,
  caught_at TIMESTAMP NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(alcoholic_id) REFERENCES alcoholic(alcoholic_id),
  FOREIGN KEY(officer_id) REFERENCES officer(officer_id),
  FOREIGN KEY(bed_id) REFERENCES bed(bed_id)
);

INSERT INTO capture(officer_id, alcoholic_id, bed_id, caught_at) VALUES
	(1, 2, 2, '2014-01-09 22:32:33'),
	(10, 8, 8, '2014-01-12 13:17:32'),
	(5, 1, 1, '2014-01-15 07:50:00'),
	(2, 4, 4, '2014-01-20 23:56:13'),
	(3, 6, 6, '2014-01-25 21:35:53'),
	(6, 3, 3, '2014-02-14 14:15:25'), 
	(10, 10, 10, '2014-02-24 05:56:02'),
	(3, 7, 7, '2014-02-26 09:34:26'),
	(2, 9, 9, '2014-03-08 09:55:58'),
	(4, 5, 5, '2014-03-09 15:27:23'),
	(6, 1, 5, '2014-04-15 07:50:00'),
	(8, 4, 2, '2014-04-20 23:56:13'),
	(5, 10, 6, '2014-04-24 05:56:02'),
	(7, 7, 9, '2014-04-26 09:34:26'),
	(10, 5, 1, '2014-05-09 15:27:23'),
	(2, 2, 4, '2014-05-09 22:32:33'),
	(9, 8, 8, '2014-05-12 13:17:32'),
	(3, 9, 7, '2014-06-08 09:55:58'),
	(4, 3, 3, '2014-06-14 14:15:25'), 
	(9, 6, 10, '2014-06-25 21:35:53');

-- creating an index to quickly to find information about the date of capture

CREATE INDEX capture_idx
	ON capture(caught_at);

-- table that contains iformation about alcoholics' loss of consciousness
CREATE TABLE fainted (
  fainted_id SERIAL PRIMARY KEY,
  alcoholic_id INT,
  happened_at TIMESTAMP NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(alcoholic_id) REFERENCES alcoholic(alcoholic_id)
);

INSERT INTO fainted(alcoholic_id, happened_at) VALUES
	(8,'2014-01-12 14:30:12'),
	(1,'2014-01-15 08:20:00'),
	(1,'2014-01-15 09:15:27'),
	(1,'2014-01-15 12:20:00'),
	(3,'2014-02-14 15:28:01'),
	(3,'2014-02-14 16:13:05'),
	(4,'2014-02-20 04:20:00'),
	(10,'2014-02-24 07:41:29'),
	(9,'2014-03-08 12:02:12'),
	(5,'2014-03-09 16:41:14');
	
-- creating an index to quickly to find information about the date of loss of consciousness

CREATE INDEX fainted_idx
	ON fainted(happened_at);

-- table that contains the information about the status of the bed
CREATE TABLE bed_status (
  bed_staus_id SERIAL PRIMARY KEY,
  bed_id INT,
  alcoholic_id INT,
  officer_id INT,
  stay_start TIMESTAMP NOT NULL,
  stay_end TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(bed_id) REFERENCES bed(bed_id),
  FOREIGN KEY(alcoholic_id) REFERENCES alcoholic(alcoholic_id),
  FOREIGN KEY(officer_id) REFERENCES officer(officer_id)
);

INSERT INTO bed_status(bed_id, alcoholic_id, officer_id, stay_start, stay_end) VALUES
	(2, 2, 1, '2014-01-09 22:32:33', '2014-01-10 14:32:33'),
	(8, 8, 10, '2014-01-12 13:17:32', '2014-01-13 13:17:32'),
	(1, 1, 5, '2014-01-15 07:50:00', '2014-01-16 10:50:00'),
	(4, 4, 2, '2014-01-20 23:56:13', '2014-01-21 14:56:13'),
	(6, 6, 3, '2014-01-25 21:35:53', '2014-01-26 15:35:53'),
	(3, 3, 6, '2014-02-14 14:15:25', '2014-02-15 14:15:25'),
	(10, 10, 10, '2014-02-24 05:56:02', '2014-02-25 10:56:02'),
	(7, 7, 3, '2014-02-26 09:34:26', '2014-02-27 09:34:26'),
	(9, 9, 2, '2014-03-08 09:55:58', '2014-03-09 09:55:58'),
	(5, 5, 4, '2014-03-09 15:27:23', '2014-03-10 15:27:23'),
	(5, 1, 6, '2014-04-15 07:50:00', '2014-04-16 07:50:00'),
	(2, 4, 8, '2014-04-20 23:56:13', '2014-04-21 23:56:13'),
	(6, 10, 5, '2014-04-24 05:56:02', '2014-04-24 06:56:02'),
	(9, 7, 7, '2014-04-26 09:39:12', '2014-04-26 10:34:26'),
	(1, 5, 10, '2014-05-09 15:27:23', '2014-05-10 15:27:23'),
	(4, 2, 2, '2014-05-09 22:32:33', '2014-05-10 22:32:33'),
	(8, 8, 9, '2014-05-12 13:17:32', '2014-05-12 14:17:32'),
	(7, 9, 3, '2014-06-08 09:55:58', '2014-06-08 10:55:58'),
	(3, 3, 4, '2014-06-14 14:15:25', '2014-06-15 14:15:25'),
	(10, 6, 9, '2014-06-25 21:35:53', '2014-06-25 22:35:53');

-- table that contains information about the release of the alcoholic
CREATE TABLE released (
  released_id SERIAL PRIMARY KEY,
  bed_id INT,
  alcoholic_id INT,
  officer_id INT,
  happened_at TIMESTAMP NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(bed_id) REFERENCES bed(bed_id),
  FOREIGN KEY(alcoholic_id) REFERENCES alcoholic(alcoholic_id),
  FOREIGN KEY(officer_id) REFERENCES officer(officer_id)
);

INSERT INTO released(bed_id, alcoholic_id, officer_id, happened_at) VALUES
	(2, 2, 1, '2014-01-10 14:32:33'),
	(8, 8, 10, '2014-01-13 13:17:32'),
	(1, 1, 7, '2014-01-16 10:50:00'),
	(4, 4, 2, '2014-01-21 14:56:13'),
	(6, 6, 3, '2014-01-26 15:35:53'),
	(3, 3, 6, '2014-02-15 14:15:25'),
	(10, 10, 10, '2014-02-25 10:56:02'),
	(7, 7, 3, '2014-02-27 09:34:26'),
	(9, 9, 2, '2014-03-09 09:55:58'),
	(5, 5, 4, '2014-03-10 15:27:23');
	
-- table that contains the information about the escape of the alcoholic
CREATE TABLE escaped (
  escaped_id SERIAL PRIMARY KEY,
  bed_id INT,
  alcoholic_id INT,
  happened_at TIMESTAMP NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(bed_id) REFERENCES bed(bed_id),
  FOREIGN KEY(alcoholic_id) REFERENCES alcoholic(alcoholic_id)	
);

INSERT INTO escaped(bed_id, alcoholic_id, happened_at) VALUES
	(5, 1, '2014-04-16 07:50:00'),
	(2, 4, '2014-04-21 23:56:13'),
	(6, 10, '2014-04-24 06:56:02'),
	(9, 7, '2014-04-26 10:34:26'),
	(1, 5, '2014-05-10 15:27:23'),
	(4, 2, '2014-05-10 22:32:33'),
	(8, 8, '2014-05-12 14:17:32'),
	(7, 9, '2014-06-08 10:55:58'),
	(3, 3, '2014-06-15 14:15:25'),
	(10, 6, '2014-06-25 22:35:53');

-- table that contains information fight between alcoholics
CREATE TABLE alcoholics_fight (
  fight_id SERIAL PRIMARY KEY,
  aggressor_id INT,
  victim_id INT,
  winner_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(aggressor_id) REFERENCES alcoholic(alcoholic_id),
  FOREIGN KEY(victim_id) REFERENCES alcoholic(alcoholic_id),
  FOREIGN KEY(winner_id) REFERENCES alcoholic(alcoholic_id)
);
