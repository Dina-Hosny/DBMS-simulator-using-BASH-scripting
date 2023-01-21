# Display menu options
echo "Please select an option by entering its corresponding number:"
echo "1) Create Database user"
echo "2) Delete Database User"
echo "3) Create new Database"
echo "4) Delete an existing Database"
echo "5) Create A new Table inside Database"
echo "6) Insert A New Row in a Table"
echo "7) Select Data from Table"
echo "8) Delete Row from Table"

# Read user input
read -p "Enter your selection: " selection

case $selection in
  # Create Database user
  1) ./create_db_user.sh ;; 
  # Delete Database User
  2) ./delete_db_user.sh ;;
  # Create new Database
  3) ./create_new_db.sh ;;
  # Delete an existing Database
  4) ./delete_exist_db.sh ;;
  # Create A new Table inside Database
  5) ./create_new_table.sh ;;
  # Insert A New Row in a Table
  6) ./insert_new_row.sh ;;
  # Select Data from Table
  7) ./select_data_from_table.sh ;;
  # Delete Row from Table
  8) ./delete_row_from_table.sh ;;
  # Other
  *) echo "Not Correct Option"
esac
