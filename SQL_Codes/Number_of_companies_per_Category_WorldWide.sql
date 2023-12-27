-- reprentation of worldwide representation of companies, their status, and 
-- the count of all the companies and categories.


SELECT
  country_code,
  status,
  COUNT(DISTINCT name) AS number_companies_per_country
FROM
  tutorial.crunchbase_companies
WHERE
  country_code IS NOT NULL --and status = 'operating'
GROUP BY
  country_code,
  status
ORDER BY
  number_companies_per_country DESC
