Check A32F2450
Auto 8224

# Run-time Variables

Var a: Num = 1
Var b: Num = 10
Var n: NumFOR = 6, 10, 1, 7010, 2
Var f: NumFOR = 8, 7, 1, 6015, 2
Var p$: Str = "b"

# End Run-time Variables

   1 RUN 10
  10 REM -------------------------------------------------------- ZX DUNGEON ---------------------------------------------
  11 REM CODED BY BARRETT OTTE 2017 WITH HELP FROM BASin MANUAL AND ZX SPECTRUM GAMES CODE CLUB BOOK
  12 REM CREATED FOR THE ZX SPECTRUM GAME JAM ON ITCH.IO
  13 REM STARTED:  06-03-2017
  14 REM FINISHED: 06-09-2017
  30 INK 6: PAPER 0: BORDER 0: BRIGHT 1: CLS
  40 GO SUB 6000
  49 REM -------------------------------------------------------- TITLE SCREEN -------------------------------------------
  50 PRINT AT 2,10; INK 4; BRIGHT 1; PAPER 0;"ZX DUNGEON": PRINT AT 4,6; INK 4;"ZX SPECTRUM GAME JAM": PRINT AT 6,7; INK 4;"BARRETT OTTE 2017"
  55 PRINT AT 2,7; INK 5;CHR$ (144)
  56 PRINT AT 2,22; INK 2;CHR$ (145)
  60 PRINT AT 9,5; INK 4;"Collect all the gold before"
  65 PRINT AT 10,5; INK 4;"  the dungeon closes!"
  70 PRINT AT 12,10; INK 4;"W-UP";AT 13,10;"S-DOWN";AT 14,10;"A-LEFT";AT 15,10;"D-RIGHT"
  75 GO SUB 7000
  80 PRINT AT 19,3; INK 4; FLASH 1;"PRESS ANY KEY TO CONTINUE": PAUSE 0: CLS : RANDOMIZE : INK 0
 110 GO SUB 300
 130 GO SUB 1000
 140 GO SUB 2000
 300 REM -------------------------------------------------------- VARIABLE DECLARATION ----------------------------------
 305 LET score=0: LET max=0
 310 LET x=7: LET y=17: LET dy=0: LET dx=0: LET time=120
 320 LET g$=".": LET enemyY=4: LET enemyX=2
 330 LET dx1=0: LET dy1=0
 400 RETURN
1000 REM -------------------------------------------------------- SCREEN SETUP ------------------------------------------
1010 CLS : INK 7: PAPER 0: PRINT INK 4;AT 0,10;"ZX DUNGEON": RANDOMIZE
1011 INK 0
1012 LET r=INT (RND*3)+1
1013 IF r=2 THEN GO TO 1200
1014 IF r=3 THEN GO TO 1350
1020 PRINT AT 03,0;"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
1030 PRINT AT 04,0;"X                             X"
1040 PRINT AT 05,0;"X  XXX  XXX  X  XXXXXXX       X"
1050 PRINT AT 06,0;"X  X      X  X  X     X  X    X"
1060 PRINT AT 07,0;"X  X      X  X        X  X    X"
1070 PRINT AT 08,0;"X  X      X           X       X"
1080 PRINT AT 09,0;"X  XXXXX  X  X  XXXX  X       X"
1090 PRINT AT 10,0;"X            X                X"
1100 PRINT AT 11,0;"XXXXXXXXX    X        XXXXXXXXX"
1110 PRINT AT 12,0;"X                             X"
1120 PRINT AT 13,0;"X       XXX                   X"
1130 PRINT AT 14,0;"X                             X"
1140 PRINT AT 15,0;"X   XX       X   XXXXXXX   XXXX"
1150 PRINT AT 16,0;"X            X                X"
1160 PRINT AT 17,0;"X       XXX  X                X"
1170 PRINT AT 18,0;"X                             X"
1180 PRINT AT 19,0;"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
1190 GO TO 1500
1200 PRINT AT 03,0;"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
1210 PRINT AT 04,0;"X     X       X       X       X"
1220 PRINT AT 05,0;"X             X               X"
1230 PRINT AT 06,0;"X             X               X"
1240 PRINT AT 07,0;"X             X               X"
1250 PRINT AT 08,0;"X     XXXXXXXXXXXXXXXXXXX   XXX"
1260 PRINT AT 09,0;"X                             X"
1270 PRINT AT 10,0;"X                             X"
1280 PRINT AT 11,0;"X                             X"
1290 PRINT AT 12,0;"XXXXXXX   XXX   XXX   XXX   XXX"
1295 PRINT AT 13,0;"X     X   X       X   X       X"
1300 PRINT AT 14,0;"X         X       X   X       X"
1305 PRINT AT 15,0;"X         X       X   X       X"
1310 PRINT AT 16,0;"X         X       X   X       X"
1315 PRINT AT 17,0;"X         X       X   X       X"
1320 PRINT AT 18,0;"X     X   X       X   X       X"
1325 PRINT AT 19,0;"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
1330 GO TO 1500
1350 PRINT AT 03,0;"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
1355 PRINT AT 04,0;"X                        x    X"
1360 PRINT AT 05,0;"X     xxx                x    X"
1365 PRINT AT 06,0;"X                        x    X"
1370 PRINT AT 07,0;"X   xx   xxxxxxxxxxxxxxxxx xx X"
1375 PRINT AT 08,0;"X   x                    x    X"
1380 PRINT AT 09,0;"X   x                    x    X"
1385 PRINT AT 10,0;"X   x  xxxxxxxxxxxxxxx   x    X"
1390 PRINT AT 11,0;"X x x  x             x   x    X"
1395 PRINT AT 12,0;"X x x  x             x   x    X"
1400 PRINT AT 13,0;"X x x      xxxxxx        x    X"
1405 PRINT AT 14,0;"X   x                    x    X"
1410 PRINT AT 15,0;"X   xxxxxxxxxxxxxxxxx   xx    X"
1415 PRINT AT 16,0;"X                             X"
1420 PRINT AT 17,0;"X                             X"
1425 PRINT AT 18,0;"X                             X"
1430 PRINT AT 19,0;"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
1500 INK 7
1510 FOR n=3 TO 19
1520 FOR m=0 TO 30
1530 IF SCREEN$ (n,m)="X" THEN PRINT AT n,m; PAPER 4; INK 4;"X"
1540 IF SCREEN$ (n,m)=" " THEN PRINT AT n,m; INK 6;".": LET max=max+1
1550 NEXT m: NEXT n
2000 REM -------------------------------------------------------- MAIN GAME LOOP -----------------------------------------
2010 LET i$=INKEY$
2110 IF i$="w" THEN LET dy=-1: LET dx=0
2120 IF i$="s" THEN LET dy=1: LET dx=0
2130 IF i$="a" THEN LET dx=-1: LET dy=0
2140 IF i$="d" THEN LET dx=1: LET dy=0
2190 IF SCREEN$ (y+dy,x+dx)<>"X" THEN PRINT AT y,x;" ": LET x=x+dx: LET y=y+dy
2195 LET y$=SCREEN$ (y,x)
2200 IF y$="." THEN LET score=score+1: LET time=time+1: BEEP .01,8
2240 IF time>160 THEN LET time=160
2290 PRINT AT y,x; INK 5;CHR$ (144): PRINT AT 2,20; INK 4;"TIME:";time;" ": PRINT AT 2,0; INK 4;"GOLD:";score
2300 LET time=time-1
2310 IF time<=0 THEN GO TO 4600
2320 IF score=max THEN GO SUB 5000
2420 PRINT AT enemyY,enemyX; INK 2;CHR$ (145);
2430 GO SUB 4000
3000 GO TO 2000
4000 REM --------------------------------------------------------- MOVE ENEMY --------------------------------------------
4010 LET r=0: RANDOMIZE
4020 IF (dx1=0 AND dy1=0) OR (enemyX=14 OR enemyX=11) THEN LET r=INT (RND*4)+1
4060 IF dy1=0 AND r=1 THEN LET dx1=-1: GO TO 4080
4065 IF dy1=0 AND r=2 THEN LET dx1=1: GO TO 4080
4070 IF dy1=0 AND r=3 THEN LET dy1=-1: GO TO 4080
4075 IF dy1=0 AND r=4 THEN LET dy1=1
4200 REM ---------------------------------------------------------- MOVE PLAYER -------------------------------------------
4210 PRINT INK 6;AT enemyY,enemyX;g$;
4215 IF SCREEN$ (enemyY+dy1,enemyX+vx1)="X" THEN LET dy1=0: LET dx1=0
4220 LET enemyX=enemyX+dx1: LET enemyY=enemyY+dy1
4235 LET g$=SCREEN$ (enemyY,enemyX)
4240 PRINT AT enemyY,enemyX; INK 2;CHR$ (145);
4250 IF ABS (x-enemyX)<2 AND ABS (y-enemyY)<2 THEN GO SUB 4600
4410 RETURN
4600 REM ----------------------------------------------------------- GAME OVER ---------------------------------------------
4610 PRINT AT 10,10;"GAME OVER";AT 12,8;"GOLD COLLECTED: ";score
4620 FOR n=1 TO 5: BEEP n/5,n: NEXT n
4627 GO SUB 5500
4630 CLS
4640 GO TO 10
4650 RETURN
5000 REM ----------------------------------------------------------- WIN ---------------------------------------------------
5010 PRINT AT 10,10;"YOU WON!!";AT 12,10;
5020 CLS
5030 GO TO 10
6000 REM ----------------------------------------------------------- GRAPHICS ----------------------------------------------
6005 RESTORE
6010 FOR n=1 TO 2: READ p$
6015 FOR f=0 TO 7
6020 READ a: POKE USR p$+f,a
6025 NEXT f
6030 NEXT n
6040 RETURN
6100 DATA "a",BIN 01111110,BIN 10000001,BIN 10100101,BIN 10000001,BIN 10111101,BIN 11000011,BIN 01111110,BIN 00111100: REM HERO
6105 DATA "b",BIN 01111110,BIN 10000001,BIN 10100101,BIN 10000001,BIN 01011010,BIN 01000010,BIN 00100100,BIN 00011000: REM ENEMY
7000 REM ----------------------------------------------------------- TITLE SOUND -------------------------------------------
7010 FOR n=1 TO 10
7020 READ a: READ b: BEEP a/5,b
7030 NEXT n
7040 DATA 2,0,4,9,1,10,1,7,4,12,1,10,1,7
7050 DATA 4,5,2,4,4,5,2,9,2,9,2,7,2,7,4,11,2
7060 RETURN
