DROP TABLE surveyT;

CREATE TABLE IF NOT EXISTS surveyT
AS SELECT provId, base
FROM survey;