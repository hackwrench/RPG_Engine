TYPE FireballGlobals
FireballGraphic1 AS LONG
FireballGraphic2 AS LONG
FireballGraphic3 AS LONG
END TYPE
TYPE FireballInstanceTYPE
Graphic1Delay AS DOUBLE
Graphic2Delay
Graphic3Delay
CurrentTimerTrigger AS DOUBLE
END TYPE
SUB Fireball.Load
SHARED FireballGlobal AS FireballGlobals
FireballGlobals.FireballGraphic1 = _LOADIMAGE&("1.png")
FireballGlobals.FireballGraphic2 = _LOADIMAGE&("2.png")
FireballGlobals.FireballGraphic3 = _LOADIMAGE&("3.png")

END SUB
SUB Fireball.CreateInstance
END SUB