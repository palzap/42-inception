# Penultimate stable version of Debian
FROM debian:bullseye

# Standard port for https
EXPOSE 443

# Install nginx and openssl
RUN	apt update && apt install -y --no-install-recommends --no-install-suggests \
	nginx \
	openssl

# Generates openssl certificates
# openssl req : generates certificate signing request
# -x509 : creates self-signed certificate
# -nodes : key w/ no password
# -days 365 : validity set to 365 days
# -newkey rsa:4096 : generates new 4096-bit RSA key 
# -keyout : output file for private key
# -out : output file for public certificate
# -subj : information on certificate
RUN mkdir -p /etc/nginx/certs/ && \
	openssl req -newkey rsa:4096 -x509 -sha256 -nodes \
    -out /etc/nginx/certs/certificate.crt \
    -keyout /etc/nginx/certs/certificate.key \
    -subj "/C=PY/ST=PT/L=PORTO/O=42/OU=PORTO/CN=pealexan.42.fr"

# Copy nginx configuration file
COPY ./conf/nginx.conf /etc/nginx/

# Change permissions and ownership of the html folder
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Start nginx in the foreground
ENTRYPOINT ["nginx", "-g", "daemon off;"]
