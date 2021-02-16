// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// R2 <- 0
@R2
M=0

// Count <- R1
// (1) D <- R1 
@R1
D=M
// (2) Count <- D
@Count
M=D

// Add R0, R1 times
(Loop)
@Count
D=M // D <- Count
@End
D;JEQ // jump to End if Count == 0

// R2 <- R0 + R2
@R0
D=M // D <- R0
@R2
M=D+M // M <- R0 + M(R2) 

// Count <- Count - 1
@Count
M=M-1 

// Jump to Loop
@Loop
0; JMP 

// infinite-loop
(End)
@End
0; JMP  