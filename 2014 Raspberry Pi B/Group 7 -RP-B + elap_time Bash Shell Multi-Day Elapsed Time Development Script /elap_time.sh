#!/bin/bash
####################################################################################
#
# elap_time.sh - Compute elapsed time & produce days:hours:minutes:secs formatted
#                output ...
#
# Refernece URLs
#  "Using time command in bash script"
#  http://stackoverflow.com/questions/3683434/using-time-command-in-bash-script
#
#  "Bash Shell Utils"
#  https://github.com/inacho/Bash-Shell-Utils/blob/master/demo_functions.sh
#
#  "Bash Shell Script Function Examples"
#  http://www.cyberciti.biz/faq/bash-shell-script-function-examples/ 
#
####################################################################################

################################################################
# Define tprint() function for formatting elapsed time ...
################################################################

tprint(){ 
   echo -e "... within tprint ...\n"  
   echo -e "T2 = \n"$T2 
   printf "T2 formatted: %02d:%02d:%02d:%02d\n" "$((T2/86400))" "$((T2/3600%24))" "$((T2/60%60))" "$((T2%60))"
}

################################################################
#  Echo & capture start time in seconds ... 
################################################################

echo -e "\nStart Date+Time:" $(date)

TS="$(date +%s)" 
echo -e "Start Time TS in Seconds:" $TS "\n" 

################################################################
#  In place of real Bash script working tasks, pause / sleep 
#   for 7 secs
################################################################

echo -e "Sleep for 7 seconds ... \n"
sleep 7

################################################################
#  Echo & capture end time in seconds ...
################################################################

# T2="$(($(date +%s)-T))"
TE="$(date +%s)" 

echo -e "Stop Time TE in Seconds:" $TE
echo -e "Stop Date+Time:" $(date) "\n" 

################################################################
#  Compute elapsed time in seconds ...
################################################################

# echo $(($TE-$TS))

T2=$(($TE-$TS))
echo -e "Stop Time TE" $TE "minus Start Time TS" $TS "in Seconds: " $T2

################################################################
#
#  Print out formatted version of number of secs ...
#
#    Note: must use short variable name T2 because the 
#          following printf line is long ! 
#
################################################################

echo -e "\nT2 = "$T2
printf "T2 formatted: %02d:%02d:%02d:%02d\n\n" "$((T2/86400))" "$((T2/3600%24))" "$((T2/60%60))" "$((T2%60))" 

################################################################
#
#  Next use test value of 86600 from ref URL above, testing 
#    number of seconds in excess of 1 day ...
#
#    Output format is days:hours:minutes:secs ...
#      86600 secs is 1 day, 0 hrs, 3 mins, 20 secs
#
################################################################

T2=27999
echo "T2 Test Value = "$T2
printf "27999 formatted: %02d:%02d:%02d:%02d\n" "$((T2/86400))" "$((T2/3600%24))" "$((T2/60%60))" "$((T2%60))"

T2=86600
echo -e "\nT2 Test Value = "$T2
printf "86600 formatted: %02d:%02d:%02d:%02d\n" "$((T2/86400))" "$((T2/3600%24))" "$((T2/60%60))" "$((T2%60))"

echo -e "\ntprint() function test: " $(tprint) "\n" 


