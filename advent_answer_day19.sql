SELECT SUM(total) as total_salaries_with_bonuses
FROM (SELECT *, CASE WHEN year_end_performance_scores[5] > AVG(year_end_performance_scores[5]) OVER()
					THEN salary + salary*0.15
					ELSE salary
			END AS total
		FROM employees);