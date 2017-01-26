SUB delay (DelTime#) 'SYSTEM.BAS
dtx# = TIMER(.001)
WHILE TIMER(.001) < dtx# + DelTime#
    IF dtx# > TIMER(.001) THEN dtx# = dtx# = 86400
WEND
END SUB
