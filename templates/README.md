
# JCL JOBCARD Template Documentation

This document explains each parameter used in a standard JCL jobcard, indicating which fields are customizable and the rules that must be followed.

## Sample Jobcard

```jcl
//MYJOB     JOB (ACCT),'USER NAME',
//             CLASS=A,
//             MSGCLASS=X,
//             MSGLEVEL=(1,1),
//             NOTIFY=&SYSUID,
//             REGION=0M
```

## Parameter Breakdown

| Parameter         | Description                                                                 | Customizable | Rules/Notes |
|-------------------|-----------------------------------------------------------------------------|--------------|-------------|
| `//MYJOB`         | Job name. Uniquely identifies the job in the system.                        | ✅ Yes       | Up to 8 alphanumeric characters. Must start with `//`. |
| `JOB`             | Marks the beginning of the job statement.                                   | ❌ No        | Mandatory keyword. |
| `(ACCT)`          | Accounting information. Used for billing/resource tracking.                 | ✅ Yes       | Depends on site standards. Often required. |
| `'USER NAME'`     | Descriptive job label (e.g. user's name or purpose).                        | ✅ Yes       | Enclosed in single quotes. For informational use. |
| `CLASS=A`         | Job class. Defines execution priority or job queue.                         | ✅ Yes       | Value depends on system configuration. |
| `MSGCLASS=X`      | Message class. Determines where output is routed (e.g., spool, printer).    | ✅ Yes       | Value must match system-defined MSGCLASS options. |
| `MSGLEVEL=(1,1)`  | Controls the level of messages printed to the job output.                   | ✅ Yes       | Format: `(JCL messages, allocation messages)`. |
| `NOTIFY=&SYSUID`  | Sends notification to the TSO user that submitted the job.                  | ✅ Yes       | `&SYSUID` is a symbolic reference to the current user. |
| `REGION=0M`       | Specifies the amount of memory allocated for the job.                       | ✅ Yes       | `0M` means "use all allowed memory". Can be tuned. |

## General Rules

- Each JCL statement must start with `//` and be no longer than 80 characters.
- Comments must start with `//*`.
- Parameters must follow the proper syntax and system-defined value constraints.
- Always consult your system's JCL standards and scheduler requirements for allowed values.
