CREATE DATABASE FinalProject
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
CREATE TABLE DimDate (
    Dateid INT PRIMARY KEY,
    date DATE NOT NULL,
    Year INT NOT NULL,
    Quarter INT NOT NULL,
    QuarterName VARCHAR(2) NOT NULL,
    Month INT NOT NULL,
    Monthname VARCHAR(255) NOT NULL,
    Day INT NOT NULL,
    Weekday INT NOT NULL,
    WeekdayName VARCHAR(255) NOT NULL
);

CREATE TABLE DimStation (
    StationId INT PRIMARY KEY,
    City VARCHAR(255) NOT NULL
);

CREATE TABLE DimTruck (
    Truckid INT PRIMARY KEY,
    TruckType VARCHAR(255) NOT NULL
	);

CREATE TABLE FactTrips (
    Tripid VARCHAR(255) PRIMARY KEY,
    Dateid INT NOT NULL,
    Stationid INT NOT NULL,
    Truckid INT NOT NULL,
    Wastecollected DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Dateid) REFERENCES DimDate(Dateid),
    FOREIGN KEY (Stationid) REFERENCES DimStation(Stationid),
    FOREIGN KEY (Truckid) REFERENCES DimTruck(Truckid)
);

SELECT * FROM DimDate LIMIT 5;
SELECT * FROM DimStation LIMIT 5;
SELECT * FROM DimTruck LIMIT 5;
SELECT * FROM FactTrips LIMIT 5;


SELECT ft.stationid, tr.trucktype, SUM(ft.Wastecollected) AS total_waste_collected
FROM FactTrips ft
INNER JOIN DimTruck tr ON ft.Truckid = tr.Truckid
INNER JOIN DimStation st ON ft.Stationid = st.Stationid
GROUP BY GROUPING SETS((ft.stationid, tr.trucktype), ft.stationid, tr.trucktype, ())
ORDER BY ft.stationid, tr.trucktype;

SELECT dd.year, ds.city, ds.stationid, SUM(ft.Wastecollected) AS total_waste_collected
FROM FactTrips ft
INNER JOIN DimDate dd ON ft.dateid = dd.dateid
INNER JOIN DimStation ds ON ft.Stationid = ds.Stationid
GROUP BY ROLLUP(dd.year, ds.city, ds.stationid)
ORDER BY dd.year, ds.city, ds.stationid;

year, city, stationid, and average waste collected.

SELECT dd.year, ds.city, ds.stationid, AVG(ft.Wastecollected) AS average_waste_collected
FROM FactTrips ft
INNER JOIN DimDate dd ON ft.dateid = dd.dateid
INNER JOIN DimStation ds ON ft.Stationid = ds.Stationid
GROUP BY CUBE(dd.year, ds.city, ds.stationid)
ORDER BY dd.year, ds.city, ds.stationid;

CREATE MATERIALIZED VIEW max_waste_stats AS
SELECT ds.city, ds.stationid, dt.trucktype, max(ft.Wastecollected) AS max_waste_collected
FROM FactTrips ft
INNER JOIN DimTruck dt ON ft.Truckid = dt.Truckid
INNER JOIN DimDate dd ON ft.dateid = dd.dateid
INNER JOIN DimStation ds ON ft.Stationid = ds.Stationid
GROUP BY ds.city, ds.stationid, dt.trucktype
WITH DATA;

REFRESH MATERIALIZED VIEW max_waste_stats;

SELECT * FROM max_waste_stats;
