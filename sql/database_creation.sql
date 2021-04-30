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
	('Lucas', 'Smith', '2014-01-15 08:01:00'),
	('Oliver', 'Taylor', '2014-04-24 17:25:44'),
	('James', 'Martin', '2014-03-14 14:28:25'),
	('Henry', 'Clark', '2014-03-16 02:27:03'),
	('Michael', 'Walker', '2014-01-09 15:41:35'),
	('Jack', 'Thompson', '2014-04-25 21:44:58'),
	('Matthew', 'Brown', '2014-03-01 09:58:18'),
	('David', 'Johnson', '2014-04-12 13:30:12'),
	('Luke', 'Williams', '2014-04-08 10:05:47'),
	('Leo', 'Jones', '2014-02-11 08:41:29');
	
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
	('Adrian', 'Lopez', '2013-03-23 13:17:50'),
	('Colton', 'Wilson', '2013-02-10 23:28:57'),
	('Cameron', 'Moore', '2013-04-10 09:28:27'),
	('Ezra', 'Lee', '2013-03-28 21:53:31'),
	('Leonardo', 'White', '2013-01-02 06:47:39'),
	('Adam', 'Harris', '2013-01-25 19:52:30'),
	('Wesley', 'Clark', '2013-04-20 10:45:40'),
	('Waylon', 'Lewis', '2013-04-20 10:47:50'),
	('Bennett', 'Young', '2013-02-20 03:48:17'),
	('George', 'Allen', '2013-02-28 09:51:23');

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
	('Ciroc', 'vodka', '2012-03-22 21:43:55'),
	('Absolut', 'vodka', '2012-01-20 17:02:41'),
	('Masseto', 'wine', '2012-02-22 03:27:38'),
	('Zubrovka', 'vodka', '2012-01-26 20:50:47'),
	('Crystal Head', 'vodka', '2012-04-07 00:58:38'),
	('Svedka', 'vodka', '2012-01-20 01:04:01'),
	('Lagunitas', 'beer', '2012-03-22 22:54:16'),
	('Bertoux', 'brandy', '2012-03-06 19:44:01'),
	('Patrón Silver', 'tequila', '2012-03-15 20:54:01');

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
	('single','2011-04-03 09:13:38'),
	('bunk', '2011-01-28 11:52:40'),
	('single','2011-03-11 18:30:46'),
	('bunk', '2011-03-10 09:48:34'),
	('single','2011-03-08 22:57:37'),
	('bunk', '2011-04-08 21:34:05'),
	('bunk', '2011-01-20 09:40:32'),
	('single','2011-02-07 10:54:39'),
	('bunk', '2011-03-12 08:36:32'),
	('single','2011-02-14 18:54:52');

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
	(2, 3),
	(3, 1),
	(3, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(6, 7),
	(7, 4),
	(7, 5),
	(7, 6),
	(7, 8),
	(8, 8),
	(8, 9),
	(8, 10),
	(9, 9),
	(10, 7),
	(10, 10);

-- table that contains the information incidents of drinking alcohol
CREATE TABLE incident (
  incident_id SERIAL PRIMARY KEY,
  additional_info TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO incident(additional_info, created_at) VALUES 
	('lonely drinker', '2014-01-19 06:01:00'),
	('drinking duet', '2014-04-30 18:37:44'),  
	('trio with wine', '2014-05-01 12:42:56'), 
	('lonely drinker', '2014-03-16 07:30:00'), 
	('alcoholic with beer', '2014-01-13 19:22:47'), 
	('two best friends', '2014-05-07 14:16:39'), 
	('big company', '2014-05-10 09:52:00'), 
	('three mechanic', '2014-04-20 21:34:53'), 
	('lonely boy', '2014-04-08 15:42:01'), 
	('two boolies', '2014-03-08 23:51:49'); 
	
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
	(1, 1, '2014-01-19 06:01:00'),
	(7, 2, '2014-04-30 18:37:44'),
	(4, 3, '2014-05-01 12:42:56'),
	(2, 4, '2014-03-16 07:30:00'),
	(8, 5, '2014-01-13 19:22:47'),
	(10, 6, '2014-05-07 14:16:39'),
	(9, 7, '2014-05-10 09:52:00'),
	(3, 8, '2014-04-20 21:34:53'),
	(6, 9, '2014-04-08 15:42:01'),
	(5, 10, '2014-03-08 23:51:49');

-- table that contains information about the capture of th alcoholic by the officer
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
	(5, 1, 1, '2014-01-15 07:50:00'),
	(1, 2, 9, '2014-10-09 22:32:33'),
	(6, 3, 3, '2014-03-14 14:15:25'), 
	(2, 4, 4, '2014-10-20 23:56:13'),
	(4, 5, 5, '2014-01-09 15:27:23'),
	(3, 6, 6, '2014-04-25 21:35:53'),
	(3, 7, 5, '2014-09-26 09:34:26'),
	(10, 8, 8, '2014-04-12 13:17:32'),
	(2, 9, 9, '2014-04-08 09:55:58'),
	(10, 10, 3, '2014-09-24 05:56:02');

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
	(5,'2014-01-10 03:41:14'),
	(1,'2014-01-16 04:20:00'),
	(1,'2014-01-17 01:15:27'),
	(1,'2014-01-17 04:20:00'),
	(10,'2014-02-12 03:41:29'),
	(3,'2014-03-15 08:28:01'),
	(3,'2014-03-16 11:13:05'),
	(4,'2014-03-17 04:20:00'),
	(9,'2014-04-09 07:02:12'),
	(8,'2014-04-13 04:30:12');
	
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
	(1, 1, 5, '2014-01-15 08:01:00', '2014-02-01 08:00:00'),
	(2, 2, 1, '2014-04-24 17:25:44', '2014-08-11 00:12:58'),
	(3, 3, 6, '2014-03-14 14:28:25', '2014-08-25 18:01:25'),
	(4, 4, 7, '2014-03-16 02:27:03', '2014-03-20 02:27:03'),
	(1, 4, 7, '2014-03-20 02:27:03', NULL),
	(5, 5, 4, '2014-01-09 15:41:35', '2014-06-28 04:26:57'),
	(6, 6, 3, '2014-04-25 21:44:58', '2014-06-09 13:45:15'),
	(7, 7, 6, '2014-03-01 09:58:18', '2014-06-07 02:12:19'),
	(8, 8, 10, '2014-04-12 13:30:12', '2014-05-01 14:18:49'),
	(9, 9, 2, '2014-04-08 10:05:47', '2014-07-24 06:31:19'),
	(10, 10, 9, '2014-02-11 08:41:29', '2014-06-27 01:01:03'),
	(2, 1, 5, '2014-10-11 20:55:43', '2014-12-23 22:15:34'),
	(9, 2, 1, '2014-10-09 22:36:41', '2014-12-16 12:06:15'),
	(7, 3, 8, '2014-09-17 13:56:20', '2014-11-15 01:35:45'),
	(4, 4, 2, '2014-10-21 00:00:23', '2014-11-14 17:31:12'),
	(1, 5, 4, '2014-09-05 19:43:37', '2014-11-24 01:31:54'),
	(6, 6, 6, '2014-10-21 05:01:27', '2014-11-05 00:45:04'),
	(5, 7, 3, '2014-09-26 09:39:12', '2014-11-25 10:49:59'),
	(8, 8, 9, '2014-10-18 03:35:45', '2014-12-20 12:38:51'),
	(10, 9, 7, '2014-09-24 06:03:41', '2014-11-07 05:28:37'),
	(3, 10, 10, '2014-09-24 06:03:41', '2014-11-18 10:30:37');

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
	(1, 1, 5, '2014-02-01 08:00:00'),
	(2, 2, 1, '2014-08-11 00:12:58'),
	(3, 3, 6, '2014-08-25 18:01:25'),
	(5, 5, 4, '2014-06-28 04:26:57'),
	(6, 6, 3, '2014-06-09 13:45:15'),
	(7, 7, 6, '2014-06-07 02:12:19'),
	(8, 8, 10, '2014-05-01 14:18:49'),
	(9, 9, 2, '2014-07-24 06:31:19');
	
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
	(10, 10, '2014-06-27 01:01:03'),
	(2, 1, '2014-12-23 22:15:34'),
	(9, 2, '2014-12-16 12:06:15'),
	(7, 3, '2014-11-15 01:35:45'),
	(4, 4, '2014-11-14 17:31:12'),
	(1, 5, '2014-11-24 01:31:54'),
	(6, 6, '2014-11-05 00:45:04'),
	(5, 7, '2014-11-25 10:49:59'),
	(8, 8, '2014-12-20 12:38:51'),
	(10, 9, '2014-11-07 05:28:37'),
	(3 ,10, '2014-11-18 10:30:37');
