-- This SQL query retrieves information about closed companies, 
-- including the category code, the count of companies in each category, 
-- the funded year, and the status. 

SELECT
  companies.category_code,
  COUNT(companies.category_code),
  investments.funded_year,
  companies.status
FROM
  tutorial.crunchbase_companies AS companies
JOIN
  tutorial.crunchbase_investments AS investments
ON
  companies.permalink = investments.company_permalink
WHERE
  companies.status = 'closed'
  AND companies.category_code <> ''
  AND investments.funded_year BETWEEN 2006 AND 2013
GROUP BY 1, 3, 4;
