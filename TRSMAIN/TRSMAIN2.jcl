//MYJOB     JOB (ACCT),'USER NAME',
//             CLASS=A,
//             MSGCLASS=X,
//             MSGLEVEL=(1,1),
//             NOTIFY=&SYSUID,
//             REGION=0M
//*=====================================================================
//UNPACK   EXEC PGM=TRSMAIN,PARM='UNPACK'
//INFILE   DD DSN=IBMUSER.TEST.FILE.TRS,     <-- Adjust input file name
//            DISP=SHR
//OUTFILE  DD DSN=IBMUSER.TEST.FILE,         <-- Adjust output file name
//            DISP=(NEW,CATLG,DELETE),
//            UNIT=3390,
//            SPACE=(CYL,(100,50),RLSE)      <-- Adjust space allocation
//SYSPRINT DD SYSOUT=*                                               
//SYSOUT   DD SYSOUT=* 
//*=====================================================================