#!/bin/bash


((x=$(/usr/bin/curl http://hack.bckdr.in/2013-MISC-75/misc75.php --cookie cookies.txt --cookie-jar newcookies.txt | /usr/bin/awk {'print $16'})))
echo $x
((toplam = 0))
((sayi=1))
((asal=1)) 
for (( i = 2; sayi <= x; i++ ))
do
for(( j=2; j<i; j++))
do
((asal=1)) 
if [  $(($i%$j)) -eq 0 ] 
then 
((asal=0)) 
break
fi
done
if [ $asal -eq 1 ]
then
((toplam=$((toplam + i))))
((sayi=$((sayi + 1))))
fi
done
echo $toplam
/usr/bin/curl -i -s -k  \
    -b newcookies.txt \
    --data-binary "answer=$toplam" \
    'http://hack.bckdr.in/2013-MISC-75/misc75.php'

