/*Given Data*/
data basketball;
  input _TYPE_$ X1 X2 X3 X4 X5 X6;
  datalines;
STD     0.1226  0.1266  0.1405  0.1438  0.1187  0.1174
N       100     100     100     100     100     100
CORR    1.00000 0.60080 0.49840 0.19200 0.19590 0.34660
CORR    0.60080 1.00000 0.47490 0.21960 0.19120 0.29790
CORR    0.49840 0.47490 1.00000 0.20790 0.20100 0.24450
CORR    0.19200 0.21960 0.20790 1.00000 0.43340 0.31970
CORR    0.19590 0.19120 0.20100 0.43340 1.00000 0.42070
CORR    0.34660 0.29790 0.24450 0.31970 0.42070 1.00000
;
run;
proc print data=basketball;
run;

/*Covariance Matrix*/
data basketball_covariance (type=cov);
infile datalines missover;
_type_="cov";
input VX1 VX2 VX3 VX4 VX5 VX6;
datalines;
0.01513
0.00939 0.01613
0.00864 0.00851 0.01998
0.00340 0.00402 0.00422 0.02074
0.00287 0.00289 0.00337 0.00742 0.01416
0.00499 0.00443 0.00404 0.00539 0.00586 0.01369
;
run;
proc print data=basketball_covariance;
run;

/*CFA for Initial Model*/
proc calis residual modification nobs=100;
lineqs
VX1 = 1.0 F1 + E1,
VX2 = LX2F F1 + E2,
VX3 = LX3F F1 + E3,
VX4 = 1.0 F2 + E4,
VX5 = LX5F F2 + E5,
VX6 = LX6F F2 + E6;
cov F1 F2 = 0;
var VX1 VX2 VX3 VX4 VX5 VX6;
run;

/*CFA for Alternative Model*/
proc calis residual modification nobs=100;
lineqs
VX1 = 1.0 F1 + E1,
VX2 = LX2F F1 + E2,
VX3 = LX3F F1 + E3,
VX4 = 1.0 F2 + E4,
VX5 = LX5F F2 + E5,
VX6 = LX6F F2 + E6;
var VX1 VX2 VX3 VX4 VX5 VX6;
run;