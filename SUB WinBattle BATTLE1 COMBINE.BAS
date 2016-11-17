SUB WinBattle
: IF totalexp = 0 THEN EXIT SUB
: COLOR 15
: LINE (0, 0)-(319, 31), 0, BF
: LINE (0, 31)-(319, 31), 12
: LOCATE 3, 40
: PRINT CHR$(26)
: PCOPY 6, 3
: LOCATE 1, 1
: PRINT "Gained"; totalexp;
: PRINT "experience!"
: GOSUB WWinKey
: FOR h = 1 TO 3
    IF curhp(h) > 0 THEN curexp(h) = curexp(h) + totalexp
    IF curexp(h) > 20000 THEN curexp(h) = 20000
: NEXT
: FOR h = 1 TO 3
     IF curlev(h) < 5 THEN
     IF curexp(h) >= levelup(curlev(h)) THEN
curlev(h) = curlev(h) + 1
dhp = INT(.2 * charstat(h, 1))
charstat(h, 1) = charstat(h, 1) + dhp
IF charstat(h, 1) > 9999 THEN charstat(h, 1) = 9999
curhp(h) = curhp(h) + dhp
IF curhp(h) > 9999 THEN curhp(h) = 9999
SELECT CASE h
CASE 1: PRINT "Kyta ";
CASE 2: PRINT "Glenlin ";
CASE 3: PRINT "Kohlen ";
END SELECT
PRINT "gained a level!"
IF h = 2 THEN
charstat(2, 2) = charstat(2, 2) + 50
curmp = curmp + 50
END IF
IF h = 2 AND maglearn(curlev(h)) > 0 THEN
spellsknown(maglearn(curlev(h))) = 1
PRINT "Learned "; UCASE$(mn$(maglearn(curlev(h)))); "!"
END IF
GOSUB WWinKey
END IF
END IF
NEXT: FOR gafl = 1 TO 4
IF gitm(gafl) > 0 THEN
exrt = INT(RND(1) * 100)
IF exrt < 10 THEN
inven(gitm(gafl)) = inven(gitm(gafl)) + 1
IF inven(gitm(gafl)) = 100 THEN inven(gitm(gafl)) = 99
PRINT "Found "; UCASE$(ItemName$(gitm(gafl))); "!"
GOSUB WWinKey
END IF
END IF
NEXT
curgold = curgold + totalgold
IF curgold > 9999 THEN curgold = 9999
PRINT "Received"; totalgold; "GP!": LOCATE 3, 40
PRINT CHR$(254): GOSUB WWinKey: EXIT SUB
WWinKey:
PCOPY 6, 0: SLEEP: dm$ = INKEY$
PCOPY 3, 6: LOCATE 1, 1: RETURN
END SUB
