DEFINT A-Z
DECLARE SUB correlate (X$, Y$)
 
 OPEN "USES1.TAB " FOR BINARY AS 1

 CALL correlate("�", "�")
 CALL correlate("�", "�")
 
 CALL correlate("�", "�")
 
 CALL correlate("�", "�")
 
 CALL correlate("|", "}")
 
 CALL correlate("}", "|")
 
 CALL correlate("�", "�")
 
 CALL correlate("�", "�")
 
CLOSE

SUB correlate (X$, Y$)
    SEEK 1, ASC(X$) + 1
    PRINT ASC(X$); ASC(Y$)
    PUT 1, , Y$
END SUB

