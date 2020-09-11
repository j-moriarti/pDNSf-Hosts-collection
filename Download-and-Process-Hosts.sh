#!bin/bash

rm -f -r output/
mkdir -p RAW-Filters
mkdir -p Processing-Phase
mkdir -p output/main
mkdir -p output/backup

cd RAW-Filters/
rm -f COMBINED-RAW-HOSTS.TXT
rm -f *.txt.raw

curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o windowsspyblocker_spy.txt.raw                       https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o windowsspyblocker_dnscrypt_spy.txt.raw              https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/dnscrypt/spy.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o windowsspyblocker_extra.txt.raw                     https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/extra.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o windowsspyblocker_dnscrypt_extra.txt.raw            https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/dnscrypt/extra.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o notracking_dnscrypt-proxy.blacklist.txt.raw         https://raw.githubusercontent.com/notracking/hosts-blocklists/master/dnscrypt-proxy/dnscrypt-proxy.blacklist.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o chef-koch_audio-fingerprinting-pages.txt.raw        https://raw.githubusercontent.com/CHEF-KOCH/NSABlocklist/master/Tests/Audio%20Fingerprinting%20pages/Hosts.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o chef-koch_microsoft.txt.raw                         https://raw.githubusercontent.com/CHEF-KOCH/NSABlocklist/master/Tests/Microsoft/MS.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o chef-koch_apple-telemetry-hosts.txt.raw             https://gitlab.com/CHEF-KOCH/cks-filterlist/-/raw/master/Anti-Corp/hosts/AppleTelemetry.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o chef-koch_ads-tracker-hosts.txt.raw                 https://gitlab.com/CHEF-KOCH/cks-filterlist/-/raw/master/hosts/Ads-tracker.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o chef-koch_anti-fpt-hosts.txt.raw                    https://gitlab.com/CHEF-KOCH/cks-filterlist/-/raw/master/hosts/Anti-FPT.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o chef-koch_spotify-ad-free.txt.raw                   https://raw.githubusercontent.com/CHEF-KOCH/Spotify-Ad-free/master/filters/Spotify-HOSTS.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o chef-koch_spotify-ad-free-mirror.txt.raw            https://gitlab.com/CHEF-KOCH/cks-filterlist/-/raw/master/Anti-Corp/Spotify/Spotify-HOSTS.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o chef-koch_nsablocklist_hosts.txt.raw                https://raw.githubusercontent.com/CHEF-KOCH/NSABlocklist/master/HOSTS/HOSTS
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o chef-koch_nsablocklist_hosts-mirror.txt.raw         https://gitlab.com/CHEF-KOCH/cks-filterlist/-/raw/master/Anti-Corp/hosts/NSABlocklist.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o chef-koch_crashlytics_hosts.txt.raw                 https://gitlab.com/CHEF-KOCH/cks-filterlist/-/raw/master/hosts/Crashlytics.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o chef-koch_malware_hosts.txt.raw                     https://gitlab.com/CHEF-KOCH/cks-filterlist/-/raw/master/hosts/Malware.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o chef-koch_coinminer_hosts.txt.raw                   https://gitlab.com/CHEF-KOCH/cks-filterlist/-/raw/master/hosts/coinminer.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o notracking_hostnames.txt.raw                        https://raw.githubusercontent.com/notracking/hosts-blocklists/master/hostnames.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o frogeye_firstparty-trackers-hosts.txt.raw           https://hostfiles.frogeye.fr/firstparty-trackers-hosts.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o eladkarako_raw-hosts.txt.raw                        https://github.com/eladkarako/hosts/raw/master/_raw__hosts.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o jerryn70_goodbyeads.txt.raw                         https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Hosts/GoodbyeAds.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o jerryn70_goodbyeads-youtube-adblock.txt.raw         https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-YouTube-AdBlock.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o jerryn70_goodbyeads-xiaomi-extension.txt.raw        https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-Xiaomi-Extension.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o jerryn70_goodbyeads-samsung-adblock.txt.raw         https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-Samsung-AdBlock.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o jerryn70_goodbyeads-leeco-extension.txt.raw         https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-LeEco-Extension.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o energized_ultimate-domains.txt.raw                  https://block.energized.pro/ultimate/formats/domains.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o energized_social-domains.txt.raw                    https://block.energized.pro/extensions/social/formats/domains.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o energized_regional-domains.txt.raw                  https://block.energized.pro/extensions/regional/formats/domains.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o energized_xtreme-domains.txt.raw                    https://block.energized.pro/extensions/xtreme/formats/domains.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o energized_ips-list.txt.raw                          https://block.energized.pro/extensions/ips/formats/list.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o dnswarden_block-3rd-party-cnames.txt.raw            https://raw.githubusercontent.com/dnswarden/blocklist/master/test/block-3rd-party-cnames.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o nextdns_cname-cloaking-blocklist.txt.raw            https://raw.githubusercontent.com/nextdns/cname-cloaking-blocklist/master/domains
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o antisocial_blacklist_community_v1.txt.raw           https://theantisocialengineer.com/AntiSocial_Blacklist_Community_V1.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o kadhosts.txt.raw                                    https://raw.githubusercontent.com/PolishFiltersTeam/KADhosts/master/KADhosts.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o polish-ads-filter_hostfile.txt.raw                  https://raw.githubusercontent.com/MajkiIT/polish-ads-filter/master/polish-pihole-filters/hostfile.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o anudeepnd_coinminer.txt.raw                         https://raw.githubusercontent.com/anudeepND/blacklist/master/CoinMiner.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o mobileadtrackers.txt.raw                            https://raw.githubusercontent.com/jawz101/MobileAdTrackers/master/hosts
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o notrack-blocklist.txt.raw                           https://gitlab.com/quidsup/notrack-blocklists/raw/master/notrack-blocklist.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shallalist_adv.txt.raw                              https://raw.githubusercontent.com/cbuijs/shallalist/master/adv/domains
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shallalist_tracker.txt.raw                          https://raw.githubusercontent.com/cbuijs/shallalist/master/tracker/domains
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o phishing_army_blocklist.txt.raw                     https://phishing.army/download/phishing_army_blocklist.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o phishing_army_blocklist_extended.txt.raw            https://phishing.army/download/phishing_army_blocklist_extended.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o oisd_dbl.txt.raw                                    https://dbl.oisd.nl/
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o oisd_dbl_light.txt.raw                              https://dblmobile.oisd.nl/
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o developerdan_ads-and-tracking-extended.txt.raw      https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o developerdan_tracking-aggressive-extended.txt.raw   https://www.github.developerdan.com/hosts/lists/tracking-aggressive-extended.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o developerdan_amp-hosts-extended.txt.raw             https://www.github.developerdan.com/hosts/lists/amp-hosts-extended.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o abpvn.txt.raw                                       https://abpvn.com/android/abpvn.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o frellwits-swedish-hosts-file.txt.raw                https://raw.githubusercontent.com/lassekongo83/Frellwits-filter-lists/master/Frellwits-Swedish-Hosts-File.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o additional-hosts_unwanted-iranian.txt.raw           https://raw.githubusercontent.com/DRSDavidSoft/additional-hosts/master/domains/blacklist/unwanted-iranian.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o additional-hosts_adservers-and-trackers.txt.raw     https://raw.githubusercontent.com/DRSDavidSoft/additional-hosts/master/domains/blacklist/adservers-and-trackers.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o additional-hosts_activation.txt.raw                 https://raw.githubusercontent.com/DRSDavidSoft/additional-hosts/master/domains/blacklist/activation.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o yhonay-antipopads.txt.raw                           https://raw.githubusercontent.com/Yhonay/antipopads/master/popads.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o xorcan_xhosts.txt.raw                               https://raw.githubusercontent.com/xorcan/hosts/master/xhosts.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o anti-webminer_blacklist.txt.raw                     https://raw.githubusercontent.com/greatis/Anti-WebMiner/master/blacklist.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o firebog_joewein.txt.raw                             https://v.firebog.net/hosts/JoeWein.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o firebog_joeylane.txt.raw                            https://v.firebog.net/hosts/JoeyLane.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o firebog_w3kbl.txt.raw                               https://v.firebog.net/hosts/static/w3kbl.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o perflyst_smarttv.txt.raw                            https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o perflyst_android-tracking.txt.raw                   https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/android-tracking.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o perflyst_amazonfiretv.txt.raw                       https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/AmazonFireTV.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o bad_packets_list.txt.raw                            https://raw.githubusercontent.com/tg12/bad_packets_blocklist/master/bad_packets_list.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o gameindustry_hosts.txt.raw                          https://www.gameindustry.eu/files/hosts.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_ads.txt.raw                         https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Ads
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_apple.txt.raw                       https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Apple
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_bitcoin.txt.raw                     https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Bitcoin
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_bloat.txt.raw                       https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Bloat
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_chat.txt.raw                        https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Chat
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_dynamic.txt.raw                     https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Dynamic
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_malware.txt.raw                     https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Malware
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_malware-scam-typo.txt.raw           https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Malware-Scam-Typo
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_marketing.txt.raw                   https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Marketing
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_marketing-email.txt.raw             https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Marketing-Email
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_microsoft.txt.raw                   https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Microsoft
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_remote.txt.raw                      https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Remote
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_scam.txt.raw                        https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Scam
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_suspicious.txt.raw                  https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Suspicious
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_tracking.txt.raw                    https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Tracking
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_typo.txt.raw                        https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Typo
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o dandelionsprout_antimalwarehosts.txt.raw            https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareHosts.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o osint_latestdomains.txt.raw                         https://osint.digitalside.it/Threat-Intel/lists/latestdomains.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o mkb2091_domains.txt.raw                             https://raw.githubusercontent.com/mkb2091/blockconvert/master/output/domains.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o mkb2091_ip-blocklist.txt.raw                        https://raw.githubusercontent.com/mkb2091/blockconvert/master/output/ip_blocklist.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o malwaredomains_justdomains.txt.raw                  https://mirror.cedia.org.ec/malwaredomains/justdomains
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o feodotracker_ipblocklist-recommended.txt.raw        https://feodotracker.abuse.ch/downloads/ipblocklist_recommended.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o blocklist.de_lists_all.txt.raw                      https://lists.blocklist.de/lists/all.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o binarydefense_banlist.txt.raw                       https://www.binarydefense.com/banlist.txt
curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o badips_list_any-age-3days.txt.raw                   https://www.badips.com/get/list/any/3?age=3d

curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o netlab-360_dga.txt.raw                              https://data.netlab.360.com/feeds/dga/dga.txt
cat netlab-360_dga.txt.raw | sed '/^#/d' | awk '{print $2 }' > netlab-360_dga_domains.txt.raw
rm -f netlab-360_dga.txt.raw

#curl -L -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o dga-feed.gz                                         https://osint.bambenekconsulting.com/feeds/dga-feed.gz
#gzip -N -d dga-feed.gz
#sed 's/,Domain .*$//' dga-feed-all.csv > dga-feed.txt.raw
#rm -f dga-feed-all.csv

currdate="$(date -u +%Y-%m-%d)"
currtime="$(date -u +%H:%M:%S)"
currdatetime="$(date -u +%Y-%m-%d_%H-%M)"

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
echo -e "Size\n_________________________________________________" > tmp2
ls -hs1 *.txt.raw >> tmp2
paste tmp1 tmp2 | column -s $'\t' -t > stats
rm -f tmp1
rm -f tmp2
rm -f ../stats
mv stats ..

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
echo "# Updated on $currdate $currtime UTC - by J-Moriarti (https://github.com/j-moriarti/pDNSf-Hosts-collection)" | cat - Wildcards.txt > temp && mv temp Wildcards.txt

cidrsize=$(ls -lah CIDR-IPs.txt | awk '{print $5}')
cidrnum=$(wc -l < CIDR-IPs.txt | sed -E -e ':a' -e 's/([[:digit:]])([[:digit:]]{3}([^[:digit:]]|$))/\1,\2/;ta')
echo "# Updated on $currdate $currtime UTC - by J-Moriarti (https://github.com/j-moriarti/pDNSf-Hosts-collection)" | cat - CIDR-IPs.txt > temp && mv temp CIDR-IPs.txt

ipsize=$(ls -lah just-IPs.txt | awk '{print $5}')
ipnum=$(wc -l < just-IPs.txt | sed -E -e ':a' -e 's/([[:digit:]])([[:digit:]]{3}([^[:digit:]]|$))/\1,\2/;ta')
echo "# Updated on $currdate $currtime UTC - by J-Moriarti (https://github.com/j-moriarti/pDNSf-Hosts-collection)" | cat - just-IPs.txt > temp && mv temp just-IPs.txt

split -a 1 -C 30M -d pDNSf-hosts.txt pDNSf-hosts-part --additional-suffix=.txt

part0size=0
if [ -f pDNSf-hosts-part0.txt ]; then
    part0size=$(ls -lah pDNSf-hosts-part0.txt | awk '{print $5}')
else
    echo "#This list is temporarily empty at the moment." > pDNSf-hosts-part0.txt
fi
echo "# Updated on $currdate $currtime UTC - by J-Moriarti (https://github.com/j-moriarti/pDNSf-Hosts-collection)" | cat - pDNSf-hosts-part0.txt > temp && mv temp pDNSf-hosts-part0.txt

part1size=0
if [ -f pDNSf-hosts-part1.txt ]; then
    part1size=$(ls -lah pDNSf-hosts-part1.txt | awk '{print $5}')
else
    echo "#This list is temporarily empty at the moment." > pDNSf-hosts-part1.txt
fi
echo "# Updated on $currdate $currtime UTC - by J-Moriarti (https://github.com/j-moriarti/pDNSf-Hosts-collection)" | cat - pDNSf-hosts-part1.txt > temp && mv temp pDNSf-hosts-part1.txt

part2size=0
if [ -f pDNSf-hosts-part2.txt ]; then
    part2size=$(ls -lah pDNSf-hosts-part2.txt | awk '{print $5}')     
else
    echo "#This list is temporarily empty at the moment." > pDNSf-hosts-part2.txt
fi
echo "# Updated on $currdate $currtime UTC - by J-Moriarti (https://github.com/j-moriarti/pDNSf-Hosts-collection)" | cat - pDNSf-hosts-part2.txt > temp && mv temp pDNSf-hosts-part2.txt

echo "# Updated on $currdate $currtime UTC - by J-Moriarti (https://github.com/j-moriarti/pDNSf-Hosts-collection)" | cat - pDNSf-hosts.txt > temp && mv temp pDNSf-hosts.txt
gzip -f -9 pDNSf-hosts.txt

gzsize=$(ls -lah pDNSf-hosts.txt.gz | awk '{print $5}')

rm -f readme.md
sed -e "s/_hostssize_/$hostssize/g" -e "s/_hostsnum_/$hostsnum/g" -e "s/_wildcardsize_/$wildcardsize/g" -e "s/_wildcardnum_/$wildcardnum/g" -e "s/_cidrsize_/$cidrsize/g" -e "s/_cidrnum_/$cidrnum/g" -e "s/_ipsize_/$ipsize/g" -e "s/_ipnum_/$ipnum/g" -e "s/_part0size_/$part0size/g" -e "s/_part1size_/$part1size/g" -e "s/_part2size_/$part2size/g" -e "s/_gzsize_/$gzsize/g" template > readme.md


mv sources-backup-*.zip output/backup/
mv pDNSf-hosts.txt.gz output/main/
mv Wildcards.txt output/main/
mv CIDR-IPs.txt output/main/
mv just-IPs.txt output/main/
mv pDNSf-hosts-part0.txt output/main/
mv pDNSf-hosts-part1.txt output/main/
mv pDNSf-hosts-part2.txt output/main/

cd output/backup/

curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o pDNSf-hosts-old.txt.gz  https://github.com/j-moriarti/pDNSf-Hosts-collection/releases/download/v1.0.0/pDNSf-hosts.txt.gz
moddate=$(date -r pDNSf-hosts-old.txt.gz "+%Y-%m-%d_%H-%M")
mv pDNSf-hosts-old.txt.gz pDNSf-hosts-backup-$moddate.gz

echo "Finished."
