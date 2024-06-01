# 8085-Zadaca-16

Два 8 битни уреди комуницираат паралелно помеѓу себе со
одредена стапка од X [B/s].
- Уредите имаат 8-битна влезна порта и 8-битна излезна
порта и влезен CLKIN сигнал.
- И двата уреди имаат едно-битен TR влезен сигнал кој кога е
единица уредот почнува да праќа 8-битни податоци на секоја
растечка ивица од CLKIN.
- И двата уреди имаат едно-битен RCV влезен сигнал кој кога
е единица уредот почнува да прима 8-битни податоци на секоја
растечка ивица од CLKIN.
- Уредот 1 е надреден и има едно-битен излезен INT сигнал за
комуникација по прекидна секвенца со процесорот на кој му
соопштува како течат податоците: кој уред праќаподатоци, а кој
прима, при што може истовремено и двата уреди и да праќаат и да
примаатподатоци.
Да се нацрта хардверско поврзување и напише соодветна
асемблерска програма.Фреквенцијата на осцилаторот е 5MHz.  

**Resenie:**

```
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
```
![Screenshot (1)](https://github.com/slavko444/8085-Zadaca-16/blob/main/Diagram%2016.png)
 ![Screenshot (2)](https://github.com/slavko444/8085-Zadaca-16/blob/main/Code%2016.1.png)
 ![Screenshot (3)](https://github.com/slavko444/8085-Zadaca-16/blob/main/Code%2016.png)
 
**Develop by:**

[Slavko Srebrenoski ](https://github.com/slavko444)


**Subject**

Microcomputer's systems

**Built With**

This project is built using the following tools:

- [8085 simulator](https://github.com/8085simulator/8085simulator.github.io?tab=readme-ov-file) : Assembler and emulator for the Intel 8085 microprocessor.

**Getting Started**

To get a local copy up and running, follow these steps.

**Prerequisites**

In order to run this project you need:

A working computer
Connection to internet
Setup

**How to Run**

To run the program, you need an 8085 emulator or assembler. You can use emulators like DOSBox or TASM (Turbo Assembler). Here's how to run the program using 8085 simulator:

1. Download and install 8085 simulator from [here](https://github.com/8085simulator/8085simulator.github.io?tab=readme-ov-file).
2. Clone this repository to your local machine.
3. Open 8085 simulator and load the `Zadaca 16 code.asm` file.
4. Assemble the code by pressing the Assemble button.
5. Run the program by pressing the Run button or by pressing F10.
