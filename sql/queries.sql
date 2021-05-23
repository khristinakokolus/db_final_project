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

-- Query 5:
-- Select all inspectors that took a given alcoholic A to the SU-station less than they let him go;

-- For example:
-- Alcoholic name = Lucas Smith
-- Date = from 2014-01-01 00:00:00 and 2015-01-01 00:00:00

-- Works well
SELECT officer.first_name, officer.last_name 
FROM (
SELECT table_5_1.officer_id, capture_number, release_number
FROM (SELECT officer_id, COUNT(*) AS capture_number 
	  FROM (SELECT officer_id, capture.alcoholic_id, bed_id, caught_at FROM capture
	  JOIN (SELECT alcoholic_id FROM alcoholic 
	  WHERE alcoholic.first_name = 'Elias' AND alcoholic.last_name = 'Carter') AS alcoid_by_names
	  ON alcoid_by_names.alcoholic_id = capture.alcoholic_id) AS specific_captures
	  GROUP BY officer_id) AS table_5_1
INNER JOIN (SELECT officer_id, COUNT(*) AS release_number 
	  FROM (SELECT bed_id, released.alcoholic_id, officer_id, happened_at FROM released
	  JOIN (SELECT alcoholic_id FROM alcoholic 
	  WHERE alcoholic.first_name = 'Elias' AND alcoholic.last_name = 'Carter') AS alcoid_by_names ON alcoid_by_names.alcoholic_id = released.alcoholic_id) AS specific_releases
	  GROUP BY officer_id) AS table_5_2
ON table_5_1.officer_id = table_5_2.officer_id
WHERE capture_number < release_number) AS inspectors_satisfying_1
JOIN officer ON officer.officer_id = inspectors_satisfying_1.officer_id;

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


-- Query 8:
-- Select all common events for an alcoholic A and inspector I in a given period - F to T;

-- For example:
-- Alcoholic: Oliver Taylor
-- Officer: Adrian Lopez

-- Works well
SELECT released_id, capture_id FROM
(SELECT released.released_id, capture.capture_id, capture.alcoholic_id, capture.officer_id 
FROM released JOIN capture 
ON released.alcoholic_id = capture.alcoholic_id AND released.officer_id = capture.officer_id
WHERE capture.caught_at >= '2014-01-01 00:00:00' AND capture.caught_at <= '2015-01-01 00:00:00' AND
released.happened_at >= '2014-01-01 00:00:00' AND released.happened_at <= '2015-01-01 00:00:00') AS table_8_1
JOIN (SELECT alcoholic_id FROM alcoholic 
   WHERE first_name = 'Oliver' AND last_name = 'Taylor') AS alc
ON table_8_1.alcoholic_id = alc.alcoholic_id
JOIN (SELECT officer_id FROM officer
  WHERE first_name = 'Adrian' AND last_name = 'Lopez') AS offc
ON table_8_1.officer_id = offc.officer_id;


-- Query 9:
-- Select the number of times a given alcoholic A drank each alcoholic drink 
-- with at least N other alcoholics in a given period F to T


--For example:
-- Alcoholic = Lucas Smith
-- Date = from 2014-01-01 00:00:00 to 2015-01-02 00:00:00
-- N = 1

-- Works well
SELECT table_9_1.title, COUNT(*) FROM(SELECT alcohol.title, incident_info.incident_id FROM alcohol JOIN incident_info ON alcohol.alco_id = incident_info.alco_id) AS table_9_1
JOIN (SELECT trailed.incident_id, trailed.alcoholic_id FROM incident_info JOIN trailed ON incident_info.incident_id = trailed.incident_id  WHERE incident_info.drank_at >= '2014-01-01 00:00:00' AND incident_info.drank_at <= '2015-01-02 00:00:00') As table_9_2 ON
table_9_1.incident_id = table_9_2.incident_id
JOIN(SELECT trailed.incident_id, alcoholic.alcoholic_id FROM trailed JOIN alcoholic ON trailed.alcoholic_id = alcoholic.alcoholic_id WHERE alcoholic.first_name = 'Lucas' AND alcoholic.last_name = 'Smith') AS table_9_3
ON table_9_3.incident_id = table_9_1.incident_id
GROUP BY table_9_1.title
HAVING COUNT (table_9_2.incident_id) > 1

-- Query 10:
-- Select total number of times alcoholics escaped from the given SU-station by months;

-- Works well
SELECT to_char(happened_at, 'Mon') AS month, EXTRACT(YEAR FROM happened_at) as year, COUNT(alcoholic_id) as alcoholic_amount
FROM escaped
GROUP BY month, year

-- Query 11:
-- Select beds in decsending order considering the average number of faints for all alcoholics that were taken 
-- in a given period F to T by a given inspector I;

-- For example:
-- Date = from 2014-01-01 00:00:00 and 2015-01-01 00:00:00

-- Works well
SELECT bed_id
FROM fainted
WHERE fainted.happened_at >= '2014-01-01 00:00:00' AND fainted.happened_at <= '2015-01-01 00:00:00'
GROUP BY bed_id
ORDER BY COUNT(alcoholic_id) DESC;

-- Query 12:
-- Select all alcoholic drinks in descending order considering the total number of alcoholics that drank
-- those drinks with a given alcoholic A in a given period F to T;

-- For example:
-- Alcoholic = Matthew Cohen
-- Date = from 2014-01-01 00:00:00 to 2015-01-02 00:00:00

-- Works well
SELECT table_12_1.title
FROM(SELECT alcohol.title, incident_info.incident_id FROM alcohol JOIN incident_info ON alcohol.alco_id = incident_info.alco_id) AS table_12_1
JOIN (SELECT trailed.incident_id, trailed.alcoholic_id FROM incident_info JOIN trailed ON incident_info.incident_id = trailed.incident_id  WHERE incident_info.drank_at >= '2014-01-01 00:00:00' AND incident_info.drank_at <= '2015-01-02 00:00:00') As table_12_2 ON
table_12_1.incident_id = table_12_2.incident_id
JOIN(SELECT trailed.incident_id, alcoholic.alcoholic_id FROM trailed JOIN alcoholic ON trailed.alcoholic_id = alcoholic.alcoholic_id WHERE alcoholic.first_name = 'Matthew' AND alcoholic.last_name = 'Cohen') AS table_12_3
ON table_12_3.incident_id = table_12_1.incident_id
ORDER BY COUNT(table_12_3.incident_id) DESC; 


-- Query 13(Additional):
-- Select top 10 most dangerous alcoholics that start the most wights
SELECT alc.first_name, alc.last_name, count(*) as fights
FROM alcoholics_fight as alc_f INNER JOIN alcoholic as alc
ON alc_f.aggressor_id = alc.alcoholic_id 
GROUP BY alc.alcoholic_id
ORDER BY fights DESC
LIMIT 10;

-- Query 14(Additional):
-- Select top 10 most skillfil alcoholics that win most of the fights
SELECT alc.first_name, alc.last_name, count(*) as fights_won
FROM alcoholics_fight as alc_f INNER JOIN alcoholic as alc
ON alc_f.winner_id = alc.alcoholic_id 
GROUP BY alc.alcoholic_id
ORDER BY fights_won DESC
LIMIT 10;


-- Additional: board of honor of alcoholics
-- Select top 10 alcoholics that were caught up at most

SELECT honor_board_alcoholic.first_name, honor_board_alcoholic.last_name, COUNT(honor_board_alcoholic.alcoholic_id) AS caught_amount
FROM (SELECT alcoholic.first_name, alcoholic.last_name, capture.alcoholic_id 
	  FROM alcoholic
	  JOIN capture ON alcoholic.alcoholic_id = capture.alcoholic_id) as honor_board_alcoholic
GROUP BY honor_board_alcoholic.first_name, honor_board_alcoholic.last_name
ORDER BY COUNT(honor_board_alcoholic.alcoholic_id) DESC
LIMIT 10;


-- Additional: board of honor of officers
-- Select top 10 officers that caught up at most

SELECT honor_board_officer.first_name, honor_board_officer.last_name, COUNT(honor_board_officer.officer_id) AS caught_amount
FROM (SELECT officer.first_name, officer.last_name, capture.officer_id 
	  FROM officer
	  JOIN capture ON officer.officer_id = capture.officer_id) as honor_board_officer
GROUP BY honor_board_officer.first_name, honor_board_officer.last_name
ORDER BY COUNT(honor_board_officer.officer_id) DESC
LIMIT 10;

