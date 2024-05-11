#!/bin/bash
file_name="os.sh"

declare -a current_selection
declare -a visited
## write a function to display the filter options and take 
## the input and filters the input and store the unique selected_options
display_filter_options () {
    echo "Filter by:"
    echo "-----------"
    echo "1. size"
    echo "2. modification date"
    echo "3. file type"
    echo "4. file or directory"
    read -p "Enter your selections separated by spaces: " -a current_selection

    ## checking if the selected value exists
    for selection in ${current_selection[@]}; do
        if [ $selection -gt 4 ] || [ $selection -lt 1 ]; then
            echo "-------------------------------" 
            echo "Choose only from the list!"
            display_filter_options
        fi
    done

    selected_options=()
    ## checking if the current selecctions are not visited
    for choice in ${current_selection[@]}; do
        # to unvisit visited
        in_visited=false
        for i in ${visited[@]}; do
            if [ $choice == $i ]; then
                in_visited=true
            fi
        done

        # if it doesn't exist in the selected
        if [ $in_visited == "false" ]; then
            ## add it to the selected options
            selected_options+=("$choice")
        fi
    done

    echo "-----------------------------------------------"
    echo "Was visited: ${visited[@]}"
    visited+=("${selected_options[@]}")
    echo "The selected options are: ${selected_options[@]}"
    echo "Visited: ${visited[@]}"
    echo "-----------------------------------------------"

    ## building the find command based on the seledted options
    options
}

# trying to turn the find_command_builder case into a function
## correct
options () {
    for option in ${selected_options[@]}; do
        case $option in
            1) read -p "Enter the minimum file size in bytes (0 for any size): " minsize
            read -p "Enter the maximum file size in bytes (0 for any size): " maxsize
            find_command+=" -size +${minsize}c -size -${maxsize}c";;
            2) read -p "Enter the modification date (format: YYYY-MM-DD): " moddate
            find_command+=" -newermt \"$moddate\"";;
            3) read -p "Enter the file type (extension, e.g., txt): " filetype
            find_command+=" -iname \"*.$filetype\"";;
            4) read -p "Enter the type (file or directory): " type
            find_command+=" -type $type";;
        esac
    done
    echo "Find command: find . $find_command"
}

## file manipulation
manipulation() {
    echo "File Manipulation: "
    echo "-------------------"
    echo "1. Open"
    echo "2. Delete"
    echo "3. Rename"

    read -p "Choose an option: " option
    if [ "$option" -gt 3 ] || [ "$option" -lt 1 ]; then
        manipulation
    else
        if [ "$option" -eq 1 ]; then
            if [ -d "$result" ]; then
                ls "$result"
            else
                if [ -s "$result" ] && [ -r "$result" ]; then
                    echo "File content"
                    echo "------------------------------------------------"
                    cat "$result"
                    echo -e "\n------------------------------------------------"
                else
                    echo "------------------------------------------------"
                    echo "File is empty or not readable"
                    echo "------------------------------------------------"
                fi
            fi
        elif [ "$option" -eq 2 ]; then
            if [ -d "$result" ]; then
                rm -r "$result"
            else
                rm "$result"
            fi
        else
            read -p "Enter the new name: " newName
            mv "$result" "./files/$newName"
        fi
    fi
}

## a functions that takes the find_command as argument and then searchs for the file
search () {
    ## evaluates the find command
    result=$(eval "$find_command")

    ## checks if the length of results is zero "no file found"
    if [ -z "$result" ]; then
        echo "==============="
        echo "Matching files:"
        echo "============================================"
        echo "File not found!"
        echo "============================================"

        ## executing the script again to search for new files
        ./$file_name
    else
        echo "==============="
        echo "Matching files:"
        echo "============================================"
        j=1
        len=0
        for res in ${result[@]}; do
            if [ -d "$res" ]; then
                echo "$j- $res (directory)"
            else
                echo "$j- $res (file)"
            fi

            (( j++ ))
            (( len++ ))
        done
        echo "============================================"
        ## checks if only one file left of more than one
        if [ $len -eq 1 ]; then
            ## if only one is left it calls the manipulations 
            ## function to open or rename or delete file
            manipulation
        else
            ## if more than one is found it calls the display_filter_options
            display_filter_options
            ## then calls the serach functions to narrow serach results
            ## repeats this step until there is only one result left
            search
        fi
    fi
}


## The program starts here
read -p "Enter the name of the file: " name

## we use the find command with the case igonre name option -iname 
## to search for the file in the specified diretory and its subdirectories
find_command="find ./files -iname \"$name*\""

## then we search with the file name
search

## exectues the script again to search for a new file
./$file_name