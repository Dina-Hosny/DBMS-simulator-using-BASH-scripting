 # Check if the current user is "oracle" or an admin user
    if [ "$USER" == "oracle" ] || grep -q "$USER" ./DB_admins.db; then
      # Delete an existing Database
      echo "List of databases:"
      ls ./DataBases
      read -p "Enter a database name to delete: " delete_db
      db_path="./DataBases/$delete_db"
    if [ ! -d "$db_path" ]; then
      echo "Database does not exist."
    else
      owner=$(cat "$db_path/owner.txt")
      if [ "$owner" = "$USER" ]; then
        rm -rf "$db_path"
        echo "Database deleted successfully."
      else
        echo "You do not have permission to delete this database."
      fi
    fi
    else 
      echo "Error: only oracle and admin users can try to delete an existing DB."
    fi
