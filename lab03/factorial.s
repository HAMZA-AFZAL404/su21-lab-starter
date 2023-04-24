.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:
    addi sp, sp, -4 # Allocate space on the stack
    sw ra, 0(sp) # Save return address on the stack

    beqz a0, base_case # Base case: if n == 0, return 1

    addi sp, sp, -4 # Allocate space on the stack
    sw a0, 0(sp) # Save n on the stack

    addi a0, a0, -1 # Decrement n
    jal ra, factorial # Recursively call factorial with n-1

    lw a1, 0(sp) # Load n from the stack
    addi sp, sp, 4 # Deallocate space on the stack

    mul a0, a1, a0 # Multiply n by the result of the recursive call
    j end_factorial

base_case:
    addi a0, x0, 1 # Base case: return 1

end_factorial:
    lw ra, 0(sp) # Load return address from the stack
    addi sp, sp, 4 # Deallocate space on the stack
    jr ra # Return