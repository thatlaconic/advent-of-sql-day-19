# [Performance review season](https://adventofsql.com/challenges/19)

## Description

At North Pole Enterprises, elves hustle and bustle year-round, crafting toys and spreading joy. As Christmas approaches, the jolly management wants to reward the top-performing elves with extra special bonuses. They believe in recognizing those elves whose elf-magic shines the brightest. To spread holiday cheer, they want you to craft a special query using your SQL magic. This enchanted script should tally up the salaries, ensuring bonuses sprinkle extra joy on those who outperform

## Challenge
[Download Challenge data](https://github.com/thatlaconic/advent-of-sql-day-19/blob/main/advent_of_sql_day_19.sql)

How much total salary was paid to all employees including those bonuses?

Employees will receive a bonus if their last performance review score is higher than the average last performance review score of all employees. The bonus is 15% extra on top of their salary.

## Dataset
This dataset contains 1 table. 
### Using PostgreSQL
**input**
```sql
SELECT *
FROM employees ;
```
**output**

![](https://github.com/thatlaconic/advent-of-sql-day-19/blob/main/employees.PNG)


### Solution
[Download Solution Code](https://github.com/thatlaconic/advent-of-sql-day-19/blob/main/advent_answer_day19.sql)

**input**
```sql
SELECT SUM(total) as total_salaries_with_bonuses
FROM (SELECT *, CASE WHEN year_end_performance_scores[5] > AVG(year_end_performance_scores[5]) OVER()
					THEN salary + salary*0.15
					ELSE salary
				END AS total
		FROM employees);

```
**output**

![](https://github.com/thatlaconic/advent-of-sql-day-19/blob/main/d19.PNG)

