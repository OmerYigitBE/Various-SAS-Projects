# Various SAS Projects
There are 4 mini-projects, 2 of which only have the SAS codes and 2 of which have also reports with detailed explanation.

## Project 1
Procedures used:
- proc princomp
- proc factor

#### Part A
The dataset comes from the European Social Survey (ESS: http://ess.nsd.uib.no/), conducted across Europe (28 countries) in 2008. The dataset “politics.txt” includes data on political attitudes or opinions (averages per country) on nine variables. In the Excel file “Politics variables” you can find the description of the variables and the measurement scale used.

The dataset is analyzed by using principal components analysis (PCA) techniques and the insights are discussed.

- *Conclusion*: 2 principal components are found to be sufficient to explain the variation in the data. Then, two rotation methods are tested to obtain alternative solutions. According to the result from rotated solutions, the two PCs selected can be classified as “trust in immigration and international policies” and “trust in domestic politics”.

#### Part B
A similar dataset with 21 variables were selected from the European Social Survey of 2016. The answers of 1766 Belgian individuals are given in the dataset “humanvalues.txt”. The description of the variables is given in the Excel file “Values variables”.

An exploratory factor analysis on the 21 items is conducted. A simple factor model that can
explain the correlation structure is found and the factors are interpreted. The model fit is briefly discussed.

- *Conclusion*: 3 factors are retained. The first one referring to values which are related to increasing of self worth. The second one referring to the attitude towards others and nature, being kind. And the final one referring to the values of being law abiding and security.

## Project 2
Procedures used:
- proc calis

#### Part A
In the text file “corr.txt” is the correlation matrix for 6 variables that have been used to assess the body shape and defensive skills of 100 basketball players. The variables are labeled X1 to X6 and the hypothesis is that X1-X3 are the indicators of body shape, while X4-X6 are the indicators of defensive skills. A description of the variables is below:
- X1: Wingspan, a fingertip-to-fingertip length, measured while the arms are fully open.
- X2: Hand size, the size of the widest part of the palm.
- X3: Length of the leg.
- X4: Steals, average number of steals per game.
- X5: Blocks, average number of blocks per game.
- X6: Average number of opponents’ shots contested by the player per game.

Confirmatory factor analysis (CFA) techniques are used to see if the model fit the data. Then, the results are interpreted.

#### Part B
In the file “shopping.txt” is the results of a survey designed to find out the level of price consciousness, time pressure, and involvement in shopping behavior. The variables have 7-level scales, 1 being the most negative answer and 7 being the most positive answer.

Confirmatory factor analysis (CFA) techniques are used to see if the variables are the good measures of the latent factors. Then, the results are interpreted.

## Project 3
Procedures used:
- proc cluster
- proc tree
- proc fastclus
- proc calis
- proc candisc
- proc discrim
- proc stepdisc

#### Part A
The dataset that contains information about endurance, strength, power, speed, agility, flexibility, nerve, durability, hand-eye coordination and analytic aptitude for 60 different
sports. The aim is to be able to identify the groups of sports that are more alike than others based on the criteria.

Various clustering methods are used - simple linkage, centroid, complete linkage and k-means
with improved initial seeds.

- *Conclusion*: Complete linkage method with 9 clusters is the ultimate decision. This makes the most sense to us interpretability wise and as the method explains a decent part of the variability in clusters we keep complete linkage as a final method. Alternative methods classify sports slightly differently, but some patterns stay the same after all.

#### Part B
The cars dataset in the Excel file consists of several variables (price, mileage, weight, turning, gear ratio etc.) measured on 74 car types. Company headquarter (Europe, Japan and USA) is the grouping variable. Based on certain assumptions, a discriminant analysis is performed to define a classification rule and to describe the differences among the cars from different hedquarters.

- *Conclusion*: With the help of pooled within canonical structure matrix, the cars of different
headquarters are labeled as
  - US — Cars with high turning diameter and size (weight & volume)
  - Japan — Cars with low price and high gear ratio
  - Europe — Cars with high price and low turning diameter

## Project 4
Procedures used:
- proc discrim
- proc glm

When cell phone relay towers are not working properly, wireless providers can lose great amounts of money so it is important to be able to fix problems expeditiously. A first step toward understanding the problems involved is to collect data from a designed experiment involving three factors. A problem was initially classified as low or high severity, simple or complex and the engineer assigned was rated as relatively new (novice) or expert (guru). Two times were observed. The time to assess the problem and plan an attack and the time to implement the solution were each measured in hours. The text file wireless.txt contains the data.

Variables:
- x1: Problem Severity Level  (Low or  High)
- x2: Problem Complexity Level  (Simple or Complex)
- x3: Engineer Experience Level  (Novice or Guru)
- y1: Assessment Time (in hours)
- y2: Implementation time (in hours)

#### Part A
Multivariate analysis of variance (MANOVA) is performed to assess if assessment time (y1) and the implementation time (y2) differ by the problem severity (x1), problem complexity (x2), and engineer experience level (x3). Interaction effects are also included.

#### Part B
A canonical correlation analysis on the X and Y variables is performed and the first pair of canonical variables are discussed. Also, a redundancy analysis is performed. Then, the results are discussed.
