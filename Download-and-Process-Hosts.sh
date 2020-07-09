#!bin/bash

mkdir -p RAW-Filters
mkdir -p Processing-Phase
cd RAW-Filters/
rm -f COMBINED-RAW-HOSTS.TXT
rm -f *.txt.raw

curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o WindowsSpyBlocker_spy.txt.raw                       https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o WindowsSpyBlocker_extra.txt.raw                     https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/extra.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o energized_ips-list.txt.raw                          https://block.energized.pro/extensions/ips/formats/list.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o phishing_army_blocklist.txt.raw                     https://phishing.army/download/phishing_army_blocklist.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o oisd_dbl_light.txt.raw                              https://dblmobile.oisd.nl/
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o firebog_w3kbl.txt.raw                               https://v.firebog.net/hosts/static/w3kbl.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o dga-feed.gz                                         https://osint.bambenekconsulting.com/feeds/dga-feed.gz
gzip -N -d dga-feed.gz
sed 's/,Domain .*$//' dga-feed-all.csv > dga-feed.txt.raw
rm -f dga-feed-all.csv


echo -e "\n" | tee -a *.txt.raw
cat *.txt.raw | tr '[:upper:]' '[:lower:]' > COMBINED-RAW-HOSTS.TXT

cd ..
rm -f Processing-Phase/COMBINED-RAW-HOSTS.TXT
mv RAW-Filters/COMBINED-RAW-HOSTS.TXT Processing-Phase/COMBINED-RAW-HOSTS.TXT


cd Processing-Phase/
rm -f CIDR-IPs.txt
sed '/^#/d;/^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\/[0-9]\{1,2\}$/!d' COMBINED-RAW-HOSTS.TXT > CIDR-IPs.txt

rm -f 1-cleaned.txt
sed '/^#\|^$\|^\t*$\|^!\|^||\|^|http\|\^\|(\|)\|\[\|\]\|{\|}\|=\|@\|<\|>\|%\|\$\|,\|;\|\/\|^\.\|\.$/d' COMBINED-RAW-HOSTS.TXT > 1-cleaned.txt

rm -f 2-no-www.txt
rm -f 2-temp.txt
rm -f Wildcards.txt
rm -f just-IPs.txt

sed 's/^.*[0-9]	*  *	*//;s/^.*[0-9]	* *		*//;s/^127\.0\.0\.1  *//;s/^::  *//;s/^::\.//;s/^\*\.//;s/ *	* *#.*$//;s/	*  *	*$//;s/		* *	*$//;s/\\$//;s/^www\.//' 1-cleaned.txt | sed '/  */d' > 2-temp.txt

rm -f 1-cleaned.txt

sed '/\./!d;/\*/d' 2-temp.txt > 2-no-www.txt

sed '/\*/!d' 2-temp.txt | sort -u -o Wildcards.txt
rm -f 2-temp.txt


rm -f 6-final-output.txt
sort -u -o 6-final-output.txt 2-no-www.txt
rm -f 2-no-www.txt
sed '/^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}$/!d' 6-final-output.txt > just-IPs.txt


cd ..
rm -f pDNSf-hosts.txt
rm -f Wildcards.txt
rm -f CIDR-IPs.txt
rm -f just-IPs.txt
mv Processing-Phase/6-final-output.txt pDNSf-hosts.txt
mv Processing-Phase/Wildcards.txt Wildcards.txt
mv Processing-Phase/CIDR-IPs.txt CIDR-IPs.txt
mv Processing-Phase/just-IPs.txt just-IPs.txt

echo "Finished."
