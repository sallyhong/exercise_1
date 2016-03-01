DROP TABLE topstatescnt
;
CREATE TABLE IF NOT EXISTS topstatescnt
AS SELECT generalT.st as st, count(generalT.st) as cnt
from generalT
INNER JOIN topTotalScore
ON generalT.provId = topTotalScore.provId
GROUP BY st
;

DROP TABLE allstatescnt
;
CREATE TABLE IF NOT EXISTS allstatescnt
AS SELECT generalT.st as st, count(generalT.st) as stcnt
from generalT
group by st
;

DROP TABLE tophospstates
;
CREATE TABLE IF NOT EXISTS tophospstates
AS SELECT allstatescnt.st, (topstatescnt.cnt / allstatescnt.stcnt) as besthospratio
from allstatescnt
inner join topstatescnt
on allstatescnt.st = topstatescnt.st
ORDER BY besthospratio DESC
;

SELECT *
FROM tophospstates
;