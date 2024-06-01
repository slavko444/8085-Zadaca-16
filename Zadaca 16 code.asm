 MVI A, 0000XXXXb ; на почеток никој не пренесува
 OUT 02h
JAMKA: JMP JAMKA
2Ch: CALL DATA
 RET
DATA: IN 01h
 CPI 1h
 JZ U1_do_U2
 CPI 2h
 JZ U2_do_U1
CPI 3h
 JZ DVONASOCNO
 JMP KRAJ
U1_do_U2: LDA CSR_PRIV ;подесување на 8155 во ACC
 OUT CSR ;запишување во CSR рег. на 8155
MVI A,1001XXXXb
OUT 02h
 JMP KRAJ
U2_do_U1: LDA CSR_PRIV ;подесување на 8155 во ACC
 OUT CSR ;запишување во CSR рег. на 8155
MVI A,0110XXXXb
 OUT 02h
 JMP KRAJ
DVONASOCNO:LDA CSR_PRIV ;подесување на 8155 во ACC
 OUT CSR ;запишување во CSR рег. на 8155
MVI A,1111XXXXb
 OUT 02h
 KRAJ: NOP
 RET 
