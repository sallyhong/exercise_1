DROP TABLE timelyEffectiveT;

CREATE TABLE IF NOT EXISTS timelyEffectiveT
AS SELECT provId, measId, score
FROM timelyEffective;