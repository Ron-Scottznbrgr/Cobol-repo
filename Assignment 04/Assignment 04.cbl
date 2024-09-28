      ******************************************************************
      *AUTHOR:      Ron Scott                                          *
      *STUDENT-ID:  041100494                                          *
      *DATE:        OCTOBER 10 2023                                    *
      ******************************************************************
       identification division.
       program-id. Assignment04.
       
       environment division.
       configuration section.
       
       data division.
       working-storage section.
       01 loopNum      PIC 99.
       01 numX         PIC 999.
       01 total        PIC 99999V99.
       01 loopCount    PIC 99.
       
       
       procedure division.
       PROG.
           PERFORM INSTRUCT-PARA
           PERFORM GET-LOOPNUM-PARA
           PERFORM END-PARA.
       
       INSTRUCT-PARA.
           display " "
           display " "
           DISPLAY "---------------------------------------------------"
           display "Welcome! This program will prompt you for a number."
           display " "
           display "We will take that number," 
           display "and then ask you for that many more numbers."
           display " "
           display "Once all of those numbers have been entered,"
           display "we will give you an average of those numbers."
           display " "
           display "Let's get started!"
           DISPLAY "---------------------------------------------------"
           display " ".

       GET-LOOPNUM-PARA.
           DISPLAY "Please Enter a positive integer Number (2-15):     "
           WITH NO ADVANCING
           ACCEPT loopNum.

           IF loopNum >= 2 AND loopNum <= 15
               PERFORM LOOP-PARA
           ELSE
               DISPLAY "Error with provided number. Please try again."
               DISPLAY " "
               PERFORM GET-LOOPNUM-PARA
           END-IF.
       
       LOOP-PARA.
           DISPLAY "Ok, now please input ", loopNum, " numbers."
           DISPLAY "Enter only Positive Numbers, with 3-digits max."
           DISPLAY " "
           PERFORM loopNum TIMES
               ADD loopCount, 1, GIVING loopCount
               DISPLAY "Enter Number [ ",loopCount," / ",loopNum" ]:   "
               WITH NO ADVANCING
               ACCEPT numX
               ADD total, numX GIVING total
           END-PERFORM.
       END-PARA.                     
               DIVIDE total BY loopNum, GIVING total
               DISPLAY " "
               DISPLAY "-----------------------------------------------"
               DISPLAY "The average of the Numbers given is: ", total
               DISPLAY "-----------------------------------------------"
               DISPLAY " "
               STOP RUN.
      
       end program Assignment04.
