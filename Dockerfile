FROM mcr.microsoft.com/mssql/server:2017-latest

USER root

RUN mkdir /data
RUN mkdir /scripts
WORKDIR /scripts

COPY . /scripts

RUN chmod +x /scripts/import-data.sh

EXPOSE 1433

# Switch back to mssql user and run the entrypoint script
USER mssql
ENTRYPOINT /bin/bash ./entrypoint.sh