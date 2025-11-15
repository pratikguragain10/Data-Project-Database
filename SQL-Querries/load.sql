-- LOAD IPL DATA FROM CSV FILES

\c ipldb;

\copy matches
FROM 'data/matches.csv'
DELIMITER ','
CSV HEADER;

\copy deliveries
FROM 'data/deliveries.csv'
DELIMITER ','
CSV HEADER;

\copy umpires 
FROM 'data/umpires.csv' 
DELIMITER ',' 
CSV HEADER;
