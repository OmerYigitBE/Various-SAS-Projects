/*Reading and printing data*/
data politics;
infile "C:\Users\tejksedopc\Desktop\Classes\Multivariate Statistics\Assignment 1\politics.txt";
input cntry$ trstprl trstlgl trstplt trstprt trstep trstun imbgeco imueclt imwbcnt;
run;
proc print data=politics;
run;

/*Correlation*/
proc corr data=politics;
run;

/*Outliers*/
proc standard data=politics
			  mean=0
			  std=1
			  out=std_politics;
proc print data=std_politics;
run;

/*Kaiser's MSA*/
???

/*Principal Component Analysis (PCA)*/
proc princomp out = politics_pca;
run;

/*Alternative solutions and rotations*/
proc factor data=politics
			simple
			method=prin
			priors=one
			mineigen=1
			plots=scree
			rotate=varimax,quartimax
			nfact=2
			round
			flag=0.50;
var trstprl trstlgl trstplt trstprt trstep trstun imbgeco imueclt imwbcnt;
run;









proc means data = politics;
title = "Politics (Standardized)"
proc standard data = politics mean = 0 std = 1 out = std_politics;
proc print data = std_politics;
proc corr data = politics;
proc corr data = std_politics;
run;

/*PCA method*/
proc princomp out = politics_pca;
run;

/*PCA alternative*/
proc factor data = politics
			simple
			method = prin
			priors = one
			mineigen = 1
			plots = scree
			rotate = varimax
			round
			flag = 0.50;
var trstprl trstlgl trstplt trstprt trstep trstun imbgeco imueclt imwbcnt;
run;

proc factor data = politics
			method = principal
			corr = msa;
run;