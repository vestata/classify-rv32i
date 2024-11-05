.globl relu

.text
# ==============================================================================
# FUNCTION: Array ReLU Activation
#
# Applies ReLU (Rectified Linear Unit) operation in-place:
# For each element x in array: x = max(0, x)
#
# Arguments:
#   a0: Pointer to integer array to be modified
#   a1: Number of elements in array
#
# Returns:
#   None - Original array is modified directly
#
# Validation:
#   Requires non-empty array (length ≥ 1)
#   Terminates (code 36) if validation fails
#
# Example:
#   Input:  [-2, 0, 3, -1, 5]
#   Result: [ 0, 0, 3,  0, 5]
# ==============================================================================
relu:
    li t0, 1             
    blt a1, t0, error     
    li t1, 0                    # index counter

loop_start:
    # DONE: Add your own implementation
    lw t3, 0(a0)                # load from memory
    bge t3, zero, t3_ge_0       # if a[i] < 0
    sw zero, 0(a0)
t3_ge_0:
    addi a0, a0, 4              # move to next word
    addi t1, t1, 1              # counter++
    blt t1, a1, loop_start      # if(counter < a1) loop

    jr ra

error:
    li a0, 36          
    j exit          
