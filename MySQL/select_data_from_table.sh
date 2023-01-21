# Select Data from Table
    echo "List of databases:"
    ls ./DataBases
    read -p "Select a database: " db_name
    db_path="./DataBases/$db_name"
    if [ ! -d "$db_path" ]; then
      echo "Database does not exist."
    else
      echo "List of tables:"
      ls "$db_path" | grep ".table"
      read -p "Select a table: " table_name
            table_path="$db_path/$table_name"
      if [ ! -f "$table_path" ]; then
        echo "Table does not exist."
      else
        echo "1) Show Table Content"
        echo "2) Search in Table"
        read -p "Enter your choice: " select_choice
        case $select_choice in
          1)
            # Show Table Content
            cat "$table_path"
            ;;
          2)
            # Search in Table
            read -p "Enter search string: " search_string
            grep -i "$search_string" "$table_path"
            ;;
          *)
            echo "Invalid choice."
            ;;
        esac
	fi
      fi
