#Script file to rename and load to HDFS

clear
echo "Starting Batch Process - Renaming and Loading to HDFS"
#Create renamed files as suggested in Exercise 01 Manual.

echo "Creating renamed Files"
touch /data/hospital/hospitals.csv
touch /data/hospital/effective_care.csv
touch /data/hospital/readmissions.csv
touch /data/hospital/Measures.csv
touch /data/hospital/surveys_responses.csv

#Rename original files to shortened files and remove headers (the "\ " is a space in the file name)

echo "Removing headers and copying data to renamed files"
tail -n +2 /data/hospital/Hospital\ General\ Information.csv > /data/hospital/hospitals.csv
tail -n +2 /data/hospital/Timely\ and\ Effective\ Care\ -\ Hospital.csv > effective_care.csv
tail -n +2 /data/hospital/Readmissions\ and\ Deaths\ -\ Hospital.csv > /data/hospital/readmissions.csv
tail -n +2 /data/hospital/Measure\ Dates.csv > /data/hospital/Measures.csv
tail -n +2 /data/hospital/hvbp_hcahps_05_28_2015.csv > /data/hospital/surveys_responses.csv

#Create folders in HDFS for the renamed files

echo "Creating individual folders per file in HDFS under /user/w205/hospital_compare/"
hdfs dfs -mkdir /user/w205/hospital_compare
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/Measures
hdfs dfs -mkdir /user/w205/hospital_compare/surveys_responses

#Load the data files into HDFS under "/user/w205/hospital_compare"

echo "Loading data files into HDFS under /user/w205/hospital_compare"
hdfs dfs -put /data/hospital/hospitals.csv /user/w205/hospital_compare/hospitals
hdfs dfs -put /data/hospital/effective_care.csv /user/w205/hospital_compare/effective_care
hdfs dfs -put /data/hospital/readmissions.csv /user/w205/hospital_compare/readmissions
hdfs dfs -put /data/hospital/Measures.csv /user/w205/hospital_compare/Measures
hdfs dfs -put /data/hospital/surveys_responses.csv /user/w205/hospital_compare/surveys_responses

echo "Batch Process Complete"