FROM alpine:latest

# Install required tools
RUN apk add --no-cache bash curl

# Copy backup script and make it executable
COPY backup.sh /pgbackrest/backup.sh
RUN chmod +x /pgbackrest/backup.sh

# Set up cron job for backups
RUN echo "0 2 * * * /pgbackrest/backup.sh >> /pgbackrest/backup.log 2>&1" > /etc/crontabs/root

# Start cron service
CMD ["crond", "-f"]
