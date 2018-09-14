! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Main Program File
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
! File                 : mcm_32_Main.f90
! Time                 : Mon Jun 18 18:45:35 2018
! Working directory    : /vols/fs1/work/schimmel/Code/kpp-2.2.3
! Equation file        : mcm_32.kpp
! Output root filename : mcm_32
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! MAIN - Main program - driver routine
!   Arguments :
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

PROGRAM mcm_32_Driver

  USE mcm_32_Model
  USE mcm_32_Initialize, ONLY: Initialize

      REAL(kind=dp) :: T, DVAL(NSPEC)
      REAL(kind=dp) :: RSTATE(20)
      INTEGER :: i
  
      REAL(kind=dp) :: t0,tint
      INTEGER       :: io_stat
!~~~> Initialization 

      STEPMIN = 0.0d0
      STEPMAX = 0.0d0

      DO i=1,NVAR
        RTOL(i) = 1.0d-4
        ATOL(i) = 1.0d-5
      END DO
     
      CALL Initialize()
      CALL InitSaveData()

!~~~> Time loop
      OPEN( unit=999,       file='SpcConc',      status='replace', &
      &     action='write', access='sequential', iostat=io_stat    )
      WRITE(999,*) ' T             ',( TRIM(SPC_NAMES(MONITOR(i)))//'            ', i=1,NMONITOR )
      WRITE(999,*) ' T(idx)  ',( MONITOR(i),' ', i=1,NMONITOR )


      WRITE(*,*) ' Diagnose species'
      DO i = 1 , SIZE(SPC_NAMES)
        IF ( TRIM(SPC_NAMES(i)) == 'SPC3939' ) WRITE(*,*) 'SPC3939 (NO2)',i   ! NO2
        IF ( TRIM(SPC_NAMES(i)) == 'SPC3951' ) WRITE(*,*) 'SPC3951 (O3)',i   ! O3
        IF ( TRIM(SPC_NAMES(i)) == 'SPC177' ) WRITE(*,*) 'SPC177',i
        IF ( TRIM(SPC_NAMES(i)) == 'SPC5664' ) WRITE(*,*) 'SPC5664',i
        IF ( TRIM(SPC_NAMES(i)) == 'SPC172' ) WRITE(*,*) 'SPC172',i
        IF ( TRIM(SPC_NAMES(i)) == 'SPC5599' ) WRITE(*,*) 'SPC5599',i
        IF ( TRIM(SPC_NAMES(i)) == 'SPC5647' ) WRITE(*,*) 'SPC5647',i
        IF ( TRIM(SPC_NAMES(i)) == 'SPC5624' ) WRITE(*,*) 'SPC5624',i
        IF ( TRIM(SPC_NAMES(i)) == 'SPC5714' ) WRITE(*,*) 'SPC5714',i
        IF ( TRIM(SPC_NAMES(i)) == 'SPC5701' ) WRITE(*,*) 'SPC5701',i
        IF ( TRIM(SPC_NAMES(i)) == 'SPC5680' ) WRITE(*,*) 'SPC5680',i
        IF ( TRIM(SPC_NAMES(i)) == 'SPC5597' ) WRITE(*,*) 'SPC5597',i
        IF ( TRIM(SPC_NAMES(i)) == 'SPC5608' ) WRITE(*,*) 'SPC5608',i
        IF ( TRIM(SPC_NAMES(i)) == 'SPC4193' ) WRITE(*,*) 'SPC4193',i
        IF ( TRIM(SPC_NAMES(i)) == 'SPC5562' ) WRITE(*,*) 'SPC5562',i
        IF ( TRIM(SPC_NAMES(i)) == 'SPC5558' ) WRITE(*,*) 'SPC5558',i
        IF ( TRIM(SPC_NAMES(i)) == 'SPC5563' ) WRITE(*,*) 'SPC5563',i
        IF ( TRIM(SPC_NAMES(i)) == 'SPC5590' ) WRITE(*,*) 'SPC5590',i
      END DO



      CALL CPU_TIME(t0)
      T = TSTART
kron: DO WHILE (T < TEND)

        TIME = T
        CALL GetMass( C, DVAL )
        WRITE(6,991) (T-TSTART)/(TEND-TSTART)*100, T,       &
                   ( TRIM(SPC_NAMES(MONITOR(i))),           &
                     C(MONITOR(i))/CFACTOR, i=1,NMONITOR )
        WRITE(999,'(*(Es14.6))') T, ( C(MONITOR(i))/CFACTOR, i=1,NMONITOR )           
        !CALL SaveData()
        CALL Update_SUN() 
        CALL Update_RCONST()

        CALL INTEGRATE( TIN = T, TOUT = T+DT, RSTATUS_U = RSTATE, &
        ICNTRL_U = (/ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 /) )
        T = RSTATE(1)

      END DO kron
!~~~> End Time loop

      CALL GetMass( C, DVAL )
      WRITE(6,991) (T-TSTART)/(TEND-TSTART)*100, T,     &
               ( TRIM(SPC_NAMES(MONITOR(i))),           &
                 C(MONITOR(i))/CFACTOR, i=1,NMONITOR ) 
      WRITE(999,'(*(Es14.6))') T, ( C(MONITOR(i))/CFACTOR, i=1,NMONITOR )
      CLOSE(999)
   
      TIME = T
      CALL SaveData()
      CALL CloseSaveData()
      CALL CPU_TIME(tint)
      WRITE(*,*) ' Integration Time = ', tint-t0

991   FORMAT(F6.1,'%. T=',E9.3,2X,200(A,'=',E11.4,'; '))

END PROGRAM mcm_32_Driver

! End of MAIN function
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


