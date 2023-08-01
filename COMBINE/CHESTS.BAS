DEFINT A-Z
   
TYPE Chest
 Item AS INTEGER
 Quantity AS INTEGER
 Flags AS INTEGER
END TYPE
DIM Treasure(1 TO 6)  AS Chest
    'TreasureChest (trnum, fght, itmnum, quan)
    'IF Surrounding("a") THEN TreasureChest 1, 0, 1, 10
    Treasure(1).Item = 1
    Treasure(1).Quantity = 10
    'IF Surrounding("b") THEN TreasureChest 2, 0, 2, 10
    Treasure(2).Item = 2
    Treasure(2).Quantity = 10
    'IF Surrounding("c") THEN TreasureChest 3, 0, 16, 1
    Treasure(3).Item = 16
    Treasure(3).Quantity = 1
   
    'IF Surrounding("d") THEN TreasureChest 4, 0, 18, 1
    Treasure(4).Item = 18
    Treasure(4).Quantity = 1

    'IF Surrounding("v") THEN
    '  SetBattle 1, 5: TreasureChest 5, 1, 0, 0
    'END IF
    Treasure(5).Item = 0
    Treasure(5).Quantity = 0
    Treasure(5).Flags = 2
    'IF Surrounding("V") THEN
    '  SetBattle 1, 4: SetBattle 2, 5: TreasureChest 6, 1, 5, 1
    Treasure(6).Item = 5
    Treasure(6).Quantity = 1
    Treasure(6).Flags = 2

    'ND IF

    OPEN "TLDEMO.TRA" FOR BINARY AS #1
    Temp% = 6
    PUT 1, , Temp%
    FOR i = 1 TO 6
      PUT 1, , Treasure(i)
    NEXT i

