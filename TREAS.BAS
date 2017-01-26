DEFINT A-Z
' $DYNAMIC

TYPE chest
 Item AS INTEGER
 Quantity AS INTEGER
 Flags AS INTEGER
END TYPE

DECLARE FUNCTION FileOPEN% (FileName$, Mode$)
DECLARE FUNCTION READBIT% (Value%, Bit%)
DECLARE FUNCTION ItemName$ (Item%)
DECLARE SUB ChestOpened ()
DECLARE SUB EnsueBattle ()
DECLARE SUB SetInventory (Item%, Amount%)
DECLARE FUNCTION InInventory% (Item%)
DECLARE SUB TreasureShow ()

DIM SHARED Treasure(0 TO 0) AS chest

SUB ChestOpened
    COLOR 15
    LINE (0, 0)-(319, 31), totalback, BF
    LINE (0, 31)-(319, 31), 12
    LOCATE 1, 1
    PRINT "** EMPTY **"
    LOCATE 3, 40
    PRINT CHR$(254)
    PCOPY 2, 0
    SLEEP
    dmb$ = INKEY$
END SUB

SUB ChestsInit (FileName AS STRING)
    SHARED Treasure() AS chest
    fc% = FileOPEN(FileName, "B")
    GET fc%, , NumberOfChests%
    REDIM Treasure(0 TO NumberOfChests%) AS chest
    FOR i = 1 TO NumberOfChests%
        GET fc%, , Treasure(i)
    NEXT i
    CLOSE fc%
END SUB

SUB TreasureChest (trnum)
    'Open Flag
    IF READBIT%(Treasure(trnum).Flags, 0) THEN ChestOpened: EXIT SUB
    Treasure(trnum).Flags = Treasure(trnum).Flags OR 1
    'Battle Flag
    IF READBIT%(Treasure(trnum).Flags, 1) THEN
      COLOR 15
      LINE (0, 0)-(319, 31), totalback, BF
      LINE (0, 31)-(319, 31), 12: LOCATE 1, 1
      PRINT "You open the treasure chest"
      PRINT "and find..."
      PRINT "    ** MONSTER **"
      LOCATE 3, 40
      PRINT CHR$(254)
      PCOPY 2, 0
      SLEEP
      dmb$ = INKEY$
      cannotrun = 1
      EnsueBattle
      SCREEN 7, 0, 2, 0: COLOR 15: LINE (0, 0)-(319, 31), totalback, BF
      LINE (0, 31)-(319, 31), 12: LOCATE 1, 1
      PRINT "You look deeper into the chest"
      TreasureShow
      DO
        bbb$ = INKEY$
      LOOP UNTIL bbb$ = ""
      LOCATE 3, 40
      PRINT CHR$(254): PCOPY 2, 0: SLEEP: dmb$ = INKEY$
    ELSE
      COLOR 15
      LINE (0, 0)-(319, 31), totalback, BF
      LINE (0, 31)-(319, 31), 12
      LOCATE 1, 1
      PRINT "Found "; UCASE$(ItemName$(Treasure(trnum).Item)); " x";
      PRINT Treasure(trnum).Quantity

      PotentialInventoryAdjustment% = InInventory(Treasure(trnum).Item) + Treasure(trnum).Quantity
      
      IF PotentialInventoryAdjustment% > 99 THEN
          SetInventory Treasure(trnum).Item, 99
      ELSE
          SetInventory Treasure(trnum).Item, PotentialInventoryAdjustment%
      END IF
     

LOCATE 3, 40
PRINT CHR$(254)
PCOPY 2, 0
SLEEP
dmb$ = INKEY$
END IF
END SUB

SUB TreasureShow
      IF Treasure(trnum).Item = 0 THEN
        PRINT "but find nothing."
      ELSE
        PRINT "and find "; ItemName$(Treasure(trnum).Item); " x";
        PRINT Treasure(trnum).Quantity
        PotentialInventoryAdjustment% = InInventory(Treasure(trnum).Item) + Treasure(trnum).Quantity
      
        IF PotentialInventoryAdjustment% > 99 THEN
          SetInventory Treasure(trnum).Item, 99
        ELSE
          SetInventory Treasure(trnum).Item, PotentialInventoryAdjustment%
        END IF
      END IF

END SUB

