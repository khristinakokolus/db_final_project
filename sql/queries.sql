-- DATABASE: sobering_up_station


-- Query 1: 
-- Select all inspectors that took a given alcoholic A to the sobering-up station at least N times from date F to T;

-- For example: 
-- N count = 1
-- Alcoholic name = Lucas Smith
-- Date = from 2014-01-01 00:00:00 and 2015-01-01 00:00:00

-- Works well
SELECT officer.first_name, officer.last_name
FROM (SELECT first_name, last_name, officer_id 
	  FROM alcoholic JOIN capture ON alcoholic.alcoholic_id = capture.alcoholic_id 
	  WHERE alcoholic.first_name = 'Lucas' 
	  AND alcoholic.last_name = 'Smith' 
	  AND capture.caught_at >= '2014-01-01 00:00:00'
	  AND capture.caught_at <= '2015-01-01 00:00:00') AS table_1
JOIN officer on officer.officer_id = table_1.officer_id
GROUP BY officer.first_name, officer.last_name
HAVING COUNT(table_1.officer_id) >= 1;

-- Query 2:
-- Select all beds of the sobering-up station where a given alcoholic A has been from date F to date T;

-- For example:
-- Alcoholic name = Lucas Smith
-- Date = from 2014-01-01 00:00:00 and 2015-01-01 00:00:00

-- Works well
SELECT bed.bed_id
FROM (SELECT *
	  FROM alcoholic JOIN bed_status ON bed_status.alcoholic_id = alcoholic.alcoholic_id
	  WHERE alcoholic.first_name = 'Lucas' AND alcoholic.last_name = 'Smith'
	  AND bed_status.stay_start >= '2014-01-01 00:00:00'
	  AND bed_status.stay_end <= '2015-01-01 00:00:00') AS table_2
JOIN bed on bed.bed_id = table_2.bed_id;

-- Query 3:
-- For inspector I select all alcoholics that he took to the sobering-up station at least N times 
-- for the given period - from date F to date T

-- For example: 
-- N count = 1
-- Inspector name = Cameron Moore
-- Date = from 2014-01-01 00:00:00 and 2015-01-01 00:00:00

-- Works well
SELECT alcoholic.first_name, alcoholic.last_name
FROM (SELECT * 
	 FROM officer JOIN capture ON capture.officer_id = officer.officer_id
	 WHERE officer.first_name = 'Cameron' 
	  AND officer.last_name = 'Moore'
	  AND capture.caught_at >= '2014-01-01 00:00:00' 
	  AND capture.caught_at <= '2015-01-01 00:00:00') AS table_3
JOIN alcoholic ON alcoholic.alcoholic_id = table_3.alcoholic_id
GROUP BY alcoholic.first_name, alcoholic.last_name
HAVING COUNT(alcoholic.alcoholic_id) >= 1;

-- Query 4:
-- Select all beds in the sobering-up station from which a given alcoholic A escaped for the given period -
-- From date F to date T

-- Alcoholic name = Lucas Smith
-- Date = from 2014-01-01 00:00:00 and 2015-01-01 00:00:00

-- Works well
SELECT bed.bed_id
FROM (SELECT *
	 FROM alcoholic JOIN escaped ON escaped.alcoholic_id = alcoholic.alcoholic_id
	 WHERE alcoholic.first_name = 'Lucas'
	 AND alcoholic.last_name = 'Smith'
	 AND escaped.happened_at >= '2014-01-01 00:00:00' 
	 AND escaped.happened_at <= '2015-01-01 00:00:00') AS table_4
JOIN bed on table_4.bed_id = bed.bed_id;

-- Query 6:
-- Select all inspectors that took at least N distinct alcoholics in a given period F to T;

-- For example:
-- Date = from 2014-01-01 00:00:00 and 2015-01-01 00:00:00

-- Works well
SELECT officer.first_name, officer.last_name
FROM (SELECT first_name, last_name, officer.officer_id, capture.alcoholic_id
   FROM officer JOIN capture ON officer.officer_id = capture.officer_id
   WHERE capture.caught_at >= '2014-01-01 00:00:00' 
   AND capture.caught_at <= '2015-01-01 00:00:00') AS table_6
JOIN officer ON officer.officer_id = table_6.officer_id
GROUP BY officer.first_name, officer.last_name
HAVING COUNT (DISTINCT table_6.alcoholic_id) >= 3;

-- Query 7:
-- Select all alcoholics that were taken to the SU-station at least N times in a given period F to T;

-- For example:
-- N count = 1
-- Date = from 2014-01-01 00:00:00 and 2015-01-01 00:00:00

-- Works well
SELECT table_7.first_name, table_7.last_name
FROM (SELECT * 
	  FROM alcoholic JOIN capture ON alcoholic.alcoholic_id = capture.alcoholic_id
	  WHERE capture.caught_at >= '2014-01-01 00:00:00'
	  AND capture.caught_at <= '2015-01-01 00:00:00') AS table_7
GROUP BY table_7.first_name, table_7.last_name
HAVING COUNT(*) >= 1;

-- Query 5:
-- Select all inspectors that took a given alcoholic A to the SU-station less than they let him go;

-- For example:
-- Alcoholic name = Lucas Smith
-- Date = from 2014-01-01 00:00:00 and 2015-01-01 00:00:00

CREATE VIEW alcoid_by_names AS
SELECT alcoholic_id FROM alcoholic 
WHERE alcoholic.first_name = 'Lucas' AND alcoholic.last_name = 'Smith';

CREATE VIEW specific_captures AS
SELECT officer_id, capture.alcoholic_id, bed_id, caught_at FROM capture
JOIN alcoid_by_names ON alcoid_by_names.alcoholic_id = capture.alcoholic_id;

CREATE VIEW specific_releases AS
SELECT bed_id, released.alcoholic_id, officer_id, happened_at FROM released
JOIN alcoid_by_names ON alcoid_by_names.alcoholic_id = released.alcoholic_id;

CREATE VIEW inspectors_satisfying_1 AS
SELECT table_5_1.officer_id, capture_number, release_number
FROM (SELECT officer_id, COUNT(*) AS capture_number 
	  FROM specific_captures
	  GROUP BY officer_id) AS table_5_1
INNER JOIN (SELECT officer_id, COUNT(*) AS release_number 
	  FROM specific_releases
	  GROUP BY officer_id) AS TABLE_5_2
ON table_5_1.officer_id = table_5_2.officer_id
WHERE capture_number < release_number;

SELECT officer.first_name, officer.last_name FROM inspectors_satisfying_1
JOIN officer ON officer.officer_id = inspectors_satisfying_1.officer_id;


-- Query 8:
-- Select all common events for an alcoholic A and inspector I in a given period - F to T;

-- Query 9:
-- Select the number of times a given alcoholic A drank each alcoholic drink 
-- with at least N other alcoholics in a given period F to T

-- Query 10:
-- Select total number of times alcoholics escaped from the given SU-station by months;

-- add processing by months
SELECT table_10.bed_id, COUNT(*)
FROM (SELECT *
	 FROM alcoholic JOIN escaped ON alcoholic.alcoholic_id = escaped.alcoholic_id
	  WHERE escaped.bed_id = 1) AS table_10
GROUP BY table_10.bed_id;

-- Query 11:
-- Select beds in decsending order considering the average number of faints for all alcoholics that were taken 
-- in a given period F to T by a given inspector I;

-- Query 12:
-- Select all alcoholic drinks in descending order considering the total number of alcoholics that drank
-- those drinks with a given alcoholic A in a given period F to T;
