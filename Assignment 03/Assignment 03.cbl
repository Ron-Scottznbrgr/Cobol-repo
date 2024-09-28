       IDENTIFICATION DIVISION.
       PROGRAM-ID. Assignment03 as "Assignment03".
       AUTHOR. Ron Scott 041100494
       
       environment division.
       configuration section.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 StudentInfo.
           03 StudentID pic 9(9).
           03 Student-Name.
               05 Student-Surname pic a(30).
               05 Student-Initials pic a(2).
               05 Student-GivenName pic a(30).
           03 Student-Date-of-Birth.
               05 Birth-Year pic 9(4).
               05 Birth-Month pic 9(2).
               05 Birth-Day pic 9(2).
           03 Student-Program-Code pic x(10).
           03 Student-Gender pic a.
           03 Student-Postal pic A9A9A9.
           03 StudentMondey pic 9(9)V99 COMP-3.
       01 out pic x(5) value "Butts".
       



x

       PROCEDURE DIVISION.
        display out.
        goback.
       

       END PROGRAM "Assignment03".
