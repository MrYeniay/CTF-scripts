#!/bin/bash


((x=$(/usr/bin/curl http://hack.bckdr.in/2013-MISC-75/misc75.php --cookie cookies.txt --cookie-jar newcookies.txt | /usr/bin/awk {'print $16'})))
echo $x
toplam=$(./prime_number_calculator $x)

echo $toplam
echo "answer=$toplam"
/usr/bin/curl -i -s -k  -b newcookies.txt --data-binary "answer=$toplam" 'http://hack.bckdr.in/2013-MISC-75/misc75.php'
