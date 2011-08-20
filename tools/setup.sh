##############################################
#
# This script downloads scripts from svn, 
# then executes these scripts to create 
# databases and load data
#
##############################################
CP=../../../scripts/tools/UpdateTextColumn/UpdateTextColumn1.3.jar:../../../scripts/tools/UpdateTextColumn/ifxjdbc.jar
CL=com.topcoder.tools.UpdateTextColumn
CONN1=jdbc:informix-sqli://env.topcoder.com:2021/
CONN2=:informixserver=informixoltp_tcp;user=coder;password=c0d3r4T

cd

### down size
echo "-->> downsizing..."
rm -rf ./downsized_scripts
mkdir -p downsized_scripts/common_oltp
./scripts/tools/DownsizeDDL/downsizeDDL.sh scripts/common_oltp/01_common_oltp_main_schema.sql
mkdir -p downsized_scripts/time_oltp
./scripts/tools/DownsizeDDL/downsizeDDL.sh scripts/time_oltp/01_time_oltp_main_schema.sql
mkdir -p downsized_scripts/informixoltp
./scripts/tools/DownsizeDDL/downsizeDDL.sh scripts/informixoltp/01_informixoltp_main_schema.sql
mkdir -p downsized_scripts/tcs_catalog
./scripts/tools/DownsizeDDL/downsizeDDL.sh scripts/tcs_catalog/01_tcs_catalog_main_schema.sql
mkdir -p downsized_scripts/common_dw
./scripts/tools/DownsizeDDL/downsizeDDL.sh scripts/common_dw/01_common_dw_main_schema.sql
mkdir -p downsized_scripts/topcoder_dw
./scripts/tools/DownsizeDDL/downsizeDDL.sh scripts/topcoder_dw/01_topcoder_dw_main_schema.sql
mkdir -p downsized_scripts/tcs_dw
./scripts/tools/DownsizeDDL/downsizeDDL.sh scripts/tcs_dw/01_tcs_dw_main_schema.sql
mkdir -p downsized_scripts/studio_oltp
./scripts/tools/DownsizeDDL/downsizeDDL.sh scripts/studio_oltp/01_studio_oltp_main_schema.sql
mkdir -p downsized_scripts/corporate_oltp
./scripts/tools/DownsizeDDL/downsizeDDL.sh scripts/corporate_oltp/01_corporate_oltp_main_schema.sql
mkdir -p downsized_scripts/jive
./scripts/tools/DownsizeDDL/downsizeDDL.sh scripts/jive/01_jive_main_schema.sql
mkdir -p downsized_scripts/studio_jive
./scripts/tools/DownsizeDDL/downsizeDDL.sh scripts/studio_jive/01_studio_jive_main_schema.sql


### drop databases
echo "-->> dropping database..."
dbaccess - - < scripts/tools/dropDatabase.sql > drop.log 2>&1

### create common_oltp
echo "-->> creating common oltp..."
dbaccess - - < downsized_scripts/common_oltp/01_common_oltp_main_schema.sql > common_oltp.log 2>&1
dbaccess - - < scripts/common_oltp/02_common_oltp_data_setup.sql >> common_oltp.log 2>&1
dbaccess - - < scripts/common_oltp/03_common_oltp_constraints_and_indexes.sql >> common_oltp.log 2>&1
dbaccess - - < scripts/common_oltp/04_common_oltp_synonyms_procedures_and_triggers.sql >> common_oltp.log 2>&1
dbaccess - - < scripts/common_oltp/05_common_oltp_test_data.sql >> common_oltp.log 2>&1

echo "-->> creating time oltp..."
dbaccess - - < downsized_scripts/time_oltp/01_time_oltp_main_schema.sql > time_oltp.log 2>&1
dbaccess - - < scripts/time_oltp/02_time_oltp_data_setup.sql >> time_oltp.log 2>&1
dbaccess - - < scripts/time_oltp/03_time_oltp_constraints_and_indexes.sql >> time_oltp.log 2>&1
dbaccess - - < scripts/time_oltp/04_time_oltp_synonyms_procedures_and_triggers.sql >> time_oltp.log 2>&1
dbaccess - - < scripts/time_oltp/05_time_oltp_test_data.sql >> time_oltp.log 2>&1

echo "-->> creating corporate oltp..."
dbaccess - - < downsized_scripts/corporate_oltp/01_corporate_oltp_main_schema.sql > corporate_oltp.log 2>&1
dbaccess - - < scripts/corporate_oltp/02_corporate_oltp_data_setup.sql >> corporate_oltp.log 2>&1
dbaccess - - < scripts/corporate_oltp/03_corporate_oltp_constraints_and_indexes.sql >> corporate_oltp.log 2>&1
dbaccess - - < scripts/corporate_oltp/04_corporate_oltp_synonyms_procedures_and_triggers.sql >> corporate_oltp.log 2>&1

echo "-->> creating informixoltp..."
dbaccess - - < downsized_scripts/informixoltp/01_informixoltp_main_schema.sql > informixoltp.log 2>&1
dbaccess - - < scripts/informixoltp/02_informixoltp_data_setup.sql >> informixoltp.log 2>&1
cd scripts/informixoltp/query_tool
java -classpath "$CP" "$CL" "F" "$CONN1""informixoltp""$CONN2" queries.txt 
cd ../../..
dbaccess - - < scripts/informixoltp/03_informixoltp_constraints_and_indexes.sql >> informixoltp.log 2>&1
dbaccess - - < scripts/informixoltp/04_informixoltp_synonyms_procedures_and_triggers.sql >> informixoltp.log 2>&1
dbaccess - - < scripts/informixoltp/05_informixoltp_test_data.sql >> informixoltp.log 2>&1

echo "-->> creating jive..."
dbaccess - - < downsized_scripts/jive/01_jive_main_schema.sql > jive.log 2>&1
dbaccess - - < scripts/jive/02_jive_data_setup.sql >> jive.log 2>&1
dbaccess - - < scripts/jive/03_jive_constraints_and_indexes.sql >> jive.log 2>&1
dbaccess - - < scripts/jive/04_jive_synonyms_procedures_and_triggers.sql >> jive.log 2>&1
dbaccess - - < scripts/jive/05_jive_test_data.sql >> jive.log 2>&1

echo "-->> creating tcs catalog..."
dbaccess - - < downsized_scripts/tcs_catalog/01_tcs_catalog_main_schema.sql > tcs_catalog.log 2>&1
dbaccess - - < scripts/tcs_catalog/02_tcs_catalog_data_setup.sql >> tcs_catalog.log 2>&1
cd scripts/tcs_catalog/query_tool
java -classpath "$CP" "$CL" "F" "$CONN1""tcs_catalog""$CONN2" queries.txt 
cd ../../..
dbaccess - - < scripts/tcs_catalog/03_tcs_catalog_constraints_and_indexes.sql >> tcs_catalog.log 2>&1
dbaccess - - < scripts/tcs_catalog/04_tcs_catalog_synonyms_procedures_and_triggers.sql >> tcs_catalog.log 2>&1 
dbaccess - - < scripts/tcs_catalog/05_tcs_catalog_test_data.sql >> tcs_catalog.log 2>&1 

echo "-->> creating studio oltp..."
dbaccess - - < downsized_scripts/studio_oltp/01_studio_oltp_main_schema.sql > studio_oltp.log 2>&1
dbaccess - - < scripts/studio_oltp/02_studio_oltp_data_setup.sql >> studio_oltp.log 2>&1
cd scripts/studio_oltp/query_tool
java -classpath "$CP" "$CL" "F" "$CONN1""studio_oltp""$CONN2" queries.txt 
cd ../../..
dbaccess - - < scripts/studio_oltp/03_studio_oltp_constraints_and_indexes.sql >> studio_oltp.log 2>&1
dbaccess - - < scripts/studio_oltp/04_studio_oltp_synonyms_procedures_and_triggers.sql >> studio_oltp.log 2>&1 
dbaccess - - < scripts/studio_oltp/05_studio_oltp_test_data.sql >> studio_oltp.log 2>&1 

echo "-->> creating common dw..."
dbaccess - - < downsized_scripts/common_dw/01_common_dw_main_schema.sql > common_dw.log 2>&1
dbaccess - - < scripts/common_dw/02_common_dw_data_setup.sql >> common_dw.log 2>&1

echo "-->> creating topcoder dw..."
dbaccess - - < downsized_scripts/topcoder_dw/01_topcoder_dw_main_schema.sql > topcoder_dw.log 2>&1
dbaccess - - < scripts/topcoder_dw/02_topcoder_dw_data_setup.sql >> topcoder_dw.log 2>&1
cd scripts/topcoder_dw/query_tool
java -classpath "$CP" "$CL" "F" "$CONN1""topcoder_dw""$CONN2" queries.txt
cd ../../..
dbaccess - - < scripts/topcoder_dw/03_topcoder_dw_constraints_and_indexes.sql >> topcoder_dw.log 2>&1
dbaccess - - < scripts/topcoder_dw/04_topcoder_dw_synonyms_procedures_and_triggers.sql >>topcoder_dw.log 2>&1

echo "-->> creating tcs dw..."
dbaccess - - < downsized_scripts/tcs_dw/01_tcs_dw_main_schema.sql > tcs_dw.log 2>&1
dbaccess - - < scripts/tcs_dw/02_tcs_dw_data_setup.sql >> tcs_dw.log 2>&1
cd scripts/tcs_dw/query_tool
java -classpath "$CP" "$CL" "F" "$CONN1""tcs_dw""$CONN2" queries.txt
cd ../../..
dbaccess - - < scripts/tcs_dw/03_tcs_dw_constraints_and_indexes.sql >> tcs_dw.log 2>&1
dbaccess - - < scripts/tcs_dw/04_tcs_dw_synonyms_procedures_and_triggers.sql >> tcs_dw.log 2>&1
dbaccess - - < scripts/tcs_dw/05_tcs_dw_test_data.sql >> tcs_dw.log 2>&1

echo "-->> creating studio jive ..."
dbaccess - - < downsized_scripts/studio_jive/01_studio_jive_main_schema.sql > studio_jive.log 2>&1

echo "-->> FINISHED"
