DROP TABLE hospavgscore
;
CREATE TABLE IF NOT EXISTS hospavgscore
AS SELECT generalT.provId as provId, AVG(timelyEffectiveT.score) as avgScore, count(timelyEffectiveT.measId) as cnt
FROM generalT
INNER JOIN timelyEffectiveT
ON generalT.provId = timelyEffectiveT.provId
WHERE NOT (timelyEffectiveT.measId Like 'ED%')
AND NOT (timelyEffectiveT.measId Like 'OP_1%')
And NOT (timelyEffectiveT.measId Like 'OP_20')
And NOT (timelyEffectiveT.measId Like 'OP_21')
And NOT (timelyEffectiveT.measId Like 'OP_22')
And NOT (timelyEffectiveT.measId Like 'OP_23')
And NOT (timelyEffectiveT.measId Like 'OP_3b')
And NOT (timelyEffectiveT.measId Like 'OP_5')
And NOT (timelyEffectiveT.measId Like 'OP_20')
And NOT (timelyEffectiveT.measId Like 'PC_01')
And NOT (timelyEffectiveT.measId Like 'VTE_6')
AND NOT (timelyEffectiveT.score LIKE 'Not Available')
AND timelyEffectiveT.fn LIKE ''
GROUP by generalT.provId
HAVING cnt >= 20 
;

DROP TABLE hosmeascount
;
CREATE TABLE IF NOT EXISTS hosmeascount
AS SELECT generalT.provId as provId, count(timelyEffectiveT.measId) as cnt
FROM generalT
INNER JOIN timelyEffectiveT
ON generalT.provId = timelyEffectiveT.provId
WHERE NOT (timelyEffectiveT.measId Like 'ED%')
AND NOT (timelyEffectiveT.measId Like 'OP_1%')
And NOT (timelyEffectiveT.measId Like 'OP_20')
And NOT (timelyEffectiveT.measId Like 'OP_21')
And NOT (timelyEffectiveT.measId Like 'OP_22')
And NOT (timelyEffectiveT.measId Like 'OP_23')
And NOT (timelyEffectiveT.measId Like 'OP_3b')
And NOT (timelyEffectiveT.measId Like 'OP_5')
And NOT (timelyEffectiveT.measId Like 'OP_20')
And NOT (timelyEffectiveT.measId Like 'PC_01')
And NOT (timelyEffectiveT.measId Like 'VTE_6')
AND NOT (timelyEffectiveT.score LIKE 'Not Available')
AND timelyEffectiveT.fn LIKE ''
GROUP by generalT.provId
;

DROP TABLE hospavgcorr
;
CREATE TABLE IF NOT EXISTS hospavgcorr
AS SELECT corr(cast(surveyT.base as double), cast(hospavgscore.avgScore as double)) AS correleation
FROM hospavgscore
INNER JOIN surveyT
ON hospavgscore.provId = surveyT.provId
;

DROP TABLE hospmeascorr
;
CREATE TABLE IF NOT EXISTS hospmeascorr
AS SELECT corr(cast(surveyT.base as double), cast(hosmeascount.cnt as double)) AS correleation
FROM hosmeascount
INNER JOIN surveyT
ON hosmeascount.provId = surveyT.provId
;

SELECT *
FROM hospavgcorr
;

SELECT *
FROM hospmeascorr
;
