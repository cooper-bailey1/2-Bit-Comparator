*Full 2-bit Comparator Circuit
.lib '/usr/cots/synopsys/UniversityLibrary/SAED32_EDK/tech/hspice/saed32nm.lib' TT
.include '/usr/cots/synopsys/UniversityLibrary/SAED32_EDK/lib/stdcell_rvt/hspice/saed32nm_rvt.spf'

* module use /usr/cots/modulefiles
* module load licenses/synopsys tools/hspice/K-2015.06-3
* use synopsys
*post the results
*.option post
.global vdd gnd_1

*define model
.model n105 nmos level=54
.model p105 pmos level=54

*source declaration
.param VDDVAL = 1.05
vvdd vdd 0 'VDDVAL'

vgnd gnd_1 0 0

.param len = 100n
.param w_n = 0.3u
.param w_p = 0.48u
.param nor_scale = 53.539 
.param l_g_inver_scale = 13.863
.param notg_scale =  7.18
.param notl_scale =  7.18
.param xnor_scale = 14.872
.param inv2_scale = 1.925
********************************************************************************
* Library          : SAED_PDK_32_28
* Cell             : not_g
* View             : schematic
* View Search List : hspice hspiceD cmos.sch cmos_sch schematic veriloga
* View Stop List   : hspice hspiceD veriloga
********************************************************************************
.subckt not_g !b0 !b1 a0 a1 gnd_1 vdd x not_g
xm15 not_g a1 net57 gnd_1 n105 w='2*w_n*notg_scale' l=len nf=1 m=1
xm14 net57 !b1 gnd_1 gnd_1 n105 w='2*w_n*notg_scale' l=len nf=1 m=1
xm13 not_g x net55 gnd_1 n105 w='3*w_n*notg_scale' l=len nf=1 m=1
xm12 net55 a0 net56 gnd_1 n105 w='3*w_n*notg_scale'l=len nf=1 m=1
xm11 net56 !b0 gnd_1 gnd_1 n105 w='3*w_n*notg_scale' l=len nf=1 m=1
xm20 not_g a1 net54 vdd p105 w='3.2*w_p*notg_scale' l=len nf=1 m=1
xm19 not_g !b1 net54 vdd p105 w='3.2*w_p*notg_scale' l=len nf=1 m=1
xm18 net54 x vdd vdd p105 w='3.2*w_p*notg_scale' l=len nf=1 m=1
xm17 net54 !b0 vdd vdd p105 w='3.2*w_p*notg_scale' l=len nf=1 m=1
xm16 net54 a0 vdd vdd p105 w='3.2*w_p*notg_scale' l=len nf=1 m=1
.ends not_g

********************************************************************************
* Library          : SAED_PDK_32_28
* Cell             : not_l
* View             : schematic
* View Search List : hspice hspiceD cmos.sch cmos_sch schematic veriloga
* View Stop List   : hspice hspiceD veriloga
********************************************************************************
.subckt not_l !a0 !a1 b0 b1 gnd_1 vdd x not_l
xm4 net3 b0 gnd_1 gnd_1 n105 w='3*w_n*notl_scale' l=len nf=1 m=1
xm3 net2 !a0 net3 gnd_1 n105 w='3*w_n*notl_scale' l=len nf=1 m=1
xm2 not_l x net2 gnd_1 n105 w='3*w_n*notl_scale' l=len nf=1 m=1
xm1 net4 b1 gnd_1 gnd_1 n105 w='2*w_n*notl_scale' l=len nf=1 m=1
xm0 not_l !a1 net4 gnd_1 n105 w='2*w_n*notl_scale' l=len nf=1 m=1
xm5 not_l !a1 net15 vdd p105 w='3.2*w_p*notl_scale' l=len nf=1 m=1
xm6 not_l b1 net15 vdd p105 w='3.2*w_p*notl_scale' l=len nf=1 m=1
xm10 net15 !a0 vdd vdd p105 w='3.2*w_p*notl_scale' l=len nf=1 m=1
xm9 net15 b0 vdd vdd p105 w='3.2*w_p*notl_scale' l=len nf=1 m=1
xm8 net15 x vdd vdd p105 w='3.2*w_p*notl_scale' l=len nf=1 m=1
.ends not_l

********************************************************************************
* Library          : SAED_PDK_32_28
* Cell             : inverter
* View             : schematic
* View Search List : hspice hspiceD cmos.sch cmos_sch schematic veriloga
* View Stop List   : hspice hspiceD veriloga
********************************************************************************
.subckt inverter gnd_1 vdd in out
xm0 out in gnd_1 gnd_1 n105 w=w_n l=len nf=1 m=1
xm1 out in vdd vdd p105 w=w_p l=len nf=1 m=1
.ends inverter

.subckt inverter2 gnd_1 vdd in out
xm0 out in gnd_1 gnd_1 n105 w='w_n*inv2_scale' l=len nf=1 m=1
xm1 out in vdd vdd p105 w="w_p*inv2_scale" l=len nf=1 m=1
.ends inverter2

.subckt l_g_inv gnd_1 vdd in out
xm0 out in gnd_1 gnd_1 n105 w='w_n*l_g_inver_scale' l=len nf=1 m=1
xm1 out in vdd vdd p105 w='w_p*l_g_inver_scale' l=len nf=1 m=1
.ends l_g_inv 

********************************************************************************
* Library          : SAED_PDK_32_28
* Cell             : NOR2
* View             : schematic
* View Search List : hspice hspiceD cmos.sch cmos_sch schematic veriloga
* View Stop List   : hspice hspiceD veriloga
********************************************************************************
.subckt nor2 a b gnd_1 vdd out
xm1 out b gnd_1 gnd_1 n105 w='w_n*nor_scale' l=len nf=1 m=1
xm0 out a gnd_1 gnd_1 n105 w='w_n*nor_scale' l=len nf=1 m=1
xm3 net23 b vdd vdd p105 w=30000n l=len nf=1 m=1
xm2 out a net23 vdd p105 w=30000n l=len nf=1 m=1
.ends nor2

********************************************************************************
* Library          : SAED_PDK_32_28
* Cell             : XNOR2
* View             : schematic
* View Search List : hspice hspiceD cmos.sch cmos_sch schematic veriloga
* View Stop List   : hspice hspiceD veriloga
********************************************************************************
.subckt xnor2 !a !b a b gnd_1 out vdd
xm3 net35 b  gnd_1 gnd_1 n105 w='2*w_n*xnor_scale' l=len nf=1 m=1
xm2 out !a net35 gnd_1 n105 w='2*w_n*xnor_scale'  l=len nf=1 m=1
xm1 net34 !b gnd_1 gnd_1 n105 w='2*w_n*xnor_scale' l=len nf=1 m=1
xm0 out a  net34 gnd_1 n105 w='2*w_n*xnor_scale' l=len nf=1 m=1
xm7 net31 !a vdd vdd p105 w='3.2*w_p*xnor_scale' l=len nf=1 m=1
xm6 net33 a  vdd vdd p105 w='3.2*w_p*xnor_scale' l=len nf=1 m=1
xm5 out !b net31 vdd p105 w='3.2*w_p*xnor_scale' l=len nf=1 m=1
xm4 out b  net33 vdd p105 w='3.2*w_p*xnor_scale' l=len nf=1 m=1
.ends xnor2

********************************************************************************
* Instantiate Devices
*Not Signals
XinvA1 gnd_1  vdd  a1_in  !a1  inverter

XinvA0 gnd_1  vdd  a0_in  !a0  inverter

XinvB1 gnd_1  vdd  b1_in  !b1  inverter

XinvB0 gnd_1  vdd  b0_in  !b0  inverter

*Normal Signals
XA1 gnd_1 vdd !a1 a1 inverter2

XA0 gnd_1 vdd !a0 a0 inverter2

XB0 gnd_1 vdd !b0 b0 inverter2

XB1 gnd_1 vdd !b1 b1 inverter2

* XNOR drives x internally
Xxnor !a1  !b1  a1  b1  gnd_1  x  vdd  xnor2

*G Gate
XG_not !b0 !b1 a0 a1 gnd_1 vdd x not_g not_g
XG gnd_1 vdd not_g G l_g_inv

*instantiate the circuit: 
XL_not !a0 !a1 b0 b1 gnd_1 vdd x not_l not_l
* Generate v_l from out
XL gnd_1 vdd not_l L l_g_inv

*E Signal 
XE L G gnd_1 vdd E nor2
********************************************************************************
*****************************************************
* INPUT STIMULUS (SWEEPS ALL 2-BIT COMBINATIONS)
*****************************************************
.param trf = 6p 
.param del = 2u
.param per = 10u
.param pw = 5u

*****************************************************
* TRANSIENT ANALYSIS
*****************************************************

* Load capacitances = 128C1
Cload_g G 0 350f
Cload_e E 0 350f
Cload_l L 0 350f
*****************************************************
* 2-bit comparator timing analysis
*****************************************************

*****************************************************
* G Test Cases
*****************************************************

*****************************************************
* Case 1: A = 01,  B = 00 --> 10 --> 00  (B1 toggles)
*****************************************************
Va1in a1_in 0 0
Va0in a0_in 0 VDDVAL
Vb1in b1_in 0 PULSE(0 VDDVAL del trf trf pw per)
Vb0in b0_in 0 0

.tran 1p 30u

*****************************************************
* Output delay measurements (trigger on B1)
*****************************************************
.measure tran tphl_G \
    TRIG v(b1_in) val='0.5*VDDVAL' rise=1 \
    TARG v(G)     val='0.5*VDDVAL' fall=1

.measure tran tplh_G \
    TRIG v(b1_in) val='0.5*VDDVAL' fall=1 \
    TARG v(G)     val='0.5*VDDVAL' rise=1

.measure tran tp_G param='(tphl_G + tplh_G)/2'

* ****************************************************
* * Case 2: A = 10 --> 00 --> 10,  B = 01  (A1 toggles)
* ****************************************************
.alter 
Va1in a1_in 0 PULSE(VDDVAL 0 del trf trf pw per)
Va0in a0_in 0 0
Vb1in b1_in 0 0
Vb0in b0_in 0 VDDVAL

.tran 1p 30u
*****************************************************
* Output delay measurements (trigger on A1)
*****************************************************
.measure tran tphl_G \
    TRIG v(a1_in) val='0.5*VDDVAL' fall=1 \
    TARG v(G)     val='0.5*VDDVAL' fall=1

.measure tran tplh_G \
    TRIG v(a1_in) val='0.5*VDDVAL' rise=1 \
    TARG v(G)     val='0.5*VDDVAL' rise=1

.measure tran tp_G param='(tphl_G + tplh_G)/2'
*****************************************************
.end 