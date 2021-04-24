
CREATE DATABASE sobering_up;


CREATE TABLE alcoholic (
  alcoholic_id SERIAL PRIMARY KEY,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  created_at DATE,
  updated_at DATE
);


INSERT INTO alcoholic(first_name, last_name, created_at, updated_at) VALUES
('Lucas', 'Smith', CURRENT_DATE, CURRENT_DATE),
('Oliver', 'Taylor', CURRENT_DATE, CURRENT_DATE),
('James', 'Martin', CURRENT_DATE, CURRENT_DATE),
('Henry', 'Clark', CURRENT_DATE, CURRENT_DATE),
('Michael', 'Walker', CURRENT_DATE, CURRENT_DATE),
('Jack', 'Thompson', CURRENT_DATE, CURRENT_DATE),
('Matthew', 'Brown', CURRENT_DATE, CURRENT_DATE),
('David', 'Johnson', CURRENT_DATE, CURRENT_DATE),
('Luke', 'Williams', CURRENT_DATE, CURRENT_DATE),
('Leo', 'Jones', CURRENT_DATE, CURRENT_DATE);


CREATE TABLE officer (
  officer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  created_at DATE,
  updated_at DATE
);


INSERT INTO officer(first_name, last_name, created_at, updated_at) VALUES
('Adrian', 'Lopez', CURRENT_DATE, CURRENT_DATE),
('Colton', 'Wilson', CURRENT_DATE, CURRENT_DATE),
('Cameron', 'Moore', CURRENT_DATE, CURRENT_DATE),
('Ezra', 'Lee', CURRENT_DATE, CURRENT_DATE),
('Leonardo', 'White', CURRENT_DATE, CURRENT_DATE),
('Adam', 'Harris', CURRENT_DATE, CURRENT_DATE),
('Wesley', 'Clark', CURRENT_DATE, CURRENT_DATE),
('Waylon', 'Lewis', CURRENT_DATE, CURRENT_DATE),
('Bennett', 'Young', CURRENT_DATE, CURRENT_DATE),
('George', 'Allen', CURRENT_DATE, CURRENT_DATE);

CREATE INDEX officer_idx
ON officer(first_name, last_name);


CREATE TABLE alcohol (
  alco_id SERIAL PRIMARY KEY,
  title VARCHAR(20) UNIQUE NOT NULL,
  kind VARCHAR(20) NOT NULL,
  additional_info TEXT,
  created_at DATE,
  updated_at DATE
);

INSERT INTO alcohol(title, kind, created_at, updated_at) VALUES
('Grey Goose', 'vodka', CURRENT_DATE, CURRENT_DATE),
('Ciroc', 'vodka', CURRENT_DATE, CURRENT_DATE),
('Absolut', 'vodka', CURRENT_DATE, CURRENT_DATE),
('Masseto', 'wine', CURRENT_DATE, CURRENT_DATE),
('Zubrovka', 'vodka', CURRENT_DATE, CURRENT_DATE),
('Crystal Head', 'vodka', CURRENT_DATE, CURRENT_DATE),
('Svedka', 'vodka', CURRENT_DATE, CURRENT_DATE),
('Lagunitas', 'beer', CURRENT_DATE, CURRENT_DATE),
('Bertoux', 'brandy', CURRENT_DATE, CURRENT_DATE),
('Patrón Silver', 'tequila', CURRENT_DATE, CURRENT_DATE);

CREATE INDEX alcohol_idx
ON alcohol(title, kind);


CREATE TABLE bed (
  bed_id SERIAL PRIMARY KEY,
  bed_type VARCHAR(20),
  aditional_info TEXT,
  created_at DATE,
  updated_at DATE
);

INSERT INTO bed(bed_type, created_at, updated_at) VALUES
('single',CURRENT_DATE, CURRENT_DATE),
('bunk', CURRENT_DATE, CURRENT_DATE),
('single',CURRENT_DATE, CURRENT_DATE),
('bunk', CURRENT_DATE, CURRENT_DATE),
('single',CURRENT_DATE, CURRENT_DATE),
('bunk', CURRENT_DATE, CURRENT_DATE),
('bunk', CURRENT_DATE, CURRENT_DATE),
('single',CURRENT_DATE, CURRENT_DATE),
('bunk', CURRENT_DATE, CURRENT_DATE),
('single',CURRENT_DATE, CURRENT_DATE);


CREATE TABLE incident_info (
  incident_info_id SERIAL PRIMARY KEY,
  alco_id INT,
  incident_id INT,
  drank_at DATE NOT NULL,
  created_at DATE,
  updated_at DATE,
  FOREIGN KEY(alco_id) REFERENCES alcohol(alco_id),
  FOREIGN KEY(incident_id) REFERENCES incident(incident_id)
);

CREATE TABLE fainted (
  fainted_id SERIAL PRIMARY KEY,
  alcoholic_id INT,
  happened_at DATE NOT NULL,
  created_at DATE,
  updated_at DATE,
  FOREIGN KEY(alcoholic_id) REFERENCES alcoholic(alcoholic_id)
);

CREATE TABLE trailed (
  trailed_id SERIAL PRIMARY KEY,
  incident_id INT,
  alcoholic_id INT,
  created_at DATE,
  updated_at DATE,
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
  created_at DATE,
  updated_at DATE,
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
  created_at DATE,
  updated_at DATE,
  FOREIGN KEY(old_bed_id) REFERENCES bed(bed_id),
  FOREIGN KEY(alcoholic_id) REFERENCES alcoholic(alcoholic_id),
  FOREIGN KEY(officer_id) REFERENCES officer(officer_id)
);


CREATE TABLE incident (
  incident_id SERIAL PRIMARY KEY,
  additional_info TEXT,
  created_at DATE,
  updated_at DATE
);

CREATE TABLE capture (
  capture_id SERIAL PRIMARY KEY,
  officer_id INT,
  alcoholic_id INT,
  bed_id INT,
  caught_at DATE NOT NULL,
  created_at DATE,
  updated_at DATE,
  FOREIGN KEY(alcoholic_id) REFERENCES alcoholic(alcoholic_id),
  FOREIGN KEY(officer_id) REFERENCES officer(officer_id),
  FOREIGN KEY(bed_id) REFERENCES bed(bed_id)
);


CREATE TABLE escaped (
  escaped_id SERIAL PRIMARY KEY,
  old_bed_id INT,
  alcoholic_id INT,
  happened_at DATE NOT NULL,
  created_at DATE,
  updated_at DATE,
  FOREIGN KEY(old_bed_id) REFERENCES bed(bed_id),
  FOREIGN KEY(alcoholic_id) REFERENCES alcoholic(alcoholic_id)	
);
