CLS
OPEN "input.txt" FOR INPUT AS 1
 DIM lineCount AS INTEGER
 lineCount = 0
DO WHILE NOT EOF(1)
  LINE INPUT #1, VALUE$
  lineCount = lineCount + 1
  
LOOP
CLOSE #1
PRINT lineCount
OPEN "input.txt" FOR INPUT AS 1
DIM numbers(lineCount) AS INTEGER
DIM index AS INTEGER
index = 1
DO WHILE NOT EOF(1)
  LINE INPUT #1, VALUE$
  numbers(index) = VAL(VALUE$)
  index = index + 1
LOOP

FOR i = 1 TO lineCount - 1
   FOR j = i + 1 TO lineCount
        IF numbers(i) + numbers(j) = 2020 THEN
                PRINT "FOUND IT!"
               
                PRINT numbers(i), numbers(j)
                DIM first AS LONG
                first = numbers(i)
                DIM second AS LONG
                second = numbers(j)
               
                PRINT first * second

        END IF
   NEXT j
NEXT i

