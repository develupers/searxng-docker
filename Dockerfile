FROM searxng/searxng:latest

# Copy the configuration files
COPY ./searxng /etc/searxng

# Generate random key and replace ultrasecretkey
RUN secret_key=$(openssl rand -hex 32) && \
    sed -i "s|ultrasecretkey|${secret_key}|g" /etc/searxng/settings.yml
