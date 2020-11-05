# sql-challenge
## Autumn Demonet

### ERD Setup
Setting up the ERD required reflecting on which tables could stand alone. I chose to start with the Titles table because it only contains 1 primary key, "title_id", that must already exist to be a foreign key for Employees. Employees came next because the primary key "emp_no" is a foreign key for nearly every other table and must already exist in order to be successfully linked. Following Employees, I set up Departments, which is the only remaining table that does not rely on attributes from other tables to exist. Finally, I created the Salaries, Dept_Emp, and Dept_Manager tables, which all require the foreign key "emp_no" to be created. Dept_Manager was created last because because it consists of only primary keys "emp_no" and "dept_no" which are also foreign keys from the Employees and Departments tables.

### Importing CSVs to SQL
The CSVs also had to be loaded very carefully to Postgres in order to avoid error messages. It took dropping the tables a few times and reloading all of the data before I found the magic sequence. Once the data was loaded, writing the scripts for the required queries was rather straightforward.

### Writing Queries
My biggest hurdle for this homework was figuring out how to only select certain columns across tables in my select statement, but once I had figured out that I could refer directly to them using the "as" shortcut, I was able to move through the queries fairly quickly. My only other issues were correcting small syntax errors such as using "in" instead of "or" and making sure to correctly set up the "group by" for the last name count.