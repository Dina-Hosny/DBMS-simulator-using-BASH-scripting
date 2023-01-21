# Delete a row from a table
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
          # Get the unique column of table
          unique_column=$(head -n 1 "$table_path" | awk -F "," '{print $1}')
          echo "List of Rows:"
          awk -F "," '{print NR" - "$0}' "$table_path"
          read -p "Enter the $unique_column of the row to delete: " delete_value
          if ! grep -q "$delete_value" "$table_path"; then
            echo "Error: $unique_column not found"
          else
            sed -i "/^$delete_value/d" "$table_path"
            echo "Row deleted successfully"
	    echo "New Table:"
	    cat "$table_path"
          fi
        fi
      else
        echo "You do not have permission to delete a row in this database."
      fi
    fi
