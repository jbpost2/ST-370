LIBNAME School "E:\ServiceStuff\ST370\Unit1\School";


PROC UNIVARIATE DATA = School.survey;
	VAR C0570;
RUN;

PROC SGPLOT DATA = School.survey;
	HISTOGRAM C0534/BINWIDTH = 10 BINSTART = 5;
RUN;
