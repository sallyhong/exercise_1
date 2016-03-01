DROP TABLE avgmeas
;
CREATE TABLE IF NOT EXISTS avgmeas
as select measureDatesT.measId as measId, measureDatesT.measName as measName, AVG(timelyeffectiveT.score) as avgMeasScore
from measureDatesT
INNER JOIN timelyeffectiveT
ON measureDatesT.measId = timelyEffectiveT.measId
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
GROUP by measureDatesT.measId, measureDatesT.measName
;

DROP TABLE tefiltered
;
CREATE TABLE IF NOT EXISTS tefiltered
as select timelyEffectiveT.provId, timelyEffectiveT.measId, timelyEffectiveT.score, timelyEffectiveT.fn
from timelyEffectiveT
inner join avgmeas
on timelyEffectiveT.measId = avgmeas.measId
where timelyEffectiveT.fn like ''
;

DROP TABLE topEffectiveScore
;
CREATE TABLE IF NOT EXISTS topEffectiveScore
AS SELECT tefiltered.provId, (COUNT(tefiltered.provId) / 51) as EffectiveScore
from tefiltered
inner join avgmeas
on tefiltered.measId = avgmeas.measId
where tefiltered.score > avgmeas.avgMeasScore
group by tefiltered.provId
;

DROP TABLE topReadmissionsScore
;
CREATE TABLE IF NOT EXISTS topReadmissionsScore
AS SELECT generalT.provId, (Count(readmissionsDeathsT.national) / 14) AS ReadmissionsScore
FROM generalT INNER JOIN readmissionsDeathsT ON generalT.provId = readmissionsDeathsT.provId
WHERE (((readmissionsDeathsT.national) Like 'Better than the National Rate'))
GROUP BY generalT.provId
;

DROP TABLE topTotalScore
;
CREATE TABLE IF NOT EXISTS topTotalScore
AS SELECT topEffectiveScore.provId as provId, (topReadmissionsScore.ReadmissionsScore + topEffectiveScore.EffectiveScore) as topScore
from topEffectiveScore
inner join topReadmissionsScore
on topReadmissionsScore.provId = topEffectiveScore.provId
;

DROP TABLE besthospbyscore
;
CREATE TABLE IF NOT EXISTS besthospbyscore
as SELECT generalT.provId as provId, generalT.hospName, topTotalScore.topScore
from generalT
inner join topTotalScore
on generalT.provId = topTotalScore.provId
order by topTotalScore.topScore DESC
limit 10
;

SELECT *
FROM besthospbyscore
;
