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
      * 01 ws-FARTS PIC Z(4) BLANK WHEN ZERO.
       01 ws-pressKeyToEnd     PIC X.
      * 01 WS-NUM1 PIC 9(4) VALUE 10.
      * 01 WS-NUM2 PIC 9(4) VALUE 10.
      * 01 WS-NUM3 PIC 9(4) VALUE 100.
      * 01 WS-NUM4 PIC 9(4) VALUE 100.
      * 01 WS-NUMA PIC 9(4) VALUE 10.
      * 01 WS-NUMB PIC 9(4) VALUE 10.
      * 01 WS-NUMC PIC 9(4) VALUE 10.
      * 01 WS-NUMD PIC 9(4) VALUE 100.
      * 01 WS-NUME PIC 9(4) VALUE 10.
  
      * 01 FIELD-1 PIC X(10) VALUE "AAABBXBBAA".
      * 01 FIELD-2 PIC X(10) VALUE "LastName".
      * 01	FIELD-3 PIC X(10) VALUE "FirstName".
      * 01	FIELD-4 PIC X(20) VALUE " ".

      * 01 UNIT-PRICE PIC 9(4) VALUE 100.           
      *01 WS-NUM1 PIC 999 VALUE 10.

      * 01 WS-NUM2 PIC 999 VALUE 20.

      * 01 WS-NUM3 PIC 999 VALUE 30.

      * 01 WS-NUM4 PIC 999 VALUE 40.



       01 WS-NUMBERS.

         03 WS-VALUE1 PIC 99V99 VALUE 25.00.

         03 WS-VALUE2 PIC 99V99 VALUE 25.00.

         03 WS-VALUE3 PIC 99V99 VALUE 25.00.

         03 WS-VALUE4 PIC 99V99 VALUE 25.00.

      

       01 EDITED-VALUES.

         03 WS-VALUE-EDITED1 PIC $$$9.99.

          03 WS-VALUE-EDITED2 PIC $$99.99.

          03 WS-VALUE-EDITED3 PIC $999.99.

          03 WS-VALUE-EDITED4 PIC ZZZ9.99.



       procedure division.
       PROG.
      *     PERFORM DATA-NUMS.
      *     PERFORM DATA-STRINGS.
      *     PERFORM DATA-DATA.
           Perform NEW-DATA.
           PERFORM END-PARA.


      
     


           NEW-DATA.
      *     ADD WS-NUM1 WS-NUM2 TO WS-NUM3 GIVING WS-NUM4.

       MOVE WS-VALUE3 TO WS-VALUE-EDITED3

     
      *         MOVE WS-VALUE4 TO WS-VALUE-EDITED4
      *         MOVE 12 TO WS-VALUE4

 
      *         DISPLAY WS-VALUE4.
           DISPLAY WS-VALUE-EDITED3.






      * A small Procedure I'm reusing to cleanly exit the Program
       END-PARA.                     
         
               DISPLAY " "
               DISPLAY "Press Enter to exit..."
               Accept ws-pressKeyToEnd.
               STOP RUN.
      
       end program Assignment07.
