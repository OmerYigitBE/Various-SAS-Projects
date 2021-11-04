/*PART A: CLUSTER ANALYSIS*/
FILENAME REFFILE '/folders/myfolders/sasuser.v94/sport.xlsx';

PROC IMPORT DATAFILE=REFFILE DBMS=XLSX OUT=WORK.IMPORT3;
GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT3; RUN;
proc print data = work.import3; run;

proc cluster data=work.import3
simple
noeigen
method=centroid
rsquare
rmsstd
pseudo
nonorm
out=tree;
id SPORT;
var END STR PWR SPD AGI FLX NER DUR HAN ANA;

proc tree data=tree out=clus9 nclusters=9;
id SPORT;
copy END STR PWR SPD AGI FLX NER DUR HAN ANA;
proc sort; by CLUSTER;

proc print data = clus9;
run;

proc cluster data=work.import3
simple
noeigen
method=single
rmsstd
rsquare
pseudo
nonorm
out=tree;
id SPORT;
var END STR PWR SPD AGI FLX NER DUR HAN ANA;

proc cluster data=work.import3
simple
noeigen
method=complete
rmsstd
rsquare
pseudo
nonorm
out=tree;
id SPORT;
var END STR PWR SPD AGI FLX NER DUR HAN ANA;
proc tree data=tree out=clus9 nclusters=9;
id SPORT;
copy END STR PWR SPD AGI FLX NER DUR HAN ANA;
proc sort; by CLUSTER;

proc print data = clus9;
run;

proc fastclus data = work.import3
radius = 1
replace = full
maxclusters = 9
maxiter = 20
out = fastnew;
var END STR PWR SPD AGI FLX NER DUR HAN ANA;
proc sort data=fastnew; by cluster;
proc print data=fastnew; by cluster;
var sport cluster distance END STR PWR SPD AGI FLX NER DUR HAN ANA;
run;

/*PART B: DISCRIMINANT ANALYSIS*/
*Importing and sorting the data;
libname c xlsx "C:/Users/tejksedopc/Desktop/Classes/Multivariate Statistics/Assignment 3/cars.xlsx";
data cars;
	set c.cars;
run;
proc sort data=cars;
	by headq;
run;
proc print data=cars;
run;

* Descriptive statistics;
proc standard data=cars mean=0 std=1 out=cars_st;
	var price mileage headroom rearseatcl trunk weight length turning volume gearratio;
proc means data=cars nolabel;
	var price mileage headroom rearseatcl trunk weight length turning volume gearratio;
run;

* Covariance matrices for each group;
data us;
	set cars;
	where headq=1;
data jp;
	set cars;
	where headq=2;
data eu;
	set cars;
	where headq=3;
run;
* Here is only one pairwise test;
proc calis covpattern=eqcovmat;
	var price mileage headroom rearseatcl trunk weight length turning volume gearratio;
	group 1 / data=jp nobs=11;
	group 2 / data=eu nobs=11;
	fitindex NoIndexType On(only)=[chisq df probchi];
run;

* Normality of variables;
proc univariate data=cars;
	var price mileage headroom rearseatcl trunk weight length turning volume gearratio;
	histogram price mileage headroom rearseatcl trunk weight length turning volume gearratio;
run;

* Discriminant analysis;
proc candisc data=cars distance out=cars_discr;
	class headq;
	var price mileage headroom rearseatcl trunk weight length turning volume gearratio;
proc sort;
	by headq;
proc means noprint;
	var can1 can2;
	by headq;
proc plot;
	plot can2*can1 $ headq;
run;
proc discrim data=cars listerr crossvalidate crosslisterr;
	class headq;
	var  price mileage headroom rearseatcl trunk weight length turning volume gearratio; 
run;

* Stepwise;
proc stepdisc data=cars;
	class headq;
	var price mileage headroom rearseatcl trunk weight length turning volume gearratio;
run;

* KNN for misclassification;
proc discrim data=cars method=npar k=5 listerr;
	class headq;
	var price mileage headroom rearseatcl trunk weight length turning volume gearratio;
run;


















