#!/bin/bash

if (( $# != 3 ))
    then
    echo "usage: ./copyright_notice.sh [program_name] [year] [author]"
    exit 1
fi

pname=$1
year=$2
author=$3

echo
echo "${pname} Copyright (C) ${year} ${author}"
echo "This program comes with ABSOLUTELY NO WARRANTY; for details type 'w'."
echo "This is free software, and you are welcome to redistribute it"
echo "under certain conditions; type 'c' for details. Type 'q' to exit."
echo "Type anything else to continue."

while [[ 1 ]]
    do
        echo
        echo -n "> "

        read cmd

        if [[ $cmd =~ "c" ]]
            then
            echo
            echo "Please visit http://www.gnu.org/licenses/gpl.html for details."
        elif [[ $cmd =~ "w" ]]
            then
            echo
            echo "THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY "
            echo "APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT "
            echo "HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM “AS IS” WITHOUT WARRANTY "
            echo "OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, "
            echo "THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR "
            echo "PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE "
            echo "PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME "
            echo "THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION."
        elif [[ $cmd =~ "q" ]]
            then
            echo
            exit 1
        else
            echo
            exit 0
        fi

done

