tag: user.code_operators_assignment
-
tag(): user.code_operators_math
tag(): user.code_operators_bitwise

# assignment
make (equal | assign): user.code_operator_assignment()

# combined computation and assignment
make (minus | subtract) equal: user.code_operator_subtraction_assignment()
make (plus | add) equals: user.code_operator_addition_assignment()
make (times | multiply) equals: user.code_operator_multiplication_assignment()
make divide equals: user.code_operator_division_assignment()
make mod equals: user.code_operator_modulo_assignment()
[make] increment: user.code_operator_increment()

#bitwise operators
(make | logical | bitwise) (ex | exclusive) or equals: user.code_operator_bitwise_exclusive_or_equals()
[(make | logical | bitwise)] (left shift | shift left) equals: user.code_operator_bitwise_left_shift_equals()
[(make | logical | bitwise)] (left right | shift right) equals: user.code_operator_bitwise_right_shift_equals()
