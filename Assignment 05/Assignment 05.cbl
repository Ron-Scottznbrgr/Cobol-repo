      ******************************************************************
      *AUTHOR:      Ron Scott                                          *
      *STUDENT-ID:  041100494                                          *
      *DATE:        OCTOBER 13 2023                                    *
      ******************************************************************
       identification division.
       program-id. Assignment05.
       
       environment division.
       configuration section.
       
       data division.
       working-storage section.
       01 loopNum          PIC 9.
       01 temperature      PIC 99V9.
       01 total            PIC 999V9.
       01 tempCity         PIC A(10).
       01 tempAvg          PIC 99.9.
       01 innerLoopCount   PIC 9.
       01 outerLoopCount   PIC 9.
       01 forLoopBABY      PIC 9 VALUE 1.
       01 pressKeyToEnd    PIC X.
       
      * I'm Attempting to learn arrays on my own.
      * I'm trying to make the program as Modular as possible ¯\_(ツ)_/¯
       01 cities.                               
           05 city-names OCCURS 5 TIMES.
               10 FILLER PIC X(5) VALUE SPACES.                  
               10 cityName-ASSIGN PIC A(10).                          
               10 FILLER PIC X(3) VALUE SPACES.                  
           05 city-Avg OCCURS 5 TIMES.
               10 FILLER PIC X(6) VALUE SPACES.
               10 cityAvg PIC 99.9. 
               10 tempC PIC X.
               10 FILLER PIC X(7) VALUE SPACES.
                                
       procedure division.
       PROG.
           PERFORM DATA-PRESET.
           PERFORM INSTRUCT-PARA.
           PERFORM OUTER-LOOP-PARA.
           PERFORM DISPLAY-RESULTS-PARA.
           PERFORM END-PARA.
       

      * Here we set all the data to the default values.
      * City Names are populated here, as is... the C... for celsius. 
       DATA-PRESET.
           MOVE 5 TO loopNum *> Number of times to ask for Temps
           MOVE 'Montreal' TO cityName(1)
           MOVE 'Ottawa'   TO cityName(2)
           MOVE 'Toronto'  TO cityName(3)
           MOVE 'Kingston' TO cityName(4)
           MOVE 'Cornwall' TO cityName(5)
           MOVE 'C' TO tempC(1)
           MOVE 'C' TO tempC(2)    *> Yep, I know this is dumb.
           MOVE 'C' TO tempC(3)    *> But hey, Maybe City 4 uses
           MOVE 'C' TO tempC(4)    *> Fahrenheit... or Kelvin.
           MOVE 'C' TO tempC(5).   *>          ಠ_ಠ


      * This is just a welcome / splash screen on startup that
      * gives the user a bit of a heads up of what to expect.    
       INSTRUCT-PARA.
           display " "
           display " "
           DISPLAY "---------------------------------------------------"
           display "Welcome! This program will prompt you for"
           display "Temperatures! "
           display " "
           display "There's 5 cities [by default]." 
           display "We will ask for 5 temperatures for each city."
           display " "
           display "Once all of those numbers have been entered,"
           display "we will give you an average of those numbers."
           display " "
           display "Let's get started!"
           DISPLAY "---------------------------------------------------"
           display " ".


      * So this is the Outer Loop. 
      * I was kind of stumped on what to call it.
      * It handles moving from city to the next once the loop completes.
      *
      * This outer loop calls a screen clear method.
      * It also enters into the Inner Loop which is responsible for
      * entering the temperatures for each city.
       OUTER-LOOP-PARA.
       PERFORM loopNum TIMES   
           ADD outerLoopCount, 1, GIVING outerLoopCount
           MOVE cityName(outerLoopCount) TO tempCity
           
      * I could not for the life of me get "DISPLAY SPACE UPON CRT" to work
      * It would cause input to lock up, text to get overlayed. 
      * It was weird. I'll submit a screenshot of the terminal with this submission.
      * I tried a bunch of different methods to clear the screen, 
      * and this one finally worked from the link below by the user named Simon Sobisch:
      * https://stackoverflow.com/questions/39460424/how-to-clear-screen-and-set-cursor-position-to-the-end-of-the-screen-in-cobol
           PERFORM CLEAR-PARA            

           DISPLAY "Enter the last ", loopNum, " daily temperatures "-
                   "for ", tempCity
           DISPLAY " "        
           DISPLAY "Temperatures (one decimal place only): "
           
      * Enter the Inner loop to add in temperatures...     
           PERFORM INNER-LOOP-PARA        

           DIVIDE total BY loopNum GIVING cityAvg(outerLoopCount)
           MOVE 0 TO total
           MOVE 0 TO innerLoopCount
      * Debug, nothing to see here... 
      *     MOVE cityAvg(outerLoopCount) TO tempAvg
      *     DISPLAY " "
      *     DISPLAY tempCity," // ",tempAvg
       END-PERFORM. 
       


      * Here's the Inner Loop... We input Temps here.
       INNER-LOOP-PARA.
       PERFORM loopNum TIMES  
           ADD innerLoopCount, 1, GIVING innerLoopCount
           DISPLAY "Enter temperture #",innerLoopCount," : "
           WITH NO ADVANCING
           ACCEPT temperature
           ADD total, temperature GIVING total
       END-PERFORM.   



      * Here's the Final Results Section. Displays the output.
       DISPLAY-RESULTS-PARA.
           PERFORM CLEAR-PARA
           DISPLAY "Here are the average temperatures for cities in "-
                   "the area:"
           Display " "
           
      * I was excited to discover for loops... >_>
      * https://www.tutorialspoint.com/cobol/cobol_loop_statements.htm   
           PERFORM VARYING forLoopBABY FROM 1 by 1 UNTIL forLoopBABY > 5
           DISPLAY city-names(forLoopBABY) WITH NO ADVANCING
           END-PERFORM
           Display " "
           PERFORM VARYING forLoopBABY FROM 1 by 1 UNTIL forLoopBABY > 5
           DISPLAY city-Avg(forLoopBABY) WITH NO ADVANCING
           END-PERFORM
           Display " " .  


      * Simple Clear Screen Section. Used it twice. 
      * Worth its own section I think. 
       CLEAR-PARA.
           CALL 'SYSTEM' USING 'clear'.


      * Fancy End screen?
      * I Tried to get a press any key to continue thing,
      * but this is the best I can do for now :P
       END-PARA.                     
               DISPLAY " "
               DISPLAY "Press Enter to exit..."
               Accept pressKeyToEnd.
               STOP RUN.
      
       end program Assignment05.
