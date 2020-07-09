#!bin/bash

mkdir -p RAW-Filters
mkdir -p Processing-Phase
cd RAW-Filters/
rm -f COMBINED-RAW-HOSTS.TXT
rm -f *.txt.raw

curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o WindowsSpyBlocker_spy.txt.raw                       https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o WindowsSpyBlocker_extra.txt.raw                     https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/extra.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o notracking_dnscrypt-proxy.blacklist.txt.raw         https://raw.githubusercontent.com/notracking/hosts-blocklists/master/dnscrypt-proxy/dnscrypt-proxy.blacklist.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o NSABlocklist_Audio-Fingerprinting-pages.txt.raw     https://raw.githubusercontent.com/CHEF-KOCH/NSABlocklist/master/Tests/Audio%20Fingerprinting%20pages/Hosts.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o NSABlocklist_Microsoft.txt.raw                      https://raw.githubusercontent.com/CHEF-KOCH/NSABlocklist/master/Tests/Microsoft/MS.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o notracking_hostnames.txt.raw                        https://raw.githubusercontent.com/notracking/hosts-blocklists/master/hostnames.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o frogeye_firstparty-trackers-hosts.txt.raw           https://hostfiles.frogeye.fr/firstparty-trackers-hosts.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o eladkarako_raw-hosts.txt.raw                        https://github.com/eladkarako/hosts/raw/master/_raw__hosts.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o jerryn70_GoodbyeAds.txt.raw                         https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Hosts/GoodbyeAds.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o jerryn70_GoodbyeAds-YouTube-AdBlock.txt.raw         https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-YouTube-AdBlock.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o jerryn70_GoodbyeAds-Xiaomi-Extension.txt.raw        https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-Xiaomi-Extension.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o jerryn70_GoodbyeAds-Samsung-AdBlock.txt.raw         https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-Samsung-AdBlock.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o jerryn70_GoodbyeAds-LeEco-Extension.txt.raw         https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-LeEco-Extension.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o energized_ultimate-domains.txt.raw                  https://block.energized.pro/ultimate/formats/domains.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o energized_social-domains.txt.raw                    https://block.energized.pro/extensions/social/formats/domains.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o energized_regional-domains.txt.raw                  https://block.energized.pro/extensions/regional/formats/domains.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o energized_xtreme-domains.txt.raw                    https://block.energized.pro/extensions/xtreme/formats/domains.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o energized_ips-list.txt.raw                          https://block.energized.pro/extensions/ips/formats/list.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o dnswarden_block-3rd-party-cnames.txt.raw            https://raw.githubusercontent.com/dnswarden/blocklist/master/test/block-3rd-party-cnames.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o nextdns_cname-cloaking-blocklist.txt.raw            https://raw.githubusercontent.com/nextdns/cname-cloaking-blocklist/master/domains
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o AntiSocial_Blacklist_Community_V1.txt.raw           https://theantisocialengineer.com/AntiSocial_Blacklist_Community_V1.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o KADhosts.txt.raw                                    https://raw.githubusercontent.com/PolishFiltersTeam/KADhosts/master/KADhosts.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o polish-ads-filter_hostfile.txt.raw                  https://raw.githubusercontent.com/MajkiIT/polish-ads-filter/master/polish-pihole-filters/hostfile.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o anudeepND_CoinMiner.txt.raw                         https://raw.githubusercontent.com/anudeepND/blacklist/master/CoinMiner.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o MobileAdTrackers.txt.raw                            https://raw.githubusercontent.com/jawz101/MobileAdTrackers/master/hosts
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o notrack-blocklist.txt.raw                           https://gitlab.com/quidsup/notrack-blocklists/raw/master/notrack-blocklist.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shallalist_adv.txt.raw                              https://raw.githubusercontent.com/cbuijs/shallalist/master/adv/domains
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shallalist_tracker.txt.raw                          https://raw.githubusercontent.com/cbuijs/shallalist/master/tracker/domains
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o Spotify-Ad-free.txt.raw                             https://raw.githubusercontent.com/CHEF-KOCH/Spotify-Ad-free/master/filters/Spotify-HOSTS.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o phishing_army_blocklist.txt.raw                     https://phishing.army/download/phishing_army_blocklist.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o phishing_army_blocklist_extended.txt.raw            https://phishing.army/download/phishing_army_blocklist_extended.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o NSABlocklist_HOSTS.txt.raw                          https://raw.githubusercontent.com/CHEF-KOCH/NSABlocklist/master/HOSTS/HOSTS
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o oisd_dbl.txt.raw                                    https://dbl.oisd.nl/
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o oisd_dbl_light.txt.raw                              https://dblmobile.oisd.nl/
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o developerdan_ads-and-tracking-extended.txt.raw      https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o developerdan_tracking-aggressive-extended.txt.raw   https://www.github.developerdan.com/hosts/lists/tracking-aggressive-extended.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o developerdan_amp-hosts-extended.txt.raw             https://www.github.developerdan.com/hosts/lists/amp-hosts-extended.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o abpvn.txt.raw                                       https://abpvn.com/android/abpvn.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o Frellwits-Swedish-Hosts-File.txt.raw                https://raw.githubusercontent.com/lassekongo83/Frellwits-filter-lists/master/Frellwits-Swedish-Hosts-File.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o additional-hosts_unwanted-iranian.txt.raw           https://raw.githubusercontent.com/DRSDavidSoft/additional-hosts/master/domains/blacklist/unwanted-iranian.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o additional-hosts_adservers-and-trackers.txt.raw     https://raw.githubusercontent.com/DRSDavidSoft/additional-hosts/master/domains/blacklist/adservers-and-trackers.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o additional-hosts_activation.txt.raw                 https://raw.githubusercontent.com/DRSDavidSoft/additional-hosts/master/domains/blacklist/activation.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o Yhonay-AntiPopAds.txt.raw                           https://raw.githubusercontent.com/deathbybandaid/piholeparser/master/Subscribable-Lists/ParsedBlacklists/Yhonay-AntiPopAds.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o xorcan_xhosts.txt.raw                               https://raw.githubusercontent.com/xorcan/hosts/master/xhosts.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o Anti-WebMiner_blacklist.txt.raw                     https://raw.githubusercontent.com/greatis/Anti-WebMiner/master/blacklist.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o firebog_JoeWein.txt.raw                             https://v.firebog.net/hosts/JoeWein.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o firebog_JoeyLane.txt.raw                            https://v.firebog.net/hosts/JoeyLane.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o firebog_w3kbl.txt.raw                               https://v.firebog.net/hosts/static/w3kbl.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o Perflyst_SmartTV.txt.raw                            https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o Perflyst_android-tracking.txt.raw                   https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/android-tracking.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o bad_packets_list.txt.raw                            https://raw.githubusercontent.com/tg12/bad_packets_blocklist/master/bad_packets_list.txt
curl -L -s --compressed --connect-timeout 30 --retry 5 --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o gameindustry_hosts.txt.raw                          https://www.gameindustry.eu/files/hosts.txt

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
