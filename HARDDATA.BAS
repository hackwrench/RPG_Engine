DEFINT A-Z


DIM SHARED etype(5, 13), ename$(5)

DIM SHARED inven(18), in$(18), inprop(18)
DIM SHARED charstat(3, 4), curhp(3), curgold, curmp, ErrorLevel
DIM SHARED mpused(12), levelup(4), curexp(3), curlev(3), equip(3, 2)
DIM SHARED spellsknown(12), mapnumber, enemyat(4), cannotrun
DIM SHARED weak(5), strn(5), maglearn(2 TO 5), magdata(12, 2)
DIM SHARED canequip(3, 4), chosen(3, 3), power(6 TO 17, 2)
DIM SHARED ehit(4), totalexp, totalgold, gitm(4), walled(4)


FOR xabc = 1 TO 18: READ inven(xabc): NEXT
OPEN "TLDEMO.GAS" FOR BINARY AS 1
FOR xabc = 1 TO 18: PUT 1, , inven(xabc): NEXT
CLOSE
FOR xabc = 1 TO 18: READ in$(xabc): NEXT
FOR xa = 1 TO 3: FOR bc = 1 TO 2: READ equip(xa, bc): NEXT: NEXT
FOR xa = 1 TO 3: FOR bc = 1 TO 4: READ canequip(xa, bc): NEXT: NEXT
FOR xa = 1 TO 3: FOR bc = 1 TO 4: READ charstat(xa, bc): NEXT: NEXT
FOR xabc = 1 TO 3: curhp(xabc) = charstat(xabc, 1): NEXT
FOR xa = 1 TO 2: FOR bc = 6 TO 17: READ power(bc, xa): NEXT: NEXT
FOR xabc = 1 TO 12: READ spellsknown(xabc): NEXT
FOR xabc = 1 TO 12: READ mpused(xabc): NEXT
FOR xabc = 2 TO 5: READ maglearn(xabc): NEXT
FOR xabc = 1 TO 12: READ magdata(xabc, 1): READ magdata(xabc, 2): NEXT
FOR xabc = 1 TO 5: READ ename$(xabc): NEXT
FOR xabc = 1 TO 5: READ weak(xabc): READ strn(xabc): NEXT
FOR xa = 1 TO 5
   FOR bc = 1 TO 13
     READ etype(xa, bc)
   NEXT
NEXT
FOR xabc = 1 TO 4: READ levelup(xabc): NEXT

DATA 10,10,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
DATA "Shruiken","Ninja Star","Phaser","Spazer","Wide Beam"
DATA "Sword","Staff","Murasame","Dagger","Wand","Machete"
DATA "Chain Mail","Robes","Turtle Hide","Plate Mail"
DATA "Guru Cloak","Ninja Suit","Tent",9,12,10,13,11,14
DATA 6,9,12,15,7,10,13,16,8,11,14,17
'Data for character status
DATA 5467,0,107,95,3489,100,57,78,7886,0,99,97
'Data for weapon/armor power/price
DATA 182,109,203,107,57,99,95,78,97,137,255,151
DATA 1000,500,750,200,100,250,100,50,200,1000,15000,2000
'Data for magic
DATA "Cure","Heal","Fire","Ice","Lightning","Tremor","Drown"
DATA "Wall","Life","Quake","Phase","TidalWave"
DATA 1,1,1,1,1,1,1,1,1,0,0,0,5,8,7,7,7,10,10,6,15,20,40,40
DATA 10,11,12,0,6,0,6,1,1,0,2,0,3,0,5,0,4,0,7,0,8,0,5,1
DATA 0,1,4,1
'Data for enemies
DATA 5,3,3,5,4,3,1,5,2,1
DATA 210,50,25,0,0,1,1,0,0,0,100,150,0
DATA 500,10,5,1,1,0,0,1,0,0,200,250,1
DATA 190,50,200,1,0,1,1,0,0,0,200,500,7
DATA 500,75,25,1,1,1,0,1,1,0,350,750,2
DATA 1000,50,100,1,1,1,1,1,1,1,750,1500,18
'Data for level-ups
DATA 500,1500,4000,10000

