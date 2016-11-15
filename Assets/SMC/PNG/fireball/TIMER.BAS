$IF TIMERBAS = 0 THEN
$LET TIMERBAS = 1

TYPE TimedTriggerInstanceTYPE
StartTimer AS DOUBLE
TimerLength AS DOUBLE
END TYPE

SUB TimedTriggerCreateInstance(TimedTriggerInstance AS TimedTriggerInstanceTYPE, TriggerLength#)
TimedTriggerInstance.StartTimer = TIMER(.001)
TimedTriggerInstance.TimerLength = TriggerLength#
END SUB
FUNCTION TimedTriggerFired% (TimedTriggerInstance)
dtx# = TIMER(.001)
    IF dtx# < TimedTriggerInstance.StartTimer THEN dtx# = dtx# + 86400
IF dtx# - TimedTriggerInstance > TimedTriggerInstance.TimerLength THEN TimedTriggerFired% = -1
END FUNCTION
$END IF
