# Get the latest ccc alpine image. Started getting latest when version 1.0.6 was build.
FROM registry.ccctechcenter.org:5000/ccctechcenter/alpine-nginx-phpfpm-pgsql:1.0.6

MAINTAINER Emmett Culley <eculley@ccctechcenter.org>

RUN mkdir -p /var/www
VOLUME ["/var/www"]
WORKDIR /var/www

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/hello-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/hello-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log
