# Identifying the Trends in Cardiovascular disease deaths
## Code Name
Project Heart Disease
## Affiliation
INFO-201: Technical Foundations of Informatics - The Information School - University of Washington
Autumn 2022

## Authors
Diana Tran - dianayt@uw.edu
Daria Manguling - dylene5@uw.edu
Luna Nguyen - tinauw@uw.edu

## Affiliation:
INFO-201: Technical Foundations of Informatics - The Information School - University of Washington

## Date
Autumn 2022

## Abstract
Our main question is, what characteristics are most common in people who have died with hypertension-related cardiovascular disease? To address the question, we will investigate datasets provided by the Centers for Disease Control and Prevention (CDC) and we are concerned with the possible risk factors that people may unknowingly have. To address this concern, we plan to help identify common characteristics and bringing light to them so that individuals and healthcare professionals can keep the consideration in mind when dealing with these diseases.

## Key Words:
- Cardiovascular disease
- Mortality Trends
- United States

## Introduction:
Heart disease has been the leading cause of death in the United States for decades. Despite knowing this, efforts made by the government and health centers to help mitigate the number of deaths have been underwhelming. Our project is designed to analyze the trends in death rates among people who suffer from cardiovascular diseases. Specifically, we are searching for common characteristics that will help to identify the inequalities people face within the healthcare research, diagnosis, and treatment stages for cardiovascular diseases. To do this, we will analyze death rates of cardiovascular disease datasets provided by the CDC. Our goal for this project is to create and provide accessible data visualizations and information to everyone in hopes that the people directly involved, such as policymakers and doctors, understand the possible inequitable conditions that affect people when it comes to cardiovascular disease and strive to make efforts that address those inequalities.

## Problem Domain:
 - Project framing
  - Our problem domain concerns physical health, specifically cardiovascular disease. The main question in mind on thinking about this problem are who is at risk of getting cardiovascular disease. How might the government seek to solve, or at least alleviate this issue? How might society need to change to lower death rates of cardiovascular disease?
- Human Values
  - As implied, human health and safety are human values that are within the problem domain. These values originate from trying to increase population lifespan in the US as cardiovascular disease is one of the leading causes of death. Another human value is income differences. According to the National Institutes of Health, there is a negative correlation of risk of heart disease to income levels; people of lower income and highly stressed people are at higher risk for getting having a cardiac arrest, along with other disease. One more potential human value is racial justice. It originates from the racial disparities in heart disease. According to Cleveland Clinic, race and ethnicity is not considered as a biological trait but rather social constructs, therefore disparities are rooted in social factors, known as social determinants of health, rather than genetic ones. One value tension with understanding the impact this disease has on the US is privacy and autonomy. Lifestyle changes like quiting smoking must be done to lower risk of heart disease, but forcing people to make these lifestyle changes may pose a problem to their autonomy.
- Direct Stakeholders
  - The direct stakeholders of this topic of interest are medical researchers and policy makers. Skills assumed in this dataset is being able to make summaries through coding, considering there is a lot of data in this. They would also need to know how the data is calculated for each row.
- Indirect stakeholders
  - One indirect stakeholder is potentially the general public. Most probably do not have the resources or technical expertise to use the data, but the people who do influence the medical field and policies they are a part of.
- Harms
  - One potential harm comes from ideas from the Challenging Power in Data Feminism. This is deficit narratives, which is to “reduce a group or culture to its “problems,” rather than portraying it with the strengths, creativity, and agency that people from those cultures possess.” In this scenario, by analyzing people by their death rates, it does not put into the spotlight their accomplishments.
- Benefits
  - One benefit of this data is for health professionals and policy makers to look at the this data and perhaps make changes for the better.
 - _References Used_
    - https://my.clevelandclinic.org/health/articles/23051-ethnicity-and-heart-disease
    - https://www.nih.gov/news-events/nih-research-matters/stress-links-poverty-inflammation-heart-disease
    - https://www.heart.org/en/news/2019/03/21/environment-culture-other-social-determinants-play-big-role-in-heart-health

## Research Questions:
- How has cardiovascular disease rates changes over time? This is important because if we can see if the risks of death rates for cardiovascular disease has risen or gone down since 2011, we can try to figure out what may have caused that shift. For other health avenues like obesity and diabetes, rates have gone up because of the sugary foods in the market, what motivates this question is learning about what social trends may have contributed to cardiovascular disease.
- How does race affect ones risk? This is an important question because race is one of the main qualities about person socially. By looking and analyzing this data, we can determine which race is at a higher risk than others. What motivates this question is the constant examples in Data Feminism about racial inequity. As mentioned previously, researchers do not consider race to be as biological but rather as social constructs, so by having one race over the other getting a higher or lower death rates, that speaks to the social determinants of health.
- Which counties have the highest death rate for cardiovascular disease and which ones have the lowest? This is an important question because by researching about those counties, we might pull in reasons why that are ranked that way. What motivates this question is seeing if income levels correlate with higher or lower death rates.

## The Dataset:
1. The data set relates to our problem domain, which concerns physical health, because it reports the mortality rate of cardiovascular disease by year, county, age (starting from 35), race, and sex. It will enable us to answer our research question about characteristics that correlate to higher risk factors for cardiovascular disease death because that information may be valuable to certain social group’s health.
2.  Datasets' column and row stats

|         | Trends 2000-2019 | Trends 2017-2019 | Trends 2016-2018 |
|---------|------------------|------------------|------------------|
| Rows    | 1,103,872        | 59,094           | 59,064           |
| Columns | 24               | 20               | 20               |
3.
  - Centers for Disease Control and Prevention. Heart Disease Mortality Data Among US Adults (35+) by State/Territory and County – 2016-2018 | Chronic Disease and Health Promotion Data & Indicators. 29 Apr. 2020, https://chronicdata.cdc.gov/Heart-Disease-Stroke-Prevention/Heart-Disease-Mortality-Data-Among-US-Adults-35-by/6x7h-usvx.
  - Rates and Trends in Hypertension-Related Cardiovascular Disease Mortality Among US Adults (35+) by County, Age Group, Race/Ethnicity, and Sex – 2000-2019 | Chronic Disease and Health Promotion Data & Indicators. 19 Feb. 2022, https://chronicdata.cdc.gov/Heart-Disease-Stroke-Prevention/Rates-and-Trends-in-Hypertension-related-Cardiovas/uc9k-vc2j.
  - Stroke Mortality Data Among US Adults (35+) by State/Territory and County – 2017-2019 | HealthData.Gov. 18 May 2021, https://healthdata.gov/dataset/Stroke-Mortality-Data-Among-US-Adults-35-by-State-/h9by-wuv2.
   4a. The CDC under the division for Heart Disease and Stroke Prevention collected the data for all the datasets. The first data set was issued on 8 February 2022 with the last update being 19 February. The second data set was issued 23 November 2021. The third data set was also issued 23 November 2021. The purpose of collecting these datasets, as implied but its title, was to investigate the rates and trends for cardiovascular disease and also see how rates change between different people’s characteristics such as location, age, race, etc.

   4b. Given that the CDC is a government agency, the data collection was most likely funded under US tax money. The US Congress authorizes a certain amount of money towards the CDC’s projects. According to the CDC website, they also accept private sector’s gifts, monetary or non-monetary, granted they pass their gift review for potential conflicts of interest. This is to ensure they maintain their scientific integrity. They also get money through the CDC Foundation, which was created by Congress to allow them to connect with private sectors in receiving gifts, granted they allow pass their gift review. The person likely to benefit from this data is the division for Heart Disease and Stroke Prevention themselves because their mission is to prevent those diseases. Other people who benefit from this might include the public, since this is public information, and specifically medical research to also look for ways to allevate this disease.

   4c. The data was validated by the team in the division and secured the data through the National Vital Statistics System (NVSS). Considering the CDC must have their research and information peer reviewed before publishing it to the public, I found this these datasets to be credible.

   4d.  All of the data was obtained through the healthdata.gov website. It is a US government website whose purpose is to have high quality data about health be more accessible to people and policy makers. Since healthdata.gov is more of a database than the one who collected it, credit given to the source of the CDC data website that hosts it.

## Expected Implications:
Cardiovascular doctors, pulmonary doctors, and dietitians could use this to better advise patients to be healthier. Policy makers could know what to ban and the exact amount of how much to ban. Medical advice and policies can be more empathic, understanding, and complex instead of simplistic with low-income people. For example, everyone advises “eat less sugary and salty food” but people in low-income neighborhoods don’t have access to stores that sell healthy food. The people who are selling cigarettes and sugar foods would not want those types of people finding out the results because if they made laws to ban cigarettes they would earn a lot less profit and go out of business. Some people in power who are racist would want someone of that group to continue smoking and eating sugary and salty foods. Knowing the cause of heart attacks could help researchers know whether cure or prevention is easier. AI bot could predict how likely someone would be to get a heart attack. As for the negative possible implications, doctors and insurance companies might want cigarettes to still be sold, people to still be obese and have high cholesterol so that way they'll still have a job.

## Limitations:
We may need to address that there may not be enough data imputed for certain years, mainly the earlier years. There may be other factors that may have caused a patient to die, not just cardiovascular disease, so that might skewer the data. There are also limitations to the grouping of nominal data. The race/ethnicity category does not consider groups who may be multiracial. Sex is divided up to male or female, so that does not consider if one is intersex. Furthermore, assuming sex refers to biological sex and not gender, transgender people’s experiences with health. To address this data, we will probably have to explicitly say what the limitations of categories are. As for the lack of data in some parts, we will not include those sections when summarizing data to analyze.

## Findings:
Which counties have the highest death rate for cardiovascular disease and which ones have the lowest? 

Cardiovascular disease and stroke mortality rates per 100,000 people in Washington state’s and New York’s counties in 2010 who are senior citizens (65 years and older) were looked into as an analysis to give insight into this question. Washington state was chosen because it is where the University of Washington is, which this group is affiliated with. New York was chosen because it is a well-known state and there are many studies around it. 2010 was chosen because the income per capita ranks to compare the findings against were taken from the Wikipedia, which got their data from the 2010 Census, and senior citizens’ data is analyzed because they have higher chances of getting the disease and having a stroke. In Washington, the county that had the highest cardiovascular disease and stroke mortality rates was Adams with a rate of 670.0 per 100,000 while the county with the lowest was San Juan county with a rate of 225.0 per 100,000. Regarding their per capita income, Adams was the lowest in the state, and San Juan was the second highest in the state after King county. King county had a rate of 382.3 per 100,000. New York’s county that had the highest rate was Bronx county with 748.2 per 100,000 while the lowest was Clinton county with 239.0. Regarding their per capita income, Bronx county ranked lowest in the state while Clinton ranked 44th. The county with the highest per capita income, New York county, had a rate of 577.2 per 100,000. 

How does race affect ones risk?

From results black people in first place of deaths and are disproportionately dying from cardiovascular disease in most states in all years. There is consistently a lack of data for Native American. The ranking for 2nd place. Hispanic and white people tend to flip depending on the state and they typically have middle ranking. Asian Pacific Islander tend to have third or fourth place. Native Americans have the least cardio vascular disease but it's probably because the population of Native Americans in Asian and Pacific Islander are much smaller than every other population and so there isn't much data on them in the first place.

How has cardiovascular disease rates changes over time?

Cardiovascular disease rates have largely been fluctuating over time and vary greatly by location. Some areas, such as California, actually have a lower median death rate in 2019 than they did in 2000 for people older than 65. However some areas, such as Vermont, in 2019 had a median death rate that was 1.5x the rate in 2000. Additionally, when viewing the changes based on age, a large number of the states have a slowly growing death rate in 35 to 64 year olds, which is alarming. Placing a focus on Washington state however, we can notice that leading up to the year 2008, there was a large increase in the death rates. 2008 was Washington’s peak median death rate number, which leads one to wonder, “what happened that causes that spike?” After 2008, Washington's death rate started to decrease where it dipped slightly below the rate from 2001 in 2016. In the recent years, 2017 to 2019, Washington’s death rate was slightly fluctuating, just barely sitting above 400 people per 100,000. To summarize, cardiovascular disease rates in Washington over the years have fluctuated greatly but in recent years have settled at a number in between its lowest point in 2000 and its highest in 2018. Comparing the oldest data to the newest, there has been little change and the death rate number increased slightly in both the 65 and older group and the 35-64 group over the years.

## Discussion:
Regarding the findings associated with the highest and lowest counties question, the main motivation for this question was to think of reasons why counties might have the highest or lowest rates, specifically if having a higher rate equates to a lower income per capita in that county and vice versa. From looking at this snippet of the data, while there is a correlation between higher rates and lower income, the other side of rates does not have as strong of a correlation. Judging this, it is safe to assume that other states also vary in correlations. These findings were important because it suggests that other factors might influence the rates. They also changed the original motivation for the question. For future analysis and findings, a researcher might use this knowledge to consider other variables that might induce or not induce cardiovascular disease and stroke mortality rates and the cities in which reside in the counties. For instance, the cost of living, access to care, poverty rates, and other forms of measuring income may influence why the highest income per capita county in Washington state and New York do have the lowest rates, especially when considering Seattle in Washington state and Manhattan in New York. This in turn can consider and spark solutions to decrease cardiovascular disease and stroke mortality rates. 

One theory for why the ranking of Hispanic and white people flip depending on the state is because white people have more privilege but a higher population whereas Hispanic people have a smaller population and less privilege. The higher the population the more cardiovascular deaths there are going to be for a certain race and the more privilege a race has the less cardiovascular deaths there are going to be. Population number and race privilege create a tug of war which is reflected in the death numbers. Native Americans tend to have the least cardiovascular death but they also have the lowest population than the other race.

The scatterplot was created with the intention of showing the change in the median death rates over time. This is important because through these changes we can identify areas regarding cardiovascular disease that should be addressed. For example, using the visualization I noticed that about 30 of the states have a higher median death rate in 2019 than in 2000. Through the visualization, it is easy to notice the upwards trend in death rate as time increases and this in turn makes it easier to find timeframes with solutions that might help to mitigate the severity. Additionally, highlighting the changes over time makes it easier to see drastic changes and allows for investigations to take place over those time frames. A sudden spike in death rates could mean something deeper, such as the implementation of a policy that provokes heart disease or economic issues that cause stress and unhealthy habits that worsen the effects of heart disease on the body and on the other side, a sudden decrease could mean a successful preventative measure was taken. Through these deeper investigations, we can be aware of what harms us and what benefits us when it comes to cardiovascular disease.

## Conclusion:

## Acknowledgements
I would like to thank our TA Darren for responding to so many of our questions about the assignment! Also I want to thank AG-8 for introducing to me the includeMarkdown function. 

## References
- (2022). [Digital Drawing]. https://health.clevelandclinic.org/is-heart-disease-curable/ 
 - Centers for Disease Control and Prevention. Heart Disease Mortality Data Among US Adults (35+) by State/Territory and County – 2016-2018 | Chronic Disease and Health Promotion Data & Indicators. 29 Apr. 2020, https://chronicdata.cdc.gov/Heart-Disease-Stroke-Prevention/Heart-Disease-Mortality-Data-Among-US-Adults-35-by/6x7h-usvx. 
- Environment, culture, other social determinants play big role in heart health. (2019, March 21). Www.Heart.Org. https://www.heart.org/en/news/2019/03/21/environment-culture-other-social-determinants-play-big-role-in-heart-health
- Heart disease risk: How race and ethnicity play a role. (2022, May 15). Cleveland Clinic. https://my.clevelandclinic.org/health/articles/23051-ethnicity-and-heart-disease
- List of New York locations by per capita income. (2022). In Wikipedia. https://en.wikipedia.org/w/index.php?title=List_of_New_York_locations_by_per_capita_income&oldid=1076079141
- List of Washington locations by per capita income. (2022). In Wikipedia. https://en.wikipedia.org/w/index.php?title=List_of_Washington_locations_by_per_capita_income&oldid=1081871636
- Rates and Trends in Hypertension-Related Cardiovascular Disease Mortality Among US Adults (35+) by County, Age Group, Race/Ethnicity, and Sex – 2000-2019 | Chronic Disease and Health Promotion Data & Indicators. 19 Feb. 2022, https://chronicdata.cdc.gov/Heart-Disease-Stroke-Prevention/Rates-and-Trends-in-Hypertension-related-Cardiovas/uc9k-vc2j. 
- Stress links poverty to inflammation and heart disease. (2019, July 8). National Institutes of Health (NIH). https://www.nih.gov/news-events/nih-research-matters/stress-links-poverty-inflammation-heart-disease
- Stroke Mortality Data Among US Adults (35+) by State/Territory and County – 2017-2019 | HealthData.Gov. 18 May 2021, https://healthdata.gov/dataset/Stroke-Mortality-Data-Among-US-Adults-35-by-State-/h9by-wuv2. 
