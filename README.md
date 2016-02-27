# exercise_1
Readme
MIDS 2016 Spring - W205
Exercise 1

hospitals.csv

1. All files listed below should be in '/data/hospital/' with ownership given to user 'w205'
Files to be copied to /data/hospital/
Hospital General Information.csv
Measure Dates.csv
Readmissions and Deaths - Hospital.csv
Timely and Effective Care - Hospital.csv
hvbp_hcahps_05_28_2015.csv

2. Create renamed files as suggested in Exercise 01 Manual.
touch /data/hospital/hospitals.csv
touch /data/hospital/effective_care.csv
touch /data/hospital/readmissions.csv
touch /data/hospital/Measures.csv
touch /data/hospital/surveys_responses.csv

3. Rename original files to shortened files and remove headers (the "\ " is a space in the file name)

tail -n +2 /data/hospital/Hospital\ General\ Information.csv > /data/hospital/hospitals.csv
tail -n +2 /data/hospital/Timely\ and\ Effective\ Care\ -\ Hospital.csv > effective_care.csv
tail -n +2 /data/hospital/Readmissions\ and\ Deaths\ -\ Hospital.csv > /data/hospital/readmissions.csv
tail -n +2 /data/hospital/Measure\ Dates.csv > /data/hospital/Measures.csv
tail -n +2 /data/hospital/hvbp_hcahps_05_28_2015.csv > /data/hospital/surveys_responses.csv

4. Verify that the header line has been removed by using wc -l <file> command

wc -l Hospital\ General\ Information.csv
wc -l hospitals.csv

wc -l Timely\ and\ Effective\ Care\ -\ Hospital.csv
wc -l effective_care.csv


wc -l Readmissions\ and\ Deaths\ -\ Hospital.csv
wc -l readmissions.csv

wc -l Measure\ Dates.csv
wc -l Measures.csv

wc -l hvbp_hcahps_05_28_2015.csv
wc -l surveys_responses.csv


5. Create folders in HDFS for the renamed files
hdfs dfs -mkdir /user/w205/hospital_compare
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/Measures
hdfs dfs -mkdir /user/w205/hospital_compare/surveys_responses

6. Check to see that the folders were created

hdfs dfs -ls /user/w205/hospital_compare/hospitals

7. Load the data files into HDFS under "/user/w205/hospital_compare"

hdfs dfs -put /data/hospital/hospitals.csv /user/w205/hospital_compare/hospitals
hdfs dfs -put /data/hospital/effective_care.csv /user/w205/hospital_compare/effective_care
hdfs dfs -put /data/hospital/readmissions.csv /user/w205/hospital_compare/readmissions
hdfs dfs -put /data/hospital/Measures.csv /user/w205/hospital_compare/Measures
hdfs dfs -put /data/hospital/surveys_responses.csv /user/w205/hospital_compare/surveys_responses

