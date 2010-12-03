
##
##   Set class path to execute the java command line tool. Class path includes
##   jar file containing java command line tool and the informix jdbc driver.
##
cp="./UpdateTextColumn1.3.jar:./ifxjdbc.jar"

if [ $# -lt 3 ] ; then

	echo "Shell script updateTextColumn.sh is used to updatet TEXT columns in informix database."
	echo ""
	echo "USAGE: updateTextColumn.sh [connectionString] [INPUT_FILE_NAME] [updateStatement]"
	echo "       where [connectionString] is the database connection string (required) "
	echo "		Ex: informix-sqli://ip:port/database:INFORMIXSERVER=serverName;user=u;password=p"
	echo "             [INPUT_FILE_NAME] is the name of the file which contains data to be updated (required)"
	echo "             [updateStatement] is the SQL update query with the one column update (required)"
	echo "			Ex: update query set content = ? where query_id = 1"
	echo ""
	echo "        (OR)"
	echo "       updateTextColumn.sh [connectionString] -c [commandsListFile] "
	echo "       where [connectionString] is the database connection string (required) "
	echo "		Ex: informix-sqli://ip:port/database:INFORMIXSERVER=serverName;user=u;password=p"
	echo "       where [commandsListFile] is the list of commands. (required)"
	echo "		Ex:contentFile1.txt|update query set content = ? where query_id = 1"
	echo "		   contentFile2.txt|update query set content = ? where query_id = 2"

	exit 0

fi

if [ $2 == "-c" ] ; then
	
	if [ -f "$3" ];  then
		echo "Input file containing command list: " $1
		java -classpath "$cp" com.topcoder.tools.UpdateTextColumn "F" "$1" "$3"
	else
		echo "Command list input file does not exist" $1

		echo ""
		echo "Shell script updateTextColumn.sh is used to updatet TEXT columns in informix database."		
		echo ""
		echo "USAGE: updateTextColumn.sh [connectionString] [INPUT_FILE_NAME] [updateStatement]"
		echo "       where [connectionString] is the database connection string (required) "
		echo "		Ex: informix-sqli://ip:port/database:INFORMIXSERVER=serverName;user=u;password=p"
		echo "             [INPUT_FILE_NAME] is the name of the file which contains data to be updated"
		echo "             [updateStatement] is the SQL update query with the one column update"
		echo "			Ex: update query set content = ? where query_id = 1"
		echo ""
		echo "        (OR)"
		echo "       updateTextColumn.sh [connectionString] -c [commandsListFile] "
		echo "       where [connectionString] is the database connection string (required) "
		echo "		Ex: informix-sqli://ip:port/database:INFORMIXSERVER=serverName;user=u;password=p"
		echo "       where [commandsListFile] is the list of commands. (required)"
		echo "		Ex:contentFile1.txt|update query set content = ? where query_id = 1"
		echo "		   contentFile2.txt|update query set content = ? where query_id = 2"

		exit 0

	fi	
else 
	if [ -f "$2" ];  then
		echo "Input file containing text to be updated: " $2
		java -classpath "$cp" com.topcoder.tools.UpdateTextColumn "I" "$1" "$2" "$3"
	else
		echo "Input file containing text to be update does not exist" $1

		echo ""
		echo "Shell script updateTextColumn.sh is used to updatet TEXT columns in informix database."
		echo ""
		echo "USAGE: updateTextColumn.sh [connectionString] [INPUT_FILE_NAME] [updateStatement]"
		echo "       where [connectionString] is the database connection string (required) "
		echo "		Ex: informix-sqli://ip:port/database:INFORMIXSERVER=serverName;user=u;password=p"
		echo "             [INPUT_FILE_NAME] is the name of the file which contains data to be updated"
		echo "             [updateStatement] is the SQL update query with the one column update"
		echo "			Ex: update query set content = ? where query_id = 1"
		echo ""
		echo "        (OR)"
		echo "       updateTextColumn.sh [connectionString] -c [commandsListFile] "
		echo "       where [connectionString] is the database connection string (required) "
		echo "		Ex: informix-sqli://ip:port/database:INFORMIXSERVER=serverName;user=u;password=p"
		echo "       where [commandsListFile] is the list of commands. (required)"
		echo "		Ex:contentFile1.txt|update query set content = ? where query_id = 1"
		echo "		   contentFile2.txt|update query set content = ? where query_id = 2"


		exit 0

	fi	
fi


echo "End of execution"
exit 0
