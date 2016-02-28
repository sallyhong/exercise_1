DROP TABLE measureDatesT;

CREATE TABLE IF NOT EXISTS measureDatesT
AS SELECT measName, measId
FROM measureDates;