# !/bin/bash
# Question 3

##############################################################################

                      # Code below is to create the file hierarchy.
                      # Comment it if you are making one manually.              
###############################################################################

echo "Enter name of directory"
read dir
mkdir $dir
cd $dir
echo "Enter number of directories in main directory : "
read num_dir
i=1
while [ $i -le $num_dir ]
do 
  mkdir "Dir_"$i
  i=$(( i+1 ))
done
mix=(".txt" ".cpp" ".cc" ".java" ".sh" ".py")
j=1
while [ $j -le $num_dir ]
do
cd "Dir_"$j
echo "To create files enter :
1. For mixed files
2. For cpp files only
3. For txt files only
4. For java files only 
5. For cc files only"

read file_type
echo "Enter the number of files to create "
read file_num
i=1
case $file_type in
1) 
   while [ $i -le $file_num ]
   do
      n=`shuf -i 0-5 -n 1`
      touch "F_"$i${mix[$n]}
      i=$(( i+1 ))
   done
   ;;
2)
while [ $i -le $file_num ]
   do
     touch "F_"$i".cpp"
      i=$(( i+1 ))
   done
;;
3) while [ $i -le $file_num ]
   do
     touch "F_"$i".txt"
      i=$(( i+1 ))
   done
;;
4) while [ $i -le $file_num ]
   do
     touch "F_"$i".java"
      i=$(( i+1 ))
   done
;;
5) while [ $i -le $file_num ]
   do
     touch "F_"$i".cc"
      i=$(( i+1 ))
   done
;;
*) echo "Sorry input not recognized"
;;
esac
j=$(( j+1 ))
cd -
done


##################################################################################

              # Below is the code for forward and backward pass. 
##################################################################################

cd main_dir    #rename this to the main directory you have
echo "Enter either forward or backward to change file hierarchy"
read user_input
# user_input="forward"
while [[ $user_input != e* ]]
do
  if [ $user_input == forward ]
  then
    mkdir -p {"Java","cpp","txt","cc","others"}
    a=`ls -d Dir_*`

    for k in  $a 
    do
    echo "We have "$k
    cd $k
    for i in *
    do
    if [[ $i == *.cpp ]]
    then
      rename="$k-$i"
      mv $i $rename
      mv $rename ../cpp
      
    elif [[ $i == *.txt ]]
    then
      rename="$k-$i"
      mv $i $rename
      mv $rename ../txt
    elif [[ $i == *.java ]]
    then
      rename="$k-$i"
      mv $i $rename
      mv $rename ../Java
    
    elif [[ $i == *.cc ]]
    then
      rename="$k-$i"
      mv $i $rename
      mv $rename ../cc
    else
      rename="$k-$i"
      mv $i $rename
      mv $rename ../others
    fi
    done
    cd -
    done
    echo $a
    rm -r Dir_*
  elif [ $user_input == backward ]
  then
    b=`ls`
    for k in  $b 
    do
      cd $k
      c=`ls`
      for i in $c
      do
        tmp=${i:0:5}
        tmp2=$i
        tmp3=${tmp2:6:100}
        echo " tmp3 is : "$tmp3
        mv $i $tmp3
        cd -
        if [ ! -d "$tmp" ] && [ "$(ls -A $k)" ]; then
          mkdir -p "$tmp"
        fi
        cp $k/$tmp3 $tmp
        cd $k
      done
      cd -
    done
    ls
    rm -r cpp cc Java others txt
  else
    echo "Wrong input!. Try again"
  fi
  echo "forward or backward pass? "
  read user_input
done
