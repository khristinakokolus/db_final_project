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
	(5,'2014-03-09 16:41:14'),

    ( 39, '2015-01-02 00:31:24' ),
    ( 38, '2015-01-04 17:04:01' ),
    ( 37, '2015-01-03 17:06:23' ),
    ( 36, '2015-01-03 19:41:36' ),
    ( 35, '2015-01-01 23:43:53' ),
    ( 34, '2015-01-03 01:42:55' ),
    ( 33, '2015-01-04 14:27:54' ),
    ( 32, '2015-01-02 10:19:59' ),
    ( 31, '2015-01-06 04:55:56' ),
    ( 30, '2015-01-01 20:14:37' ),
    ( 29, '2015-01-02 07:10:27' ),
    ( 28, '2015-01-02 09:53:21' ),
    ( 27, '2015-01-03 21:25:54' ),
    ( 26, '2015-01-02 14:24:06' ),
    ( 25, '2015-01-04 11:49:59' ),
    ( 24, '2015-01-01 13:35:40' ),
    ( 23, '2015-01-05 23:01:33' ),
    ( 22, '2015-01-01 13:35:59' ),
    ( 21, '2015-01-04 06:13:34' ),
    ( 20, '2015-02-05 22:05:22' ),
    ( 19, '2015-02-08 05:19:26' ),
    ( 18, '2015-02-07 08:26:23' ),
    ( 17, '2015-02-12 16:39:01' ),
    ( 16, '2015-02-04 15:25:47' ),
    ( 15, '2015-02-08 09:53:18' ),
    ( 14, '2015-02-11 21:26:03' ),
    ( 13, '2015-02-10 00:04:41' ),
    ( 12, '2015-02-05 08:55:21' ),
    ( 11, '2015-01-02 11:47:47' ),
    ( 39, '2015-02-08 16:50:35' ),
    ( 38, '2015-02-07 03:45:39' ),
    ( 37, '2015-02-06 22:48:17' ),
    ( 36, '2015-02-03 22:32:38' ),
    ( 35, '2015-02-09 05:52:18' ),
    ( 34, '2015-02-05 01:51:02' ),
    ( 33, '2015-02-06 16:53:06' ),
    ( 32, '2015-03-16 20:02:15' ),
    ( 31, '2015-02-08 11:20:02' ),
    ( 30, '2015-03-12 19:20:13' ),
    ( 29, '2015-03-19 02:51:41' ),
    ( 28, '2015-03-10 02:49:59' ),
    ( 27, '2015-03-12 23:31:33' ),
    ( 26, '2015-03-18 05:10:06' ),
    ( 25, '2015-03-16 05:07:24' ),
    ( 24, '2015-03-15 18:15:41' ),
    ( 23, '2015-02-09 16:12:41' ),
    ( 22, '2015-02-08 08:40:56' ),
    ( 21, '2015-02-04 03:00:23' ),
    ( 20, '2015-03-21 01:28:09' ),
    ( 19, '2015-03-13 07:37:08' ),
    ( 18, '2015-03-09 10:46:17' ),
    ( 17, '2015-03-19 04:58:55' ),
    ( 16, '2015-03-10 11:59:59' ),
    ( 15, '2015-03-15 18:36:12' ),
    ( 14, '2015-04-23 15:05:56' ),
    ( 13, '2015-03-20 02:05:32' ),
    ( 12, '2015-04-14 16:56:15' ),
    ( 11, '2015-03-12 01:20:57' ),
    ( 39, '2015-04-20 17:24:24' ),
    ( 38, '2015-04-20 13:47:44' ),
    ( 37, '2015-04-19 09:49:07' ),
    ( 36, '2015-04-18 00:38:02' ),
    ( 35, '2015-03-14 04:26:05' ),
    ( 34, '2015-03-14 16:44:59' ),
    ( 33, '2015-03-11 01:40:22' ),
    ( 32, '2015-04-29 15:01:24' ),
    ( 31, '2015-03-17 16:58:06' ),
    ( 30, '2015-04-20 18:52:47' ),
    ( 29, '2015-04-23 21:11:16' ),
    ( 28, '2015-04-14 19:30:11' ),
    ( 27, '2015-04-19 23:46:45' );

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
	(10, 6, 9, '2014-06-25 21:35:53', '2014-06-25 22:35:53'),

    ( 1, 39, 10, '2015-01-01 13:30:00', '2015-01-04 02:21:21' ),
    ( 2, 38, 9, '2015-01-01 13:30:00', '2015-01-06 16:30:09' ),
    ( 3, 37, 8, '2015-01-01 13:30:00', '2015-01-06 10:44:57' ),
    ( 4, 36, 7, '2015-01-01 13:30:00', '2015-01-05 22:16:51' ),
    ( 5, 35, 6, '2015-01-01 13:30:00', '2015-01-04 23:45:14' ),
    ( 6, 34, 5, '2015-01-01 13:30:00', '2015-01-03 12:57:43' ),
    ( 7, 33, 4, '2015-01-01 13:30:00', '2015-01-06 22:53:48' ),
    ( 8, 32, 3, '2015-01-01 13:30:00', '2015-01-06 13:25:06' ),
    ( 9, 31, 2, '2015-01-01 13:30:00', '2015-01-06 08:25:51' ),
    ( 10, 30, 1, '2015-01-01 13:30:00', '2015-01-03 12:51:12' ),
    ( 12, 29, 10, '2015-01-01 13:30:00', '2015-01-06 20:49:12' ),
    ( 13, 28, 9, '2015-01-01 13:30:00', '2015-01-02 20:27:46' ),
    ( 14, 27, 8, '2015-01-01 13:30:00', '2015-01-06 04:42:11' ),
    ( 15, 26, 7, '2015-01-01 13:30:00', '2015-01-03 13:34:24' ),
    ( 16, 25, 6, '2015-01-01 13:30:00', '2015-01-05 05:06:58' ),
    ( 17, 24, 5, '2015-01-01 13:30:00', '2015-01-02 16:08:52' ),
    ( 18, 23, 4, '2015-01-01 13:30:00', '2015-01-07 05:44:21' ),
    ( 19, 22, 3, '2015-01-01 13:30:00', '2015-01-01 13:40:57' ),
    ( 20, 21, 2, '2015-01-01 13:30:00', '2015-01-05 02:02:22' ),
    ( 1, 20, 1, '2015-02-05 02:21:21', '2015-02-09 06:15:50' ),
    ( 3, 19, 10, '2015-02-07 10:44:57', '2015-02-08 18:25:28' ),
    ( 4, 18, 9, '2015-02-06 22:16:51', '2015-02-08 00:34:06' ),
    ( 5, 17, 8, '2015-02-05 23:45:14', '2015-02-12 19:01:11' ),
    ( 6, 16, 7, '2015-02-04 12:57:43', '2015-02-05 14:18:45' ),
    ( 7, 15, 6, '2015-02-07 22:53:48', '2015-02-08 15:26:43' ),
    ( 8, 14, 5, '2015-02-07 13:25:06', '2015-02-14 04:48:59' ),
    ( 9, 13, 4, '2015-02-07 08:25:51', '2015-02-12 01:19:23' ),
    ( 10, 12, 3, '2015-02-04 12:51:12', '2015-02-06 00:16:55' ),
    ( 11, 11, 2, '2015-01-01 13:30:00', '2015-01-08 02:25:41' ),
    ( 14, 39, 10, '2015-02-07 04:42:11', '2015-02-13 07:56:35' ),
    ( 15, 38, 9, '2015-02-04 13:34:24', '2015-02-07 18:00:08' ),
    ( 16, 37, 8, '2015-02-06 05:06:58', '2015-02-08 06:46:05' ),
    ( 17, 36, 7, '2015-02-03 16:08:52', '2015-02-04 10:58:39' ),
    ( 18, 35, 6, '2015-02-08 05:44:21', '2015-02-13 23:03:39' ),
    ( 19, 34, 5, '2015-02-02 13:40:57', '2015-02-06 08:11:55' ),
    ( 20, 33, 4, '2015-02-06 02:02:22', '2015-02-07 20:34:34' ),
    ( 1, 32, 3, '2015-03-13 06:15:50', '2015-03-19 05:55:42' ),
    ( 2, 31, 2, '2015-02-07 16:30:09', '2015-02-14 15:27:04' ),
    ( 3, 30, 1, '2015-03-12 18:25:28', '2015-03-13 03:57:43' ),
    ( 5, 29, 10, '2015-03-16 19:01:11', '2015-03-23 03:12:13' ),
    ( 6, 28, 9, '2015-03-09 14:18:45', '2015-03-10 06:04:48' ),
    ( 7, 27, 8, '2015-03-12 15:26:43', '2015-03-16 21:59:42' ),
    ( 8, 26, 7, '2015-03-18 04:48:59', '2015-03-18 14:00:18' ),
    ( 9, 25, 6, '2015-03-16 01:19:23', '2015-03-17 13:01:47' ),
    ( 10, 24, 5, '2015-03-10 00:16:55', '2015-03-16 08:34:15' ),
    ( 11, 23, 4, '2015-02-09 02:25:41', '2015-02-09 22:19:50' ),
    ( 12, 22, 3, '2015-02-07 20:49:12', '2015-02-09 10:00:58' ),
    ( 13, 21, 2, '2015-02-03 20:27:46', '2015-02-04 11:34:48' ),
    ( 14, 20, 1, '2015-03-17 07:56:35', '2015-03-24 05:42:13' ),
    ( 16, 19, 10, '2015-03-12 06:46:05', '2015-03-18 11:59:11' ),
    ( 17, 18, 9, '2015-03-08 10:58:39', '2015-03-15 06:47:33' ),
    ( 18, 17, 8, '2015-03-17 23:03:39', '2015-03-21 23:05:35' ),
    ( 19, 16, 7, '2015-03-10 08:11:55', '2015-03-12 10:30:13' ),
    ( 20, 15, 6, '2015-03-11 20:34:34', '2015-03-16 05:27:29' ),
    ( 1, 14, 5, '2015-04-20 05:55:42', '2015-04-24 12:55:45' ),
    ( 2, 13, 4, '2015-03-18 15:27:04', '2015-03-20 09:35:38' ),
    ( 3, 12, 3, '2015-04-14 03:57:43', '2015-04-14 18:18:45' ),
    ( 4, 11, 2, '2015-03-12 00:34:06', '2015-03-12 08:13:14' ),
    ( 7, 39, 10, '2015-04-17 21:59:42', '2015-04-21 06:47:22' ),
    ( 8, 38, 9, '2015-04-19 14:00:18', '2015-04-21 10:48:57' ),
    ( 9, 37, 8, '2015-04-18 13:01:47', '2015-04-21 12:33:56' ),
    ( 10, 36, 7, '2015-04-17 08:34:15', '2015-04-22 22:00:51' ),
    ( 11, 35, 6, '2015-03-13 22:19:50', '2015-03-14 12:02:25' ),
    ( 12, 34, 5, '2015-03-13 10:00:58', '2015-03-18 19:42:24' ),
    ( 13, 33, 4, '2015-03-08 11:34:48', '2015-03-15 02:58:34' ),
    ( 14, 32, 3, '2015-04-25 05:42:13', '2015-05-02 01:34:53' ),
    ( 15, 31, 2, '2015-03-11 18:00:08', '2015-03-18 01:20:31' ),
    ( 16, 30, 1, '2015-04-19 11:59:11', '2015-04-24 11:10:12' ),
    ( 18, 29, 10, '2015-04-22 23:05:35', '2015-04-28 12:07:33' ),
    ( 19, 28, 9, '2015-04-13 10:30:13', '2015-04-17 17:23:15' ),
    ( 20, 27, 8, '2015-04-17 05:27:29', '2015-04-23 00:54:58' );

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
	(5, 5, 4, '2014-03-10 15:27:23'),

    ( 8, 32, 3, '2015-01-06 13:25:06' ),
    ( 9, 31, 2, '2015-01-06 08:25:51' ),
    ( 10, 30, 1, '2015-01-03 12:51:12' ),
    ( 15, 26, 7, '2015-01-03 13:34:24' ),
    ( 17, 24, 5, '2015-01-02 16:08:52' ),
    ( 18, 23, 4, '2015-01-07 05:44:21' ),
    ( 1, 20, 1, '2015-02-09 06:15:50' ),
    ( 3, 19, 10, '2015-02-08 18:25:28' ),
    ( 4, 18, 9, '2015-02-08 00:34:06' ),
    ( 5, 17, 8, '2015-02-12 19:01:11' ),
    ( 6, 16, 7, '2015-02-05 14:18:45' ),
    ( 7, 15, 6, '2015-02-08 15:26:43' ),
    ( 10, 12, 3, '2015-02-06 00:16:55' ),
    ( 11, 11, 2, '2015-01-08 02:25:41' ),
    ( 14, 39, 10, '2015-02-13 07:56:35' ),
    ( 18, 35, 6, '2015-02-13 23:03:39' ),
    ( 19, 34, 5, '2015-02-06 08:11:55' ),
    ( 1, 32, 3, '2015-03-19 05:55:42' ),
    ( 5, 29, 10, '2015-03-23 03:12:13' ),
    ( 6, 28, 9, '2015-03-10 06:04:48' ),
    ( 10, 24, 5, '2015-03-16 08:34:15' ),
    ( 12, 22, 3, '2015-02-09 10:00:58' ),
    ( 17, 18, 9, '2015-03-15 06:47:33' ),
    ( 1, 14, 5, '2015-04-24 12:55:45' ),
    ( 2, 13, 4, '2015-03-20 09:35:38' ),
    ( 4, 11, 2, '2015-03-12 08:13:14' ),
    ( 7, 39, 10, '2015-04-21 06:47:22' ),
    ( 8, 38, 9, '2015-04-21 10:48:57' ),
    ( 9, 37, 8, '2015-04-21 12:33:56' ),
    ( 14, 32, 3, '2015-05-02 01:34:53' ),
    ( 18, 29, 10, '2015-04-28 12:07:33' ),
    ( 19, 28, 9, '2015-04-17 17:23:15' );
	
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
	(10, 6, '2014-06-25 22:35:53'),

    ( 1, 39, '2015-01-04 02:21:21' ),
    ( 2, 38, '2015-01-06 16:30:09' ),
    ( 3, 37, '2015-01-06 10:44:57' ),
    ( 4, 36, '2015-01-05 22:16:51' ),
    ( 5, 35, '2015-01-04 23:45:14' ),
    ( 6, 34, '2015-01-03 12:57:43' ),
    ( 7, 33, '2015-01-06 22:53:48' ),
    ( 12, 29, '2015-01-06 20:49:12' ),
    ( 13, 28, '2015-01-02 20:27:46' ),
    ( 14, 27, '2015-01-06 04:42:11' ),
    ( 16, 25, '2015-01-05 05:06:58' ),
    ( 19, 22, '2015-01-01 13:40:57' ),
    ( 20, 21, '2015-01-05 02:02:22' ),
    ( 8, 14, '2015-02-14 04:48:59' ),
    ( 9, 13, '2015-02-12 01:19:23' ),
    ( 15, 38, '2015-02-07 18:00:08' ),
    ( 16, 37, '2015-02-08 06:46:05' ),
    ( 17, 36, '2015-02-04 10:58:39' ),
    ( 20, 33, '2015-02-07 20:34:34' ),
    ( 2, 31, '2015-02-14 15:27:04' ),
    ( 3, 30, '2015-03-13 03:57:43' ),
    ( 7, 27, '2015-03-16 21:59:42' ),
    ( 8, 26, '2015-03-18 14:00:18' ),
    ( 9, 25, '2015-03-17 13:01:47' ),
    ( 11, 23, '2015-02-09 22:19:50' ),
    ( 13, 21, '2015-02-04 11:34:48' ),
    ( 14, 20, '2015-03-24 05:42:13' ),
    ( 16, 19, '2015-03-18 11:59:11' ),
    ( 18, 17, '2015-03-21 23:05:35' ),
    ( 19, 16, '2015-03-12 10:30:13' ),
    ( 20, 15, '2015-03-16 05:27:29' ),
    ( 3, 12, '2015-04-14 18:18:45' ),
    ( 10, 36, '2015-04-22 22:00:51' ),
    ( 11, 35, '2015-03-14 12:02:25' ),
    ( 12, 34, '2015-03-18 19:42:24' ),
    ( 13, 33, '2015-03-15 02:58:34' ),
    ( 15, 31, '2015-03-18 01:20:31' ),
    ( 16, 30, '2015-04-24 11:10:12' ),
    ( 20, 27, '2015-04-23 00:54:58' );

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
