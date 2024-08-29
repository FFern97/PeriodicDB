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
SELECT INITCAP(symbol)
FROM elements; 

