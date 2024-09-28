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
      
       working-storage section.
       01 ws-pressKeyToEnd     PIC X.
       01 ws-empty PIC X(5).
       01 ws-max PIC 99 VALUE 10.
       01 loop1   PIC 99.
       01 loop2   PIC 99.
       01 timesTable.                               
           03 numCol OCCURS 10 TIMES.
               05 colData PIC ZZZ9.
               05 numRow Occurs 10 TIMES.
                   07 rowData PIC ZZZ9.
      
      * I completed the assignment and REALLY wanted to make it modular...
      *   Looked into using something like this:
      *01 timesTable.                               
      *     03 numCol OCCURS  0 TO 99 DEPENDING ON ws-max.
      *         05 colData PIC ZZ9.
      *         05 numRow OCCURS 0 TO 99 DEPENDING ON ws-max.
      *             07 rowData PIC ZZ9.
      *
      * But I can't use nested OCCURS DEPENDING clauses :(
      *
      * So if you want to do a table of 20x20, you'll have to manually
      *    edit the variable occurs amounts. I left ws-max in there
      *    just for ease of use I suppose. 
      *    This is also why I left the variables at ZZZ9. I tested it
      *    up to 45x45 before the table started to get all messed up
      *    due to my screen not being wide enough to display properly! 
      *    :P
                  

       procedure division.
       PROG.
           PERFORM DATA-PRESET.
           PERFORM DATA-DUMP.
           PERFORM END-PARA.


      * This paragraph initializes all of the data in the array       
       DATA-PRESET.
           PERFORM VARYING loop1 FROM 1 BY 1 UNTIL loop1 > ws-max
                MOVE loop1 TO colData(loop1)
           PERFORM VARYING loop2 FROM 1 BY 1 UNTIL loop2 > ws-max
                MULTIPLY loop2 BY loop1 giving rowData(loop1,loop2)
                END-PERFORM
                END-PERFORM.

      * This paragraph displays all the data stored in the 
      *    array to the screen.     
       DATA-DUMP.
      *    Top Row display... includes the empty spacee in the 
      *        top left corner of the table 

           DISPLAY " "
           DISPLAY " "
           DISPLAY " "
           DISPLAY "Multiplication table " WITH NO ADVANCING
           DISPLAY ws-max WITH NO ADVANCING
           DISPLAY "x" WITH NO ADVANCING
           DISPLAY ws-max WITH NO ADVANCING
           DISPLAY ":"
           DISPLAY " "
           
           DISPLAY ws-empty WITH NO ADVANCING
           PERFORM VARYING loop1 FROM 1 BY 1 UNTIL loop1 > ws-max
           DISPLAY colData(loop1) WITH NO ADVANCING
           DISPLAY " " WITH NO ADVANCING
           END-PERFORM
           DISPLAY " "

      *    Displays the Rest of the Table.                                                                   
           PERFORM VARYING loop1 FROM 1 BY 1 UNTIL loop1 > ws-max
           DISPLAY colData(loop1) WITH NO ADVANCING
           DISPLAY " " WITH NO ADVANCING
           PERFORM VARYING loop2 FROM 1 BY 1 UNTIL loop2 > ws-max
           DISPLAY rowData(loop1,loop2) WITH NO ADVANCING
           DISPLAY " " WITH NO ADVANCING
           END-PERFORM
           DISPLAY " "
           END-PERFORM.
       

      * A small Procedure I'm reusing to cleanly exit the Program
       END-PARA.                     
         
               DISPLAY " "
               DISPLAY "Press Enter to exit..."
               Accept ws-pressKeyToEnd.
               STOP RUN.
      
       end program Assignment07.
