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

|   |         | Trends 2000-2019 | Trends 2017-2019 | Trends 2016-2018 |
|---|---------|------------------|------------------|------------------|
|   | Rows    | 1,103,872        | 59,094           | 59,064           |
|   | Columns | 24               | 20               | 20               |
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

## References
- https://my.clevelandclinic.org/health/articles/23051-ethnicity-and-heart-disease 
- https://www.nih.gov/news-events/nih-research-matters/stress-links-poverty-inflammation-heart-disease 
- https://www.heart.org/en/news/2019/03/21/environment-culture-other-social-determinants-play-big-role-in-heart-health 
- https://healthdata.gov/dataset/Rates-and-Trends-in-Hypertension-related-Cardiovas/8sg3-w2fs 
- https://healthdata.gov/dataset/Stroke-Mortality-Data-Among-US-Adults-35-by-State-/h9by-wuv2 
- https://healthdata.gov/dataset/Heart-Disease-Mortality-Data-Among-US-Adults-35-by/pwn5-iqp5 

