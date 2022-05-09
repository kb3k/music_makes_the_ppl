CREATE TEMP FUNCTION DaysInMonth(d TIMESTAMP) AS (
  32 - EXTRACT(DAY FROM DATE_ADD(DATE_TRUNC(CAST (d AS DATE), MONTH), INTERVAL 31 DAY))
);

WITH monthly_cost_table AS (SELECT 
                      account_name,
                      EXTRACT (MONTH FROM bill_datetime) month,
                      EXTRACT (YEAR FROM bill_datetime) year,
                      SUM(cost) monthly_cost
                      FROM `all_billing_data.account_billing_log` 
                      GROUP BY 1,2,3 ORDER BY account_name, year, month),
     daily_costs AS ( SELECT account_name,
                      DaysInMonth( bill_datetime) - EXTRACT (DAY FROM bill_datetime)  day,
                      EXTRACT (MONTH FROM bill_datetime) month,
                      EXTRACT (YEAR FROM bill_datetime) year,
                      SUM(cost) daily_cost
                      FROM `all_billing_data.account_billing_log`
                      GROUP BY 1,2,3,4 ORDER BY account_name, year, month, day)
 SELECT daily_costs.*, monthly_cost_table.monthly_cost FROM
 daily_costs  
 LEFT JOIN
 monthly_cost_table ON
 daily_costs.month = monthly_cost_table.month AND
 daily_costs.year = monthly_cost_table.year AND
 daily_costs.account_name = monthly_cost_table.account_name