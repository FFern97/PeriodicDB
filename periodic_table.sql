-- RENAME COLUMNS
ALTER TABLE properties
RENAME COLUMN weight TO atomic_mass;

ALTER TABLE properties
RENAME COLUMN melting_point TO melting_point_celsius;

ALTER TABLE properties
RENAME COLUMN boiling_point TO boiling_point_celsius;

-- ADD CONSTRAINT NOT NULL
ALTER TABLE properties 
ALTER COLUMN melting_point_celsius SET NOT NULL;

ALTER TABLE properties 
ALTER COLUMN boiling_point_celsius SET NOT NULL;

ALTER TABLE elements 
ALTER COLUMN symbol SET NOT NULL;

ALTER TABLE elements 
ALTER COLUMN name SET NOT NULL;

-- ADD CONSTRAINT UNIQUE 
ALTER TABLE elements
ADD CONSTRAINT unique_symbol UNIQUE (symbol);

ALTER TABLE elements
ADD CONSTRAINT unique_name UNIQUE (name);

--SET FOREIGN KEY
ALTER TABLE properties
ADD CONSTRAINT fk_properties_elements FOREIGN KEY (atomic_number) REFERENCES elements (atomic_number);

-- CREATE TYPES TABLE
CREATE TABLE types(type_id SERIAL PRIMARY KEY, type VARCHAR(255) NOT NULL);

-- INSERT ROWS INTO TYPES
INSERT INTO types (type) VALUES ('metal');
INSERT INTO types (type) VALUES ('nonmetal');
INSERT INTO types (type) VALUES ('metalloid');

-- ADD type_id COLUMN AND SET FOREIGN KEY TO PROPERTIES TABLE
ALTER TABLE properties
ADD COLUMN type_id INT;

UPDATE properties SET type_id = 1 WHERE type_id IS NULL;

ALTER TABLE properties
ALTER COLUMN type_id SET NOT NULL; 

ALTER TABLE properties
ADD CONSTRAINT  fk_properties_types FOREIGN KEY (type_id) REFERENCES  types(type_id);

--CAPITALIZE  SYMBOL COLUMN FROM ELEMENTS
UPDATE elements
SET symbol = INITCAP(symbol);

--REMOVE ZEROS FROM ATOMIC_MASS COLUMN
ALTER TABLE properties
ALTER COLUMN atomic_mass SET DATA TYPE FLOAT;

UPDATE properties
SET atomic_mass = 1.008 WHERE atomic_number = 1;

UPDATE properties
SET atomic_mass = 4.0026 WHERE atomic_number = 2;

UPDATE properties
SET atomic_mass = 9.0122 WHERE atomic_number = 4;

UPDATE properties
SET atomic_mass = 12.011 WHERE atomic_number = 6;

UPDATE properties
SET atomic_mass = 14.007 WHERE atomic_number = 7;

--ADD ELEMENT N°9 DATA TO ELEMENTS AND PROPERTIES
INSERT INTO elements (atomic_number,symbol, name) VALUES (9, 'F', 'Fluorine');

INSERT INTO properties (atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES (9, 'nonmetal', 18.998, -220, -188.1, 1);

--CORRECT ERROR FROM FCC // CHANGE 

--ADD ELEMENT N° 10 DATA TO ELEMENTS AND PROPERTIES
INSERT INTO elements (atomic_number,symbol, name) VALUES (10, 'Ne', 'Neon');

INSERT INTO properties (atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES (10, 'nonmetal', 20.18, -248.6, -246.1, 1);

--DELETE ATOMIC NUMBER 1000 FROM ELEMENTS AND PROPERTIES
DELETE FROM properties WHERE atomic_number = 1000;
DELETE FROM elements WHERE atomic_number = 1000;

--DROP TYPE COLUMN FROM PROPERTIES
ALTER TABLE properties
DROP COLUMN type;
