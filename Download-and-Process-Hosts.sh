#!bin/bash

print_size () {
    filesize=$1
    arg2=$2
    if [ $filesize -ge 1048576 ]
    then
        filesize="$(awk 'BEGIN {printf "%.1f",'$filesize'/1048576}') MB"
    elif [ $filesize -ge 1024 ]
    then
        filesize="$(awk 'BEGIN {printf "%.1f",'$filesize'/1024}') KB"
    else
        filesize="$filesize B "
    fi
    if [ $arg2 == 2 ]
    then
        printf "%9s\n" "$filesize"
    else
        echo $filesize
    fi
}

# idna_to_dns "input-file-name" "output-file-name"
idna_to_dns () {
    input=$1
    output=$2
    sed '/[^\x00-\x7F]/d' $input > $output
    input_list="$(sed '/[^\x00-\x7F]/!d' $input)"
    python -c "exec(\"import sys\nhost = sys.argv[1:]\n[print(i.encode('idna').decode('utf8')) for i in host]\")" $input_list >> $output
}

rm -f -r output/
mkdir -p RAW-Filters
mkdir -p Processing-Phase
mkdir -p output/main
mkdir -p output/backup

cd RAW-Filters/
rm -f COMBINED-RAW-HOSTS.TXT
rm -f *.txt.raw

# make sure all source files will always be created (even if empty).
sed '/^output *=/!d;s/^output *= *//' ../sources.conf | xargs touch

# Download raw sources using the lists in 'sources.conf' file.
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 3 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -K ../sources.conf

# Process some raw sources to be in correct format.
sed -i 's/<.*$//;/^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}$/!d' gameindustry_adobe-inc_hosts.txt.raw
sed -i '/^0\.0\.0\.0 /!d;s/^0\.0\.0\.0 //;s/<.*$//;s/ .*$//' gameindustry_amazon-com-inc_hosts.txt.raw gameindustry_staedte-gemeinden_hosts.txt.raw gameindustry_ministerien-behoerden_hosts.txt.raw


#cat netlab-360_dga.txt.raw | sed '/^#/d' | awk '{print $2 }' > netlab-360_dga_domains.txt.raw
#rm -f netlab-360_dga.txt.raw

#sed 's/}/\n/g' exodus-privacy_trackers.json.raw | sed 's/^.*:\/\///g;/.*\/.*\/.*/d;s/\/\"$//;s/\"$//;/\//d;/\./!d' > exodus-privacy_trackers.txt.raw
sed 's/"network_signature": "/\n/g' exodus-privacy_trackers.json.raw | sed 's/", "website": "/\n/g;s/"}.*//;s/|/\n/g' | sed 's/\\\\//g;s/^\.//;s/^https*:\/\///;s/:.*//;s/\/.*//;s/\.$/\.\*/;s/\.\./\./;s/\[0-9\]//g;/\./!d;/{\|^$\|^github\.com$\|^twitter\.com$\|^en\.wikipedia\.org$\|^www\.mozilla\.org$\|^wiki\.mozilla\.org$\|^developer\.amazon\.com$\|^www\.developer\.amazon\.com$\|^cloud\.google\.com$\|^www\.adobe\.com$\|^developers\.google\.com$\|^google\.com$\|^www\.google\.com$\|^www\.googletagmanager\.com$\|^azure\.microsoft\.com$\|^docs\.microsoft\.com$/d;' | sort -u -o exodus-privacy_trackers.txt.raw
rm -f exodus-privacy_trackers.json.raw

#gzip -N -d dga-feed.gz
#sed 's/,Domain .*$//' dga-feed-all.csv > dga-feed.txt.raw
#rm -f dga-feed-all.csv


currdate="$(date -u +%Y-%m-%d)"
currtime="$(date -u +%H:%M:%S)"
currdatetime="$(date -u +%Y-%m-%d_%H-%M)"


#echo -e "Last Update Time (server-side)\n________________" > tmp5
#ls -1 *.txt.raw | while read line; do date -r $line "+%Y-%m-%d %H:%M"; done >> tmp5


#tar -czf ../output/sources-backup-$currdatetime.tar.gz *.txt.raw
cd ..
python -m zipfile -c sources-backup-$currdatetime.zip RAW-Filters/
cd RAW-Filters/

#CRLF to LF
ls -1 *.txt.raw | xargs sed -i -e 's/\r\+$//'

echo "" | tee -a *.txt.raw

echo $(ls -1q *.txt.raw | wc -l) sources
#ls -lah *.txt.raw | awk '{print $5 " " $9}' | sort -k2 | sed -e "s/ /\t/g"
#ls -lah *.txt.raw | awk '{print $9}' | xargs wc -l > stats
#find *.txt.raw -type f -exec wc -lc {} +
#ls -hs1 *.txt
#paste $(ls -1 *.txt | xargs wc -l | awk '{print $1}') $(ls -hs1 *.txt) | column -s $'\t' -tn
echo -e "Domains \n________" > tmp1
ls -1 *.txt.raw | xargs wc -l | awk '{print $1 }' >> tmp1

echo -e "  Size   \n_________" > tmp2
du -abc *.txt.raw | awk '{print $1 }' | while read line
do
    print_size $line 2 >> tmp2
done

echo -e "Name \n____________________________________________" > tmp3
du -abc *.txt.raw | awk '{print $2 }' | sed 's/\.txt\.raw$//' >> tmp3

paste tmp3 tmp2 | column -s $'\t' -t > tmp4
paste tmp4 tmp1 | column -s $'\t' -t > stats
#paste tmp3 tmp5 | column -s $'\t' -t > stats
rm -f tmp1
rm -f tmp2
rm -f tmp3
rm -f tmp4
#rm -f tmp5
rm -f ../stats
mv stats ..
mv mkb2091_whitelist_domains.txt.raw ../whitelist_domains.txt

#rm -f sources-backup.tar.gz
#tar -czf sources-backup.tar.gz *.txt.raw
#tmp1=$(curl -s --upload-file ./sources-backup.tar.gz https://transfer.sh/sources-backup.tar.gz)
#echo $tmp1 > ../raw-sources-backup
#rm -f sources-backup.tar.gz

cat *.txt.raw | tr '[:upper:]' '[:lower:]' > COMBINED-RAW-HOSTS.TXT
rm -f *.txt.raw

cd ..
rm -f Processing-Phase/COMBINED-RAW-HOSTS.TXT
mv RAW-Filters/COMBINED-RAW-HOSTS.TXT Processing-Phase/COMBINED-RAW-HOSTS.TXT


cd Processing-Phase/
rm -f CIDR-IPs.txt
sed '/^#/d;/^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\/[0-9]\{1,2\}$/!d' COMBINED-RAW-HOSTS.TXT | sort -V -o CIDR-IPs.txt

rm -f 1-cleaned.txt
sed '/^#\|^$\|^\t*$\|^!\|^||\|^|http/d;s/^.*[0-9]	*  *	*//;s/^.*[0-9]	* *		*//;s/^127\.0\.0\.1  *//;s/^::  *//;s/^::\.//;s/^\*\.//;s/ *	* *#.*$//;s/	*  *	*$//;s/		* *	*$//;s/\\$//;s/:443$//;s/:80$//;s/^www\.//;/  */d;/^-/d' COMBINED-RAW-HOSTS.TXT > 1-cleaned.txt

rm -f COMBINED-RAW-HOSTS.TXT
rm -f 2-no-www.txt
rm -f 2-temp.txt
rm -f Wildcards.txt
rm -f just-IPs.txt

sed '/^#\|^$\|^\t*$\|^!\|^||\|^|http\|\^\|(\|)\|\[\|\]\|{\|}\|=\|@\|<\|>\|%\|\$\|,\|;\|\/\|^\.\|\.$/d' 1-cleaned.txt > 2-temp.txt

rm -f 1-cleaned.txt

sed '/\*/!d' 2-temp.txt | sort -u -o Wildcards.txt

sed '/\./!d;/\*/d' 2-temp.txt > 3-temp.txt

# pu:ny:co:de
idna_to_dns "3-temp.txt" "2-no-www.txt"

rm -f 2-temp.txt
rm -f 3-temp.txt


rm -f 6-final-output.txt
rm -f 3-reversed.txt
rm -f 4-sorted.txt
perl -nlE 'say reverse split "([.])"' 2-no-www.txt > 3-reversed.txt
rm -f 2-no-www.txt
sort -i -s -u -o 4-sorted.txt 3-reversed.txt
rm -f 3-reversed.txt
perl -nlE 'say reverse split "([.])"' 4-sorted.txt > 6-final-output.txt
rm -f 4-sorted.txt
sed '/^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}$/!d' 6-final-output.txt | sort -V -o just-IPs.txt


## remove domains with invalid tlds

mv 6-final-output.txt temp-output.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o tld1.txt  https://data.iana.org/TLD/tlds-alpha-by-domain.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o tld2.txt  https://tld-list.com/df/tld-list-basic.txt
echo "" >> tld2.txt
echo -e "onion\neth\nbit\nzil\ncrypto\nwallet\ncoin\nx\nnft\nblockchain\nbitcoin\n888\ndao\nbbs\nchan\ncyb\ndyn\nepic\ngeek\ngopher\nindy\nlibre\nneo\nnull\no\noss\noz\nparody\npirate\nfree\nbazar\ncoin\nemc\nlib\nfur\nku\nte\nti\nuu\nko\nrm\nglue" > tld3.txt
ls -1 tld*.txt | xargs sed -i -e 's/\r\+$//'
if [ $(wc -l < tld1.txt) -lt 1000 ]; then
    cp ../TLD-list.txt tld1.txt
fi
if [ $(wc -l < tld2.txt) -lt 1000 ]; then
    cp ../TLD-list.txt tld2.txt
fi
cat tld1.txt tld2.txt tld3.txt | tr '[:upper:]' '[:lower:]' > tldtmp1.txt
idna_to_dns "tldtmp1.txt" "tldtmp2.txt"
sort -u -o tld.txt tldtmp2.txt
echo $(sed '/^#/d;/.*/!d' tld.txt) | sed 's/ /\$\\\|\\\./g;s/.*/\/\\\.&\$\/\!d/' > sedconf
sed -f sedconf temp-output.txt > 6-final-output.txt
cp tld.txt ../TLD-list.txt
rm -f sedconf temp-output.txt tld*.txt


cd ..
rm -f pDNSf-hosts.txt
rm -f pDNSf-hosts_no-whitelist.txt
rm -f pDNSf-hosts.txt.gz
rm -f pDNSf-hosts_no-whitelist.txt.gz
rm -f pDNSf-hosts-part*.txt
rm -f Wildcards.txt
rm -f CIDR-IPs.txt
rm -f just-IPs.txt
mv Processing-Phase/6-final-output.txt pDNSf-hosts-full.txt
mv Processing-Phase/Wildcards.txt Wildcards.txt
mv Processing-Phase/CIDR-IPs.txt CIDR-IPs.txt
mv Processing-Phase/just-IPs.txt just-IPs.txt



originalhostssize=$(du -abc pDNSf-hosts-full.txt | print_size $(awk '{print $1}'))
originalhostsnum=$(echo $(wc -l < pDNSf-hosts-full.txt) | sed -E -e ':a' -e 's/([[:digit:]])([[:digit:]]{3}([^[:digit:]]|$))/\1,\2/;ta')
echo -e "# Updated on $currdate $currtime UTC - by J-Moriarti (https://github.com/j-moriarti/pDNSf-Hosts-collection)\n# Package: Original version (no whitelists + no subdomains removal)" | cat - pDNSf-hosts-full.txt > pDNSf-hosts_no-whitelist.txt
gzip -f -9 pDNSf-hosts_no-whitelist.txt
originalgzsize=$(du -abc pDNSf-hosts_no-whitelist.txt.gz | print_size $(awk '{print $1}'))


cat whitelist_domains.txt allow_list.txt | tr '[:upper:]' '[:lower:]' > whitelist.txt
rm -f whitelist_domains.txt
sed -i 's/^www\.//' whitelist.txt
sort -u -o wl.txt whitelist.txt
rm -f whitelist.txt
sort -o pdnsf.txt pDNSf-hosts-full.txt
rm -f pDNSf-hosts-full.txt
comm -23 pdnsf.txt wl.txt > temp.txt
rm -f wl.txt
rm -f pdnsf.txt
perl -nlE 'say reverse split "([.])"' temp.txt > temp-reversed.txt
rm -f temp.txt
# Fix sort problem with priority of "-" character
sed -i 's/-/\\/g' temp-reversed.txt
sort -o temp-sorted.txt temp-reversed.txt
rm -f temp-reversed.txt
sed -i 's/\\/-/g' temp-sorted.txt
# Remove blocked subdomains from list, if the main domain is already blocked
awk '{if (index($0,p)!=1) {print $0; p=$0".";}}' p=. temp-sorted.txt > temp-cleaned.txt
rm -f temp-sorted.txt
perl -nlE 'say reverse split "([.])"' temp-cleaned.txt > pDNSf-hosts.txt
rm -f temp-cleaned.txt



wildcardsize=$(du -abc Wildcards.txt | print_size $(awk '{print $1}'))
wildcardnum=$(wc -l < Wildcards.txt | sed -E -e ':a' -e 's/([[:digit:]])([[:digit:]]{3}([^[:digit:]]|$))/\1,\2/;ta')
echo "# Updated on $currdate $currtime UTC - by J-Moriarti (https://github.com/j-moriarti/pDNSf-Hosts-collection)" | cat - Wildcards.txt > temp && mv temp Wildcards.txt

cidrsize=$(du -abc CIDR-IPs.txt | print_size $(awk '{print $1}'))
cidrnum=$(wc -l < CIDR-IPs.txt | sed -E -e ':a' -e 's/([[:digit:]])([[:digit:]]{3}([^[:digit:]]|$))/\1,\2/;ta')
echo "# Updated on $currdate $currtime UTC - by J-Moriarti (https://github.com/j-moriarti/pDNSf-Hosts-collection)" | cat - CIDR-IPs.txt > temp && mv temp CIDR-IPs.txt

ipsize=$(du -abc just-IPs.txt | print_size $(awk '{print $1}'))
ipnum=$(wc -l < just-IPs.txt | sed -E -e ':a' -e 's/([[:digit:]])([[:digit:]]{3}([^[:digit:]]|$))/\1,\2/;ta')
echo "# Updated on $currdate $currtime UTC - by J-Moriarti (https://github.com/j-moriarti/pDNSf-Hosts-collection)" | cat - just-IPs.txt > temp && mv temp just-IPs.txt

hostssize=$(du -abc pDNSf-hosts.txt | print_size $(awk '{print $1}'))
# hostsnum=$(echo $[$(wc -l < pDNSf-hosts.txt)+$(wc -l < just-IPs.txt)] | sed -E -e ':a' -e 's/([[:digit:]])([[:digit:]]{3}([^[:digit:]]|$))/\1,\2/;ta')
hostsnum=$(echo $(wc -l < pDNSf-hosts.txt) | sed -E -e ':a' -e 's/([[:digit:]])([[:digit:]]{3}([^[:digit:]]|$))/\1,\2/;ta')

split -a 1 -n l/3 -d pDNSf-hosts.txt pDNSf-hosts-part --additional-suffix=.txt

part0size="0 B"
if [ -f pDNSf-hosts-part0.txt ]; then
    part0size=$(du -abc pDNSf-hosts-part0.txt | print_size $(awk '{print $1}'))
else
    echo "#This list is temporarily empty at the moment." > pDNSf-hosts-part0.txt
fi
echo -e "# Updated on $currdate $currtime UTC - by J-Moriarti (https://github.com/j-moriarti/pDNSf-Hosts-collection)\n#Package: Split mode - Part 0 (1 of 3)\n" | cat - pDNSf-hosts-part0.txt > temp && mv temp pDNSf-hosts-part0.txt

part1size="0 B"
if [ -f pDNSf-hosts-part1.txt ]; then
    part1size=$(du -abc pDNSf-hosts-part1.txt | print_size $(awk '{print $1}'))
else
    echo "#This list is temporarily empty at the moment." > pDNSf-hosts-part1.txt
fi
echo -e "# Updated on $currdate $currtime UTC - by J-Moriarti (https://github.com/j-moriarti/pDNSf-Hosts-collection)\n#Package: Split mode - Part 1 (2 of 3)\n" | cat - pDNSf-hosts-part1.txt > temp && mv temp pDNSf-hosts-part1.txt

part2size="0 B"
if [ -f pDNSf-hosts-part2.txt ]; then
    part2size=$(du -abc pDNSf-hosts-part2.txt | print_size $(awk '{print $1}'))     
else
    echo "#This list is temporarily empty at the moment." > pDNSf-hosts-part2.txt
fi
echo -e "# Updated on $currdate $currtime UTC - by J-Moriarti (https://github.com/j-moriarti/pDNSf-Hosts-collection)\n#Package: Split mode - Part 2 (3 of 3)\n" | cat - pDNSf-hosts-part2.txt > temp && mv temp pDNSf-hosts-part2.txt

echo "# Updated on $currdate $currtime UTC - by J-Moriarti (https://github.com/j-moriarti/pDNSf-Hosts-collection)" | cat - pDNSf-hosts.txt > temp && mv temp pDNSf-hosts.txt
gzip -f -9 pDNSf-hosts.txt

gzsize=$(du -abc pDNSf-hosts.txt.gz | print_size $(awk '{print $1}'))

rm -f readme.md
sed -e "s/_originalhostssize_/$originalhostssize/g" -e "s/_originalhostsnum_/$originalhostsnum/g" -e "s/_hostssize_/$hostssize/g" -e "s/_hostsnum_/$hostsnum/g" -e "s/_wildcardsize_/$wildcardsize/g" -e "s/_wildcardnum_/$wildcardnum/g" -e "s/_cidrsize_/$cidrsize/g" -e "s/_cidrnum_/$cidrnum/g" -e "s/_ipsize_/$ipsize/g" -e "s/_ipnum_/$ipnum/g" -e "s/_part0size_/$part0size/g" -e "s/_part1size_/$part1size/g" -e "s/_part2size_/$part2size/g" -e "s/_gzsize_/$gzsize/g" -e "s/_originalgzsize_/$originalgzsize/g" template > readme.md


mv sources-backup-*.zip output/backup/
mv pDNSf-hosts.txt.gz output/main/
mv pDNSf-hosts_no-whitelist.txt.gz output/main/
mv Wildcards.txt output/main/
mv CIDR-IPs.txt output/main/
mv just-IPs.txt output/main/
mv pDNSf-hosts-part*.txt output/main/


cd output/backup/

curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o pDNSf-hosts-old.txt.gz  https://github.com/j-moriarti/pDNSf-Hosts-collection/releases/download/v1.0.0/pDNSf-hosts.txt.gz
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o pDNSf-hosts_no-whitelist-old.txt.gz  https://github.com/j-moriarti/pDNSf-Hosts-collection/releases/download/v1.0.0/pDNSf-hosts_no-whitelist.txt.gz

if [ $(stat -c%s pDNSf-hosts-old.txt.gz) -lt 10000 ]; then
	rm -f pDNSf-hosts-old.txt.gz
else
    moddate=$(date -r pDNSf-hosts-old.txt.gz "+%Y-%m-%d_%H-%M")
    mv pDNSf-hosts-old.txt.gz pDNSf-hosts-backup-$moddate.gz
fi

if [ $(stat -c%s pDNSf-hosts_no-whitelist-old.txt.gz) -lt 10000 ]; then
	rm -f pDNSf-hosts_no-whitelist-old.txt.gz
else
    moddate=$(date -r pDNSf-hosts_no-whitelist-old.txt.gz "+%Y-%m-%d_%H-%M")
    mv pDNSf-hosts_no-whitelist-old.txt.gz pDNSf-hosts_no-whitelist-backup-$moddate.gz
fi

echo "Finished."
