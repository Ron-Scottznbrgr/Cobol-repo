      ******************************************************************
      *AUTHOR:      Ron Scott                                          *
      *STUDENT-ID:  041100494                                          *
      *DATE:        OCTOBER 23 2023                                    *
      ******************************************************************
       identification division.
       program-id. Assignment06.
       
       environment division.
       INPUT-OUTPUT SECTION.
      
      * I could NOT get the files to read from C:\Datafiles\...
      * I don't know if it the way my terminal is set up, or what.
      * I made sure the path was correct... 
      * I'm guessing the file has to be in the Ubuntu install that
      *    The terminal accesses? That's the only thing I can think
      *    of and I don't know how to do that.
      * The Program works otherwise. I put the files in a "DataFiles"
      *    Subfolder to show that I can navigate a file system.
      *    I'm truly confused as to why it doesn't seem to want to 
      *    go into the C:\Datafiles folder I made. Pictures attached.
      *    Error Pictures 1-3
      *
      * Additionally, all of my output files seem to have a couple of
      *    leading NULL characters whenever I write to file...
      * It doesn't matter what I write, or where, the data is always
      *    preceded by [NULL][?][NULL][NULL].
      * The [?] character seems to be random, and based off of the
      *    PIC value of the field. Again, no idea what's going on here.
      *    Error Pictures 4-5

       FILE-CONTROL.
           SELECT INFILE ASSIGN 
           "DataFiles\Assignment#6_WeeklySalaryDataFile.dat"
           ORGANIZATION IS LINE SEQUENTIAL.

      * This File is only for Emps with Job Code S and Sales > 100,000
           SELECT OUTGIFT ASSIGN "DataFiles\SalespersonRecognition.rpt".

      * This File is for all Emps, reports Salary Expenses by store#
           SELECT OUTSALARY ASSIGN "DataFiles\SalaryExpense.rpt".


           
       DATA DIVISION.
       FILE SECTION.
       FD INFILE.
       01 InRec.
           03  In-EmpID           PIC 9(4).
           03  In-EmpJobCode      PIC A.
           03  In-EmpLastName     PIC A(14).
           03  In-EmpFirstName    PIC A(14).
           03  In-EmpStartDate    PIC 9(8).
           03  In-EmpStoreNumber  PIC 9(4).
           03  In-EmpWeeklySalary PIC 9999V99 value 0.00.
           03  In-EmpSalesAmount  PIC 9(8).

       FD OUTGIFT.
       01 Gift-Header                  PIC X(52).
       01 OutGiftRec.
           03  Out-EmpLastName         PIC A(14).
           03  Out-EmpFirstName        PIC A(14).
           03  Out-EmpStoreNumber      PIC 9(4).

       FD OUTSALARY.
       01 Salary-Header            PIC X(52).
       01 Salary-MinorHeader       PIC X(15).
       01  Out-Store1_M_Total      PIC 9999.99 value 0.
       01  Out-Store1_S_Total      PIC 9999.99 value 0.
       01  Out-Store1_A_Total      PIC 9999.99 value 0.
       01  Out-Store1_C_Total      PIC 9999.99 value 0.
       01  Out-Store2_M_Total      PIC 9999.99 value 0.
       01  Out-Store2_S_Total      PIC 9999.99 value 0.
       01  Out-Store2_A_Total      PIC 9999.99 value 0.
       01  Out-Store2_C_Total      PIC 9999.99 value 0.
       01  Out-Store3_M_Total      PIC 9999.99 value 0.
       01  Out-Store3_S_Total      PIC 9999.99 value 0.
       01  Out-Store3_A_Total      PIC 9999.99 value 0.
       01  Out-Store3_C_Total      PIC 9999.99 value 0.

       working-storage section.
       01 ws-pressKeyToEnd     PIC X.
       01 ws-output-header     PIC X(90).
       01 ws-output-blank      PIC X value SPACE.
       01 ws-record-count      PIC 9(4) value 0.
       01 ws-inSAL             PIC 9999999.99.
       01 ws-outSAL            PIC 9999999.99.
       01  ws-Salary              PIC 9999999V99 value 0.
       01  ws-JobCode             PIC A.
       01  ws-Store1_M_Total      PIC 9999999V99 value 0.
       01  ws-Store1_S_Total      PIC 9999999V99 value 0.
       01  ws-Store1_A_Total      PIC 9999999V99 value 0.
       01  ws-Store1_C_Total      PIC 9999999V99 value 0.
       01  ws-Store2_M_Total      PIC 9999999V99 value 0.
       01  ws-Store2_S_Total      PIC 9999999V99 value 0.
       01  ws-Store2_A_Total      PIC 9999999V99 value 0.
       01  ws-Store2_C_Total      PIC 9999999V99 value 0.
       01  ws-Store3_M_Total      PIC 9999999V99 value 0.
       01  ws-Store3_S_Total      PIC 9999999V99 value 0.
       01  ws-Store3_A_Total      PIC 9999999V99 value 0.
       01  ws-Store3_C_Total      PIC 9999999V99 value 0.
       01 ws-EOF                  PIC 9 value 0.
           88 EOF value 1.
   

       procedure division.
       PROG.
           PERFORM DATA-PRESET.
           PERFORM INSTRUCT-PARA.
           PERFORM FILE-DISPLAY UNTIL EOF.
           PERFORM FILE-WRITE-SALARY.
           PERFORM END-PARA.
             
       DATA-PRESET.
           OPEN INPUT INFILE.
           OPEN OUTPUT OUTGIFT.
           
           MOVE "Employee recognition for the week ending: 2023-10-23"
           TO Gift-Header
           WRITE Gift-Header.

           MOVE "----------------------------------------------------"
           TO Gift-Header
           WRITE Gift-Header AFTER ADVANCING 2.

           MOVE "Last Name     First Name    Store #                 "
           TO Gift-Header
           WRITE Gift-Header AFTER ADVANCING 1.

           MOVE "----------------------------------------------------"
           TO Gift-Header
           WRITE Gift-Header AFTER ADVANCING 1.
      *     CLOSE OUTGIFT.

       INSTRUCT-PARA.
           display " "
           display " "
           DISPLAY "---------------------------------------------------"
           display "Welcome! This program will take input from a file."
           display "> DataFiles\Assignment#6_WeeklySalaryDataFile.dat"
           display " "
           display "It will display the data to the screen. [Ex1]"
           display " "
           display "It will then take all Salespeople's Data with over"
           display "$100,000 in sales, and write those individuals to"
           display "file. They will recieve a gift later. [Ex3]"
           display "> DataFiles\SalespersonRecognition.rpt."
           display " "
           display "Finally, it will total up all of the employee's"
           display "Salaries for each store, break it down into "
           display "Job Types, and write the totals to file, by store,"
           display "as per instructions. [Ex4]"
           display "> DataFiles\SalaryExpense.rpt"
           DISPLAY "---------------------------------------------------"
           display " "
           PERFORM CONTINUE-PARA.
      
       
      * This is called until EOF is reached... 
       FILE-DISPLAY.
           Perform FILE-READ.
       
      * Reads the Data File.
      * While we are here, we also do the Gift Output, since the 
      *    data is already being accessed. 
       FILE-READ.
           READ INFILE
               AT END
                   SET EOF to true
                   SET ws-EOF TO 1
           END-READ

      
           IF ws-EOF = 0
      * Display Record as per Excercise 1     
               display InRec
           END-IF

      

      * Begin Gift Output, as per Excercise 3
           IF In-EmpJobCode = "S" AND In-EmpSalesAmount >= 100000
               Perform FILE-WRITE-GIFT        
           END-IF
      
      * The program doesn't like adding Ins to Outs, so...
      *    We use some Temp variables to add them together.
      *    I dunno. It was acting strange.
           MOVE In-EmpWeeklySalary TO ws-Salary
           MOVE In-EmpJobCode TO ws-JobCode
      
      *    Begin Excercise 4.
           PERFORM TOTAL-SALARY.
        

      * Excercise 2
       FILE-WRITE-GIFT.
           MOVE In-EmpLastName TO Out-EmpLastName
           MOVE In-EmpFirstName TO Out-EmpFirstName
           MOVE In-EmpStoreNumber TO Out-EmpStoreNumber
           WRITE OutGiftRec AFTER ADVANCING 1.               

      * Adds up the values as they come in.
      * Broken down by Emp Store, and then Emp Job Code.
       TOTAL-SALARY.
           IF In-EmpStoreNumber = 1
               IF ws-JobCode = "A"
                  ADD ws-Salary, ws-Store1_A_Total
                  GIVING ws-Store1_A_Total
               ELSE IF ws-JobCode = "C"
                  ADD ws-Salary, ws-Store1_C_Total
                  GIVING ws-Store1_C_Total
               ELSE IF ws-JobCode = "M"
                  ADD ws-Salary, ws-Store1_M_Total
                  GIVING ws-Store1_M_Total  
               ELSE IF ws-JobCode = "S"
                  ADD ws-Salary, ws-Store1_S_Total
                  GIVING ws-Store1_S_Total  
               END-IF
           
           ELSE IF In-EmpStoreNumber = 2
               IF ws-JobCode = "A"
                  ADD ws-Salary, ws-Store2_A_Total
                  GIVING ws-Store2_A_Total
               ELSE IF ws-JobCode = "C"
                  ADD ws-Salary, ws-Store2_C_Total
                  GIVING ws-Store2_C_Total
               ELSE IF ws-JobCode = "M"
                  ADD ws-Salary, ws-Store2_M_Total
                  GIVING ws-Store2_M_Total  
               ELSE IF ws-JobCode = "S"
                  ADD ws-Salary, ws-Store2_S_Total
                  GIVING ws-Store2_S_Total  
               END-IF

           ELSE IF In-EmpStoreNumber = 3
               IF ws-JobCode = "A"
                  ADD ws-Salary, ws-Store3_A_Total
                  GIVING ws-Store3_A_Total
               ELSE IF ws-JobCode = "C"
                  ADD ws-Salary, ws-Store3_C_Total
                  GIVING ws-Store3_C_Total
               ELSE IF ws-JobCode = "M"
                  ADD ws-Salary, ws-Store3_M_Total
                  GIVING ws-Store3_M_Total  
               ELSE IF ws-JobCode = "S"
                  ADD ws-Salary, ws-Store3_S_Total
                  GIVING ws-Store3_S_Total   
               END-IF
           END-IF.

       
       DEBUG-OUTPUT.
      * Things weren't being added properly. 
      *    I included this to help myself figure out what was
      *    happening.
           
               display "Begin Output Test - OUT"
               display Out-Store1_M_Total
               display Out-Store1_S_Total
               display Out-Store1_A_Total
               display Out-Store1_C_Total
           
               display Out-Store2_M_Total
               display Out-Store2_S_Total
               display Out-Store2_A_Total
               display Out-Store2_C_Total
           
               display Out-Store3_M_Total
               display Out-Store3_S_Total
               display Out-Store3_A_Total
               display Out-Store3_C_Total

               display "Begin Output Test - WS"
               display ws-Store1_M_Total
               display ws-Store1_S_Total
               display ws-Store1_A_Total
               display ws-Store1_C_Total
           
               display ws-Store2_M_Total
               display ws-Store2_S_Total
               display ws-Store2_A_Total
               display ws-Store2_C_Total
       
               display ws-Store3_M_Total
               display ws-Store3_S_Total
               display ws-Store3_A_Total
               display ws-Store3_C_Total.

      * Part 2 of Excercise 4... Writing to File.
       FILE-WRITE-SALARY.      
           OPEN OUTPUT OUTSALARY.
           
           MOVE "Salary expense for the week ending: 2023-10-23"
           TO Salary-Header
           WRITE Salary-Header
      ***********************************************Store 1
           MOVE "STORE #1" TO Salary-MinorHeader
           WRITE Salary-MinorHeader AFTER ADVANCING 2

           MOVE "Management:" TO Salary-MinorHeader
           WRITE Salary-MinorHeader AFTER ADVANCING 1
           MOVE ws-Store1_M_Total TO Out-Store1_M_Total
           WRITE Out-Store1_M_Total

           MOVE "Sales     :" TO Salary-MinorHeader
           WRITE Salary-MinorHeader AFTER ADVANCING 1
           MOVE ws-Store1_S_Total TO Out-Store1_S_Total
           WRITE Out-Store1_S_Total

           MOVE "Admin     :" TO Salary-MinorHeader
           WRITE Salary-MinorHeader AFTER ADVANCING 1
           MOVE ws-Store1_A_Total TO Out-Store1_A_Total
           WRITE Out-Store1_A_Total
           
           MOVE "Custodial :" TO Salary-MinorHeader
           WRITE Salary-MinorHeader AFTER ADVANCING 1
           MOVE ws-Store1_C_Total TO Out-Store1_C_Total
           WRITE Out-Store1_C_Total
      ***********************************************Store 2
           MOVE "STORE #2" TO Salary-MinorHeader
           WRITE Salary-MinorHeader AFTER ADVANCING 2

           MOVE "Management:" TO Salary-MinorHeader
           WRITE Salary-MinorHeader AFTER ADVANCING 1
           MOVE ws-Store2_M_Total TO Out-Store2_M_Total
           WRITE Out-Store2_M_Total

           MOVE "Sales     :" TO Salary-MinorHeader
           WRITE Salary-MinorHeader AFTER ADVANCING 1
           MOVE ws-Store2_S_Total TO Out-Store2_S_Total
           WRITE Out-Store2_S_Total

           MOVE "Admin     :" TO Salary-MinorHeader
           WRITE Salary-MinorHeader AFTER ADVANCING 1
           MOVE ws-Store2_A_Total TO Out-Store2_A_Total
           WRITE Out-Store2_A_Total
           
           MOVE "Custodial :" TO Salary-MinorHeader
           WRITE Salary-MinorHeader AFTER ADVANCING 1
           MOVE ws-Store2_C_Total TO Out-Store2_C_Total
           WRITE Out-Store2_C_Total
      ***********************************************Store 3
           MOVE "STORE #3" TO Salary-MinorHeader
           WRITE Salary-MinorHeader AFTER ADVANCING 2

           MOVE "Management:" TO Salary-MinorHeader
           WRITE Salary-MinorHeader AFTER ADVANCING 1
           MOVE ws-Store3_M_Total TO Out-Store3_M_Total
           WRITE Out-Store3_M_Total

           MOVE "Sales     :" TO Salary-MinorHeader
           WRITE Salary-MinorHeader AFTER ADVANCING 1
           MOVE ws-Store3_S_Total TO Out-Store3_S_Total
           WRITE Out-Store3_S_Total

           MOVE "Admin     :" TO Salary-MinorHeader
           WRITE Salary-MinorHeader AFTER ADVANCING 1
           MOVE ws-Store3_A_Total TO Out-Store3_A_Total
           WRITE Out-Store3_A_Total
           
           MOVE "Custodial :" TO Salary-MinorHeader
           WRITE Salary-MinorHeader AFTER ADVANCING 1
           MOVE ws-Store3_C_Total TO Out-Store3_C_Total
           WRITE Out-Store3_C_Total

           CLOSE OUTSALARY.

      * Small PARA to have a "Press to continue function"
       CONTINUE-PARA.
           DISPLAY " "
           DISPLAY "Press Enter to continue..."
           Accept ws-pressKeyToEnd.

      * Same as the continue PARA but kills the program, and cleans up
      *    anything else that needs it, like closing file streams.
       END-PARA.                     
               CLOSE INFILE.
               CLOSE OUTGIFT.
      *        OUT SALARY IS CLOSED IN IT'S OWN PARA.          
               DISPLAY " "
               DISPLAY "Press Enter to exit..."
               Accept ws-pressKeyToEnd.
               STOP RUN.
      
       end program Assignment06.
