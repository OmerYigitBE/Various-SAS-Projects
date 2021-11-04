*Reading the data;
data wireless;
input X1$ X2$ X3$ Y1 Y2 Group$; *Group variable is added later;
datalines;
Low Simple Novice 3.0 6.3 LSN
Low Simple Novice 2.3 5.3 LSN
Low Simple Guru 1.7 2.1 LSG
Low Simple Guru 1.2 1.6 LSG
Low Complex Novice 6.7 12.6 LCN
Low Complex Novice 7.1 12.8 LCN
Low Complex Guru 5.6 8.8 LCG
Low Complex Guru 4.5 9.2 LCG
High Simple Novice 4.5 9.5 HSN
High Simple Novice 4.7 10.7 HSN
High Simple Guru 3.1 6.3 HSG
High Simple Guru 3.0 5.6 HSG
High Complex Novice 7.9 15.6 HCN
High Complex Novice 6.9 14.9 HCN
High Complex Guru 5.0 10.4 HCG
High Complex Guru 5.3 10.4 HCG
;
run;
proc print data=wireless;
run;
*Descriptive statistics;
proc means data=wireless;
class x1;
run;
proc means data=wireless;
class x2;
run;
proc means data=wireless;
class x3;
run;
proc corr data=wireless;
var y1 y2;
run;
*Checking the assumptions - Multinormality;
%include 'C:\Users\tejksedopc\Desktop\Classes\Multivariate Statistics\Assignment 4\multnorm.sas';
%multnorm (data=wireless, var = y1 y2);
run;
*Checking the assumptions - Equal covariance matrices;
proc discrim data=wireless pool=test;
	class group;
	var y1 y2;
run;
*MANOVA applications;
proc glm;
	class x1 x2 x3;
	model y1 y2 = x1 x2 x3 x1*x2 x1*x3 x2*x3 x1*x2*x3;
	manova h = x1 x2 x3 x1*x2 x1*x3 x2*x3 x1*x2*x3;
run;
*3-way interaction is omitted;
proc glm;
	class x1 x2 x3;
	model y1 y2 = x1 x2 x3 x1*x2 x1*x3 x2*x3;
	manova h = x1 x2 x3 x1*x2 x1*x3 x2*x3;
run;
*Only x1*x2 interaction is left;
proc glm;
	class x1 x2 x3;
	model y1 y2 = x1 x2 x3 x1*x2;
	manova h = x1 x2 x3 x1*x2;
run;