-- We can calculate totals, subtotals and grand subtotals with the script below;

WITH SampleData AS
(
    SELECT [Month] = 'October' , Category = 'A', Amount = 1000 UNION ALL
    SELECT [Month] = 'October' , Category = 'A', Amount = 500  UNION ALL
    SELECT [Month] = 'November', Category = 'A', Amount = 750  UNION ALL
    SELECT [Month] = 'November', Category = 'A', Amount = 1250 UNION ALL
    SELECT [Month] = 'October' , Category = 'B', Amount = 450  UNION ALL
    SELECT [Month] = 'October' , Category = 'B', Amount = 650  UNION ALL
    SELECT [Month] = 'November', Category = 'B', Amount = 800  UNION ALL
    SELECT [Month] = 'October' , Category = 'C', Amount = 100  UNION ALL
    SELECT [Month] = 'November', Category = 'C', Amount = 350
)
SELECT
     [Month]
    ,Category
    ,Amount         = SUM(Amount)
    ,SubTotalFlag   = GROUPING([Category])
    ,GrandTotalFlag = GROUPING([Month])
    ,GruopingID = GROUPING_ID([Month],[Category]) -- case when GruopingID = 1 then total, =3 grandtotal...
FROM [SampleData]
GROUP BY ROLLUP([Month],[Category]);
