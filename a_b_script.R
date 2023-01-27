### Importing Libraries
library(tidyverse)
library(janitor)
library(car)

### Importing Data set
df <- read_csv("https://raw.githubusercontent.com/TimileyinSamuel/A-B-Testing-for-E-Commerce-Website/main/ab_test.csv")

### checking the data set
head(df)

### renaming con_treat column to group
df <- df |> 
  rename(group = con_treat)

### checking number of rows and missing values
skimr::skim(df)
# 294478 rows
# No missing value

### checking for duplicates
duplicates <- df |> 
  janitor::get_dupes(id)

### Removing duplicates
df_new <- anti_join(df, duplicates, by = "id")

### checking descriptive statistics in the control and treatment group
## Number of participants in both groups
df_new |> 
  select(id,group, page, converted) |> 
  group_by(group) |> 
  summarise(participants = n())
## 143,293 participants in control group, 143397 participants in the treatment group

### Calculating conversion rate for both groups
df_new |> 
  select(id,group, page, converted) |> 
  group_by(group) |> 
  summarise(conversion_rate = mean(converted) * 100)
## conversion rate for control group is 12.0 while it is 11.9 for the treatment group

### Checking if Assumptions are Met

## Homogeneity of Variance
## Using Levene's Test for homogeneity of variance
leveneTest(converted ~ group, df_new)

## There is equality of variance between both groups
## Assumption is met 

### Hypothesis Testing (Independent T-Test)
t.test(converted ~ group, var.equal = TRUE, data = df_new)

## The results show that the p value is greater than alpha level of 0.05. Hence
## we fail to reject the null hypothesis, which indicates that the the new web
## page does not provide different result compared to the old web page.
