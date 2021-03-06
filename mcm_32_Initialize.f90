! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Initialization File
! 
! Generated by KPP-2.2.3 symbolic chemistry Kinetics PreProcessor
!       (http://www.cs.vt.edu/~asandu/Software/KPP)
! KPP is distributed under GPL, the general public licence
!       (http://www.gnu.org/copyleft/gpl.html)
! (C) 1995-1997, V. Damian & A. Sandu, CGRER, Univ. Iowa
! (C) 1997-2005, A. Sandu, Michigan Tech, Virginia Tech
!     With important contributions from:
!        M. Damian, Villanova University, USA
!        R. Sander, Max-Planck Institute for Chemistry, Mainz, Germany
! 
! File                 : mcm_32_Initialize.f90
! Time                 : Sat Sep 15 19:57:21 2018
! Working directory    : /vols/fs1/work/schimmel/Code/kpp-2.2.3
! Equation file        : mcm_32.kpp
! Output root filename : mcm_32
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



MODULE mcm_32_Initialize

  USE mcm_32_Parameters, ONLY: dp, NVAR, NFIX
  IMPLICIT NONE

CONTAINS


! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Initialize - function to initialize concentrations
!   Arguments :
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SUBROUTINE Initialize ( )


  USE mcm_32_Global
  USE mcm_32_Monitor

  INTEGER :: i
  REAL(kind=dp) :: x

  CFACTOR = 1.000000e+00_dp

  x = (1.e-20_dp)*CFACTOR
  DO i = 1, NVAR
    VAR(i) = x
  END DO

  x = (1.e-20_dp)*CFACTOR
  DO i = 1, NFIX
    FIX(i) = x
  END DO

! constant rate coefficients
! END constant rate coefficients

! INLINED initializations

  TSTART =   0.00000000D+00
  TEND   =   0.84600000D+05
  DT     =   0.60000000D+03
  TEMP   =   0.28000000D+03
  DO i=1,UBOUND(SPC_NAMES,1)
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC15' )   VAR(i) = (4.340E+13_dp)*CFACTOR      ! C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC16' )   VAR(i) = (7.470E+09_dp)*CFACTOR      ! C#C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC171' )   VAR(i) = (1.110E+08_dp)*CFACTOR      ! C1CCC(=O)CC1
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC172' )   VAR(i) = (1.920E+06_dp)*CFACTOR      ! C1CCC(O)CC1
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC177' )   VAR(i) = (1.600E+08_dp)*CFACTOR      ! C1CCCCC1
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC181' )   VAR(i) = (6.690E+07_dp)*CFACTOR      ! C1OC1
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC190' )   VAR(i) = (2.550E+14_dp)*CFACTOR      ! C=C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC228' )   VAR(i) = (2.550E+10_dp)*CFACTOR      ! C=O
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC230' )   VAR(i) = (5.100E+10_dp)*CFACTOR      ! CC
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC231' )   VAR(i) = (1.320E+10_dp)*CFACTOR      ! CC(=O)C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC786' )   VAR(i) = (2.550E+09_dp)*CFACTOR      ! CC(=O)C=O
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC1088' )   VAR(i) = (2.010E+08_dp)*CFACTOR      ! CC(=O)OC
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC1120' )   VAR(i) = (2.240E+09_dp)*CFACTOR      ! CC(=O)OC(C)C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC1186' )   VAR(i) = (2.550E+07_dp)*CFACTOR      ! CC(=O)OO
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC1187' )   VAR(i) = (2.550E+08_dp)*CFACTOR      ! CC(=O)OON(=O)=O
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC1267' )   VAR(i) = (7.620E+06_dp)*CFACTOR      ! CC(C)=C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC1269' )   VAR(i) = (9.470E+08_dp)*CFACTOR      ! CC(C)C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC1320' )   VAR(i) = (6.290E+08_dp)*CFACTOR      ! CC(C)C(C)C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC1363' )   VAR(i) = (4.070E+07_dp)*CFACTOR      ! CC(C)C=C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC1633' )   VAR(i) = (5.970E+09_dp)*CFACTOR      ! CC(O)C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC1805' )   VAR(i) = (1.080E+08_dp)*CFACTOR      ! CC(O)CO
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC2433' )   VAR(i) = (1.600E+09_dp)*CFACTOR      ! CC=C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC2439' )   VAR(i) = (4.020E+07_dp)*CFACTOR      ! CC=CC=O
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC2440' )   VAR(i) = (1.630E+09_dp)*CFACTOR      ! CC=O
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC2441' )   VAR(i) = (2.280E+09_dp)*CFACTOR      ! CCC
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC2444' )   VAR(i) = (1.210E+10_dp)*CFACTOR      ! CCC(=O)C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC2705' )   VAR(i) = (2.540E+06_dp)*CFACTOR      ! CCC(C)=C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC2706' )   VAR(i) = (6.130E+09_dp)*CFACTOR      ! CCC(C)C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC2713' )   VAR(i) = (1.030E+09_dp)*CFACTOR      ! CCC(C)CC
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC2764' )   VAR(i) = (1.920E+06_dp)*CFACTOR      ! CCC(O)C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3062' )   VAR(i) = (3.400E+08_dp)*CFACTOR      ! CCC=C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3063' )   VAR(i) = (8.030E+07_dp)*CFACTOR      ! CCC=O
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3064' )   VAR(i) = (3.490E+10_dp)*CFACTOR      ! CCCC
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3162' )   VAR(i) = (2.480E+08_dp)*CFACTOR      ! CCCC(C)C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3167' )   VAR(i) = (1.920E+08_dp)*CFACTOR      ! CCCC(C)CC
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3303' )   VAR(i) = (2.290E+08_dp)*CFACTOR      ! CCCC=C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3304' )   VAR(i) = (8.030E+07_dp)*CFACTOR      ! CCCC=O
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3305' )   VAR(i) = (3.460E+09_dp)*CFACTOR      ! CCCCC
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3306' )   VAR(i) = (1.110E+08_dp)*CFACTOR      ! CCCCC(=O)C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3380' )   VAR(i) = (2.160E+08_dp)*CFACTOR      ! CCCCC=C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3382' )   VAR(i) = (3.500E+09_dp)*CFACTOR      ! CCCCCC
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3422' )   VAR(i) = (1.030E+09_dp)*CFACTOR      ! CCCCCCC
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3467' )   VAR(i) = (2.210E+08_dp)*CFACTOR      ! CCCCCCCC
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3486' )   VAR(i) = (9.240E+07_dp)*CFACTOR      ! CCCCCCCCC
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3493' )   VAR(i) = (6.760E+07_dp)*CFACTOR      ! CCCCCCCCCC
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3500' )   VAR(i) = (1.850E+08_dp)*CFACTOR      ! CCCCCCCCCCC
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3507' )   VAR(i) = (2.220E+07_dp)*CFACTOR      ! CCCCCO
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3512' )   VAR(i) = (1.220E+08_dp)*CFACTOR      ! CCCCO
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3513' )   VAR(i) = (2.000E+09_dp)*CFACTOR      ! CCCCOC(=O)C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3548' )   VAR(i) = (5.550E+08_dp)*CFACTOR      ! CCCOC(=O)C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3555' )   VAR(i) = (2.550E+10_dp)*CFACTOR      ! CCO
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3556' )   VAR(i) = (4.550E+08_dp)*CFACTOR      ! CCOC(=O)C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3584' )   VAR(i) = (1.350E+07_dp)*CFACTOR      ! CCOCC
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3629' )   VAR(i) = (1.590E+08_dp)*CFACTOR      ! CLC(CL)=C(CL)CL
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3630' )   VAR(i) = (6.010E+07_dp)*CFACTOR      ! CLC(CL)=CCL
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3654' )   VAR(i) = (4.330E+08_dp)*CFACTOR      ! CLC=C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3677' )   VAR(i) = (1.630E+07_dp)*CFACTOR      ! CLCCCL
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3685' )   VAR(i) = (7.650E+12_dp)*CFACTOR      ! CO
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3686' )   VAR(i) = (2.200E+09_dp)*CFACTOR      ! COC
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3772' )   VAR(i) = (1.960E+08_dp)*CFACTOR      ! COCCO
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3786' )   VAR(i) = (2.550E+08_dp)*CFACTOR      ! COO
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3845' )   VAR(i) = (4.500E+08_dp)*CFACTOR      ! Cc1ccc(C)cc1C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3846' )   VAR(i) = (1.200E+08_dp)*CFACTOR      ! Cc1ccc(C=O)cc1
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3882' )   VAR(i) = (1.280E+08_dp)*CFACTOR      ! Cc1cccc(C)c1C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3906' )   VAR(i) = (5.260E+08_dp)*CFACTOR      ! Cc1ccccc1C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3922' )   VAR(i) = (7.980E+07_dp)*CFACTOR      ! Cc1ccccc1CC
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3928' )   VAR(i) = (1.280E+13_dp)*CFACTOR      ! H2
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3929' )   VAR(i) = (2.550E+10_dp)*CFACTOR      ! H2O2
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3930' )   VAR(i) = (5.100E+09_dp)*CFACTOR      ! HCL
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC3931' )   VAR(i) = (2.550E+10_dp)*CFACTOR      ! HNO3
   IF ( TRIM(SPC_NAMES(i)) == 'SPC3939' )   VAR(i) = (1.150E+11_dp)*CFACTOR       ! NO2
   IF ( TRIM(SPC_NAMES(i)) == 'SPC3951' )   VAR(i) = (2.290E+12_dp)*CFACTOR       ! O3
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC4307' )   VAR(i) = (3.610E+08_dp)*CFACTOR      ! O=CC=C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC4318' )   VAR(i) = (2.550E+09_dp)*CFACTOR      ! O=CC=O
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC4653' )   VAR(i) = (1.280E+11_dp)*CFACTOR      ! OC
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC5143' )   VAR(i) = (3.650E+07_dp)*CFACTOR      ! OCCO
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC5277' )   VAR(i) = (1.280E+11_dp)*CFACTOR      ! SO2
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC5521' )   VAR(i) = (4.160E+08_dp)*CFACTOR      ! c1c(C)cc(C)cc1C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC5550' )   VAR(i) = (1.930E+08_dp)*CFACTOR      ! c1c(C)cccc1C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC5551' )   VAR(i) = (5.110E+07_dp)*CFACTOR      ! c1c(C)cccc1CC
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC5588' )   VAR(i) = (7.070E+08_dp)*CFACTOR      ! c1cc(C)ccc1C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC5640' )   VAR(i) = (2.550E+07_dp)*CFACTOR      ! c1ccc(O)cc1
!   IF ( TRIM(SPC_NAMES(i)) == 'SPC5663' )   VAR(i) = (2.830E+08_dp)*CFACTOR       ! c1ccccc1
!   IF ( TRIM(SPC_NAMES(i)) == 'SPC5664' )   VAR(i) = (2.130E+09_dp)*CFACTOR       ! c1ccccc1C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC5683' )   VAR(i) = (1.850E+06_dp)*CFACTOR      ! c1ccccc1C(C)C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC5700' )   VAR(i) = (2.170E+08_dp)*CFACTOR      ! c1ccccc1C=C
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC5701' )   VAR(i) = (2.410E+08_dp)*CFACTOR      ! c1ccccc1C=O
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC5702' )   VAR(i) = (2.330E+07_dp)*CFACTOR      ! c1ccccc1CC
!    IF ( TRIM(SPC_NAMES(i)) == 'SPC5708' )   VAR(i) = (6.740E+06_dp)*CFACTOR      ! c1ccccc1CCC
  END DO

! End INLINED initializations
  WRITE(*,*) 

      
END SUBROUTINE Initialize

! End of Initialize function
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



END MODULE mcm_32_Initialize

