/* -------------
we use if exists it checks the dataware house is already created or not. It already
created then its recreated.
Also we have created the three schemas:
Bronze, silver, Gold.

-------------------------------------

Warning:
Running the database if already exists.
All Data in the database will be delete completely. caution.
So please before running the scripts and ensures have the proper backups before 
running the scripts.
*/
use master;
-- This script is for  drop or recreate the databases
IF EXISTS(select 1 from sys.databases where name = 'DatwareHouse' )
BEGIN
    alter database datawareHouse Set single_User with ROLLBACK IMMEDIATE;
    drop database DatawareHouse;
END;
GO

create database DatawareHouse;
Use DatawareHouse;
Create Schema bronze;
Go -- Seprate batches when working with multiple Sql statements.
Create schema silver;
GO
Create Schema Gold;
GO

