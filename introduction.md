# Do You Have What It Takes to Become a Billionare in 2022?

#### By: Ayesha Patel, Fal Iyoab, Gillian Soekawan, Jackie Hong, and Megan Cuan

![image of U.S. cash]("https://images.pexels.com/photos/259132/pexels-photo-259132.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")

## Introduction
Wealth is a vital determinant in the health, success, and security of one’s life. With greater wealth, not only does one have daily access to basic human necessities but also better healthcare benefits and reassurance of a sufficient income leading to longevity and tranquility. Yet, despite the great significance wealth has on the quality of life, there are large inconsistencies in the global [wealth distribution](https://www.cnbc.com/2023/01/16/richest-1percent-amassed-almost-two-thirds-of-new-wealth-created-since-2020-oxfam.html). From all of the wealth created since 2020, the richest 1% in the world own 67% of this new wealth (Kiderlin). Concerned with the unequal distribution of wealth, we wanted to analyze trends in the individuals who have the highest net worth globally in order to understand if this top-tier socioeconomic status is limited to specific characteristics or if it is a status that can be achieved by people from all backgrounds.

Our project focuses on identifying precursors for achieving a high economic status and assess who is being excluded from the billionaire economic class by investigating the question: **What precursors do those with the highest net worth in the world have in common with one another?** Included in this report will be interactive data visualizations that help answer the following questions:

1. *How is age related to the networth of a billionaire, and how do these trends differ when gender (as a binary variable) is also analyzed?*
2. *How does a billionaire's tendency to give back to society change based on their privilege/inherited wealth?*
3. *How does one’s country of origin (international factor) or state (domestic factor) relate to the chances of achieving a net worth in the billions?*

Through our research, we hope to provide answers about the common social factors among current billionaires. Our findings can help designers and technologists who work in research to design and share more detailed information about the make-up of billionaires beyond the standard factors of industry and net worth. Policy-makers, both on an international and domestic level, face increasing amounts of pressure and responsibility to address wealth inequality through public policies. Our findings can make policy-makers aware of whether they’re enforcing the status quo of who a billionaire is and what social class they come from. In order to better craft effective policies that curb an over-accumulation of wealth by a small and concentrated part of society, policy-makers can consider through our data who is being left out of these opportunities to accumulate wealth. Lastly, our focus on the trends in philanthropy among billionaires can help policy-makers evaluate what are the best methods to make sure billionaires are sharing their wealth.

## The Dataset
In order to address these questions, we used Forbes’ data on the World’s Billionaires in 2022 as billionaires own the most amount of wealth in the world. The dataset includes variables relevant to our research questions such as age, gender, philanthropy score, self-made or not, and country or state of origin.
The data was collected by Forbes and published on Kaggle. The main editor of the data is Kerry A. Dolan and others include Bruce Upbin, Russell Flannery, Naazneen Karmali, Zina Moukheiber, Tatiana Serafin, and Susan Adams. The entire team is composed of more than 50 individuals that work together to collect and aggregate the data.

[Link to data as a csv file (Kaggle)](https://www.kaggle.com/datasets/prasertk/forbes-worlds-billionaires-list-2022?resource=download)

[Link to source of data (Forbes)](https://www.forbes.com/billionaires/)



## Ethical Questions

Gender is misrepresented as female and male in this dataset. Forbes misidentified gender as sex by using "female" instead of "women" and "male" instead of "men" to represent the data for gender. Throughout this report, we will denote the `F` and `M` symbol in Forbes' data under the `gender` column as "women" and "men" respectively. The data also treats gender as a binary variable limiting the gender analysis to women and men. 

Secondly, a person is listed as a billionaire only if they were the founder of their wealth. This means multi-generational families and those born into tremendous wealth are not included in the survey. This refers to privilege and how those who are born into wealthy circumstances may not be represented in this dataset.

## Limitations

After evaluating the dataset, one possible problem might arise due to the inclusion of both international and domestic data. This could cause difficulty in interpreting the results as a combined population because of the known differences between domestic versus international trends. It ultimately led us to our question “How does one’s country of origin (international factor) or state (domestic factor) relate to the chances of achieving a net worth in the billions?” through which we first examine trends in individual countries to identify and reduce the impact of cultural differences. Another possible limitation is the considerable number of “NA” values in the philanthropy score column. The lack of data limits our sample size for identifying trends among those who are charitable. Furthermore, it seems there are more “NA” values for billionaires who are not from the United States, suggesting the dataset is favoring United States billionaires over international ones. Limited data about those from countries other than the United States would cause our conclusions therefore to also favor US billionaires. Another possible limitation is the “self-made” category being represented as binary which may be an oversimplification. It is difficult to ascertain the level of power and influence the individual’s family may have had, leading to limited nuance and applicability of the results. Lastly, there are a few factors that are more informative in elucidating the realities of social mobility such as educational attainment, race, and the family’s relative economic class that Forbes chose not to investigate. If these factors were included in our dataset, the conclusions we would be able to draw about whether social mobility is attainable for the average person may be more specific and detailed.