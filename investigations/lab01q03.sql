DROP TABLE varproc
;
CREATE TABLE IF NOT EXISTS varproc
AS SELECT stddev_samp(tefiltered.score)/ AVG(tefiltered.score) as varScore, avgmeas.measId, avgmeas.measName
FROM avgmeas
inner join tefiltered
ON avgmeas.measId = tefiltered.measId
group by avgmeas.measId, avgmeas.measName
ORDER BY varScore DESC
;

SELECT *
FROM varproc
;
