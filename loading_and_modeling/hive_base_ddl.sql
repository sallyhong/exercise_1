DROP TABLE general;

CREATE EXTERNAL TABLE IF NOT EXISTS general
(provId string, 
hospName string,
address string,
city string,
state string,
zip string,
county string,
phone string,
hospType string,
hospOwner string,
emergency string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE 
LOCATION '/user/w205/hospital_compare/hospitals';

DROP TABLE timeleyEffective;

CREATE EXTERNAL TABLE IF NOT EXISTS timelyEffective
(provId string, 
hospName string,
address string,
city string,
state string,
zip string,
county string,
phone string,
condition string,
measId string,
measName string,
score int, 
sample int,
fn string,
startDate string,
endDate string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE 
LOCATION '/user/w205/hospital_compare/effective_care';

DROP TABLE readmissionsDeaths;

CREATE EXTERNAL TABLE IF NOT EXISTS readmissionsDeaths
(provId string, 
hospName string,
address string,
city string,
state string,
zip string,
country string,
phone string,
measName string,
measId string,
national string,
denom int,
score int, 
low int,
high int,
fn string,
startDate string,
endDate string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE 
LOCATION '/user/w205/hospital_compare/readmissions';

DROP TABLE measureDates;

CREATE EXTERNAL TABLE IF NOT EXISTS measureDates
(measName string,
measId string,
measStartQ string,
startDate string,
measEndQ string,
endDate string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE 
LOCATION '/user/w205/hospital_compare/Measures';

DROP TABLE survey;

CREATE EXTERNAL TABLE IF NOT EXISTS survey
(provId string, 
hospName string,
address string,
city string,
state string,
zip string,
county string,
nurseAP string,
nurseIP string,
nurseDS string,
doctorAP string,
doctorIP string,
doctorDS string,
staffAP string,
staffIP string,
staffDS string,
painAP string,
painIP string,
painDS string,
medAP string,
medIP string,
medDS string,
cleanAP string,
cleanIP string,
cleanDS string,
dischargeAP string,
dischargeIP string,
dischargeDS string,
overallAP string,
overallIP string,
overallDS string,
base int,
consistency int
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE 
LOCATION '/user/w205/hospital_compare/surveys_responses';