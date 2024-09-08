# Sakila
 This project involves enhancing the Sakila Database, a fictional DVD rental store system. Key tasks included data enrichment, cleansing, and structuring, followed by data modeling and ending with data analysis and visualization.

# 1. Overview
This project demonstrates the end-to-end process of building a data warehouse for the Sakila DVD rental database, enriched with additional data for comprehensive year-round analysis. The project includes data modeling, ETL using SSIS, and advanced analytics through SSAS, Power BI, and Tableau. Key features include:
1. Data warehouse design with a snowflake schema.
2. ETL implementation using SSIS to populate the DWH.
3. Comprehensive data analysis and visualization with SSAS, SSRS, Power BI, Tableau and Excel.
4. Advanced insights on rental performance, customer behavior, film categories, and store operations.

# 2. Prject Satges
1. Data Source
2. Data Understanding and Mapping
3. Data Enrichment 
4. Data Cleansing and Validation
5. DWH Design
6. DWH Implementation (ETL)
7. Advanced Analytics and Visualization

## 2.1 Data Source
The Sakila database was sourced from MySQL Server as a demo dataset.
The initial dataset covered only months 5, 6, 7, and 8. To create a more comprehensive data sample for analysis, we generated additional data for the remaining months.

## 2.2 Data Understanding and Mapping
1.	Table and Column Identification:
   Key Tables: Actor, Address, Category, City, Country, Customer, Film, Film_Actor, Film_Category, Inventory, Language, Payment, Rental, Staff, Store.
   Sample Columns: actor_id, first_name, last_name, film_id, title, customer_id, rental_date, inventory_id, store_id.
2.	Relationship Analysis: analyzed the relationships between key entities like customers, rentals, and inventory to understand their interactions within the database.
3.	ERD Creation
4.	Mapping and Normalization (3rd NF)

## 2.3 Data Enrichment
Utilized SQL to generate random values for the remaining months, ensuring a complete dataset covering the entire year. The Payment and Rental tables were updated with these values, using random foreign key references within their respective ranges.

## 2.4 Data Cleansing and Validation
Utilized SQL to identify and handle null values effectively. For instance, the Rental table was intended to contain data exclusively from 2005, yet some entries had rental dates from 2006 and corresponding null return dates. These rows were deleted to maintain data integrity. Additionally, the district column in the Address table was found to be empty, leading to its removal. We also dropped the last_update column from each table as it was not relevant for further analysis.

## 2.5 DWH Design
We applied data modeling concepts to develop a snowflake schema for our Data Warehouse.
The main tables included in this schema are FactRental, DimDate, DimCustomer, DimFilm, FilmActor, DimStaff,and DimStore.
This design approach ensures efficient data storage, retrieval, and reporting.
It provides a robust foundation for advanced analytics.

## 2.6 DWH Implementation
Began by creating an empty dataset in SSMS consisting of the DWH tables from our designed model. We ensured that the data types for each column matched those in the original dataset to prevent errors during the data population process in the subsequent steps. Below is a code sample of the DWH creation.

After creating the empty dataset, we began populating it using the SSIS tool. The process unfolded as follows:
1. Column Analysis: We reviewed the columns of each empty table in our DWH, comparing them with the original dataset structure. We carefully considered how to align these structures and identified the necessary join statements to ensure that all required values were included without omission.
2. SQL Validation: We tested the SQL statements on SSMS to ensure they would correctly achieve the desired table structures before implementing them in SSIS.
3. Data Flow Task Creation: We opened SSIS and created a Data Flow Task for each table in the DWH.
4. Source and Destination Setup: Within each Data Flow Task, we selected OLE DB Source and Destination components. We ensured that the source data was extracted via SQL commands from the original dataset and that the destination correctly referred to the corresponding empty columns in the DWH.
   
## 2.7 Advanced Analytics and Visualization
Leveraged multiple analysis and visualization tools to extract and present meaningful business insights. The tools used in this process include:
1. SSAS
2. SSRS
3. Power BI
4. Tableau
5. Excel


