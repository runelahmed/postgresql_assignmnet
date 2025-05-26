-- Active: 1747676105912@@127.0.0.1@5432@conservation_db
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY UNIQUE,
    full_name VARCHAR (50) NOT NULL,
    region VARCHAR(50) NOT NULL
)

INSERT INTO rangers (full_name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');

SELECT * from rangers;




create Table species (
    species_id SERIAL PRIMARY KEY UNIQUE,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(50) NOT NULL,
    discovery_date DATE,
    conservation_status VARCHAR (50) NOT NULL

)

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

SELECT * FROM species;



create Table sightings (
    sighting_id SERIAL PRIMARY KEY UNIQUE,
    ranger_id INTEGER REFERENCES rangers(ranger_id),
    species_id INTEGER REFERENCES species(species_id),
    sighting_time TIMESTAMP,
    location VARCHAR (50) NOT NULL,
    notes TEXT
)

INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);


SELECT * from sightings;



-- question-1
INSERT into rangers(full_name, region) VALUES ('Derek Fox', 'Coastal Plains');

SELECT * FROM rangers;

-- question-2
SELECT count(*) as unique_species_count from rangers;

-- question-3
SELECT * FROM sightings
    WHERE location ILIKE '%pass';

-- question-4
SELECT full_name, count(*) as total_sightings FROM sightings
    JOIN rangers ON sightings.ranger_id = rangers.ranger_id
    GROUP BY full_name;

-- easiest way 
SELECT full_name, count(ranger_id) as total_sightings from sightings
    JOIN rangers USING(ranger_id)
        GROUP BY full_name;

-- question-5

SELECT common_name from species
    LEFT JOIN sightings on species.species_id = sightings.species_id
   WHERE sightings.species_id IS NULL;

-- question-6

SELECT species.common_name, sightings.sighting_time, rangers.full_name FROM sightings
JOIN species USING (species_id) JOIN rangers USING (ranger_id)
ORDER BY sighting_time DESC LIMIT 2;

-- question - 7

UPDATE species
    set conservation_status = 'Historic'
    WHERE extract(year from discovery_date::date) < 1800;

-- question - 8
SELECT sighting_id, CASE 
    WHEN sighting_time ::time BETWEEN '06:00:00' AND '11:59:59'
    THEN 'Morning'
    WHEN sighting_time::time BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
    WHEN sighting_time::time BETWEEN '18:00:00' AND '20:59:59' THEN 'Evening'
    ELSE 'Night' END as time_of_day from sightings;


--question-9

SELECT full_name from rangers
    LEFT JOIN sightings on rangers.ranger_id = sightings.ranger_id
   WHERE sightings.ranger_id IS NULL;

DELETE from rangers WHERE full_name in (SELECT full_name from rangers
    LEFT JOIN sightings on rangers.ranger_id = sightings.ranger_id
   WHERE sightings.ranger_id IS NULL);

