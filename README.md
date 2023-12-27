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


[SQL Code](https://github.com/saamehg/Crunchbase_Analysis/blob/master/SQL_Codes/Number_of_companies_per_Category_WorldWide.sql)

![Number of Comapaies WordlWide](https://github.com/saamehg/Crunchbase_Analysis/blob/master/Pictures/Number_of_companies_per_Category_WorldWide.jpg)

Given our current emphasis on Germany, I opted to conduct a brief comparison between Germany and two other prominent regions: Great Britain, representing another sizable European country, and the USA, which leads in terms of company presence.

As depicted in the graphs below, certain categories emerge as particularly favorable in the aforementioned countries, while others are unique to specific regions. Notably, common categories, predominantly the most funded and founded, include **Biotech**, **Software**, **Enterprise**, and **Mobile**.

![Most Funded Categories in USA](https://github.com/saamehg/Crunchbase_Analysis/blob/master/Pictures/MostFunded_USA.png) 

![Most Funded Categories in GBR](https://github.com/saamehg/Crunchbase_Analysis/blob/master/Pictures/MostFunded_GBR.png)

![Most Funded Categories in GER](https://github.com/saamehg/Crunchbase_Analysis/blob/master/Pictures/MostFunded_DEU.png) 

[SQL Code](https://github.com/saamehg/Crunchbase_Analysis/blob/master/SQL_Codes/Categories_FundingStatus_USE_GBR_GER.sql)

This preliminary assessment provides valuable insights and a foundational perspective for consideration in subsequent analyses.

### Evaluation Criteria:

Now that we have obtained an initial overview of the companies and categories, it's time to establish evaluation criteria to guide our final decision-making process. We are considering various factors, and based on their respective importance, we will assign different scores. This scoring system aims to enhance our decision-making process, aligning with the original needs of our companies.

The factors taken into consideration include:

- **Funding Rounds:** The number of rounds each category secured funding.
- **Fund Raised:** The total amount of money each category raised across all rounds.
- **Status:** If the status is marked as "*closed*," it is considered a negative score.
- **Region:** Although this criterion doesn't have a numeric score, it serves as a measure when deciding where to invest.
- **Funding Type:** This factor provides insights into which categories are more appealing to venture capitalists.

By assigning scores to these factors, we aim to make more informed decisions tailored to the specific needs of our companies.

- **Note:** Moving forward, our analysis is exclusively focused on Germany, specifically examining Funding Rounds and Funding Raised.


#### FUNDING ROUNDS & FUND RAISED:

Through this evaluation, the following insights into fundings emerge:


![Funding Round&Money](https://github.com/saamehg/Crunchbase_Analysis/blob/master/Pictures/FundingDetail_all.png)

- **Biotech Companies:** Historically, Biotech companies have consistently been among the most appealing categories. They could secure substantial funding, with multiple rounds of funding. There is a noticeable decrease in funding during the years 2007 and 2008, potentially linked to the global economic crisis.

- **Video Games Companies:** This category, unique to Germany, experienced a significant funding surge in 2011, followed by a notable decline. It suggests a sudden interest in the gaming market that waned afterward.

- **Mobile Category:** Similar to video games, the Mobile category witnessed a surge in funding in 2012.

- **Software Companies:** While Software companies attracted funding multiple times, the total amount raised was relatively moderate.

- **Enterprise Companies:** A positive trend is observed in Enterprise companies, showing both an increasing trend in the amount of money raised and the frequency of funding rounds.

- **E-commerce:** E-commerce exhibits some fluctuations but remains promising.

- **Hardware Companies:** Hardware companies gained investor interest, particularly in the last year.


This analysis provides a nuanced understanding of funding dynamics within different categories in the German market. [^1]
[^1]: For more accurate representations, please refer to the [presentation file](https://github.com/saamehg/Crunchbase_Analysis/blob/master/Presentation.pdf), where enhanced visuals and images are available.


#### STATUS : CLOSED!

The primary motivation behind assessing the status of companies is to understand the behavior of different categories over time. A higher frequency of closed status indicates greater vulnerability in a category. While it is crucial to ascertain the number of companies in the operating status, it is equally valuable to identify those that were unable to sustain. The specific reasons for company closures are not our current focus but represent a topic worthy of further investigation and evaluation.

![Status](https://github.com/saamehg/Crunchbase_Analysis/blob/master/Pictures/ClosedStatus.png)


As evident in the image above, a majority of companies across all categories are operational. However, discerning whether these companies have longstanding operations or are recently founded remains unclear. In contrast, a "closed" status for a company strongly implies prior operation and subsequent failure. Understanding the percentage of companies in each category that have faced closure is crucial. 
**Reminder**: this constitutes a negative factor in our scoring system.

![Closed_status](https://github.com/saamehg/Crunchbase_Analysis/blob/master/Pictures/Closed_Status.png)

[SQL Code](https://github.com/saamehg/Crunchbase_Analysis/blob/master/SQL_Codes/Status_Closed_over_time.sql)

By examining the closure patterns of companies over the years, a notable trend emerges. For instance, a significant number of software companies faced closure during the economic crisis from 2007 to 2009, highlighting their vulnerability. Despite a history of frequent closures, it's intriguing to observe a decline in the number of companies closed in the last year. This may indicate a positive sign of economic growth, possibly influenced by increased funding across all categories.

Taking this into consideration, I have chosen to reduce the negative score for all companies. This decision stems from the observed improvement over time, despite past challenges, suggesting a positive trajectory in their overall performance.


#### REGIONS & VENTURE CAPITAL:

We are a venture capital firm based in Berlin. It's natural, and perhaps more prudent, to exhibit a higher willingness to invest in companies located in Berlin. With this in mind, I conducted an analysis to determine the prevalence of each category in Berlin and assess if Berlin aligns well with promising categories. While this evaluation doesn't involve scoring, it holds significant importance for our final decision.

![Regions](https://github.com/saamehg/Crunchbase_Analysis/blob/master/Pictures/Regions.png)

[SQL Code](https://github.com/saamehg/Crunchbase_Analysis/blob/master/SQL_Codes/Regions.sql)
As depicted in the image, Berlin has consistently invested in Software, Mobile, Video Games, E-commerce, and Enterprise. Notably, the highest investments were made in E-commerce and Enterprise among these five categories.

In this segment, I examined companies funded by various investors, aiming to identify categories that are particularly appealing to venture capitalists. The image below clearly indicates that Software, E-commerce, and Biotech stand out as the most attractive categories for venture capital investment among all.

![VC](https://github.com/saamehg/Crunchbase_Analysis/blob/master/Pictures/FundingType_VC.png)

[SQL Code](https://github.com/saamehg/Crunchbase_Analysis/blob/master/SQL_Codes/FundingType.sql)

#### SCORING TABLE:

In the scoring table, it is evident that the amount of money a company secures during the desired years and the last year carries a maximum of 3 and 2 points, respectively, making them pivotal factors in our evaluation system. The number of funding rounds is equally significant, with a maximum threshold of 2, akin to the funding amount in the last year. While being funded by a venture capital firm holds importance, it is not as critical as the aforementioned factors. As previously mentioned, a "closed" status has a negative impact on our evaluation. Additionally, a crucial but previously unexplored factor involves common categories among the USA, GBR, and DEU. These categories are assigned specific value in our evaluation matrix because it is imperative for us that a company, contemplating future growth, finds opportunities beyond German borders.

![Scores](https://github.com/saamehg/Crunchbase_Analysis/blob/master/Pictures/ScoringSystem.png)

#### CONCLUSION:

Considering the outcomes from the preceding table and the comprehensive factors we have assessed, the following conclusion can be drawn:

- 1. If the venture capital (VC) is open to investing **outside Berlin**, the most favorable option is in the **Biotech** category, potentially within the Tuebingen area.
- 2. However, if the focus is primarily on investing **within Berlin**, the **Enterprise** category stands out as a promising choice.