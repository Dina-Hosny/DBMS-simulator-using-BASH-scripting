# DBMS-simulator-using-BASH-scripting

The project’s purpose is to build a Database Management System with its tasks using Bash Scripting.

## Project Discription:

The Project will be under Directory Called ```MySQL```
There will be a main script called ```MySQL/main.sh```

A bash project that simulate the MySQL database and do the following:
When A user run it the screen will be cleared and ask for the below entry and need to be selected by it’s number Each one will run a specific script.
- Create Database user.
- Delete Database User.
- Create new Database.
- Delete an existing Database.
- Create A new Table inside Database
- Insert A New Row in a Table
- Select Data from Table

## Project Steps:

### 1) Create Database user
- By default, will be a system user called “oracle”
- If the user that run the script is “oracle” or an admin user then he can do the following:
  - Will Ask you for a new admin user.
  - If this user already exists MSG will appear that tells the user is already exist.
  - If not, the entered user will be in a file called ```DB_admins.db```.
  - DB_admins.db will have a list of admin users, including oracle and other created users.
  
### 2) Delete Database User
- Only users in DB_admins.db can run this script.
- The Script will show you the list of users in ```DB_admins.db```.
- If one is selected then it will be deleted from ```DB_admins.db```.

### 3) Create new Database
- Only users in ```DB_admins.db``` can run this script.
- The script will ask you for database name.
- Then A Directory is created with the entered DB name under the Following Path: ```MySQL/DataBases/YOUR_NEW_DB```.
- A file will be in this path called ```owner.txt``` will have the user name for the user that create this database.
- The final output for this script is a directory with DataBase Name.
```bash
  MySQL/DataBases/EmplyeeDB
```

### 4) Delete an existing Database
- Only users in ```DB_admins.db``` can run this script.
- The script will show all available created Databases inside ```MySQL/DataBases```
- If the Database owner is the same with the user that run this script, then Database directory and it’s content be deleted.
```bash
  if EmplyeeDB is selected directory and it’s content be deleted.
```

### 5) Create A new Table inside Database
- Only users in ```DB_admins.db``` can run this script.
- The script will show all available created Databases inside ```MySQL/DataBases```.
- If the Database owner is the same with the user that run this script, then will ask you for Table Name, Number of columns need to be created.
- If Table Name not already exist inside this Database then will ask you to enter the Column Names according to the entered number of columns.
- The final output for this script must create a file named with the entered Table Name.
```bash
  MySQL/DataBases/EmplyeeDB/employee.table:
#cat employee.table
emp_id,emp_name,job_name,manager_id,hire_date
```
- Each Column name is separated by comma.

