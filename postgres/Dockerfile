FROM postgres:17

# Copy custom PostgreSQL configuration
COPY postgresql.conf /etc/postgresql/postgresql.conf

# Set PostgreSQL config directory and permissions
RUN mkdir -p /var/lib/postgresql/data \
    && chmod 700 /etc/postgresql/postgresql.conf

# Start PostgreSQL with custom configuration
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]
