#/bin/bash
output_file=/home/$(whoami)/bssid_list.txt
interface=`ip link | /bin/egrep 'state UP' | /usr/bin/cut -d: -f2`
buffer=`sudo /sbin/iwlist $interface scan | /bin/sed 's/\([ ]\)\1\+/\1/g'| /bin/egrep 'Address|ESSID|Channel' | /bin/egrep -v 'Freq' | /bin/egrep -o '([0-9A-F]{2}:){5}[A-F0-9]{2}|Channel:[0-9]+|ESSID:[^ ]+' | /usr/bin/tr '\r\n' ' '`

ap_count=`/bin/echo $buffer| /usr/bin/wc -w`
#sed 's/ESSID:" "/ESSID:"_"/g'
for ((i=1; i<=ap_count; (( i+=3 ))))
do 
echo $buffer | cut -d' ' -f$i,$(($i+1)),$(($i+2)) >> $output_file
done

/usr/bin/sort $output_file | /usr/bin/uniq | /usr/bin/tee $output_file
#/bin/cat $output_file | /bin/egrep -o '^([0-9A-F]{2}:){5}[0-9A-F]{2}' | /usr/bin/comm -23 whitelist_bssid.txt - | /usr/bin/tee bssid_list.txt
