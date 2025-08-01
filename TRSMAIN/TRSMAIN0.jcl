//MYJOB     JOB (ACCT),'USER NAME',
//             CLASS=A,
//             MSGCLASS=X,
//             MSGLEVEL=(1,1),
//             NOTIFY=&SYSUID,
//             REGION=0M
//*=====================================================================
//PACK     EXEC PGM=TRSMAIN,PARM='PACK'
//INFILE   DD DSN=IBMUSER.TEST.FILE,         <-- Adjust input file name
//            DISP=SHR
//OUTFILE  DD DSN=IBMUSER.TEST.FILE.TRS,     <-- Adjust output file name
//            DISP=(NEW,CATLG,DELETE),
//            UNIT=3390,
//            SPACE=(CYL,(100,50),RLSE),     <-- Adjust space allocation
//            DCB=(LRECL=1024,BLKSIZE=0,RECFM=FB,DSORG=PS)
//SYSPRINT DD SYSOUT=*                                               
//SYSOUT   DD SYSOUT=* 
//*=====================================================================