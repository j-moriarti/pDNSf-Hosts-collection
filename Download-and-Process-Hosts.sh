#!bin/bash

mkdir -p RAW-Filters
mkdir -p Processing-Phase
cd RAW-Filters/
rm -f COMBINED-RAW-HOSTS.TXT
rm -f *.txt.raw

curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o WindowsSpyBlocker_spy.txt.raw                       https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o WindowsSpyBlocker_dnscrypt_spy.txt.raw              https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/dnscrypt/spy.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o WindowsSpyBlocker_extra.txt.raw                     https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/extra.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o WindowsSpyBlocker_dnscrypt_extra.txt.raw            https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/dnscrypt/extra.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o notracking_dnscrypt-proxy.blacklist.txt.raw         https://raw.githubusercontent.com/notracking/hosts-blocklists/master/dnscrypt-proxy/dnscrypt-proxy.blacklist.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o NSABlocklist_Audio-Fingerprinting-pages.txt.raw     https://raw.githubusercontent.com/CHEF-KOCH/NSABlocklist/master/Tests/Audio%20Fingerprinting%20pages/Hosts.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o NSABlocklist_Microsoft.txt.raw                      https://raw.githubusercontent.com/CHEF-KOCH/NSABlocklist/master/Tests/Microsoft/MS.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o notracking_hostnames.txt.raw                        https://raw.githubusercontent.com/notracking/hosts-blocklists/master/hostnames.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o frogeye_firstparty-trackers-hosts.txt.raw           https://hostfiles.frogeye.fr/firstparty-trackers-hosts.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o eladkarako_raw-hosts.txt.raw                        https://github.com/eladkarako/hosts/raw/master/_raw__hosts.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o jerryn70_GoodbyeAds.txt.raw                         https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Hosts/GoodbyeAds.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o jerryn70_GoodbyeAds-YouTube-AdBlock.txt.raw         https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-YouTube-AdBlock.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o jerryn70_GoodbyeAds-Xiaomi-Extension.txt.raw        https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-Xiaomi-Extension.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o jerryn70_GoodbyeAds-Samsung-AdBlock.txt.raw         https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-Samsung-AdBlock.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o jerryn70_GoodbyeAds-LeEco-Extension.txt.raw         https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-LeEco-Extension.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o energized_ultimate-domains.txt.raw                  https://block.energized.pro/ultimate/formats/domains.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o energized_social-domains.txt.raw                    https://block.energized.pro/extensions/social/formats/domains.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o energized_regional-domains.txt.raw                  https://block.energized.pro/extensions/regional/formats/domains.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o energized_xtreme-domains.txt.raw                    https://block.energized.pro/extensions/xtreme/formats/domains.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o energized_ips-list.txt.raw                          https://block.energized.pro/extensions/ips/formats/list.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o dnswarden_block-3rd-party-cnames.txt.raw            https://raw.githubusercontent.com/dnswarden/blocklist/master/test/block-3rd-party-cnames.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o nextdns_cname-cloaking-blocklist.txt.raw            https://raw.githubusercontent.com/nextdns/cname-cloaking-blocklist/master/domains
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o AntiSocial_Blacklist_Community_V1.txt.raw           https://theantisocialengineer.com/AntiSocial_Blacklist_Community_V1.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o KADhosts.txt.raw                                    https://raw.githubusercontent.com/PolishFiltersTeam/KADhosts/master/KADhosts.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o polish-ads-filter_hostfile.txt.raw                  https://raw.githubusercontent.com/MajkiIT/polish-ads-filter/master/polish-pihole-filters/hostfile.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o anudeepND_CoinMiner.txt.raw                         https://raw.githubusercontent.com/anudeepND/blacklist/master/CoinMiner.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o MobileAdTrackers.txt.raw                            https://raw.githubusercontent.com/jawz101/MobileAdTrackers/master/hosts
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o notrack-blocklist.txt.raw                           https://gitlab.com/quidsup/notrack-blocklists/raw/master/notrack-blocklist.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shallalist_adv.txt.raw                              https://raw.githubusercontent.com/cbuijs/shallalist/master/adv/domains
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shallalist_tracker.txt.raw                          https://raw.githubusercontent.com/cbuijs/shallalist/master/tracker/domains
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o Spotify-Ad-free.txt.raw                             https://raw.githubusercontent.com/CHEF-KOCH/Spotify-Ad-free/master/filters/Spotify-HOSTS.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o phishing_army_blocklist.txt.raw                     https://phishing.army/download/phishing_army_blocklist.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o phishing_army_blocklist_extended.txt.raw            https://phishing.army/download/phishing_army_blocklist_extended.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o NSABlocklist_HOSTS.txt.raw                          https://raw.githubusercontent.com/CHEF-KOCH/NSABlocklist/master/HOSTS/HOSTS
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o oisd_dbl.txt.raw                                    https://dbl.oisd.nl/
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o oisd_dbl_light.txt.raw                              https://dblmobile.oisd.nl/
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o developerdan_ads-and-tracking-extended.txt.raw      https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o developerdan_tracking-aggressive-extended.txt.raw   https://www.github.developerdan.com/hosts/lists/tracking-aggressive-extended.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o developerdan_amp-hosts-extended.txt.raw             https://www.github.developerdan.com/hosts/lists/amp-hosts-extended.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o abpvn.txt.raw                                       https://abpvn.com/android/abpvn.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o Frellwits-Swedish-Hosts-File.txt.raw                https://raw.githubusercontent.com/lassekongo83/Frellwits-filter-lists/master/Frellwits-Swedish-Hosts-File.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o additional-hosts_unwanted-iranian.txt.raw           https://raw.githubusercontent.com/DRSDavidSoft/additional-hosts/master/domains/blacklist/unwanted-iranian.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o additional-hosts_adservers-and-trackers.txt.raw     https://raw.githubusercontent.com/DRSDavidSoft/additional-hosts/master/domains/blacklist/adservers-and-trackers.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o additional-hosts_activation.txt.raw                 https://raw.githubusercontent.com/DRSDavidSoft/additional-hosts/master/domains/blacklist/activation.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o Yhonay-AntiPopAds.txt.raw                           https://raw.githubusercontent.com/Yhonay/antipopads/master/popads.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o xorcan_xhosts.txt.raw                               https://raw.githubusercontent.com/xorcan/hosts/master/xhosts.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o Anti-WebMiner_blacklist.txt.raw                     https://raw.githubusercontent.com/greatis/Anti-WebMiner/master/blacklist.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o firebog_JoeWein.txt.raw                             https://v.firebog.net/hosts/JoeWein.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o firebog_JoeyLane.txt.raw                            https://v.firebog.net/hosts/JoeyLane.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o firebog_w3kbl.txt.raw                               https://v.firebog.net/hosts/static/w3kbl.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o Perflyst_SmartTV.txt.raw                            https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o Perflyst_android-tracking.txt.raw                   https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/android-tracking.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o Perflyst_AmazonFireTV.txt.raw                       https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/AmazonFireTV.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o bad_packets_list.txt.raw                            https://raw.githubusercontent.com/tg12/bad_packets_blocklist/master/bad_packets_list.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o gameindustry_hosts.txt.raw                          https://www.gameindustry.eu/files/hosts.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ShadowWhisperer_Ads.txt.raw                         https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Ads
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ShadowWhisperer_Apple.txt.raw                       https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Apple
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ShadowWhisperer_Bitcoin.txt.raw                     https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Bitcoin
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ShadowWhisperer_Bloat.txt.raw                       https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Bloat
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ShadowWhisperer_Chat.txt.raw                        https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Chat
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ShadowWhisperer_Dynamic.txt.raw                     https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Dynamic
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ShadowWhisperer_Malware.txt.raw                     https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Malware
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ShadowWhisperer_Malware-Scam-Typo.txt.raw           https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Malware-Scam-Typo
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ShadowWhisperer_Marketing.txt.raw                   https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Marketing
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ShadowWhisperer_Marketing-Email.txt.raw             https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Marketing-Email
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ShadowWhisperer_Microsoft.txt.raw                   https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Microsoft
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ShadowWhisperer_Remote.txt.raw                      https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Remote
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ShadowWhisperer_Scam.txt.raw                        https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Scam
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ShadowWhisperer_Suspicious.txt.raw                  https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Suspicious
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ShadowWhisperer_Tracking.txt.raw                    https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Tracking
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ShadowWhisperer_Typo.txt.raw                        https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Typo
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o DandelionSprout_AntiMalwareHosts.txt.raw            https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareHosts.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o osint_latestdomains.txt.raw                         https://osint.digitalside.it/Threat-Intel/lists/latestdomains.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o mkb2091_domains.txt.raw                             https://raw.githubusercontent.com/mkb2091/blockconvert/master/output/domains.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o mkb2091_ip-blocklist.txt.raw                        https://raw.githubusercontent.com/mkb2091/blockconvert/master/output/ip_blocklist.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o malwaredomains_justdomains.txt.raw                  https://mirror.cedia.org.ec/malwaredomains/justdomains

curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o dga-feed.gz                                         https://osint.bambenekconsulting.com/feeds/dga-feed.gz
gzip -N -d dga-feed.gz
sed 's/,Domain .*$//' dga-feed-all.csv > dga-feed.txt.raw
rm -f dga-feed-all.csv

echo "" | tee -a *.txt.raw

echo $(ls -1q *.txt.raw | wc -l) sources
#ls -lah *.txt.raw | awk '{print $5 " " $9}' | sort -k2 | sed -e "s/ /\t/g"
#ls -lah *.txt.raw | awk '{print $9}' | xargs wc -l > stats
#find *.txt.raw -type f -exec wc -lc {} +
#ls -hs1 *.txt
#paste $(ls -1 *.txt | xargs wc -l | awk '{print $1}') $(ls -hs1 *.txt) | column -s $'\t' -tn
echo -e "Domains \n________" > tmp1
ls -1 *.txt.raw | xargs wc -l | awk '{print $1 }' >> tmp1
echo -e "Size\n_________________________________________________" > tmp2
ls -hs1 *.txt.raw >> tmp2
paste tmp1 tmp2 | column -s $'\t' -t > stats
rm -f tmp1
rm -f tmp2
rm -f ../stats
mv stats ..

cat *.txt.raw | tr '[:upper:]' '[:lower:]' > COMBINED-RAW-HOSTS.TXT
rm -f *.txt.raw

cd ..
rm -f Processing-Phase/COMBINED-RAW-HOSTS.TXT
mv RAW-Filters/COMBINED-RAW-HOSTS.TXT Processing-Phase/COMBINED-RAW-HOSTS.TXT


cd Processing-Phase/
rm -f CIDR-IPs.txt
sed '/^#/d;/^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\/[0-9]\{1,2\}$/!d' COMBINED-RAW-HOSTS.TXT > CIDR-IPs.txt

rm -f 1-cleaned.txt
sed '/^#\|^$\|^\t*$\|^!\|^||\|^|http\|\^\|(\|)\|\[\|\]\|{\|}\|=\|@\|<\|>\|%\|\$\|,\|;\|\/\|^\.\|\.$/d' COMBINED-RAW-HOSTS.TXT > 1-cleaned.txt

rm -f COMBINED-RAW-HOSTS.TXT
rm -f 2-no-www.txt
rm -f 2-temp.txt
rm -f Wildcards.txt
rm -f just-IPs.txt

sed 's/^.*[0-9]	*  *	*//;s/^.*[0-9]	* *		*//;s/^127\.0\.0\.1  *//;s/^::  *//;s/^::\.//;s/^\*\.//;s/ *	* *#.*$//;s/	*  *	*$//;s/		* *	*$//;s/\\$//;s/^www\.//;/  */d;/^-/d' 1-cleaned.txt > 2-temp.txt

rm -f 1-cleaned.txt

sed '/\./!d;/\*/d' 2-temp.txt > 2-no-www.txt

sed '/\*/!d' 2-temp.txt | sort -u -o Wildcards.txt
rm -f 2-temp.txt


rm -f 6-final-output.txt
rm -f 3-reversed.txt
rm -f 4-sorted.txt
perl -nlE 'say reverse split "([.])"' 2-no-www.txt > 3-reversed.txt
rm -f 2-no-www.txt
sort -i -s -u -o 4-sorted.txt 3-reversed.txt
rm -f 3-reversed.txt
perl -nlE 'say reverse split "([.])"' 4-sorted.txt > 6-final-output.txt
rm -f 4-sorted.txt
sed '/^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}$/!d' 6-final-output.txt > just-IPs.txt


cd ..
rm -f pDNSf-hosts.txt
rm -f pDNSf-hosts.txt.gz
rm -f pDNSf-hosts-part*.txt
rm -f Wildcards.txt
rm -f CIDR-IPs.txt
rm -f just-IPs.txt
mv Processing-Phase/6-final-output.txt pDNSf-hosts.txt
mv Processing-Phase/Wildcards.txt Wildcards.txt
mv Processing-Phase/CIDR-IPs.txt CIDR-IPs.txt
mv Processing-Phase/just-IPs.txt just-IPs.txt

hostssize=$(ls -lah pDNSf-hosts.txt | awk '{print $5}')
hostsnum=$(wc -l < pDNSf-hosts.txt | sed -E -e ':a' -e 's/([[:digit:]])([[:digit:]]{3}([^[:digit:]]|$))/\1,\2/;ta')
wildcardsize=$(ls -lah Wildcards.txt | awk '{print $5}')
wildcardnum=$(wc -l < Wildcards.txt | sed -E -e ':a' -e 's/([[:digit:]])([[:digit:]]{3}([^[:digit:]]|$))/\1,\2/;ta')
cidrsize=$(ls -lah CIDR-IPs.txt | awk '{print $5}')
cidrnum=$(wc -l < CIDR-IPs.txt | sed -E -e ':a' -e 's/([[:digit:]])([[:digit:]]{3}([^[:digit:]]|$))/\1,\2/;ta')
ipsize=$(ls -lah just-IPs.txt | awk '{print $5}')
ipnum=$(wc -l < just-IPs.txt | sed -E -e ':a' -e 's/([[:digit:]])([[:digit:]]{3}([^[:digit:]]|$))/\1,\2/;ta')

split -a 1 -C 30M -d pDNSf-hosts.txt pDNSf-hosts-part --additional-suffix=.txt

part0size=0
if [ -f pDNSf-hosts-part0.txt ]; then
    part0size=$(ls -lah pDNSf-hosts-part0.txt | awk '{print $5}')
else
    touch pDNSf-hosts-part0.txt
fi

part1size=0
if [ -f pDNSf-hosts-part1.txt ]; then
    part1size=$(ls -lah pDNSf-hosts-part1.txt | awk '{print $5}')
else
    touch pDNSf-hosts-part1.txt
fi

part2size=0
if [ -f pDNSf-hosts-part2.txt ]; then
    part2size=$(ls -lah pDNSf-hosts-part2.txt | awk '{print $5}')     
else
    touch pDNSf-hosts-part2.txt
fi

gzip -f -9 pDNSf-hosts.txt

gzsize=$(ls -lah pDNSf-hosts.txt.gz | awk '{print $5}')

rm -f readme.md
sed -e "s/_hostssize_/$hostssize/g" -e "s/_hostsnum_/$hostsnum/g" -e "s/_wildcardsize_/$wildcardsize/g" -e "s/_wildcardnum_/$wildcardnum/g" -e "s/_cidrsize_/$cidrsize/g" -e "s/_cidrnum_/$cidrnum/g" -e "s/_ipsize_/$ipsize/g" -e "s/_ipnum_/$ipnum/g" -e "s/_part0size_/$part0size/g" -e "s/_part1size_/$part1size/g" -e "s/_part2size_/$part2size/g" -e "s/_gzsize_/$gzsize/g" template > readme.md

echo "Finished."
