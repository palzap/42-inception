#!/bin/bash

# Start mariadb service
service mariadb start

# Open mariadb as root and start an heredoc to introduce configuration instructions
mariadb -v -u root << EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO 'root'@'%' IDENTIFIED BY '$DB_PASS_ROOT';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_PASS_ROOT');
EOF

# Allow enough time to finish configuration
sleep 5

# Stop mariadb service
service mariadb stop

# Execute the argument passed "mysqld_safe"
# mysqld_safe stats mariadb in safe mode
exec $@

