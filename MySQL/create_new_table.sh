# Check if the current user is "oracle" or an admin user
    if [ "$USER" == "oracle" ] || grep -q "$USER" ./DB_admins.db; then

	echo "List of databases:"
    ls ./DataBases
    read -p "Select a database: " db_name
    db_path="./DataBases/$db_name"
    if [ ! -d "$db_path" ]; then
      echo "Database does not exist."
    else
      owner=$(cat "$db_path/owner.txt")
      if [ "$owner" = "$USER" ]; then
        read -p "Enter a table name: " table_name
        table_path="$db_path/$table_name.table"
        if [ -f "$table_path" ]; then
          echo "Table already exists."
        else
          read -p "Enter the number of columns: " num_columns
          columns=""
          for ((i=1;i<=num_columns;i++)); do
            read -p "Enter column $i name: " column_name
            columns="$columns$column_name,"
          done
          columns=${columns%,}
          echo "$columns" > "$table_path"
          echo "Table created successfully."
        fi
      else
        echo "You do not have permission to create a table in this database."
      fi
    fi
else
      echo "Error: only oracle and admin can run this script."
    fi
