# RISC-V assembly code for the given C code
 # Use s0 to hold i variable.
 #Use a0 to hold num variable
.globl main
    .data
    .align 2
.text
    .align 2
main:
    # Initialize i to 0
#     li s0, 0
    # Initialize a to 7
    li a0, 7

# Function: dataArray
# Description: Initializes an array and calls the compare function to populate it
dataArray:
  addi sp, sp, -40    # Adjust stack pointer to allocate space for local variables and array
  sw ra, 0(sp)        # Save return address on the stack
  sw s0, 4(sp)        # Save s0 (i) on the stack
  li s0, 0            # Initialize i to 0
  addi t0, sp, 8      # Calculate the address of the array on the stack
#   mv t1, a0           # Move num to a temporary register t1

loop:
  addi sp,sp,-4
  sw a0,0(sp)
  li t2,10
  bge s0, t2, endloop # Branch to endloop if i is greater than or equal to 10
  jal compare         # Jump and link to compare function to populate array element
  sw a3, 0(t0)        # Store the result of compare in the array
  addi a1,a3,0
  addi a0,x0,1
  ecall
  addi a1, x0, '\n'   # Load in ascii code for newline
  addi a0, x0, 11
  ecall
  addi s0, s0, 1      # Increment i by 1
  addi t0, t0, 4      # Increment array pointer by 4 bytes
  lw a0,0(sp)
  addi sp,sp,4
  j loop              # Jump back to loop

endloop:
  lw s0, 4(sp)        # Restore s0 (i) from the stack
  lw ra, 0(sp)        # Restore return address from the stack
  addi sp, sp, 40     # Adjust stack pointer to deallocate space for local variables and array
  # Exit the program
    addi a0, x0, 10
    ecall # Exit

# Function: sub
# Description: Subtracts b from a and returns the result
subtract:
  addi sp, sp, -4    # Adjust stack pointer to allocate space for a local variable
  sw ra, 0(sp)        # Save return address on the stack
  sub a2,a0,s0       # Subtract b from a and store the result in a0
  lw ra, 0(sp)        # Restore return address from the stack
  addi sp, sp, 4     # Adjust stack pointer to deallocate space for local variables
  jr ra               # Jump to return address and return

# Function: compare
# Description: Compares a and b using the sub function
compare:
  addi sp, sp, -4    # Adjust stack pointer to allocate space for a local variable
  sw ra, 0(sp)        # Save return address on the stack
  jal subtract             # Jump and link to sub function to perform subtraction
  bgez a2, return1    # Branch to return1 if the result is greater than or equal to 0
  li a3, 0            # Load 0 into a0 to indicate false (0)
  j end               # Jump to end

return1:
  li a3, 1            # Load 1 into a0 to indicate true (1)

end:
  lw ra, 0(sp)
  addi sp, sp, 4     # Adjust stack pointer to deallocate space for local variables
  jr ra               # Jump to return address and return






