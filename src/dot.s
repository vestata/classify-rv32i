.globl dot

.text
# =======================================================
# FUNCTION: Strided Dot Product Calculator
#
# Calculates sum(arr0[i * stride0] * arr1[i * stride1])
# where i ranges from 0 to (element_count - 1)
#
# Args:
#   a0 (int *): Pointer to first input array
#   a1 (int *): Pointer to second input array
#   a2 (int):   Number of elements to process
#   a3 (int):   Skip distance in first array
#   a4 (int):   Skip distance in second array
#
# Returns:
#   a0 (int):   Resulting dot product value
#
# Preconditions:
#   - Element count must be positive (>= 1)
#   - Both strides must be positive (>= 1)
#
# Error Handling:
#   - Exits with code 36 if element count < 1
#   - Exits with code 37 if any stride < 1
# =======================================================
dot:
    li t0, 1
    blt a2, t0, error_terminate  
    blt a3, t0, error_terminate   
    blt a4, t0, error_terminate  

    li t0, 0                    # accumulator
    li t1, 0                    # counter

loop_start:
    bge t1, a2, loop_end        # if(counter >= length) break;
    # DONE: Add your own implementation
    lw t3, 0(a0)
    lw t4, 0(a1)

    li t5, 0
multiply_loop_d:
    andi t5, t4, 1            # Check if LSB of t4 is 1
    beq t5, zero, skip_add_d    # If LSB is 0, skip addition
    add t0, t0, t3            

skip_add_d:
    slli t3, t3, 1            # Shift t3 left by 1 (t3 *= 2)
    srli t4, t4, 1            # Shift t4 right by 1 (t4 /= 2)
    bne t4, zero, multiply_loop_d  # Continue loop if t4 != 0
multiply_end_d:

    addi t1, t1, 1              # counter++

    slli t5, a3, 2              # stride * 4 since the data is word wide
    slli t6, a4, 2
    
    add a0, a0, t5              # Iterate through the array
    add a1, a1, t6
    j loop_start

loop_end:
    mv a0, t0
    jr ra

error_terminate:
    blt a2, t0, set_error_36
    li a0, 37
    j exit

set_error_36:
    li a0, 36
    j exit
