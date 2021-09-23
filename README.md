#Introduction
It is my study project from relational databases. 
Action plan:
1. created a database
2. generated some .csv files with test data. (random data generator like mockaroo)
3. loaded database with sql loader
4. created a data warehouse
5. created procedures to transport data from database to data warehouse
6. created some queries

One of the goals was to compare the execution time of queries.

#Project structure:

Project 
   |
   |--baza  <---- everything about databases
   |    |
   |    |--pliki_do_zaladowania_bazy <----- it's a folder with .csv, .ctl, .bad files. Resources to load to database.
   |    |
   |    |--baza.sql <---- sql file to create a database.
   |    |
   |    |--dane.bat <---- .bat file to load database using sql loader.
   |    |
   |    |--DatabaseDiagram.png <----- png file with ERD diagram of database
   |
   |--hurtownia  <---- everything about data warehouse
   |    |
   |    |--baza.sql <---- sql file to create a data warehouse.
   |    |
   |    |--dane.sql <---- sql file with procedures to transport resources from database to data warehouse
   |    |
   |    |--DatabaseDiagram.png <----- png file with ERD diagram of data warehouse
   |
   |--zapytania  <---- in this folder there are some queries to database and data warehouse
   |    |
   |    |--cube <---- sql queries with cube
   |    |
   |    |--funkcje rankingowe <---- sql queries with rank functions
   |    |
   |    |--okna czasowe <----- sql queries with window functions
   |    |
   |    |--partycje obliczeniowe <---- sql queries with partition by clause
   |    |
   |    |--rollup <----- sql queries with rollup