      ******************************************************************
      *AUTHOR:      Ron Scott                                          *
      *STUDENT-ID:  041100494                                          *
      *DATE:        November 13 2023                                   *
      ******************************************************************
       identification division.
       program-id. Assignment07.
       
       environment division.
           
       DATA DIVISION.
       FILE SECTION.

          
       WORKING-STORAGE SECTION.
       01 ws-FARTS PIC Z(4) BLANK WHEN ZERO.
       01 ws-pressKeyToEnd     PIC X.
       01 WS-NUM1 PIC 9(4) VALUE 10.
       01 WS-NUM2 PIC 9(4) VALUE 10.
       01 WS-NUM3 PIC 9(4) VALUE 100.
       01 WS-NUM4 PIC 9(4) VALUE 100.
       01 WS-NUMA PIC 9(4) VALUE 10.
       01 WS-NUMB PIC 9(4) VALUE 10.
       01 WS-NUMC PIC 9(4) VALUE 10.
       01 WS-NUMD PIC 9(4) VALUE 100.
       01 WS-NUME PIC 9(4) VALUE 10.
  
       01 FIELD-1 PIC X(10) VALUE "AAABBXBBAA".
       01 FIELD-2 PIC X(10) VALUE "LastName".
       01	FIELD-3 PIC X(10) VALUE "FirstName".
       01	FIELD-4 PIC X(20) VALUE " ".

       01 UNIT-PRICE PIC 9(4) VALUE 100.           

       procedure division.
       PROG.
      *     PERFORM DATA-NUMS.
      *     PERFORM DATA-STRINGS.
           PERFORM DATA-DATA.
           PERFORM END-PARA.


      
       DATA-NUMS.
      *     SUBTRACT WS-NUM1 WS-NUM2 FROM WS-NUM3 WS-NUM4.
      *     ADD WS-NUM1 WS-NUM2 TO WS-NUM3 GIVING WS-NUM4.
      *     SUBTRACT WS-NUMA WS-NUMB WS-NUMC FROM WS-NUMD GIVING WS-NUME.
      *     MULTIPLY WS-NUMA BY WS-NUMB WS-NUMC.
      *     MULTIPLY WS-NUMA BY WS-NUMB GIVING WS-NUMC.
      *     DIVIDE WS-NUMD BY 7 GIVING WS-NUMA REMAINDER WS-NUMB.
           COMPUTE WS-NUMC = (WS-NUM1 * WS-NUM2) - (WS-NUMA / WS-NUMB) 
           + WS-NUM3.

           DISPLAY "NUM 1 - 4"
      
           DISPLAY WS-NUM1
           DISPLAY WS-NUM2
           DISPLAY WS-NUM3
           DISPLAY WS-NUM4

           DISPLAY " "
           DISPLAY "NUM A - E"
           DISPLAY WS-NUMA
           DISPLAY WS-NUMB
           DISPLAY WS-NUMC
           DISPLAY WS-NUMD
           DISPLAY WS-NUME
           
           
           
           DISPLAY " ".



           DATA-STRINGS.
      *     INSPECT FIELD-1 REPLACING FIRST "B" BY "Z".
      *     INSPECT FIELD-1 REPLACING ALL "B" BY "C".
      
           STRING FIELD-2 DELIMITED BY SIZE
            FIELD-3 DELIMITED BY SPACE
           INTO FIELD-4
           ON OVERFLOW DISPLAY "OVERFLOW!"
           END-STRING



           DISPLAY "FIELD 1 - 4"
      
           DISPLAY FIELD-1
           DISPLAY FIELD-2
           DISPLAY FIELD-3
           DISPLAY FIELD-4
      
           
           
           DISPLAY " ".

            DATA-DATA.
            MOVE 0909 TO ws-FARTS
            DISPLAY ws-FARTS
            SUBTRACT 6.5 FROM UNIT-PRICE
            DISPLAY UNIT-PRICE
            DISPLAY " ".










      * A small Procedure I'm reusing to cleanly exit the Program
       END-PARA.                     
         
               DISPLAY " "
               DISPLAY "Press Enter to exit..."
               Accept ws-pressKeyToEnd.
               STOP RUN.
      
       end program Assignment07.
