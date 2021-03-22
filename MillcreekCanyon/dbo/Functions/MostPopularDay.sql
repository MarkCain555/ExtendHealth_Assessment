-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION MostPopularDay
()
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT TOP 1 WeekDayName, Count(WeekDayName) as 'Most Frequent'
	FROM Calendar
	WHERE A1_res_id IS NOT NULL OR A2_res_id IS NOT NULL OR A3_res_id IS NOT NULL OR A4_res_id IS NOT NULL or A5_res_id IS NOT NULL
	   OR B1_res_id IS NOT NULL OR B2_res_id IS NOT NULL OR B3_res_id IS NOT NULL OR B4_res_id IS NOT NULL or B5_res_id IS NOT NULL
	   OR C1_res_id IS NOT NULL OR C2_res_id IS NOT NULL OR C3_res_id IS NOT NULL OR C4_res_id IS NOT NULL or C5_res_id IS NOT NULL
	GROUP BY WeekDayName
	ORDER BY Count(WeekDayName) DESC
)
