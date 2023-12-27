-- This SQL query retrieves information about the number of funding rounds 
-- and the total raised money in USD for each combination of category code 
-- and region for companies in Germany. 

SELECT
  companies.category_code,
  companies.region,
  COUNT(companies.funding_rounds) AS round_count,
  ROUND(SUM(investments.raised_amount_usd) / 1000000) AS raised_money
FROM
  (SELECT * FROM tutorial.crunchbase_companies WHERE region != 'unknown' AND country_code='DEU') AS companies
JOIN
  (SELECT * FROM tutorial.crunchbase_investments WHERE company_region != 'unknown' AND company_country_code='DEU') AS investments
ON
  companies.permalink = investments.company_permalink
WHERE
  companies.category_code IS NOT NULL
GROUP BY
  1, 2
ORDER BY
  companies.category_code;