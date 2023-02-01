# A-B-Testing-for-E-Commerce-Website

![picture](https://user-images.githubusercontent.com/119361599/216068174-92b4e4f0-8f2c-4d15-b2f0-d9965ade6b27.png)

---

Can a new webpage boost products' sale? A/B Testing of an e-commerce webpage change.


Situation Description
In an effort to increase sales, an e-commerce platform proposes modifying its' website. In order to accomplish this, the company has developed a new webpage and is testing it in the hopes of increasing the number of users who "convert," or decide to purchase the company's product. However, the company wants to determine whether it should switch to the new page, maintain the old page, or run the experiment for a longer period before deciding.



Objective
To examine whether the new web page increases the likelihood that users will purchase product as compared to the old web page. The deciding metric for success is the number of users who "convert" .



The Study
Before making this crucial decision, the company will need to collect and analyze data. The steps will involve randomly exposing a sample of the product users to the old and new webpage and documenting the conversion rate between both groups. Which webpage is most likely to persuade customers to buy the product? This is referred to as A/B testing.
A/B testing, also known as "split testing," is an experiment in which two versions of a web page or application are compared to determine which performs better. These variations, designated A and B, are presented to users at random. Then, a portion of them will be directed to the first version, while the rest will be assigned to the second. The deciding metric for whether the new page is more successful is if there is an increase in the number of users who "convert," that is, decide to pay for the company's product.
In this project, I will run this test for an e-commerce company to see if a new web page will increase user conversion rates when compared to its current web page.



Dataset Description
The data used for this project was obtained through an experiment done by the e-commerce company. The data contains 5 variables, 294478 rows, and 290584 unique users. The variable details are shown below.
user_id: a unique number that identifies each user.
timestamp: the login time of the user
group (control or test group): whether the user belongs to the control (those visiting the old web page) or test group (those visiting the new page)
landing page: the page a user visits (old page or new page)
converted: whether the user was converted or not(1 if user decided to pay for the product, 0 user decided not to pay for the product)

Data Cleaning (missing values, duplicates)
The data set was examined for duplicates and missing values. All of these variables have the potential to introduce bias into the analysis. The data set contained no missing values. However, the total number of rows was higher than the number of unique users. This meant that some product users were tested more than once or took part in both the treatment and control groups. Further investigation revealed that some users who logged in multiple times at different times were assigned to both the test and control groups. A key assumption of A/B testing is that observations are independent. It should be noted that a user cannot belong to both groups. These users are thus excluded from the analysis. These duplicates constituted 7788 rows (2.6%) of the dataset and were eliminated prior to analysis.



Distribution of Data
There are 143,397 participants in the test group (users assigned the new landing page). In the control group (users assigned to the old landing page), 143,293 individuals participated. A/B testing is not dependent on having an equal number of participants in both groups. However, as earlier mentioned, it is more crucial that the participants are independent (i.e., they cannot belong to both groups) and that they are randomly assigned to these groups.

<img width="234" alt="Screenshot 2023-01-25 at 13 27 03" src="https://user-images.githubusercontent.com/119361599/216068373-1c2deb9a-6de3-45c4-85a3-1e4d02fc7fa3.png">


I went on to compare the conversion rates between the control group and the test group.

<img width="267" alt="Screenshot 2023-01-25 at 13 29 19" src="https://user-images.githubusercontent.com/119361599/216068463-39ef87d0-df24-4ca6-9899-ffaa8cf00904.png">


The conversion rate for the control group is 12, while for the test group it is 11.9. There is a minimal difference between the number of customers who buy when using the old page and the new page. It appears that the old page attracts more buyers than the new page. The important question is whether this difference between the treatment and control groups is sufficient to conclude that the old page outperforms the new page. In other words, is this result statistically significant enough to support this conclusion? This requires testing hypotheses.



Hypothesis Testing

The following information is provided:
The simple random sample size for treatment group = 143,293
The simple random sample size for control = 143,397
The conversation rate for treatment group = 11.9
The conversation rate for control group = 12.0
The significance level (alpha) = 0.95



Formulating Hypotheses
Null Hypothesis: There is no significant difference between the conversion rates of users of the old and users of the new webpage.
Alternative Hypothesis: There is significant difference between the conversion rates of users of the old page and users of the new webpage.



Checking Statistical Test's Assumptions (Normality, Homogeneity of Variance, Independence)
The final step prior to testing the hypothesis consists of checking the statistical test's underlying assumptions. In the following paragraphs, I will explain why each assumption is important, how it affects the results, and why it must be checked prior to testing the hypotheses. Normality and homogeneity of variance are two important assumptions that must be checked.


Normality: For significance tests, the sampling distribution of what is being tested needs to be normal. The normal distribution applies to the model that will be fit to the data. Non-normal distributions affect parameter estimation. As a result, the confidence intervals are wrongfully determined. Deviation from the assumption of normality also affects the null hypothesis and significance testing because the distributions of the test statistics used for these purposes are related to the normal distribution.
The central limit theorem allows this assumption to be met without worry. According to the central limit theorem, by calculating the means of many samples, one can approximate the true mean of the population from which the data for the groups were drawn. The distribution of sample means will have a normal distribution around the true mean. In other words, the bigger the sample gets, the more closely it will resemble that of a normal distribution. Both the control and test groups have more than 100,000 respondents. Thus, the assumption of normality can hold.


Homogeneity of Variance: Homogeneity of variance indicates that, when testing different groups of participants (as in this project), each sample comes from a population with the same variance. Unequal variances between the two groups distort the standard error estimate. So, because the confidence interval and significance tests are computed using the standard error, they will be biased if this assumption is not met.
To test this assumption, I used the Levene's Test for Homogeneity of Variance.


<img width="527" alt="Screenshot 2023-01-27 at 22 58 58" src="https://user-images.githubusercontent.com/119361599/216068732-59e1866b-c1f6-4367-bb52-5f445b836ef1.png">


The result indicates that the variance between both groups is equal. So this assumption is met.
Independence: This indicates that the data from different participants are independent, meaning that the behaviour of one participant does not affect the behaviour of another. Different treatment conditions yield independent results (because they come from different people). This assumption is already met.
Now that all assumptions for this parametric test have been fulfilled, it is possible to test the hypothesis.



Hypothesis Result

<img width="428" alt="Screenshot 2023-01-27 at 22 16 58" src="https://user-images.githubusercontent.com/119361599/216068894-ee27fc4f-1765-404d-8efa-9c97e95627e5.png">


The results show that the p value is greater than alpha level of 0.05. Hence we fail to reject the null hypothesis, which indicates that the the new web page does not provide different result compared to the old web page.
Interpreting Result in Business Words
The difference seen in conversion rate for customers is not due to the old page or new page. Thus, the new web page does not increase the likelihood that consumers will buy the company's products (conversation rate).



Conclusion
The company's new web page does not provide better conversation rates than the old web page.



Recommendations
As the new web page does not result in increased customer purchases, the old web page should be maintained.
Another design can be created and tested to determine if it will achieve the desired outcome.

