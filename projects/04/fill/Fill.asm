// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
// Check the keyboard input
(ReadKeyboard)
// FillColor <- 0 (Black as default)
@FillColor
M=0

@KBD
D=M // D <- KBD

// Jump to FillScreen if there is no input
@FillScreen
D; JEQ 

// Set fill color as white
@FillColor
M=!M // 0xFFFF

(FillScreen)
// Offset <- 0
@Offset
M=0

(FillingLoop)
// Adderess <- SCREEN + Memory[Offset]
@SCREEN
D=A
@Offset
D=D+M
@Address
M=D

// Memory[Address] <- Memory[FillColor]
@FillColor
D=M
@Address
A=M
M=D

@3
D=A
@Offset // M <- Memory[Offset]
D=D-M // 8192 - Memory[Offset] (0..8191)

// Memory[Offset] <- Memory[Offset] + 1
M=M+1

// Jump to FillingLoop if (8192 - Memory[Offset]) > 0
@FillingLoop
D; JGT

(End)
// Jump to ReadKeyboard to repeat the tasks
@End
0; JMP