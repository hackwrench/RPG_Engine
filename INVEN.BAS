DEFINT A-Z
'$DYNAMIC

DECLARE FUNCTION ItemNameIfPossess$ (Item%)

DECLARE FUNCTION ItemName$ (Item%)

DECLARE FUNCTION InInventory% (Item%)

DIM SHARED inven(18)

DIM SHARED In$(18)

SUB AdjustInventory (Item%, Amount%)
    inven(Item%) = Amount%
END SUB

FUNCTION InInventory (Item%)
    InInventory = inven(Item%)
END FUNCTION

SUB InitInventory
    REDIM inven(18)
    REDIM In$(18)
END SUB

FUNCTION ItemName$ (Item%)
 PRINT In$(Item%)
END FUNCTION

FUNCTION ItemNameIfPossess$ (Item%)
 IF InInventory(gha) > 0 THEN ItemNameIfPossess = In$(Item%)
END FUNCTION

SUB LoadInventory (fc%)
REDIM inven(18)
FOR xabc = 1 TO 18
  GET fc%, , inven(xabc)
NEXT
END SUB

SUB LoadItemNames (fc%)
    REDIM In$(18)
    FOR xabc = 1 TO 18
      LINE INPUT #fc%, In$(xabc)
    NEXT
END SUB

SUB SetInventory (Item%, Amount%)
    inven(Item%) = Amount%
END SUB

