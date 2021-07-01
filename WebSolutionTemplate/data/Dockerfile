FROM mroyon/mssqlbaseblackportal

# Create a config directory
RUN mkdir -p /usr/config
WORKDIR /usr/config
USER root
# Bundle config source
COPY data/. /usr/config

# Grant permissions for to our scripts to be executable
RUN chmod +x /usr/config/entrypoint.sh
RUN chmod +x /usr/config/configure-db.sh
RUN chmod +x /usr/config/scriptversion.txt
RUN chmod +x /usr/config/setup.sql
RUN chmod +x /usr/config/setup2.sql

ENTRYPOINT ["./entrypoint.sh"]

# Tail the setup logs to trap the process
CMD ["tail -f /dev/null"]

HEALTHCHECK --interval=15s CMD /opt/mssql-tools/bin/sqlcmd -U sa -P $SA_PASSWORD -Q "select 1" && grep -q "MSSQL CONFIG COMPLETE" ./config.log
