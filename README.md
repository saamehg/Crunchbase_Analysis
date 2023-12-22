# Crunchbase Project:
This project, completed during my data analysis course, serves as a representative sample of the coding and project work I've undertaken. I aim to showcase my skills and experiences by including it in my GitHub repository.

During this project, I utilized **SQL** to write the necessary codes for data manipulation and analysis. Additionally, **mode.com** served as the initial platform for data visualization, contributing to the comprehensive presentation of project insights.

# Project Definition: 

Investment Analysis Focus: "Identifying Ideal Investment Targets"

Hypothesis: As a venture capital firm, our goal is to discern the optimal sectors (e.g., health, e-commerce, software) for investment in the upcoming year. Additionally, we aim to evaluate the feasibility of expanding our investment portfolio to regions beyond the EU.


Below outlines the steps I took to reach the ultimate decision. Striving for innovation, I devised a scoring tool to evaluate diverse criteria. This tool facilitates decision-making aligned with our objectives. It allows us (the venture capital firm) to compare and determine whether any of the initial factors undergo changes.

***

## Source of Data:
While actively engaged on the *mode.com* website, I utilized data accessible from there. The website, along with its datasets, is freely available for use up to a limited timeframe. Consequently, the SQL codes I authored contain file addresses configured in a manner that ensures seamless execution when run on *mode*, taking full advantage of its functionalities.

The information available on this website is dated, with the latest data being from 2014. Consequently, for the purpose of this investigation, we are assuming the current date to be November 2014. Our objective is to gain insights into the data up to this assumed date.

### about crunchabse: 
Crunchbase is a comprehensive platform that provides information about companies and the startup ecosystem. It serves as a business directory, offering data on a wide range of companies, from startups to well-established enterprises. Crunchbase collects and curates information about businesses, including details about their founders, funding rounds, key personnel, products, and more.

Key features and information available on Crunchbase include:

**Company Profiles:**  Detailed profiles of companies, including their founding date, location, industry, and a summary of their products or services.

**Funding Rounds:** Information about the funding history of companies, detailing investment rounds, investors, and the amounts raised.

**Leadership:** Details about key personnel in companies, such as founders, CEOs, and other executives.

**Acquisitions:** Information about companies that have been acquired or have made acquisitions.

**News and Insights:** Updates and news articles related to companies, helping users stay informed about industry trends and developments.

**Search and Filter Tools:** Users can search for companies based on various criteria, including location, industry, funding status, and more.

Crunchbase is widely used by entrepreneurs, investors, and professionals to gather insights into the business landscape, identify potential investment opportunities, and stay informed about industry trends. The platform offers both free and premium subscription plans, with the latter providing additional features and advanced search capabilities.

---

Quick look at the data set:

**companies:**
![Comapnies Dataset](https://github.com/saamehg/Crunchbase_Analysis/blob/master/Pictures/crunchbase_comapnies_dataset.png)

**investments:**
![investments Dataset](https://github.com/saamehg/Crunchbase_Analysis/blob/master/Pictures/crunchbase_comapnies_dataset.png)


The permalink field is a unique identifier for each row, and also shows the web address. For each company in the table, you can view its online Crunchbase profile by copying/pasting its permalink after Crunchbase’s web domain.

##### description of the fields in companies dataset:
- name:	company name
- homepage_url:	company website url
- category_code: company category code
- funding_total_usd: total amount of funding received by the company from external investors in USD
- status: company status. It can be (1) operating (2) closed (3) acquired (4) IPO
- country_code: code of country of origin of the company
- state_code: code of the state of the company if the company is form the USA
- region: geographic region of the company
- City: city of the company
- funding rounds: number of funding rounds the company has 
- founded_at: mm/dd/ yyy format date when company was founded
- founded_month: yyyy-mm format date when company was founded
- founded _quarter: yyyy-Qx format date when company was founded
- founded_year: year company was founded
- first_funding_at: date of first founding round
- last_milestone: date of companies last milestone
- id: company id

##### description of the fields in investments dataset:


- company_category_code: category code of company that received investments
- company_city: city of company that received investments
- company_country_code: country code of company that received investments
- company_name: name of company that received investments
- company_permalink: the same as company unique identifier “permalink” in tutorial.crunchbase_companies
- company_region: geographic region of the company
- company_state_code: state code of company acquired if company is from the USA
- funded_at: date of company being funded (received investment)
- funded_month: month of company being funded (received investment)
- funded_quarter: quarter of company being funded (received investment)
- funded_year: year of company being funded (received investment)
- funding_round_type: type of the funding round
- id: row id
- investor_category_code: category code of company-investor
- investor_city: city of company-investor
- investor_country_code: country code of company-investor
- investor_name: name of company-investor
- investor_permalink: the same as investor-company unique identifier “permalink” in tutorial.crunchbase_companies
- investor_region: region of company-investor
- investor_state_code: state code of investor-company if company is from the USA
- raised_amount_usd: how much money was invested in this round

*** 

As illustrated in the image provided, the distribution of companies varies across different countries, with a significant concentration in the USA. Companies are categorized into four statuses: operating, acquired, closed, and IPO. 
Notably, a majority of the companies fall under the operating status. Given our location in Germany, situated in Europe, we have chosen to include another European country, specifically Great Britain, for comparison, in addition to the USA, which boasts a substantial amount of data.


[SQL CODE](https://github.com/saamehg/Crunchbase_Analysis/blob/master/SQL%20Codes/Number_of_companies_per_Category_WorldWide.sql)

![Number of Comapaies WordlWide](https://github.com/saamehg/Crunchbase_Analysis/blob/master/Pictures/Number_of_companies_per_Category_WorldWide.jpg)

Given our current emphasis on Germany, I opted to conduct a brief comparison between Germany and two other prominent regions: Great Britain, representing another sizable European country, and the USA, which leads in terms of company presence.

As depicted in the graphs below, certain categories emerge as particularly favorable in the aforementioned countries, while others are unique to specific regions. Notably, common categories, predominantly the most funded and founded, include **Biotech**, **Software**, **Enterprise**, and **Mobile**.

![Most Funded Categories in USA](https://github.com/saamehg/Crunchbase_Analysis/blob/master/Pictures/MostFunded_USA.png) 

![Most Funded Categories in GBR](https://github.com/saamehg/Crunchbase_Analysis/blob/master/Pictures/MostFunded_GBR.png)

![Most Funded Categories in GER](https://github.com/saamehg/Crunchbase_Analysis/blob/master/Pictures/MostFunded_DEU.png) 

[SQL Code](https://github.com/saamehg/Crunchbase_Analysis/blob/master/SQL%20Codes/Categories_FundingStatus_USE_GBR_GER.sql)

This preliminary assessment provides valuable insights and a foundational perspective for consideration in subsequent analyses.

##### Evaluation Criteria:

Now that we have obtained an initial overview of the companies and categories, it's time to establish evaluation criteria to guide our final decision-making process. We are considering various factors, and based on their respective importance, we will assign different scores. This scoring system aims to enhance our decision-making process, aligning with the original needs of our companies.

The factors taken into consideration include:

- **Funding Rounds:** The number of rounds each category secured funding.
- **Fund Raised:** The total amount of money each category raised across all rounds.
- **Status:** If the status is marked as "*closed*," it is considered a negative score.
- **Region:** Although this criterion doesn't have a numeric score, it serves as a measure when deciding where to invest.
- **Funding Type:** This factor provides insights into which categories are more appealing to venture capitalists.

By assigning scores to these factors, we aim to make more informed decisions tailored to the specific needs of our companies.

**Note:** Moving forward, our analysis is exclusively focused on Germany, specifically examining Funding Rounds and Funding Raised.

Through this evaluation, the following insights into fundings emerge:

**Biotech Companies:** Historically, Biotech companies have consistently been among the most appealing categories. They could secure substantial funding, with multiple rounds of funding. There is a noticeable decrease in funding during the years 2007 and 2008, potentially linked to the global economic crisis.

**Video Games Companies:** This category, unique to Germany, experienced a significant funding surge in 2011, followed by a notable decline. It suggests a sudden interest in the gaming market that waned afterward.

**Mobile Category:** Similar to video games, the Mobile category witnessed a surge in funding in 2012.

**Software Companies:** While Software companies attracted funding multiple times, the total amount raised was relatively moderate.

**Enterprise Companies:** A positive trend is observed in Enterprise companies, showing both an increasing trend in the amount of money raised and the frequency of funding rounds.

**E-commerce:** E-commerce exhibits some fluctuations but remains promising.

**Hardware Companies:** Hardware companies gained investor interest, particularly in the last year.

This analysis provides a nuanced understanding of funding dynamics within different categories in the German market. [^1]
[^1]: For more accurate representations, please refer to the presentation file, where enhanced visuals and images are available.








