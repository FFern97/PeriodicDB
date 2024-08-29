-- RENAME COLUMNS
ALTER TABLE properties
RENAME COLUMN weight TO atomic_mass;

ALTER TABLE properties
RENAME COLUMN melting_point TO melting_popint_celsius;

ALTER TABLE properties
RENAME COLUMN boiling_point TO boiling_ponit_celsius;

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

-- ADD type_id FOREIGN KEY TO PROPERTIES TABLE



