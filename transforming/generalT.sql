DROP TABLE generalT;

CREATE TABLE IF NOT EXISTS generalT
AS SELECT provId, hospName, st
FROM general;