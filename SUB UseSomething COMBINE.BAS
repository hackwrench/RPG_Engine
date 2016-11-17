SUB UseSomething
    CalcSomething dir, somethingup, somethingover

    IF DoActions% = TRUE THEN CALL Actions(MID$(curmap$(up + somethingup), over + somethingover, 1))
 IF MID$(curmap$(up + somethingup), over + somethingover, 1) = "ñ" THEN
    MID$(curmap$(up + somethingup), over + somethingover, 1) = "ò"
    GOTO DoneUsing
 END IF
 IF MID$(curmap$(up + somethingup), over + somethingover, 1) = "ò" THEN
  MID$(curmap$(up + somethingup), over + somethingover, 1) = "ñ": GOTO DoneUsing
 END IF
 IF MID$(curmap$(up + somethingup), over + somethingover, 1) = "ð" THEN
  MID$(curmap$(up + somethingup), over + somethingover, 1) = "ó": GOTO DoneUsing
 END IF
 IF MID$(curmap$(up + somethingup), over + somethingover, 1) = "ó" THEN
  MID$(curmap$(up + somethingup), over + somethingover, 1) = "ð": GOTO DoneUsing
 END IF
 IF MID$(curmap$(up + somethingup), over + somethingover, 1) = "|" THEN
  MID$(curmap$(up + somethingup), over + somethingover, 1) = "}": GOTO DoneUsing
 END IF
 IF MID$(curmap$(up + somethingup), over + somethingover, 1) = "}" THEN
  MID$(curmap$(up + somethingup), over + somethingover, 1) = "|": GOTO DoneUsing
 END IF
 IF MID$(curmap$(up + somethingup), over + somethingover, 1) = "õ" THEN
  MID$(curmap$(up + somethingup), over + somethingover, 1) = "ô": GOTO DoneUsing
 END IF
 IF MID$(curmap$(up + somethingup), over + somethingover, 1) = "ô" THEN
  MID$(curmap$(up + somethingup), over + somethingover, 1) = "õ": GOTO DoneUsing
 END IF


DoneUsing:
CALL DrawLevel


END SUB
