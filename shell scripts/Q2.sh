# !/bin/bash 
# Question 2
echo "***********************************************************************"
echo -e "\nWelcome to the main menu. To perform the following taks, enter a number (1-5) :\n
1. Display permissions of a particular file
2. Search a string in a file
3. Create a file dummy.txt and add the content of all the files in the current directory to dummy.
4. Check modified date of a file.
exit. To exit the main menu
"
read number
d=`date`


case $number in
1) echo -e "\n Option 0"$number" selected at " $d | tee -a logfile.txt
   echo -n "File name: " | tee -a logfile.txt
   read fname
   echo $fname | tee -a logfile.txt
   a=`stat -c %a $fname`
   echo "Permissions of "$fname":" $a | tee -a logfile.txt
   x=$(( 777-$a ))
   chmod $x $fname
   echo "Permissions changed" | tee -a logfile.txt
   echo "Updated Permissions of "$fname":" $x | tee -a logfile.txt

;;
2) echo -e "\n Option 0"$number" selected at " $d | tee -a logfile.txt
   echo -n "File name: " | tee -a logfile.txt
   read fname
   echo -n "String: " | tee -a logfile.txt
   read str 
   echo $str | tee -a logfile.txt
   grep $str $fname | tee -a logfile.txt
;;
3) echo -e "\n Option 0"$number" selected at " $d | tee -a logfile.txt
   a=`ls`
   echo "Enter number of lines you want to copy "
   read N
   for f in $a; do
    if [ "$f" != "dummy.txt" ] && [ "$f" != "logfile.txt" ] && [ "$f" != "Q2.sh" ] && [ "$f" != "main.sh" ]
    then
    touch dummy.txt
    if [ "$(expr $(echo 0$f | tr -cd 0-9) % 2)" -eq 0 ]; then
      even+=$f" "
      head -n $N $f >> dummy.txt
    else
      odd+=$f" "
      tail -n $N $f >> dummy.txt
    fi
    fi
  done
  echo "Files at odd location:" $odd | tee -a logfile.txt
  echo "Files at even location:" $even | tee -a logfile.txt
  echo "Dummy.txt is created and "$N" lines of each file copied in it" | tee -a logfile.txt
;;
4) echo -e "\n Option 0"$number" selected at " $d | tee -a logfile.txt
   echo -ne "Filename: " | tee -a logfile.txt
   read f
   echo $f | tee -a logfile.txt
   modf_time=`ls -l $f`

  time_month=`echo $modf_time | awk '{print $6}'`
  time_day=`echo $modf_time | awk '{print $7}'`
  time_hrmin=`echo $modf_time | awk '{print $8}'`
  time_hr=`echo $time_hrmin | cut -d ':' -f1`
  time_min=`echo $time_hrmin | cut -d ':' -f2`

  echo "Current modified date: " $time_day $time_month $time_hr":"$time_min | tee -a logfile.txt

  X1=`date -r $f "+%Y"`
  Y1=`date "+%Y"`
  if [ $Y1 -ge $X1 ]; then 
    X2=`date -r $f "+%m"`
    Y2=`date "+%m"`
    if [ $Y2 -ge $X2 ]; then
      X3=`date -r $f "+%d"`
      Y3=`date "+%d"`
  
      temp=$(( $Y3-$X3 ))
      if [ $temp -eq 1 ]; then
        X4=`date -r $f "+%H"`
        Y4=`date "+%H"`
   
        if [ $Y4 -ge $X4 ]; then
          touch $f
          echo -ne "Modified time updated" | tee -a logfile.txt
          echo -ne "New time is "
          echo `date -r $f`
        else
          echo "Modified time not updated" | tee -a logfile.txt
        fi
      elif [ $temp -ge 2 ]; then
        touch $f
        echo -ne "Modified time updated" | tee -a logfile.txt
        echo -ne "New time is "
        echo `date -r $f`
      else
        echo "Modified time not updated" | tee -a logfile.txt
      fi
      else 
      echo "Modified time not updated" | tee -a logfile.txt
    fi
    else
    echo "Modified time not updated" | tee -a logfile.txt
  fi
  ;;
exit) echo -e "\n Option "$number | tee -a logfile.txt
  dt=`date`
  echo "Script terminated at "$dt | tee -a logfile.txt
  
  exit
;;
*) echo "Sorry, unrecognized input! " ;;
esac