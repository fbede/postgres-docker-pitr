# Base image with required dependencies
FROM debian:bullseye-slim

# Install necessary packages
RUN apt-get update && apt-get install -y \
    gcc \
    make \
    libc-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    zlib1g-dev \
    postgresql-client \
    curl \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Clone pgBackRest source code
RUN git clone --branch release/2.46 https://github.com/pgbackrest/pgbackrest.git /pgbackrest-src

# Build and install pgBackRest
WORKDIR /pgbackrest-src/src
RUN make \
    && make install \
    && rm -rf /pgbackrest-src

# Add configuration directories
RUN mkdir -p /etc/pgbackrest /var/log/pgbackrest /var/lib/pgbackrest \
    && chmod 750 /etc/pgbackrest /var/log/pgbackrest /var/lib/pgbackrest

# Create an entrypoint script to generate pgbackrest.conf
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Default command
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["pgbackrest"]
