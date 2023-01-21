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
        echo "List of tables:"
        ls "$db_path" | grep ".table"
        read -p "Select a table: " table_name
        table_path="$db_path/$table_name"
        if [ ! -f "$table_path" ]; then
          echo "Table does not exist."
        else
          columns=$(head -n 1 "$table_path")
          unique_column=$(echo $columns | awk -F "," '{print $1}')
          read -p "Enter data for columns ($columns): " data
          data_array=($data)
          unique_data=${data_array[0]}
          if grep -q "$unique_data" "$table_path"; then
            echo "Error: $unique_column must be unique."
          else
            echo "$data" >> "$table_path"
            echo "Data inserted successfully."
          fi
        fi
      else
        echo "You do not have permission to insert data in this database."
      fi
    fi

else
      echo "Error: only oracle and admin users can run this script."
    fi
