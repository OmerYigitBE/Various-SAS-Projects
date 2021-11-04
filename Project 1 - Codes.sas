/*PART A: PCA*/

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
proc standard data=politics mean=0 std=1 out=std_politics;
proc print data=std_politics;
run;

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

/*PART B: FACTOR ANALYSIS*/
proc factor data = work.import
simple
msa
corr
method=prin
priors=smc
plots=scree
rotate=promax
round
flag=.4;
var ipcrtiv imprich ipeqopt ipshabt impsafe impdiff ipfrule
ipudrst ipmodst ipgdtim impfree iphlppl ipsuces ipstrgv
ipadvnt ipbhprp iprspot iplylfr impenv imptrad impfun;
run;

proc factor data = WORK.import
simple
msa
simple
method=ml
priors=smc
plots=scree
rotate=promax
round
flag=.4;
var ipcrtiv imprich ipeqopt ipshabt impsafe impdiff ipfrule
ipudrst ipmodst ipgdtim impfree iphlppl ipsuces ipstrgv
ipadvnt ipbhprp iprspot iplylfr impenv imptrad impfun;
run;

proc factor data = WORK.import
simple
method=prin
priors=smc
nfact=3 /*nfact = 4*/
plots=scree
rotate=promax
round
flag=.4;
var ipcrtiv imprich ipeqopt ipshabt impsafe impdiff ipfrule
ipudrst ipmodst ipgdtim impfree iphlppl ipsuces ipstrgv
ipadvnt ipbhprp iprspot iplylfr impenv imptrad impfun;
run;