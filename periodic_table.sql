
ALTER TABLE properties
RENAME COLUMN weight TO atomic_mass;

ALTER TABLE properties
RENAME COLUMN melting_point TO melting_popint_celsius;

ALTER TABLE properties
RENAME COLUMN boiling_point TO boiling_ponit_celsius;

ALTER TABLE properties 
ALTER COLUMN melting_point_celsius SET NOT NULL;

ALTER TABLE properties 
ALTER COLUMN boiling_point_celsius SET NOT NULL;

ALTER TABLE elements 
ALTER COLUMN symbol SET NOT NULL;

ALTER TABLE elements 
ALTER COLUMN name SET NOT NULL;

ALTER TABLE elements
ADD CONSTRAINT unique_symbol UNIQUE (symbol);

ALTER TABLE elements
ADD CONSTRAINT unique_name UNIQUE (name);


ADD 
