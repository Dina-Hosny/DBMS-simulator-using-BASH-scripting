# Check if the current user is "oracle" or an admin user
    if [ "$USER" == "oracle" ] || grep -q "$USER" ./DB_admins.db; then
      # Read the new admin user's name
      read -p "Enter the new admin user's name: " new_admin

      # Check if the new admin user already exists in DB_admins.db
      if grep -q "$new_admin" ./DB_admins.db; then
        echo "Error: user already exists."
      else
        # Add the new admin user to DB_admins.db
        echo "$new_admin" >> ./DB_admins.db
      fi
    else
      echo "Error: only oracle and admin users can create a new database user."
    fi
