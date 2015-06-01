#!/bin/bash
################################################################
#  echo out the first command line arg ...
################################################################

echo -e "\nbonnie_tst6.sh ... \nbonnie++ output filename: "$1 "\n"

################################################################
#  Set $NOW for bonnie++ output files suffix ... and capture 
#    start time TS as seconds ...
################################################################

NOW=$(date +"%Y-%m-%d-%H:%M:%S")

TS="$(date +%s)"
echo -e "Start Date+Time:" $(date)
echo -e "StartTime TS in Seconds:" $TS "\n" 

################################################################
#  Create multi-process semaphore for 3 bonnie++ concurrent
#    processes ...
################################################################

echo -e "Invoking bonnie -p3 ... "
bonnie++ -p3 

################################################################
#  Initiate 3 concurrent bonnie++ processes, pipe bonnie++
#    output text to bon_csv2txt script, and save to filename
#    $1 + sequence number $cntr2 + date-timestamp $NOW 
################################################################

echo -e "\nInitiating 3 concurrent / parallel bonnie++ processes ..." 

for cntr2 in `seq 1 3`;
do
   filename3=$1"_multi_out"$cntr2+$NOW 
   echo " ... Output file"$cntr2": "$filename3
   bonnie++ -d /media/USB-HDD1/ -u pi -r 436 -b -s 872 -y s | bon_csv2txt > $filename3 &
#   sleep 13 & 
done

################################################################
#  Use Bash wait for all parallel Bash background processes to 
#    complete ... and enable total elapsed time measurement of 
#    entire script execution ...
################################################################

echo -e "\nExecuting wait command to enable timing of all background process completion ... \n" 
wait

################################################################
#  Capture stop time TE as seconds ... 
################################################################

TE="$(date +%s)" 
echo -e "Stop Date+Time:" $(date)
echo -e "StopTime TE in Seconds:" $TE "\n" 

T2=$(($TE-$TS))
echo -e "StopTime TE" $TE "minus Start Time TS" $TS "in Seconds:" $T2 

################################################################
#  Last, output T2 elapsed seconds in days:hours:minutes:secs 
################################################################

echo -e "\nT2 in days:hours:minutes:seconds format ..." 
printf "T2 formatted: %02d:%02d:%02d:%02d\n" "$((T2/86400))" "$((T2/3600%24))" "$((T2/60%60))" "$((T2%60))"

echo -e "\n ... end of bonnie_tst6.sh ..."

