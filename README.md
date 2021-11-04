# Various SAS Projects
There are 4 mini-projects, 2 of which only have the SAS codes and 2 of which have also reports with detailed explanation.

## Project 1
Procedures used:
- proc princomp
- proc factor

### Part A
The dataset comes from the European Social Survey (ESS: http://ess.nsd.uib.no/), conducted across Europe (28 countries) in 2008. The dataset “politics.txt” includes data on political attitudes or opinions (averages per country) on nine variables. In the Excel file “Politics variables” you can find the description of the variables and the measurement scale used.

The dataset is analyzed by using principal components analysis (PCA) techniques and the insights are discussed.

- *Conclusion*: 2 principal components are found to be sufficient to explain the variation in the data. Then, two rotation methods are tested to obtain alternative solutions. According to the result from rotated solutions, the two PCs selected can be classified as “trust in immigration and international policies” and “trust in domestic politics”.

### Part B
A similar dataset with 21 variables were selected from the European Social Survey of 2016. The answers of 1766 Belgian individuals are given in the dataset “humanvalues.txt”. The description of the variables is given in the Excel file “Values variables”.

An exploratory factor analysis on the 21 items is conducted. A simple factor model that can
explain the correlation structure is found and the factors are interpreted. The model fit is briefly discussed.

- *Conclusion*: 3 factors are retained. The first one referring to values which are related to increasing of self worth. The second one referring to the attitude towards others and nature, being kind. And the final one referring to the values of being law abiding and security.

## Project 2
Procedures used:
- proc calis

### Part A
In the text file “corr.txt” is the correlation matrix for 6 variables that have been used to assess the body shape and defensive skills of 100 basketball players. The variables are labeled X1 to X6 and the hypothesis is that X1-X3 are the indicators of body shape, while X4-X6 are the indicators of defensive skills. A description of the variables is below:
- X1: Wingspan, a fingertip-to-fingertip length, measured while the arms are fully open.
- X2: Hand size, the size of the widest part of the palm.
- X3: Length of the leg.
- X4: Steals, average number of steals per game.
- X5: Blocks, average number of blocks per game.
- X6: Average number of opponents’ shots contested by the player per game.

Confirmatory factor analysis (CFA) techniques are used to see if the model fit the data. Then, the results are interpreted.

### Part B
In the file “shopping.txt” is the results of a survey designed to find out the level of price consciousness, time pressure, and involvement in shopping behavior. The variables have 7-level scales, 1 being the most negative answer and 7 being the most positive answer.

Confirmatory factor analysis (CFA) techniques are used to see if the variables are the good measures of the latent factors. Then, the results are interpreted.


## Project 3


## Project 4

