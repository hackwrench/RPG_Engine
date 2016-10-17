DEFINT A-Z
DECLARE SUB correlate (X$, Y$)
 
 OPEN "USES1.TAB " FOR BINARY AS 1

 CALL correlate("ñ", "ò")
 CALL correlate("ò", "ñ")
 
 CALL correlate("ð", "ó")
 
 CALL correlate("ó", "ð")
 
 CALL correlate("|", "}")
 
 CALL correlate("}", "|")
 
 CALL correlate("õ", "ô")
 
 CALL correlate("ô", "õ")
 
CLOSE

SUB correlate (X$, Y$)
    SEEK 1, ASC(X$) + 1
    PRINT ASC(X$); ASC(Y$)
    PUT 1, , Y$
END SUB

