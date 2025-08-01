# TRSMAIN JCL Examples

This directory contains JCL examples for using the `TRSMAIN` utility, which is typically used for packing and unpacking sequential datasets on z/OS.

## TRSMAIN0.jcl

**Purpose:** This JCL demonstrates how to pack a sequential dataset using the `TRSMAIN` utility with the `PACK` parameter.

**Description:**
The `PACK` operation compresses the input dataset (`INFILE`) and writes the compressed data to the output dataset (`OUTFILE`). This can be useful for saving disk space when storing large sequential files.

**Key DD Statements:**
*   `INFILE`: Specifies the input sequential dataset to be packed.
    *   `DSN=IBMUSER.TEST.FILE` (Adjust this to your actual input file name)
    *   `DISP=SHR`: Indicates the dataset is shared.
*   `OUTFILE`: Specifies the output sequential dataset where the packed data will be stored.
    *   `DSN=IBMUSER.TEST.FILE.TRS` (Adjust this to your desired output file name)
    *   `DISP=(NEW,CATLG,DELETE)`: Creates a new dataset, catalogs it, and deletes it if the step fails.
    *   `UNIT=3390`: Specifies the device type for the output dataset.
    *   `SPACE=(CYL,(100,50),RLSE)`: Allocates space in cylinders (100 primary, 50 secondary) and releases unused space.
    *   `DCB=(LRECL=1024,BLKSIZE=0,RECFM=FB,DSORG=PS)`: Defines the Data Control Block attributes for the output file (Logical Record Length, Block Size, Record Format Fixed Block, Data Set Organization Physical Sequential).
*   `SYSPRINT`: Standard output for messages from `TRSMAIN`.
*   `SYSOUT`: Standard output for system messages.

## TRSMAIN1.jcl

**Purpose:** This JCL demonstrates how to pack a sequential dataset using the `TRSMAIN` utility with the `SPACK` parameter.

**Description:**
Similar to `PACK`, the `SPACK` operation compresses the input dataset (`INFILE`) and writes the compressed data to the output dataset (`OUTFILE`). The `SPACK` parameter might imply a different packing algorithm or specific options compared to `PACK`, often resulting in better compression ratios or performance depending on the data.

**Key DD Statements:**
*   `INFILE`: Specifies the input sequential dataset to be packed.
    *   `DSN=IBMUSER.TEST.FILE` (Adjust this to your actual input file name)
    *   `DISP=SHR`: Indicates the dataset is shared.
*   `OUTFILE`: Specifies the output sequential dataset where the packed data will be stored.
    *   `DSN=IBMUSER.TEST.FILE.TRS` (Adjust this to your desired output file name)
    *   `DISP=(NEW,CATLG,DELETE)`: Creates a new dataset, catalogs it, and deletes it if the step fails.
    *   `UNIT=3390`: Specifies the device type for the output dataset.
    *   `SPACE=(CYL,(100,50),RLSE)`: Allocates space in cylinders (100 primary, 50 secondary) and releases unused space.
    *   `DCB=(LRECL=1024,BLKSIZE=0,RECFM=FB,DSORG=PS)`: Defines the Data Control Block attributes for the output file (Logical Record Length, Block Size, Record Format Fixed Block, Data Set Organization Physical Sequential).
*   `SYSPRINT`: Standard output for messages from `TRSMAIN`.
*   `SYSOUT`: Standard output for system messages.

## TRSMAIN2.jcl

**Purpose:** This JCL demonstrates how to unpack a sequential dataset using the `TRSMAIN` utility with the `UNPACK` parameter.

**Description:**
The `UNPACK` operation decompresses a previously packed dataset (`INFILE`) and restores it to its original sequential format in the output dataset (`OUTFILE`). This is the reverse operation of `PACK` or `SPACK`.

**Key DD Statements:**
*   `INFILE`: Specifies the input packed sequential dataset to be unpacked.
    *   `DSN=IBMUSER.TEST.FILE.TRS` (Adjust this to your actual packed input file name)
    *   `DISP=SHR`: Indicates the dataset is shared.
*   `OUTFILE`: Specifies the output sequential dataset where the unpacked data will be stored.
    *   `DSN=IBMUSER.TEST.FILE` (Adjust this to your desired output file name)
    *   `DISP=(NEW,CATLG,DELETE)`: Creates a new dataset, catalogs it, and deletes it if the step fails.
    *   `UNIT=3390`: Specifies the device type for the output dataset.
    *   `SPACE=(CYL,(100,50),RLSE)`: Allocates space in cylinders (100 primary, 50 secondary) and releases unused space.
*   `SYSPRINT`: Standard output for messages from `TRSMAIN`.
*   `SYSOUT`: Standard output for system messages.
