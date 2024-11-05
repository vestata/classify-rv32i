.globl argmax

.text
# =================================================================
# FUNCTION: Maximum Element First Index Finder
#
# Scans an integer array to find its maximum value and returns the
# position of its first occurrence. In cases where multiple elements
# share the maximum value, returns the smallest index.
#
# Arguments:
#   a0 (int *): Pointer to the first element of the array
#   a1 (int):  Number of elements in the array
#
# Returns:
#   a0 (int):  Position of the first maximum element (0-based index)
#
# Preconditions:
#   - Array must contain at least one element
#
# Error Cases:
#   - Terminates program with exit code 36 if array length < 1
# =================================================================
argmax:
    li t6, 1
    blt a1, t6, handle_error            # handle error

    lw t0, 0(a0)                        # temporary store max

    li t1, 0                            # set max index
    li t2, 1                            # counter
loop_start:
    # DONE: Add your own implementation
    bge t2, a1, break                   # if(t2 >= a1) break
    addi a0, a0, 4                      
    lw t3, 0(a0)                        
    blt t3, t0, skipp                   # update t0 if there are larger element
    mv t0, t3
    mv t1, t2                           # update index
skipp:
    addi t2, t2, 1                      # counter++
    j loop_start

break:
    mv a0, t1                           # set return a0
    jr ra

handle_error:
    li a0, 36
    j exit
