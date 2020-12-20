DECLARE FUNCTION SEARCH% (values() AS INTEGER, value%, length%)
DECLARE SUB SWAPVALS (values() AS INTEGER, i%, j%)
DECLARE SUB QUICKSORT (values() AS INTEGER, l%, r%)
DECLARE FUNCTION PARTITION% (values() AS INTEGER, l%, r%)
CLS
OPEN "input.txt" FOR INPUT AS 1
 DIM lineCount AS INTEGER
 lineCount = 0
DO WHILE NOT EOF(1)
  LINE INPUT #1, value$
  lineCount = lineCount + 1
  
LOOP
CLOSE #1
PRINT lineCount
OPEN "input.txt" FOR INPUT AS 1
DIM numbers(lineCount) AS INTEGER
DIM index AS INTEGER
index = 1
DO WHILE NOT EOF(1)
  LINE INPUT #1, value$
  numbers(index) = VAL(value$)
  index = index + 1
LOOP

CALL QUICKSORT(numbers(), 0, lineCount - 1)

FOR i = 1 TO lineCount - 1
      val1% = numbers(i)
      val2% = 2020 - val1%
      IF SEARCH(numbers(), val2%, lineCount - 1) > -1 THEN
            PRINT "FOUND IT!"
            PRINT val1%, val2%
            longVal1& = val1%
            longVal2& = val2%
            PRINT longVal1& * longVal2&
            EXIT FOR
      END IF
NEXT i

FUNCTION PARTITION% (values() AS INTEGER, l%, r%)
q% = l%
j% = l%
pivotVal% = values(r%)

DO WHILE j% < r%
  IF values(j%) > pivotVal% THEN
        j% = j% + 1
  ELSE
        CALL SWAPVALS(values(), j%, q%)
        j% = j% + 1
        q% = q% + 1
  END IF
LOOP

CALL SWAPVALS(values(), r%, q%)

PARTITION% = q%

END FUNCTION

SUB QUICKSORT (values() AS INTEGER, l%, r%)
      
        IF l% < r% - 1 THEN
                q% = PARTITION(values(), l%, r%)
                CALL QUICKSORT(values(), l%, q% - 1)
                CALL QUICKSORT(values(), q% + 1, r%)
        END IF
END SUB

FUNCTION SEARCH% (values() AS INTEGER, value%, length%)
        l% = 0
        r% = length% - 1
        
        DO WHILE l% < r%
                mid% = (l% + r%) / 2
                IF values(mid%) < value% THEN
                        l% = mid% + 1
                ELSEIF values(mid%) > value% THEN
                        r% = mid% - 1
                ELSE
                        SEARCH% = mid%
                        EXIT FUNCTION
                END IF
        LOOP
        SEARCH% = -1
END FUNCTION

SUB SWAPVALS (values() AS INTEGER, i%, j%)
        temp% = values(j%)
        values(j%) = values(i%)
        values(i%) = temp%
END SUB

