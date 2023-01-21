# Check if the current user is in DB_admins.db
    if grep -q "$USER" ./DB_admins.db; then
      # Display the list of users in DB_admins.db
      echo "Select a user to delete:"
      cat ./DB_admins.db

      # Read the user to delete
      read -p "Enter the name of the user to delete: " user_to_delete

      # Check if the user to delete is "oracle"
      if [ "$user_to_delete" == "oracle" ]; then
        echo "Error: oracle cannot be deleted."
      else
        # Delete the user from DB_admins.db using sed
        sed -i "/$user_to_delete/d" ./DB_admins.db
      fi
    else
      echo "Error: only users in DB_admins.db can delete a database user."
    fi
