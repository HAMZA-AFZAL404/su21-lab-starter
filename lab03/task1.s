# RISC-V assembly code for the given C code
# Use s0 to hold i
# Use s1 to hold a
# Use s2 to hold &b i.e base address of b
.globl main
    .data
    .align 2
#Defining an array b[3]
b:
    .word 0
    .word 0
    .word 0
.text
    .align 2
main:
    # Initialize i to 0
    li s0, 0
    # Initialize a to 7
    li s1, 7
    # Load the address of b into s2
    la s2, b
loop:
    # Check if i is less than 3
    li t2,3
    bge s0, t2, exit
    # Calculating a + (i * a)
    mul t3,s0,s1
    add t4,s1,t3
    # Storing the value to the a + (i * a) into b[i]
    slli t0, s0, 2
    add t0, t0, s2
    sw t4, 0(t0)
    # Print b[i]
    lw a0, 0(t0)
    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result
    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline
    # Increment i
    addi s0, s0, 1
    # Increment the address of b to point to the next element
    addi s2, s2, 4
    j loop
exit:
    # Exit the program
    addi a0, x0, 10
    ecall # Exit