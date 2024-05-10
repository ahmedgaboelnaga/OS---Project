#! /bin/bash


# In shell scripting, escape sequences are used with backslashes (`\`) to represent special characters or behaviors. Here are some common escape sequences used in shell scripting:

# 1. `\n`: Represents a newline character. It is used to move the cursor to the beginning of the next line.
# 2. `\t`: Represents a tab character. It is used to insert horizontal spacing.
# 3. `\\`: Represents a literal backslash character.
# 4. `\"`: Represents a double quote character (`"`). Useful for including double quotes within a double-quoted string.
# 5. `\$`: Represents a literal dollar sign (`$`). Useful when you want to prevent variable expansion in double-quoted strings.
# 6. `\b`: Represents a backspace character. It is used to move the cursor backward one position.
# 7. `\r`: Represents a carriage return character. It is used to move the cursor to the beginning of the current line.
# 8. `\f`: Represents a form feed character. It is used to advance the cursor to the next page or form feed position.

# Here's an example script demonstrating the use of some escape sequences:

# ```bash
# #!/bin/bash

# # Newline and tab
# echo -e "First Line\nSecond Line\tIndented Third Line"

# # Literal backslash and double quote
# echo "A backslash: \\"
# echo "A double quote: \""

# # Dollar sign
# echo "The variable \$HOME is set to: $HOME"

# # Backspace and carriage return
# echo -e "Countdown: 5\b4\b3\b2\b1\bBlast Off!\rMission Complete."

# # Form feed
# echo -e "Page 1\fPage 2"
# ```

# When you run this script, it will display output with various escape sequences interpreted:

# ```
# First Line
# Second Line    Indented Third Line
# A backslash: \
# A double quote: "
# The variable $HOME is set to: /home/user
# Countdown: 54321Blast Off!Mission Complete.
# Page 1
#          Page 2
# ```

# Each escape sequence serves a specific purpose, allowing you to control formatting and include special characters in your shell scripts.


# The code starts here

# read -p "Enter a name: " name
# read -p "Enter 3 names: " name1 name2 name3

# echo "name: $name"
# echo "name1: $name1, name2: $name2, name3: $name3"

# read -p "Enter any number of names: " -a names

# echo "names are: ${names[@]}"

# args=("$@")
# echo "first two arguments: $1 $2"
# echo "All arguemnts: ${args[@]}"

# This one i to print the argument list directly from the buffer
echo "All arguments with the shortcut:" $@

# This one is to print the number of argments passed  "$#"
echo "Number of arguments: " $#