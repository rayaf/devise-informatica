#!/bin/sh

# Wait until the SQLite database is ready

# Function to check if SQLite database has already been created
check_database_exists() {
  if [ -f /var/www/db/development.sqlite3 ] && [ -f /var/www/db/test.sqlite3 ]; then
    return 0
  fi
  return 1
}

if check_database_exists; then
  echo "Database already exists"
else
  echo "Database not found. Running rails db:setup..."
  bundle exec rails db:setup
fi


# Iniciar a aplicação Rails
exec "$@"