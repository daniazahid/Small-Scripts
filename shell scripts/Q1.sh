# !/bin/bash 
# Script to print a generic pattern
n=1
case $1 in
right)
echo $1 pattern of size: $2
space=$(( $2-1 ))

# first half of the pattern
while [ $n -lt $2 ]
do
  k=1
  while [ $k -le $space ]
  do
    echo -n " "
    k=$(( k+1 ))
  done
  star=1
  while [ $star -le $n ]
  do
    echo -n "*"
    star=$(( star+1 ))
  done
  echo -e "\n"
  space=$(( space-1 ))
  n=$(( n+1 ))
done

# second half of the pattern
k=0
r=$star
while [ $n -gt 0 ]
do
  space=0
  star=$r
  while [ $space -lt $k ]
  do
    echo -n " "
    space=$(( space+1 ))
  done
  while [ $star -gt 0 ]
  do
    echo -n "*"
    star=$(( star-1 ))
  done
  echo -e "\n"
  r=$(( r-1 ))
  k=$(( k+1 ))
  n=$(( n-1 ))
done

;;
left)
echo $1 pattern of size: $2
r=1
while [ $n -lt $2 ]
do
   i=0
  while [ $i -lt $r ]
  do
    echo -n "*"
    i=$(( i+1 ))
  done
  echo -e "\n"
  r=$(( r+1 ))
  n=$(( n+1 ))
done
r=$i
while [ $n -gt 0 ]
do
  i=$r
  while [ $i -ge 0 ]
  do
    echo -n "*"
    i=$(( i-1 ))
  done
echo -e "\n"
r=$((r-1))
n=$(( n-1 ))
done
;;

full)
echo Full pattern of size: $2
space=$(( $2-1 ))
m=$n
while [ $n -le $2 ]
do
  k=1
  while [ $k -le $space ]
  do
    echo -n " "
    k=$(( k+1 ))
  done
  star=1
  space2=$space
  while [ $star -le $m ]
  do
    echo -n "*"
    star=$(( star+1 ))
  done
  while [ $space2 -gt 0 ]
  do
    echo -n " "
    space2=$(( space2-1 ))
  done

  echo -e "\n"
  space=$(( space-1 ))
  m=$(( m+2 ))
  n=$(( n+1 ))
done

#second half of the pattern 


k=1
star=$(( star-3 ))
r=$star
n=$((n-2))
while [ $n -gt 0 ]
do
  space=0
  while [ $space -lt $k ]
  do
    echo -n " "
    space=$(( space+1 ))
  done
  star=$r
  while [ $star -gt 0 ]
  do
    echo -n "*"
    star=$(( star-1 ))
  done
  space2=$space
  while [ $space2 -gt 0 ]
  do
    echo -n " "
    space2=$(( space2-1 ))
  done
  echo -e "\n"
  r=$(( r-2 ))
  k=$(( k+1 ))
  n=$(( n-1 ))
done
;;

*)
echo "Sorry pattern option not recognized!";;
esac
