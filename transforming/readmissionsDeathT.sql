DROP TABLE readmissionsDeathsT;

CREATE TABLE IF NOT EXISTS readmissionsDeathsT
AS SELECT provId, measId, national
FROM readmissionsDeaths;