#!/bin/env bash
# ____________________________________________________________________________________________________
# __________________1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1___________________
# ___________________1___1___1___1___1___1___1___1___1___1___1___1___1___1___1___1____________________
# ___________________1___1___1___1___1___1___1___1___1___1___1___1___1___1___1___1____________________
# ____________________1_1_____1_1_____1_1_____1_1_____1_1_____1_1_____1_1_____1_1_____________________
# _____________________1_______1_______1_______1_______1_______1_______1_______1______________________
# _____________________1_______1_______1_______1_______1_______1_______1_______1______________________
# _____________________1_______1_______1_______1_______1_______1_______1_______1______________________
# ______________________1_____1_________1_____1_________1_____1_________1_____1_______________________
# _______________________1___1___________1___1___________1___1___________1___1________________________
# ________________________1_1_____________1_1_____________1_1_____________1_1_________________________
# _________________________1_______________1_______________1_______________1__________________________
# _________________________1_______________1_______________1_______________1__________________________
# _________________________1_______________1_______________1_______________1__________________________
# _________________________1_______________1_______________1_______________1__________________________
# _________________________1_______________1_______________1_______________1__________________________
# __________________________1_____________1_________________1_____________1___________________________
# ___________________________1___________1___________________1___________1____________________________
# ____________________________1_________1_____________________1_________1_____________________________
# _____________________________1_______1_______________________1_______1______________________________
# ______________________________1_____1_________________________1_____1_______________________________
# _______________________________1___1___________________________1___1________________________________
# ________________________________1_1_____________________________1_1_________________________________
# _________________________________1_______________________________1__________________________________
# _________________________________1_______________________________1__________________________________
# _________________________________1_______________________________1__________________________________
# _________________________________1_______________________________1__________________________________
# _________________________________1_______________________________1__________________________________
# _________________________________1_______________________________1__________________________________
# _________________________________1_______________________________1__________________________________
# _________________________________1_______________________________1__________________________________
# _________________________________1_______________________________1__________________________________
# __________________________________1_____________________________1___________________________________
# ___________________________________1___________________________1____________________________________
# ____________________________________1_________________________1_____________________________________
# _____________________________________1_______________________1______________________________________
# ______________________________________1_____________________1_______________________________________
# _______________________________________1___________________1________________________________________
# ________________________________________1_________________1_________________________________________
# _________________________________________1_______________1__________________________________________
# __________________________________________1_____________1___________________________________________
# ___________________________________________1___________1____________________________________________
# ____________________________________________1_________1_____________________________________________
# _____________________________________________1_______1______________________________________________
# ______________________________________________1_____1_______________________________________________
# _______________________________________________1___1________________________________________________
# ________________________________________________1_1_________________________________________________
# _________________________________________________1__________________________________________________
# _________________________________________________1__________________________________________________
# _________________________________________________1__________________________________________________
# _________________________________________________1__________________________________________________
# _________________________________________________1__________________________________________________
# _________________________________________________1__________________________________________________
# _________________________________________________1__________________________________________________
# _________________________________________________1__________________________________________________
# _________________________________________________1__________________________________________________
# _________________________________________________1__________________________________________________
# _________________________________________________1__________________________________________________
# _________________________________________________1__________________________________________________
# _________________________________________________1__________________________________________________
# _________________________________________________1__________________________________________________
# _________________________________________________1__________________________________________________
# _________________________________________________1__________________________________________________

# Creating a Fractal Tree from Y-shaped branches

# This challenge involves the construction of trees, in the form of ASCII Art.

# We have to deal with real world constraints, so we cannot keep repeating the pattern infinitely. So, we will provide you a number of iterations, and you need to generate the ASCII version of the Fractal Tree for only those many iterations (or, level_lines of recursion). A few samples are provided below.

# Iteration #1
# In the beginning, we simply create a Y. There are 63 rows and 100 columns in the grid below. The triangle is composed of underscores and ones as shown below. The vertical segment and the slanting segments are both 16 characters in length.

# Iteration #2
# At the top of the left and right branches of the first Y, we now add a pair of Y-shapes, which are half the size of the original Y.

# Input Format
# A single integer, N.

# Constraints
# N <= 5

# Output Format
# The Nth iteration of the Fractal Tree, as shown above. It should be a matrix of 63 rows and 100 columns. (i.e. 6300 printable characters) It should be composed entirely of underscores and ones, in a manner similar to the examples provided. Do not include any extra leading or trailing spaces.

# function print_tree(){
#     height=4
#     for ((line=0;line<height*2;line++)); do

#     done
# }

function draw_spacer_lines(){
    for (( lines=0; lines<$level_size; lines++ )); do
        spacer $line_width; echo;
    done
}
function draw_fractal(){
    local branch_point=$(( level_size / 2 ))
    for (( depth=level_size; depth>0; depth-- )); do
        [[ depth -le branch_point ]] && local m=0 || local m=$(( ((depth - branch_point) * 2) - 1 ))
        local n=$(( (level_size - m) / 2 ))
        spacer $level_padding
        print_line $n $m
        for (( t=1; t<level_repeat; t++ )); do
            spacer $(( level_size - 1 ))
            print_line $n $m;
        done
        spacer $(( level_padding + 1 ))
        echo;
    done
}
function print_line(){
    spacer $1; branch;
    if [[ $2 -gt 0 ]]; then spacer $2; branch; fi;
    spacer $1;
}
function branch() { printf "1"; }
function spacer() { [[ $1 -gt 0 ]] && printf "%0.s_" `seq ${1}`; }

read requested_levels
line_width=100
level_limit=5
level_paddings=(18 19 21 25 33)
level_repeats=(16 8 4 2 1)
spacer $line_width; echo;
for (( level=0; level<level_limit; level++ )); do
    level_size=$(echo "2^(${level} + 1)" | bc)
    level_repeat=${level_repeats[$level]}
    level_padding=${level_paddings[$level]}
    echo "$level_lines $level_repeat $level_padding"
    [[ $level -lt $(( level_limit - requested_levels )) ]] && draw_spacer_lines || draw_fractal
done
