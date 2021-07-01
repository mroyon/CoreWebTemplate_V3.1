#!/bin/bash

# wait for MSSQL server to start
export STATUS=1
i=0

while [[ $STATUS -ne 0 ]] && [[ $i -lt 30 ]]; do
	i=$i+1
	/opt/mssql-tools/bin/sqlcmd -t 1 -U sa -P $SA_PASSWORD -Q "select 1" >> /dev/null
	STATUS=$?
done

if [ $STATUS -ne 0 ]; then 
	echo "Error: MSSQL SERVER took more than thirty seconds to start up."
	exit 1
fi

echo "======= MSSQL SERVER STARTED ========" | tee -a ./config.log

FILE="/usr/config/scriptversion.txt"
value=$(</usr/config/scriptversion.txt)

if [[ -f $FILE ]];then
    echo "$FILE exists"
	if [[ "$value" != "$FILE_VERSION" ]]; then
    	# Initialize the application database asynchronously in a background process. This allows a) the SQL Server process to be the main process in the container, which allows graceful shutdown and other goodies, and b) us to only start the SQL Server process once, as opposed to starting, stopping, then starting it again.
		function initialize_app_database2() {
			# Wait a bit for SQL Server to start. SQL Server's process doesn't provide a clever way to check if it's up or not, and it needs to be up before we can import the application database
			sleep 15s
			#run the setup script to create the DB and the schema in the DB      
			/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d master -i setup2.sql
			# Note that the container has been initialized so future starts won't wipe changes to the data
			touch /tmp/app-initialized
		}
		initialize_app_database2 &
	else
    	# Initialize the application database asynchronously in a background process. This allows a) the SQL Server process to be the main process in the container, which allows graceful shutdown and other goodies, and b) us to only start the SQL Server process once, as opposed to starting, stopping, then starting it again.
		function initialize_app_database() {
			# Wait a bit for SQL Server to start. SQL Server's process doesn't provide a clever way to check if it's up or not, and it needs to be up before we can import the application database
			sleep 15s
			#run the setup script to create the DB and the schema in the DB      
			/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d master -i setup.sql
			# Note that the container has been initialized so future starts won't wipe changes to the data
			touch /tmp/app-initialized
		}
		initialize_app_database &
	fi
else
    echo "$FILE doesn't exist"
fi


echo "======= MSSQL CONFIG COMPLETE =======" | tee -a ./config.log
