
-- Create the DIM_DATE table
CREATE TABLE DimDate (
    Date DATETIME PRIMARY KEY,
    Day INT,
    Month INT,
    MonthName VARCHAR(10),
    Year INT
)


CREATE TABLE DimCustomer (
  customer_id INT NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(50) DEFAULT NULL,
  active CHAR(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY  (customer_id),
  address VARCHAR(50) NOT NULL,
  district VARCHAR(20) NOT NULL,
  city VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL,
)


CREATE TABLE DimStaff (
  staff_id TINYINT NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(50) DEFAULT NULL,
  active BIT NOT NULL DEFAULT 1,
  PRIMARY KEY  (staff_id),
  address VARCHAR(50) NOT NULL,
  district VARCHAR(20) NOT NULL,
  city VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL,
)


CREATE TABLE DimStore (
  store_id INT NOT NULL,
  PRIMARY KEY  (store_id),
  address VARCHAR(50) NOT NULL,
  district VARCHAR(20) NOT NULL,
  city VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL,
)


CREATE TABLE DimFilm (
  film_id int NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT DEFAULT NULL,
  release_year VARCHAR(4) NULL,
  length SMALLINT DEFAULT NULL,
  replacement_cost DECIMAL(5,2) NOT NULL DEFAULT 19.99,
  rental_rate DECIMAL(4,2) NOT NULL DEFAULT 4.99,
  rental_duration TINYINT NOT NULL DEFAULT 3,
  rating VARCHAR(10) DEFAULT 'G',
  special_features VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY  (film_id),
  category VARCHAR(25) NOT NULL,
  language CHAR(20) NOT NULL,
)

CREATE TABLE FilmActor (
  film_id int NOT NULL,
  actor_id int NOT NULL,
  first_name VARCHAR(45),
  last_name VARCHAR(45),
  CONSTRAINT fk_actor FOREIGN KEY (film_id) REFERENCES DimFilm (film_id),
  CONSTRAINT pk_film_actor PRIMARY KEY (film_id, actor_id)
)

CREATE TABLE FactRental (
  rental_id INT NOT NULL,
  rental_date DATETIME NOT NULL,
  return_date DATETIME DEFAULT NULL,
  payment_date DATETIME NOT NULL,
  customer_id INT  NOT NULL,
  staff_id TINYINT NOT NULL,
  inventory_id INT  NOT NULL,
  film_id int NOT NULL,
  store_id INT NOT NULL,
  amount DECIMAL(5,2) NOT NULL,
  CONSTRAINT fk_rental_staff FOREIGN KEY (staff_id) REFERENCES DimStaff (staff_id) ,
  CONSTRAINT fk_rental_customer FOREIGN KEY (customer_id) REFERENCES DimCustomer (customer_id),
  CONSTRAINT fk_rental_store FOREIGN KEY (store_id) REFERENCES DimStore (store_id),
  CONSTRAINT fk_rental_film FOREIGN KEY (film_id) REFERENCES DimFilm (film_id),
  CONSTRAINT fk_rental_date FOREIGN KEY (rental_date) REFERENCES DimDate (date),
  CONSTRAINT fk_payment_date FOREIGN KEY (payment_date) REFERENCES DimDate (date),
  CONSTRAINT fk_return_date FOREIGN KEY (return_date) REFERENCES DimDate (date)
  )

 
;WITH DateCTE AS (
    SELECT CAST('2005-01-01' AS DATE) AS DateValue
    UNION ALL
    SELECT DATEADD(DAY, 1, DateValue)
    FROM DateCTE
    WHERE DateValue <= '2005-12-31'
)
INSERT INTO DimDate (Date, Day, Month, MonthName, Year)
SELECT 
    DateValue,
    DAY(DateValue) AS Day,
    MONTH(DateValue) AS Month,
    DATENAME(MONTH, DateValue) AS MonthName,
    YEAR(DateValue) AS Year
FROM DateCTE
OPTION (MAXRECURSION 366);
SELECT * FROM DimDate WHERE Year = 2005 ORDER BY Date;

