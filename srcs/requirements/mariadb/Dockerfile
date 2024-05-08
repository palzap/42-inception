# Penultimate stable version of Debian
FROM debian:bullseye

# Expose port 3306
EXPOSE 3306

# Install only the needed services to run mariadb
RUN	apt update \
	&& apt install -y --no-install-recommends --no-install-suggests \
	mariadb-server \
	&& rm -rf /var/lib/apt/lists/*

# Copy configuration file
COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# Copy configuration script and assign executable permissions to it
COPY	tools/setup.sh /bin/
RUN	chmod +x /bin/setup.sh

# At runtime execute setup script and run the mysqld_safe command
CMD	["setup.sh", "mysqld_safe"]
