#############################
# Project: R-Team Importing and cleaning data in R
# Author: Yevhen
# Data: GSS 2016  subset of age and marijuana use variables
#############################
library(tidyverse)

# bring the csv data
dataPath <- "D:/Data sources/datasets_7/Datasets/data/legal_weed_age_GSS2016_ch1.csv"
gss.2016 <- read.csv(file = dataPath)

# bring the data with packages
gss.2016 <- data.table::fread(input = dataPath)

# edit the data
gss.2016$grass <- as.factor(gss.2016$grass)
gss.2016$age[gss.2016$age == "89 OR OLDER"] <- "89"
gss.2016$age <- as.numeric(gss.2016$age)

# edit with dplyr::mutate
gss.2016.cleaned <- gss.2016 %>%
  mutate(age = recode(age, "89 OR OLDER" = "89")) %>%
  mutate(age = as.numeric(age)) %>%
  mutate(grass = as.factor(grass)) %>%
  mutate(grass = na_if(x = grass, y = "DK")) %>%
  mutate(grass = na_if(x = grass, y = "IAP")) %>%
  mutate(grass = droplevels(grass)) %>%
  mutate(age.cat = cut(age,
                       breaks = c(-Inf, 29, 59, 74, Inf),
                       labels = c("<30", "30-59", "60-74", "75+")
                       ))

summary(gss.2016.cleaned)
head(gss.2016.cleaned)
tail(gss.2016.cleaned)

# bar plot chart
legalize.bar <- gss.2016.cleaned %>%
  drop_na(grass) %>%
  drop_na(age) %>%
  mutate(grass = recode_factor(grass,
                               'LEGAL' = "Yes",
                               'NOT LEGAL' = "No")) %>%
  group_by(grass, age.cat) %>%
  count() %>%
  group_by(age.cat) %>%
  mutate(perc.grass = 100*n/sum(n)) %>%
  
  
  ggplot(aes(x = age.cat, fill = grass,
             y = perc.grass)) + 
  geom_col(position = 'dodge') +
  scale_fill_manual(values = c("#78A678", "#7463AC"),
                    name = "Should marijuana be legal?") +
  theme_minimal() +
  labs(x = "Age group in years",
       y = "Percent of responses in age group, %")

legalize.bar

