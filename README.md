# Data-Warehouse

This project aims to design a data warehouse, create a schema for the data warehouse in PostgreSQL, load data into the data warehouse, write aggregation queries, and create materialized views.

## Objectives
The objectives of this project, to demonstrate how to:

  - Design a data warehouse.
  - Load data into the data warehouse.
  - Create a materialized view.

## Scenario

I am a data engineer hired by a solid waste management company. The company collects and
recycles solid waste across major cities in the country of Brazil. The company operates hundreds
of trucks of different types to collect and transport solid waste. The company would like to create a
data warehouse so that it can create reports like:

  - Total waste collected per year per city

  - Total waste collected per month per city

  - Total waste collected per quarter per city

  - Total waste collected per year per truck type

  - Total waste collected per truck type per city

  - Total waste collected per truck type per station per city

## Prerequisites
This project requires to use of one of the RDBMS, and  I used a PostgreSQL Database to proceed with the tasks.
I created tables and loaded data into PostgreSQL using pgAdmin.

## Criteria
There are a total of 16 tasks for this project, and it is  based on the following tasks:

### Exercise 1: Design a data warehouse
Task 1: Design the dimension table MyDimDate

Task 2: Design the dimension table MyDimWaste

Task 3: Design the dimension table MyDimZone

Task 4: Design the fact table MyFactTrips

### Exercise 2 - Create schema for data warehouse on PostgreSQL

Task 5: Create the dimension table MyDimDate

Task 6: Create the dimension table MyDimWaste

Task 7: Create the dimension table MyDimZone

Task 8: Create the fact table MyFactTrips

### Exercise 3: Load data into the data warehouse

After the initial schema design, I was told that due to operational issues, data could not be collected in the format initially planned. This implies that the previous tables (MyDimDate, MyDimWaste, MyDimZone, MyFactTrips) in the Project database and their associated attributes are no longer applicable to the current design. The company has now provided data in CSV files with new tables DimTruck and DimStation as per the new design.

Task 9: Load data into the dimension table DimDate

Task 10: Load data into the dimension table DimTruck

Task 11: Load data into the dimension table DimStation

Task 12: Load data into the fact table FactTrips

### Exercise 4 - Write aggregation queries and create materialized views

Task 13: Create a grouping sets query

Task 14: Create a rollup query

Task 15: Create a cube query using the columns year, city, station, and average waste collected

Task 16: Create a materialized view named max_waste_per_station using the columns city, station, trucktype, and max waste collected

## Note: Screenshots
During this project, I took screenshots for each task and saved them with their respective task IDs, along with a file containing the queries.
