
-- CREATE DATABASE 

CREATE TABLE Alcohol (
  alco_id SERIAL PRIMARY KEY,
  title VARCHAR(20),
  additional_info TEXT,
  created_at DATE,
  updated_at DATE
);

CREATE TABLE IncidentInfo (
  incident_info_id SERIAL PRIMARY KEY,
  alco_id INT,
  incident_id INT,
  drank_at DATE,
  created_at DATE,
  updated_at DATE,
  FOREIGN KEY(alco_id) REFERENCES Alcohol(alco_id),
  FOREIGN KEY(incident_id) REFERENCES Incident(incident_id)
);

CREATE TABLE Fainted (
  fainted_id SERIAL PRIMARY KEY,
  alcoholic_id INT,
  happened_at DATE,
  created_at DATE,
  updated_at DATE,
  FOREIGN KEY(alcoholic_id) REFERENCES Alcoholic(alcoholic_id)
);

CREATE TABLE Trailed (
  trailed_id SERIAL PRIMARY KEY,
  incident_id INT,
  alcoholic_id INT,
  created_at DATE,
  updated_at DATE,
  FOREIGN KEY(incident_id) REFERENCES Incident(incident_id),
  FOREIGN KEY(alcoholic_id) REFERENCES Alcoholic(alcoholic_id)
);

CREATE TABLE Bed (
  bed_id SERIAL PRIMARY KEY,
  aditional_info TEXT,
  bed_free bool,
  created_at DATE,
  updated_at DATE
);

CREATE TABLE BedExchange (
  exhange_id SERIAL PRIMARY KEY,
  old_bed_id INT,
  alcoholic_id INT,
  officer_id INT,
  new_bed_id INT,
  happened_at DATE,
  created_at DATE,
  updated_at DATE,
  FOREIGN KEY(old_bed_id) REFERENCES Bed(bed_id),
  FOREIGN KEY(new_bed_id) REFERENCES Bed(bed_id),
  FOREIGN KEY(alcoholic_id) REFERENCES Alcoholic(alcoholic_id),
  FOREIGN KEY(officer_id) REFERENCES Officer(officer_id)
);

CREATE TABLE Released (
  released_id SERIAL PRIMARY KEY,
  old_bed_id INT,
  alcoholic_id INT,
  officer_id INT,
  happened_at DATE,
  created_at DATE,
  updated_at DATE,
  FOREIGN KEY(old_bed_id) REFERENCES Bed(bed_id),
  FOREIGN KEY(alcoholic_id) REFERENCES Alcoholic(alcoholic_id),
  FOREIGN KEY(officer_id) REFERENCES Officer(officer_id)
);

CREATE TABLE Officer (
  officer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  created_at DATE,
  updated_at DATE
);

CREATE TABLE Incident (
  incident_id SERIAL PRIMARY KEY,
  additional_info TEXT,
  created_at DATE,
  updated_at DATE
);

CREATE TABLE Capture (
  capture_id SERIAL PRIMARY KEY,
  officer_id INT,
  alcoholic_id INT,
  bed_id INT,
  caught_at DATE,
  created_at DATE,
  updated_at DATE,
  FOREIGN KEY(alcoholic_id) REFERENCES Alcoholic(alcoholic_id),
  FOREIGN KEY(officer_id) REFERENCES Officer(officer_id),
  FOREIGN KEY(bed_id) REFERENCES Bed(bed_id)
);

CREATE TABLE Alcoholic (
  alcoholic_id SERIAL PRIMARY KEY,
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  created_at DATE,
  updated_at DATE
);

CREATE TABLE Escaped (
  escaped_id SERIAL PRIMARY KEY,
  old_bed_id INT,
  alcoholic_id INT,
  happened_at DATE,
  created_at DATE,
  updated_at DATE,
  FOREIGN KEY(old_bed_id) REFERENCES Bed(bed_id),
  FOREIGN KEY(alcoholic_id) REFERENCES Alcoholic(alcoholic_id)	
);
