DROP TABLE tefiltered2
;
CREATE TABLE IF NOT EXISTS tefiltered2
as select timelyEffectiveT.provId, timelyEffectiveT.measId, timelyEffectiveT.score
from timelyEffectiveT
inner join avgmeas
on timelyEffectiveT.measId = avgmeas.measId
WHERE NOT (timelyEffectiveT.score LIKE 'Not Available')
;

DROP TABLE varproc
;
CREATE TABLE IF NOT EXISTS varproc
AS SELECT stddev_samp(tefiltered2.score)/ AVG(tefiltered2.score) as varScore, avgmeas.measId, avgmeas.measName
FROM avgmeas
inner join tefiltered2
ON avgmeas.measId = tefiltered2.measId
group by avgmeas.measId, avgmeas.measName
ORDER BY varScore DESC
;

SELECT *
FROM varproc
;
