DROP TABLE surveyT;

CREATE TABLE IF NOT EXISTS surveyT
AS SELECT provId, base
FROM survey
where cast(base as float) is not null;