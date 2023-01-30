FROM postgres:14-alpine as dumper

COPY db_localhost_dump.sql /docker-entrypoint-initdb.d/

RUN ["sed", "-i", "s/exec \"$@\"/echo \"skipping...\"/", "/usr/local/bin/docker-entrypoint.sh"]

ENV POSTGRES_USER=test_user
ENV POSTGRES_PASSWORD=test_password
ENV PGDATA=/data

RUN ["/usr/local/bin/docker-entrypoint.sh", "postgres"]

# final build stage
FROM postgres:14-alpine

EXPOSE 5432
COPY --from=dumper /data $PGDATA