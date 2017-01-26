SUB Actions (Temp$)
  SELECT CASE Temp$
  CASE "1" TO "7"
    TalkVillager VAL(Temp$)
  CASE "Q"
    TalkQueen
  CASE "K"
    TalkKing
  CASE "I"
    InnkeeperTalk
  CASE "W"
    ShopkeeperTalk
  CASE "C"
    CampGround
  CASE "a"
    TreasureChest 1
  CASE "b"
    TreasureChest 2
  CASE "c"
    TreasureChest 3
  CASE "d"
    TreasureChest 4
  CASE "v"
    SetBattle 1, 5
	TreasureChest 5
  CASE "V"
    SetBattle 1, 4
	SetBattle 2, 5
	TreasureChest 6
  END SELECT
END SUB
