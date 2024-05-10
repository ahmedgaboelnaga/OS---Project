#!/bin/bash

# **Logical Operators**:
#     - `&&`: Logical AND. Executes the next command only if the previous one succeeds.
#     - `||`: Logical OR. Executes the next command only if the previous one fails.
#     - `!`: Logical NOT. Negates the result of a condition.


# Explanation: In Bash scripting, logical operators are used to combine or manipulate conditions in conditional statements or expressions.
# These operators allow you to create more complex conditions by evaluating multiple expressions and determining whether they are true or false.

# Explanation: AND Operator (&&)
# The && operator is used to perform the AND operation. It combines two conditions and evaluates to true only if both conditions are true.
if [ condition1 ] && [ condition2 ]; then
    # Code block executed if both condition1 and condition2 are true
fi

# Explanation: OR Operator (||)
# The || operator performs the OR operation. It evaluates to true if at least one of the conditions is true.
if [ condition1 ] || [ condition2 ]; then
    # Code block executed if either condition1 or condition2 is true
fi

# Explanation: NOT Operator (!)
# The ! operator negates the result of a condition. It reverses the logical state of the condition.
if ! [ condition ]; then
    # Code block executed if condition is false
fi

# Explanation: Combining Logical Operators
# You can combine these operators to create more complex conditions.
# && and || can be used together to create compound conditions.
# Parentheses () can be used to group conditions and control the evaluation order.
if [ condition1 ] && ( [ condition2 ] || [ condition3 ] ); then
    # Code block executed if condition1 is true and either condition2 or condition3 is true
fi

# Explanation: Compound Conditionals with -a (AND) and -o (OR)
# -a is used as the logical AND operator, and -o is used as the logical OR operator within the [[ ... ]] construct.
if [[ condition1 -a condition2 ]]; then
    # Code block executed if both condition1 and condition2 are true
fi

if [[ condition1 -o condition2 ]]; then
    # Code block executed if either condition1 or condition2 is true
fi

# Example
# Check if a file exists and is readable using compound conditions
if [[ -r "myfile.txt" && -f "myfile.txt" ]]; then
    echo "File 'myfile.txt' exists and is readable."
else
    echo "File 'myfile.txt' either doesn't exist or is not readable."
fi
