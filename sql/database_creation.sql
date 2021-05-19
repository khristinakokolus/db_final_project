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
    ('Anthony', 'Hunter', '2015-02-28 14:28:25'),
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

    ( 39, '2015-01-04 16:30:20' ),
    ( 38, '2015-01-06 19:23:27' ),
    ( 37, '2015-01-03 19:10:59' ),
    ( 36, '2015-01-01 14:03:17' ),
    ( 35, '2015-01-03 01:54:43' ),
    ( 34, '2015-01-01 21:09:08' ),
    ( 33, '2015-01-04 10:46:58' ),
    ( 32, '2015-01-03 01:45:27' ),
    ( 31, '2015-01-02 21:06:42' ),
    ( 30, '2015-01-05 03:59:50' ),
    ( 29, '2015-01-02 08:45:53' ),
    ( 28, '2015-01-01 22:54:01' ),
    ( 27, '2015-01-04 08:32:01' ),
    ( 26, '2015-01-04 20:13:48' ),
    ( 25, '2015-01-02 10:33:05' ),
    ( 24, '2015-01-02 20:21:47' ),
    ( 23, '2015-01-02 16:34:22' ),
    ( 22, '2015-01-02 22:37:06' ),
    ( 21, '2015-02-07 11:18:48' ),
    ( 20, '2015-02-08 02:39:24' ),
    ( 19, '2015-02-06 10:52:47' ),
    ( 18, '2015-02-08 02:11:30' ),
    ( 17, '2015-02-06 05:13:43' ),
    ( 16, '2015-02-05 00:46:57' ),
    ( 15, '2015-02-09 23:08:48' ),
    ( 14, '2015-02-07 14:29:22' ),
    ( 13, '2015-02-04 09:43:09' ),
    ( 12, '2015-02-07 17:47:48' ),
    ( 11, '2015-02-04 13:21:49' ),
    ( 39, '2015-02-07 10:28:40' ),
    ( 38, '2015-02-10 18:34:24' ),
    ( 37, '2015-02-07 02:28:08' ),
    ( 36, '2015-02-08 17:15:25' ),
    ( 35, '2015-02-11 13:03:38' ),
    ( 34, '2015-02-05 15:18:45' ),
    ( 33, '2015-03-16 07:56:28' ),
    ( 32, '2015-03-14 18:15:19' ),
    ( 31, '2015-03-15 02:24:25' ),
    ( 30, '2015-03-13 13:58:59' ),
    ( 29, '2015-03-16 01:29:24' ),
    ( 28, '2015-03-15 23:02:48' ),
    ( 27, '2015-03-14 11:19:56' ),
    ( 26, '2015-03-14 19:13:42' ),
    ( 25, '2015-03-10 07:16:38' ),
    ( 24, '2015-03-13 01:11:51' ),
    ( 23, '2015-03-10 00:29:26' ),
    ( 22, '2015-02-04 11:33:01' ),
    ( 21, '2015-03-12 13:27:05' ),
    ( 20, '2015-03-17 07:01:15' ),
    ( 19, '2015-03-13 05:30:14' ),
    ( 18, '2015-03-16 09:05:00' ),
    ( 17, '2015-03-16 15:29:16' ),
    ( 16, '2015-03-15 16:49:06' ),
    ( 15, '2015-04-22 05:38:56' ),
    ( 14, '2015-04-25 00:04:13' ),
    ( 13, '2015-04-23 07:58:45' ),
    ( 12, '2015-04-17 20:47:13' ),
    ( 11, '2015-04-19 02:56:12' ),
    ( 39, '2015-04-22 05:09:37' ),
    ( 38, '2015-04-15 21:57:56' ),
    ( 37, '2015-04-20 20:53:03' ),
    ( 36, '2015-04-19 02:25:16' ),
    ( 35, '2015-04-14 20:28:56' ),
    ( 34, '2015-03-13 04:52:53' ),
    ( 33, '2015-04-15 03:19:58' ),
    ( 32, '2015-04-19 09:40:37' ),
    ( 31, '2015-04-20 13:37:34' ),
    ( 30, '2015-04-19 12:46:06' ),
    ( 29, '2015-04-22 01:05:06' ),
    ( 28, '2015-04-18 23:02:52' );
	
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

    ( 1, 39, 19, '2015-01-01 13:30:00', '2015-01-05 01:27:54' ),
    ( 2, 38, 18, '2015-01-01 13:30:00', '2015-01-06 20:25:40' ),
    ( 3, 37, 17, '2015-01-01 13:30:00', '2015-01-03 23:44:14' ),
    ( 4, 36, 16, '2015-01-01 13:30:00', '2015-01-06 00:17:12' ),
    ( 5, 35, 15, '2015-01-01 13:30:00', '2015-01-03 06:32:54' ),
    ( 6, 34, 14, '2015-01-01 13:30:00', '2015-01-02 06:04:32' ),
    ( 7, 33, 13, '2015-01-01 13:30:00', '2015-01-06 16:59:37' ),
    ( 8, 32, 12, '2015-01-01 13:30:00', '2015-01-05 13:42:48' ),
    ( 9, 31, 11, '2015-01-01 13:30:00', '2015-01-03 07:10:01' ),
    ( 11, 30, 19, '2015-01-01 13:30:00', '2015-01-06 03:07:11' ),
    ( 12, 29, 18, '2015-01-01 13:30:00', '2015-01-03 13:11:52' ),
    ( 13, 28, 17, '2015-01-01 13:30:00', '2015-01-02 23:10:14' ),
    ( 14, 27, 16, '2015-01-01 13:30:00', '2015-01-06 04:12:50' ),
    ( 15, 26, 15, '2015-01-01 13:30:00', '2015-01-08 08:21:33' ),
    ( 16, 25, 14, '2015-01-01 13:30:00', '2015-01-05 12:49:30' ),
    ( 17, 24, 13, '2015-01-01 13:30:00', '2015-01-06 17:14:03' ),
    ( 18, 23, 12, '2015-01-01 13:30:00', '2015-01-04 12:47:51' ),
    ( 19, 22, 11, '2015-01-01 13:30:00', '2015-01-04 08:58:54' ),
    ( 1, 21, 19, '2015-02-06 01:27:54', '2015-02-07 19:25:07' ),
    ( 2, 20, 18, '2015-02-07 20:25:40', '2015-02-09 18:26:52' ),
    ( 3, 19, 17, '2015-02-04 23:44:14', '2015-02-07 12:56:44' ),
    ( 4, 18, 16, '2015-02-07 00:17:12', '2015-02-08 03:14:24' ),
    ( 5, 17, 15, '2015-02-04 06:32:54', '2015-02-08 07:29:41' ),
    ( 6, 16, 14, '2015-02-03 06:04:32', '2015-02-08 14:20:56' ),
    ( 7, 15, 13, '2015-02-07 16:59:37', '2015-02-10 01:56:15' ),
    ( 8, 14, 12, '2015-02-06 13:42:48', '2015-02-09 18:53:36' ),
    ( 9, 13, 11, '2015-02-04 07:10:01', '2015-02-04 12:19:53' ),
    ( 11, 12, 19, '2015-02-07 03:07:11', '2015-02-08 09:12:19' ),
    ( 12, 11, 18, '2015-02-04 13:11:52', '2015-02-06 00:05:41' ),
    ( 14, 39, 16, '2015-02-07 04:12:50', '2015-02-08 12:56:44' ),
    ( 15, 38, 15, '2015-02-09 08:21:33', '2015-02-12 01:02:21' ),
    ( 16, 37, 14, '2015-02-06 12:49:30', '2015-02-08 13:53:39' ),
    ( 17, 36, 13, '2015-02-07 17:14:03', '2015-02-10 23:16:23' ),
    ( 18, 35, 12, '2015-02-05 12:47:51', '2015-02-12 04:03:44' ),
    ( 19, 34, 11, '2015-02-05 08:58:54', '2015-02-10 00:10:37' ),
    ( 1, 33, 19, '2015-03-11 19:25:07', '2015-03-17 20:59:49' ),
    ( 2, 32, 18, '2015-03-13 18:26:52', '2015-03-17 06:57:39' ),
    ( 3, 31, 17, '2015-03-11 12:56:44', '2015-03-16 20:15:16' ),
    ( 4, 30, 16, '2015-03-12 03:14:24', '2015-03-14 23:26:56' ),
    ( 5, 29, 15, '2015-03-12 07:29:41', '2015-03-18 02:10:34' ),
    ( 6, 28, 14, '2015-03-12 14:20:56', '2015-03-16 02:29:41' ),
    ( 7, 27, 13, '2015-03-14 01:56:15', '2015-03-18 21:40:17' ),
    ( 8, 26, 12, '2015-03-13 18:53:36', '2015-03-14 20:57:43' ),
    ( 9, 25, 11, '2015-03-08 12:19:53', '2015-03-14 04:45:28' ),
    ( 11, 24, 19, '2015-03-12 09:12:19', '2015-03-17 19:27:54' ),
    ( 12, 23, 18, '2015-03-10 00:05:41', '2015-03-12 12:12:12' ),
    ( 13, 22, 17, '2015-02-03 23:10:14', '2015-02-04 12:10:40' ),
    ( 14, 21, 16, '2015-03-12 12:56:44', '2015-03-13 11:57:04' ),
    ( 15, 20, 15, '2015-03-16 01:02:21', '2015-03-18 08:40:43' ),
    ( 16, 19, 14, '2015-03-12 13:53:39', '2015-03-15 12:03:33' ),
    ( 17, 18, 13, '2015-03-14 23:16:23', '2015-03-17 08:41:57' ),
    ( 18, 17, 12, '2015-03-16 04:03:44', '2015-03-17 11:25:35' ),
    ( 19, 16, 11, '2015-03-14 00:10:37', '2015-03-16 20:17:46' ),
    ( 1, 15, 19, '2015-04-18 20:59:49', '2015-04-23 05:13:03' ),
    ( 2, 14, 18, '2015-04-18 06:57:39', '2015-04-25 01:41:11' ),
    ( 3, 13, 17, '2015-04-17 20:15:16', '2015-04-24 11:11:50' ),
    ( 4, 12, 16, '2015-04-15 23:26:56', '2015-04-19 05:35:02' ),
    ( 5, 11, 15, '2015-04-19 02:10:34', '2015-04-19 10:20:46' ),
    ( 7, 39, 13, '2015-04-19 21:40:17', '2015-04-24 13:24:33' ),
    ( 8, 38, 12, '2015-04-15 20:57:43', '2015-04-17 21:35:32' ),
    ( 9, 37, 11, '2015-04-15 04:45:28', '2015-04-21 23:07:52' ),
    ( 11, 36, 19, '2015-04-18 19:27:54', '2015-04-19 06:36:45' ),
    ( 12, 35, 18, '2015-04-13 12:12:12', '2015-04-15 13:46:45' ),
    ( 13, 34, 17, '2015-03-08 12:10:40', '2015-03-14 17:39:19' ),
    ( 14, 33, 16, '2015-04-14 11:57:04', '2015-04-20 17:41:49' ),
    ( 15, 32, 15, '2015-04-19 08:40:43', '2015-04-19 09:49:28' ),
    ( 16, 31, 14, '2015-04-16 12:03:33', '2015-04-23 09:50:30' ),
    ( 17, 30, 13, '2015-04-18 08:41:57', '2015-04-19 13:34:44' ),
    ( 18, 29, 12, '2015-04-18 11:25:35', '2015-04-22 21:57:02' ),
    ( 19, 28, 11, '2015-04-17 20:17:46', '2015-04-23 16:34:40' );


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

    ( 1, 39, 19, '2015-01-05 01:27:54' ),
    ( 3, 37, 17, '2015-01-03 23:44:14' ),
    ( 4, 36, 16, '2015-01-06 00:17:12' ),
    ( 6, 34, 14, '2015-01-02 06:04:32' ),
    ( 7, 33, 13, '2015-01-06 16:59:37' ),
    ( 9, 31, 11, '2015-01-03 07:10:01' ),
    ( 11, 30, 19, '2015-01-06 03:07:11' ),
    ( 12, 29, 18, '2015-01-03 13:11:52' ),
    ( 14, 27, 16, '2015-01-06 04:12:50' ),
    ( 17, 24, 13, '2015-01-06 17:14:03' ),
    ( 18, 23, 12, '2015-01-04 12:47:51' ),
    ( 1, 21, 19, '2015-02-07 19:25:07' ),
    ( 2, 20, 18, '2015-02-09 18:26:52' ),
    ( 3, 19, 17, '2015-02-07 12:56:44' ),
    ( 4, 18, 16, '2015-02-08 03:14:24' ),
    ( 5, 17, 15, '2015-02-08 07:29:41' ),
    ( 6, 16, 14, '2015-02-08 14:20:56' ),
    ( 8, 14, 12, '2015-02-09 18:53:36' ),
    ( 9, 13, 11, '2015-02-04 12:19:53' ),
    ( 12, 11, 18, '2015-02-06 00:05:41' ),
    ( 17, 36, 13, '2015-02-10 23:16:23' ),
    ( 1, 33, 19, '2015-03-17 20:59:49' ),
    ( 3, 31, 17, '2015-03-16 20:15:16' ),
    ( 6, 28, 14, '2015-03-16 02:29:41' ),
    ( 8, 26, 12, '2015-03-14 20:57:43' ),
    ( 11, 24, 19, '2015-03-17 19:27:54' ),
    ( 12, 23, 18, '2015-03-12 12:12:12' ),
    ( 16, 19, 14, '2015-03-15 12:03:33' ),
    ( 17, 18, 13, '2015-03-17 08:41:57' ),
    ( 19, 16, 11, '2015-03-16 20:17:46' ),
    ( 3, 13, 17, '2015-04-24 11:11:50' ),
    ( 8, 38, 12, '2015-04-17 21:35:32' ),
    ( 9, 37, 11, '2015-04-21 23:07:52' ),
    ( 12, 35, 18, '2015-04-15 13:46:45' ),
    ( 14, 33, 16, '2015-04-20 17:41:49' ),
    ( 18, 29, 12, '2015-04-22 21:57:02' ),
    ( 19, 28, 11, '2015-04-23 16:34:40' );
	
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

    ( 2, 38, '2015-01-06 20:25:40' ),
    ( 5, 35, '2015-01-03 06:32:54' ),
    ( 8, 32, '2015-01-05 13:42:48' ),
    ( 13, 28, '2015-01-02 23:10:14' ),
    ( 15, 26, '2015-01-08 08:21:33' ),
    ( 16, 25, '2015-01-05 12:49:30' ),
    ( 19, 22, '2015-01-04 08:58:54' ),
    ( 7, 15, '2015-02-10 01:56:15' ),
    ( 11, 12, '2015-02-08 09:12:19' ),
    ( 14, 39, '2015-02-08 12:56:44' ),
    ( 15, 38, '2015-02-12 01:02:21' ),
    ( 16, 37, '2015-02-08 13:53:39' ),
    ( 18, 35, '2015-02-12 04:03:44' ),
    ( 19, 34, '2015-02-10 00:10:37' ),
    ( 2, 32, '2015-03-17 06:57:39' ),
    ( 4, 30, '2015-03-14 23:26:56' ),
    ( 5, 29, '2015-03-18 02:10:34' ),
    ( 7, 27, '2015-03-18 21:40:17' ),
    ( 9, 25, '2015-03-14 04:45:28' ),
    ( 13, 22, '2015-02-04 12:10:40' ),
    ( 14, 21, '2015-03-13 11:57:04' ),
    ( 15, 20, '2015-03-18 08:40:43' ),
    ( 18, 17, '2015-03-17 11:25:35' ),
    ( 1, 15, '2015-04-23 05:13:03' ),
    ( 2, 14, '2015-04-25 01:41:11' ),
    ( 4, 12, '2015-04-19 05:35:02' ),
    ( 5, 11, '2015-04-19 10:20:46' ),
    ( 7, 39, '2015-04-24 13:24:33' ),
    ( 11, 36, '2015-04-19 06:36:45' ),
    ( 13, 34, '2015-03-14 17:39:19' ),
    ( 15, 32, '2015-04-19 09:49:28' ),
    ( 16, 31, '2015-04-23 09:50:30' ),
    ( 17, 30, '2015-04-19 13:34:44' );



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
