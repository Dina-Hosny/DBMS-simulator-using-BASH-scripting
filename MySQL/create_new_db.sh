# Check if the current user is in DB_admins.db
    if grep -q "$USER" ./DB_admins.db; then
      # Read the database name
      read -p "Enter the name of the new database: " db_name

      # Create the new database directory
      mkdir -p ./DataBases/"$db_name"

      # Create the owner.txt file
      echo "$USER" > ./DataBases/"$db_name"/owner.txt
    else
      echo "Error: only users in DB_admins.db can create a new database."
    fi
