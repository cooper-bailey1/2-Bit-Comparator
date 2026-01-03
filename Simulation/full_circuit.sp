*Full 2-bit Comparator Circuit
.lib '/usr/cots/synopsys/UniversityLibrary/SAED32_EDK/tech/hspice/saed32nm.lib' TT
.include '/usr/cots/synopsys/UniversityLibrary/SAED32_EDK/lib/stdcell_rvt/hspice/saed32nm_rvt.spf'

* module use /usr/cots/modulefiles
* module load licenses/synopsys tools/hspice/K-2015.06-3
* use synopsys
*post the results
.option post
.global vdd gnd_1

*define model
.model n105 nmos level=54
.model p105 pmos level=54

*source declaration
.param VDDVAL = 1.05
vvdd vdd 0 'VDDVAL'

vgnd gnd_1 0 0

.param len = 100n
********************************************************************************
* Library          : SAED_PDK_32_28
* Cell             : not_g
* View             : schematic
* View Search List : hspice hspiceD cmos.sch cmos_sch schematic veriloga
* View Stop List   : hspice hspiceD veriloga
********************************************************************************
.subckt not_g !b0 !b1 a0 a1 gnd_1 vdd x not_g
xm15 not_g a1 net57 gnd_1 n105 w=0.3u l=0.03u nf=1 m=1
xm14 net57 !b1 gnd_1 gnd_1 n105 w=0.3u l=0.03u nf=1 m=1
xm13 not_g x net55 gnd_1 n105 w=0.3u l=0.03u nf=1 m=1
xm12 net55 a0 net56 gnd_1 n105 w=0.3u l=0.03u nf=1 m=1
xm11 net56 !b0 gnd_1 gnd_1 n105 w=0.3u l=0.03u nf=1 m=1
xm20 not_g a1 net54 vdd p105 w=0.1u l=0.03u nf=1 m=1
xm19 not_g !b1 net54 vdd p105 w=0.1u l=0.03u nf=1 m=1
xm18 net54 x vdd vdd p105 w=0.6u l=0.03u nf=1 m=1
xm17 net54 !b0 vdd vdd p105 w=0.6u l=0.03u nf=1 m=1
xm16 net54 a0 vdd vdd p105 w=0.6u l=0.03u nf=1 m=1
.ends not_g

********************************************************************************
* Library          : SAED_PDK_32_28
* Cell             : not_l
* View             : schematic
* View Search List : hspice hspiceD cmos.sch cmos_sch schematic veriloga
* View Stop List   : hspice hspiceD veriloga
********************************************************************************
.subckt not_l !a0 !a1 b0 b1 gnd_1 vdd x not_l
xm4 net3 b0 gnd_1 gnd_1 n105 w=0.3u l=0.03u nf=1 m=1
xm3 net2 !a0 net3 gnd_1 n105 w=0.3u l=0.03u nf=1 m=1
xm2 not_l x net2 gnd_1 n105 w=0.3u l=0.03u nf=1 m=1
xm1 net4 b1 gnd_1 gnd_1 n105 w=0.3u l=0.03u nf=1 m=1
xm0 not_l !a1 net4 gnd_1 n105 w=0.3u l=0.03u nf=1 m=1
xm5 not_l !a1 net15 vdd p105 w=0.1u l=0.03u nf=1 m=1
xm6 not_l b1 net15 vdd p105 w=0.1u l=0.03u nf=1 m=1
xm10 net15 !a0 vdd vdd p105 w=0.6u l=0.03u nf=1 m=1
xm9 net15 b0 vdd vdd p105 w=0.6u l=0.03u nf=1 m=1
xm8 net15 x vdd vdd p105 w=0.6u l=0.03u nf=1 m=1
.ends not_l

********************************************************************************
* Library          : SAED_PDK_32_28
* Cell             : inverter
* View             : schematic
* View Search List : hspice hspiceD cmos.sch cmos_sch schematic veriloga
* View Stop List   : hspice hspiceD veriloga
********************************************************************************
.subckt inverter gnd_1 vdd in out
xm0 out in gnd_1 gnd_1 n105 w=0.3u l=0.03u nf=1 m=1
xm1 out in vdd vdd p105 w=0.6u l=0.03u nf=1 m=1
.ends inverter

********************************************************************************
* Library          : SAED_PDK_32_28
* Cell             : NOR2
* View             : schematic
* View Search List : hspice hspiceD cmos.sch cmos_sch schematic veriloga
* View Stop List   : hspice hspiceD veriloga
********************************************************************************
.subckt nor2 a b gnd_1 vdd out
xm1 out b gnd_1 gnd_1 n105 w=0.3u l=0.03u nf=1 m=1
xm0 out a gnd_1 gnd_1 n105 w=0.3u l=0.03u nf=1 m=1
xm3 net23 b vdd vdd p105 w=0.6u l=0.03u nf=1 m=1
xm2 out a net23 vdd p105 w=0.6u l=0.03u nf=1 m=1
.ends nor2

********************************************************************************
* Library          : SAED_PDK_32_28
* Cell             : XNOR2
* View             : schematic
* View Search List : hspice hspiceD cmos.sch cmos_sch schematic veriloga
* View Stop List   : hspice hspiceD veriloga
********************************************************************************
.subckt xnor2 !a !b a b gnd_1 out vdd
xm3 net35 b  gnd_1 gnd_1 n105 w=0.3u l=len nf=1 m=1
xm2 out !a net35 gnd_1 n105 w=0.3u l=len nf=1 m=1
xm1 net34 !b gnd_1 gnd_1 n105 w=0.3u l=len nf=1 m=1
xm0 out a  net34 gnd_1 n105 w=0.3u l=len nf=1 m=1
xm7 net31 !a vdd vdd p105 w=0.6u l=len nf=1 m=1
xm6 net33 a  vdd vdd p105 w=0.6u l=len nf=1 m=1
xm5 out !b net31 vdd p105 w=0.6u l=len nf=1 m=1
xm4 out b  net33 vdd p105 w=0.6u l=len nf=1 m=1
.ends xnor2


********************************************************************************
* Instantiate Devices
*Not Signals
XinvA1 gnd_1  vdd  a1_in  !a1  inverter

XinvA0 gnd_1  vdd  a0_in  !a0  inverter

XinvB1 gnd_1  vdd  b1_in  !b1  inverter

XinvB0 gnd_1  vdd  b0_in  !b0  inverter

*Normal Signals
XA1 gnd_1 vdd !a1 a1 inverter 

XA0 gnd_1 vdd !a0 a0 inverter

XB0 gnd_1 vdd !b0 b0 inverter

XB1 gnd_1 vdd !b1 b1 inverter

* XNOR drives x internally
Xxnor !a1  !b1  a1  b1  gnd_1  x  vdd  xnor2


*G Gate
XG_not !b0 !b1 a0 a1 gnd_1 vdd x not_g not_g
XG gnd_1 vdd not_g G inverter

*instantiate the circuit: 
XL_not !a0 !a1 b0 b1 gnd_1 vdd x not_l not_l
* Generate v_l from out
XL gnd_1 vdd not_l L inverter 

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

** LSB: B0_in
Vb0in b0_in 0 PULSE(0 VDDVAL  0 1p 1p 10n 20n)

* * Next bit: B1_in 
Vb1in b1_in 0 PULSE(0 VDDVAL  0 1p 1p 20n 40n)

* * Next bit: A0_in 
Va0in a0_in 0 PULSE(0 VDDVAL  0 1p 1p 40n 80n)

* * MSB: A1_in 
Va1in a1_in 0 PULSE(0 VDDVAL  0 1p 1p 80n 160n)

*****************************************************
* TRANSIENT ANALYSIS
*****************************************************
.tran .1n 160n

*****************************************************
* WAVEFORM OUTPUTS (HSPICE FORMAT)
*****************************************************
.probe tran v(a0_in) v(a1_in) v(b0_in) v(b1_in) v(G) v(L) v(E)
*****************************************************

.end