0 WIDTH80:PALETTE0,0:PALETTE9,22:R=RND(-TIMER):ONBRKGOTO9
1 PRINT"Monty Hall problem":PRINT:PRINT"Are we going to switch (Y/N)";:INPUTA$:PRINT:PRINT"How many repetitions";:INPUTN:FORI=1TON:GOSUB2:NEXTI:PRINT:PRINT"Wins:";W:PRINT"Losses:";L:PRINT:GOTO1
2 D$(1)="G":D$(2)="G":D$(3)="G":D$(INT(3*RND(0))+1)="C":PRINT:G=INT(3*RND(0))+1:PRINT"You guess door #";G
3 D=INT(3*RND(0))+1:IFD$(D)="C"ORD=G THENGOTO3
4 PRINT"Monty opens door #";D;"to reveal a goat.":IFA$="Y"THENGOSUB7:PRINT"You decide to switch to door #";F ELSEF=G:PRINT"You stick with door #";F
5 IFD$(F)="C"THENPRINT"Beep beep! You win! It's a car!":W=W+1ELSEPRINT"Too baaaaad! It's a goat!":L=L+1
6 RETURN
7 FORJ=1TO3:IFJ<>G ANDJ<>D THENF=J
8 NEXTJ:RETURN
9 POKE&H71,0:EXEC&H8C1B
 
