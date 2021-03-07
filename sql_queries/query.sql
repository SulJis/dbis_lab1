SELECT regname AS REGION, AVG(engball100) as ENG_AVERAGE_MARK
FROM ZNO_STATS
WHERE engteststatus = 'Зараховано'
GROUP BY regname
ORDER BY ENG_AVERAGE_MARK DESC;