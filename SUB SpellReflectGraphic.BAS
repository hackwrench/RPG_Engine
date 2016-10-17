SUB SpellReflectGraphic (ex%, ey%, Speed!)
PCOPY 3, 6
FOR gjkl = 1 TO 15
    LINE (ex%, ey% + gjkl)-(ex% + 20, ey% + gjkl + 10), gjkl
NEXT
PCOPY 6, 0
delay Speed!
END SUB
