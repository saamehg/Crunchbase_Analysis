
-- calculating total raised amount of money (US$) and number of time each category got funded in three different countries. (USA, GBBR and DEU)
-- in order to compare the most and the least funded categories in these three countries

SELECT
  companies.category_code,
  ROUND(SUM(CASE WHEN investments.company_country_code = 'USA' THEN investments.raised_amount_usd END) / 1000000) AS USA_funding_amount, -- in million US$
  SUM(CASE WHEN companies.country_code = 'USA' THEN companies.funding_rounds END) AS USA_funding_round,
  COUNT(DISTINCT CASE WHEN companies.country_code = 'USA' THEN companies.permalink END) AS USA_Categories_count,
  ROUND(SUM(CASE WHEN investments.company_country_code ILIKE 'DEU' THEN investments.raised_amount_usd END) / 1000000) AS DEU_funding_amount, -- in million US$
  SUM(CASE WHEN companies.country_code = 'DEU' THEN companies.funding_rounds END) AS DEU_funding_round,
  COUNT(DISTINCT CASE WHEN companies.country_code ILIKE 'DEU' THEN companies.permalink END) AS DEU_Categories_count,
  ROUND(SUM(CASE WHEN investments.company_country_code ILIKE 'GBR' THEN investments.raised_amount_usd END) / 1000000) AS GBR_funding_amount, -- in million US$
  SUM(CASE WHEN companies.country_code = 'GBR' THEN companies.funding_rounds END) AS GBR_funding_round,
  COUNT(DISTINCT CASE WHEN companies.country_code ILIKE 'GBR' THEN companies.permalink END) AS GBR_Categories_count
FROM
  tutorial.crunchbase_companies AS companies
JOIN
  tutorial.crunchbase_investments AS investments
ON
  companies.permalink = investments.company_permalink
WHERE
  companies.category_code IS NOT NULL
  AND companies.status = 'operating'
GROUP BY
  companies.category_code
ORDER BY
  USA_Categories_count DESC;