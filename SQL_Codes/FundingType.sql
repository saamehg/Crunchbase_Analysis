-- This SQL query retrieves information about the count of 
-- funding rounds for each combination of category code 
-- and funding round type for companies in Germany. 
SELECT
  companies.category_code,
  investments.funding_round_type,
  COUNT(investments.funding_round_type)
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