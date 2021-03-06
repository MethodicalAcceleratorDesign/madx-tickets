
  ++++++++++++++++++++++++++++++++++++++++++++
  +     MAD-X 5.02.02  (64 bit, Darwin)      +
  + Support: mad@cern.ch, http://cern.ch/mad +
  + Release   date: 2014.07.04               +
  + Execution date: 2014.09.09 08:40:13      +
  ++++++++++++++++++++++++++++++++++++++++++++
beam;



CD.WHA0305.ENT: MARKER; 

CD.WHA0305.MID: MARKER; 

CD.WHA0305: MARKER; 





dlwig.driftwig1: drift, l = 0.8;

dlwig.driftwig2: drift, l = 0.8;

dlwig.deltal: drift, l = 0.4;





dl.wiggler : line = (CD.WHA0305.ent,dlwig.driftwig1,CD.WHA0305.MID,dlwig.driftwig2, CD.WHA0305);



dl.wigglerpdrift: line = (dlwig.deltal,dl.wiggler,dlwig.deltal);





! matching of the quadrupolar lenses strength as a function of the current

!(or dtrj)





use, period=dl.wigglerpdrift;



match, use_macro;



  vary, NAME = dlwig.wnl1, step = 0.01;

  vary, NAME = dlwig.wnl2, step = 0.01;

  vary, NAME = dlwig.wpl1, step = 0.01;

  vary, NAME = dlwig.wpl2, step = 0.01;

  vary, NAME = dlwig.wnp0, step = 0.01;



  mdlwigl: macro =

     {

        use, period=dl.wigglerpdrift;

        twiss, RMATRIX, betx = 3, bety=2;

        value, dlwig.wnp0;

        value, table(twiss, dl.wigglerpdrift$end, RE11),

               table(twiss, dl.wigglerpdrift$end, RE12),

               table(twiss, dl.wigglerpdrift$end, RE33),

               table(twiss, dl.wigglerpdrift$end, RE34);

     };

  CONSTRAINT, expr=table(twiss, dl.wigglerpdrift$end, RE11) = dlWIG.J11;

  CONSTRAINT, expr=table(twiss, dl.wigglerpdrift$end, RE12) = dlWIG.J12;

  CONSTRAINT, expr=table(twiss, dl.wigglerpdrift$end, RE33) = dlWIG.J33;

  CONSTRAINT, expr=table(twiss, dl.wigglerpdrift$end, RE34) = dlWIG.J34;



  CONSTRAINT, expr=table(twiss, dl.wigglerpdrift$end, betx) < 10e6;



  !rmatrix, range = wigglerpdrift,  rm(1, 3) = 0.

  lmdif,   tolerance:= 1e-24,  calls := 500;

number of variables:    5
user given constraints: 0
total constraints:      5

START LMDIF:

dlwig.wnp0 =                  0 ;
table( twiss  dl.wigglerpdrift$end  re11 ) =                  1 ;
table( twiss  dl.wigglerpdrift$end  re12 ) =                2.4 ;
table( twiss  dl.wigglerpdrift$end  re33 ) =                  1 ;
table( twiss  dl.wigglerpdrift$end  re34 ) =                2.4 ;
Initial Penalty Function =   0.13520000E+02


dlwig.wnp0 =                  0 ;
table( twiss  dl.wigglerpdrift$end  re11 ) =                  1 ;
table( twiss  dl.wigglerpdrift$end  re12 ) =                2.4 ;
table( twiss  dl.wigglerpdrift$end  re33 ) =                  1 ;
table( twiss  dl.wigglerpdrift$end  re34 ) =                2.4 ;
dlwig.wnp0 =                  0 ;
table( twiss  dl.wigglerpdrift$end  re11 ) =                  1 ;
table( twiss  dl.wigglerpdrift$end  re12 ) =                2.4 ;
table( twiss  dl.wigglerpdrift$end  re33 ) =                  1 ;
table( twiss  dl.wigglerpdrift$end  re34 ) =                2.4 ;
dlwig.wnp0 =                  0 ;
table( twiss  dl.wigglerpdrift$end  re11 ) =                  1 ;
table( twiss  dl.wigglerpdrift$end  re12 ) =                2.4 ;
table( twiss  dl.wigglerpdrift$end  re33 ) =                  1 ;
table( twiss  dl.wigglerpdrift$end  re34 ) =                2.4 ;
dlwig.wnp0 =                  0 ;
table( twiss  dl.wigglerpdrift$end  re11 ) =                  1 ;
table( twiss  dl.wigglerpdrift$end  re12 ) =                2.4 ;
table( twiss  dl.wigglerpdrift$end  re33 ) =                  1 ;
table( twiss  dl.wigglerpdrift$end  re34 ) =                2.4 ;
dlwig.wnp0 =             0.0001 ;
table( twiss  dl.wigglerpdrift$end  re11 ) =                  1 ;
table( twiss  dl.wigglerpdrift$end  re12 ) =                2.4 ;
table( twiss  dl.wigglerpdrift$end  re33 ) =                  1 ;
table( twiss  dl.wigglerpdrift$end  re34 ) =                2.4 ;
 ++++++++++ LMDIF ended: converged successfully
dlwig.wnp0 =                  0 ;
table( twiss  dl.wigglerpdrift$end  re11 ) =                  1 ;
table( twiss  dl.wigglerpdrift$end  re12 ) =                2.4 ;
table( twiss  dl.wigglerpdrift$end  re33 ) =                  1 ;
table( twiss  dl.wigglerpdrift$end  re34 ) =                2.4 ;
call:       6   Penalty function =   0.13520000E+02
!  simplex,  tolerance:= 1e-24,  calls := 300;

endmatch;


MATCH SUMMARY

--------------------------------------------------------------------
macro: mdlwigl             
  constraint: table(twiss,dl.wigglerpdrift$end,re11)=dlwig.j11
  values:     +1.00000e+00=+0.00000e+00
  weight:     +1.00000e+00
  penalty:    +1.00000e+00

  constraint: table(twiss,dl.wigglerpdrift$end,re12)=dlwig.j12
  values:     +2.40000e+00=+0.00000e+00
  weight:     +1.00000e+00
  penalty:    +2.40000e+00

  constraint: table(twiss,dl.wigglerpdrift$end,re33)=dlwig.j33
  values:     +1.00000e+00=+0.00000e+00
  weight:     +1.00000e+00
  penalty:    +1.00000e+00

  constraint: table(twiss,dl.wigglerpdrift$end,re34)=dlwig.j34
  values:     +2.40000e+00=+0.00000e+00
  weight:     +1.00000e+00
  penalty:    +2.40000e+00

  constraint: table(twiss,dl.wigglerpdrift$end,betx)<10e6
  values:     +4.92000e+00<+1.00000e+07
  weight:     +1.00000e+00
  penalty:    +0.00000e+00



Final Penalty Function =   1.35200000e+01



Variable                 Final Value  Initial Value Lower Limit  Upper Limit 
--------------------------------------------------------------------------------
dlwig.wnl1                0.00000e+00  0.00000e+00 -1.00000e+20  1.00000e+20
dlwig.wnl2                0.00000e+00  0.00000e+00 -1.00000e+20  1.00000e+20
dlwig.wpl1                0.00000e+00  0.00000e+00 -1.00000e+20  1.00000e+20
dlwig.wpl2                0.00000e+00  0.00000e+00 -1.00000e+20  1.00000e+20
dlwig.wnp0                0.00000e+00  0.00000e+00 -1.00000e+20  1.00000e+20

END MATCH SUMMARY

VARIABLE "TAR" SET TO   1.35200000e+01

  Number of warnings: 0

  ++++++++++++++++++++++++++++++++++++++++++++
  + MAD-X 5.02.02 (64 bit) finished normally +
  ++++++++++++++++++++++++++++++++++++++++++++
