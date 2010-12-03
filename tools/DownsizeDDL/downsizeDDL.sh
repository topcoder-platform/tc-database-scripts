# downsizeDDL.sh
# ==============
# 
# Author: subchap
# 
# Due to space limitations in the VMs, we need to transform base scripts extent sizes to manageable values 
# so that we can run them in the cloud's database server and keep the size small. 
# 
# For this we need a shell script to go through the ddl script and replace extent sizes (extent size [A] next size [B]) in the following manner: 
# - if [A] or [B] is greater than 64, make both 64. 
# - otherwise, keep the predefined values. 
# 
# Examples: 
# extent size 5000 next size 2500 -> extent size 64 next size 64 
# extent size 64 next size 16 -> extent size 64 next size 16 
# extent size 32 next size 32 -> extent size 32 next size 32 
# 
# Script requirements: 
# - The script must accept input ddl script name (required) 
# - The script must accept output script name (optional) - if no name is specified then it should use downsized_[input ddl script name] 

 #!/bin/sh
   if [ "$1" == "" ]; then
    echo "You need to specify the output file name.";
    exit;
   fi
   fname="$1";
 
   if [ "$2" == "" ]; then
    oname="downsized_$1";
   else
    oname="$2";
   fi
   logfile="logfile.log"; 
   echo "----------------------------------------------------------------" >> "$logfile";
   time=$(date +%k:%M);
   day=`/bin/date +%Y/%m/%d`;
   echo "Transformation Date: $day" >> "$logfile";
   echo "Transformation Time: $time" >> "$logfile";
   ORIGIFS=$IFS
   IFS=$(echo -en "\n\b")

   exec<$fname;
   iline=0;
   while read line
   do
     iline=`expr $iline + 1`;
     newline=$line;
     match=`echo "\$line" | grep -c "next size"`;
     if [ "$match" != '0' ]; then
      num1=-1;
      num2=-1;
      IFS=$(echo -en " ") 
      for w in $line
      do
        if [ "$w" != "size" ] && [ "$w" != "extent" ] && [ "$w" != "next" ]  &&  [ "$w" != ")" ] &&  [ "$w" != "lock" ] &&  [ "$w" != "mode" ] &&  [ "$w" != "row" ] &&  [ "$w" != "page" ]; then
         if [ "$num1" == -1 ]; then
          num1=$w;
         else
          num2=$w;
         fi
        fi
      done
      if [ "$num1" == -1 ] || [ "$num2" == -1 ]; then
       echo "Line$iline: Error. The expression is not complete!" >> "$logfile"; 
      else
       if [ "$num1" -gt 64 ] || [ "$num2" -gt 64 ]; then
        echo "Line$iline: Changed from ($num1,$num2) into (64,64)" >> "$logfile";
        num1="64";
        num2="64";
        newline="extent size $num1 next size $num2";
       fi
      fi
     fi
     if [ "$iline" == 1 ]; then 
       echo "$newline" > "$oname";
     else
       echo "$newline" >> "$oname";
     fi
     IFS=$(echo -en "\n\b")
   done
   echo "----------------------------------------------------------------" >> "$logfile";
   echo "DONE";

