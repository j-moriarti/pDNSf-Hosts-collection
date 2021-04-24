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
rm -f -r output/
mkdir -p RAW-Filters
mkdir -p Processing-Phase
mkdir -p output/main
mkdir -p output/backup

cd RAW-Filters/
rm -f COMBINED-RAW-HOSTS.TXT
rm -f *.txt.raw

curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o crazy-max_windowsspyblocker_spy.txt.raw             https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o crazy-max_windowsspyblocker_dnscrypt_spy.txt.raw    https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/dnscrypt/spy.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o crazy-max_windowsspyblocker_extra.txt.raw           https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/extra.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o crazy-max_windowsspyblocker_dnscrypt_extra.txt.raw  https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/dnscrypt/extra.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o notracking_dnscrypt-proxy.blacklist.txt.raw         https://raw.githubusercontent.com/notracking/hosts-blocklists/master/dnscrypt-proxy/dnscrypt-proxy.blacklist.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o notracking_hostnames.txt.raw                        https://raw.githubusercontent.com/notracking/hosts-blocklists/master/hostnames.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o kowith337_hosts_google_hotword.txt.raw              https://raw.githubusercontent.com/kowith337/PersonalFilterListCollection/master/hosts/hosts_google_hotword.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o kowith337_hosts_leftover.txt.raw                    https://raw.githubusercontent.com/kowith337/PersonalFilterListCollection/master/hosts/hosts_leftover.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o kowith337_hosts_badbait_th.txt.raw                  https://raw.githubusercontent.com/kowith337/PersonalFilterListCollection/master/hosts/hosts_badbait_th.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o frogeye_firstparty-trackers.txt.raw                 https://hostfiles.frogeye.fr/firstparty-trackers.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o frogeye_firstparty-only-trackers.txt.raw            https://hostfiles.frogeye.fr/firstparty-only-trackers.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o frogeye_multiparty-trackers.txt.raw                 https://hostfiles.frogeye.fr/multiparty-trackers.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o frogeye_multiparty-only-trackers.txt.raw            https://hostfiles.frogeye.fr/multiparty-only-trackers.txt
#curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o eladkarako_raw-hosts.txt.raw                        https://github.com/eladkarako/hosts/raw/master/_raw__hosts.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o jerryn70_goodbyeads.txt.raw                         https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Hosts/GoodbyeAds.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o jerryn70_goodbyeads-youtube-adblock.txt.raw         https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-YouTube-AdBlock.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o jerryn70_goodbyeads-xiaomi-extension.txt.raw        https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-Xiaomi-Extension.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o jerryn70_goodbyeads-samsung-adblock.txt.raw         https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-Samsung-AdBlock.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o jerryn70_goodbyeads-leeco-extension.txt.raw         https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-LeEco-Extension.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o badmojr_1hosts_pro_domains.txt.raw                  https://badmojr.github.io/1Hosts/Pro/domains.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o badmojr_1hosts_xtra_domains.txt.raw                 https://badmojr.github.io/1Hosts/Pro/xtra/domains.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o energized_ultimate-domains.txt.raw                  https://block.energized.pro/ultimate/formats/domains.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o energized_social-domains.txt.raw                    https://block.energized.pro/extensions/social/formats/domains.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o energized_regional-domains.txt.raw                  https://block.energized.pro/extensions/regional/formats/domains.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o energized_xtreme-domains.txt.raw                    https://block.energized.pro/extensions/xtreme/formats/domains.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o energized_ips-list.txt.raw                          https://block.energized.pro/extensions/ips/formats/list.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o dnswarden_block-3rd-party-cnames.txt.raw            https://raw.githubusercontent.com/dnswarden/blocklist/master/test/block-3rd-party-cnames.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o nextdns_cname-cloaking-blocklist.txt.raw            https://raw.githubusercontent.com/nextdns/cname-cloaking-blocklist/master/domains
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o antisocial_blacklist_community_v1.txt.raw           https://theantisocialengineer.com/AntiSocial_Blacklist_Community_V1.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o polishfiltersteam_kadhosts.txt.raw                  https://raw.githubusercontent.com/PolishFiltersTeam/KADhosts/master/KADhosts.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o majkiit_polish-ads-filter_hostfile.txt.raw          https://raw.githubusercontent.com/MajkiIT/polish-ads-filter/master/polish-pihole-filters/hostfile.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o anudeepnd_coinminer.txt.raw                         https://raw.githubusercontent.com/anudeepND/blacklist/master/CoinMiner.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o quidsup_notrack-blocklist.txt.raw                   https://gitlab.com/quidsup/notrack-blocklists/raw/master/notrack-blocklist.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o cbuijs_shallalist_adv.txt.raw                       https://raw.githubusercontent.com/cbuijs/shallalist/master/adv/domains
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o cbuijs_shallalist_tracker.txt.raw                   https://raw.githubusercontent.com/cbuijs/shallalist/master/tracker/domains
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o phishing_army_blocklist.txt.raw                     https://phishing.army/download/phishing_army_blocklist.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o phishing_army_blocklist_extended.txt.raw            https://phishing.army/download/phishing_army_blocklist_extended.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o oisd_dbl.txt.raw                                    https://dbl.oisd.nl/
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o oisd_dbl_light.txt.raw                              https://dblmobile.oisd.nl/
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o developerdan_ads-and-tracking-extended.txt.raw      https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o developerdan_tracking-aggressive-extended.txt.raw   https://www.github.developerdan.com/hosts/lists/tracking-aggressive-extended.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o developerdan_amp-hosts-extended.txt.raw             https://www.github.developerdan.com/hosts/lists/amp-hosts-extended.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o abpvn.txt.raw                                       https://abpvn.com/android/abpvn.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o lassekongo83_frellwits-swedish-hosts-file.txt.raw   https://raw.githubusercontent.com/lassekongo83/Frellwits-filter-lists/master/Frellwits-Swedish-Hosts-File.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o drsdavidsoft_unwanted-iranian.txt.raw               https://raw.githubusercontent.com/DRSDavidSoft/additional-hosts/master/domains/blacklist/unwanted-iranian.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o drsdavidsoft_adservers-and-trackers.txt.raw         https://raw.githubusercontent.com/DRSDavidSoft/additional-hosts/master/domains/blacklist/adservers-and-trackers.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o drsdavidsoft_activation.txt.raw                     https://raw.githubusercontent.com/DRSDavidSoft/additional-hosts/master/domains/blacklist/activation.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o yhonay-antipopads.txt.raw                           https://raw.githubusercontent.com/Yhonay/antipopads/master/popads.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o greatis_anti-webminer_blacklist.txt.raw             https://raw.githubusercontent.com/greatis/Anti-WebMiner/master/blacklist.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o firebog_joewein.txt.raw                             https://v.firebog.net/hosts/JoeWein.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o firebog_joeylane.txt.raw                            https://v.firebog.net/hosts/JoeyLane.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o firebog_w3kbl.txt.raw                               https://v.firebog.net/hosts/static/w3kbl.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o perflyst_smarttv.txt.raw                            https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o perflyst_android-tracking.txt.raw                   https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/android-tracking.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o perflyst_amazonfiretv.txt.raw                       https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/AmazonFireTV.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o tg12_bad_packets_list.txt.raw                       https://raw.githubusercontent.com/tg12/bad_packets_blocklist/master/bad_packets_list.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_ads.txt.raw                         https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Ads
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_apple.txt.raw                       https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Apple
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_bitcoin.txt.raw                     https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Bitcoin
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_bloat.txt.raw                       https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Bloat
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_chat.txt.raw                        https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Chat
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_dynamic.txt.raw                     https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Dynamic
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_malware.txt.raw                     https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Malware
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_marketing.txt.raw                   https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Marketing
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_marketing-email.txt.raw             https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Marketing-Email
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_microsoft.txt.raw                   https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Microsoft
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_remote.txt.raw                      https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Remote
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_scam.txt.raw                        https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Scam
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_tracking.txt.raw                    https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Tracking
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o shadowwhisperer_typo.txt.raw                        https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/Lists/Typo
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o dandelionsprout_antimalwarehosts.txt.raw            https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareHosts.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o davidonzo_latestdomains.txt.raw                     https://raw.githubusercontent.com/davidonzo/Threat-Intel/master/lists/latestdomains.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o davidonzo_latestips.txt.raw                         https://raw.githubusercontent.com/davidonzo/Threat-Intel/master/lists/latestips.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o mkb2091_domains.txt.raw                             https://raw.githubusercontent.com/mkb2091/blockconvert/master/output/domains.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o mkb2091_ip-blocklist.txt.raw                        https://raw.githubusercontent.com/mkb2091/blockconvert/master/output/ip_blocklist.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o feodotracker_ipblocklist-recommended.txt.raw        https://feodotracker.abuse.ch/downloads/ipblocklist_recommended.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o blocklist.de_lists_all.txt.raw                      https://lists.blocklist.de/lists/all.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o binarydefense_banlist.txt.raw                       https://www.binarydefense.com/banlist.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o d43m0nhlint3r_agencyblocklist.txt.raw               https://raw.githubusercontent.com/d43m0nhLInt3r/socialblocklists/master/Agency/agencyblocklist.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o socram_notonmyshift_hosts.txt.raw                   https://orca.pet/notonmyshift/hosts.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o curben_urlhaus-filter-domains.txt.raw               https://curben.gitlab.io/malware-filter/urlhaus-filter-domains.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o curben_phishing-filter-domains.txt.raw              https://curben.gitlab.io/phishing-filter-mirror/phishing-filter-domains.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ftpmorph_ftpihole_apple-macos-big-sur.txt.raw       https://pastebin.com/raw/gKaWxety
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ftpmorph_ftpihole_hola-luminati-full.txt.raw        https://raw.githubusercontent.com/ftpmorph/ftpihole/master/blocklists/hola-luminati-full-block.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ftpmorph_ftpihole_huawei-trackers.txt.raw           https://raw.githubusercontent.com/ftpmorph/ftpihole/master/blocklists/huawei-trackers.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ftpmorph_ftpihole_smart-tv-ads-tracking.txt.raw     https://raw.githubusercontent.com/ftpmorph/ftpihole/master/blocklists/smart-tv-ads-tracking.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ftpmorph_ftpihole_smartphone-ads-tracking.txt.raw   https://raw.githubusercontent.com/ftpmorph/ftpihole/master/blocklists/smartphone-ads-tracking.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ftpmorph_ftpihole_spotify-ads-tracking.txt.raw      https://raw.githubusercontent.com/ftpmorph/ftpihole/master/blocklists/spotify-ads-tracking.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ftpmorph_ftpihole_windows10-spying.txt.raw          https://raw.githubusercontent.com/ftpmorph/ftpihole/master/blocklists/windows10-spying-erm-i-mean-telemetry-lol.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o ftpmorph_ftpihole_xiaomi-ads-tracking.txt.raw       https://raw.githubusercontent.com/ftpmorph/ftpihole/master/blocklists/xiaomi-ads-tracking.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o filtri-dns_filtri.txt.raw                           https://filtri-dns.ga/filtri.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o bigdargon_hostsVN_filters.txt.raw                   https://raw.githubusercontent.com/bigdargon/hostsVN/master/filters/domain-adservers-all.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o bigdargon_hostsVN_hosts.txt.raw                     https://raw.githubusercontent.com/bigdargon/hostsVN/master/hosts
#curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o zonefiles-io_compromised_domains_live.txt.raw       https://zonefiles.io/f/compromised/domains/live
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o zonefiles-io_compromised_ip_live.txt.raw            https://zonefiles.io/f/compromised/ip/live/
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o threatcrowd_feeds_domains.txt.raw                   https://www.threatcrowd.org/feeds/domains.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o zznidar_bar-list.txt.raw                            https://raw.githubusercontent.com/zznidar/BAR/master/BAR-list
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o xionkzn_blocklist_hosts.txt.raw                     https://raw.githubusercontent.com/XionKzn/PiHole-Lists/master/PiHole/Blocklist_HOSTS.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o mailscanner-info_phishing-bad-sites.txt.raw         http://phishing.mailscanner.info/phishing.bad.sites.conf
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o olbat_ut1-blacklists_phishing.txt.raw               https://raw.githubusercontent.com/olbat/ut1-blacklists/master/blacklists/phishing/domains
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o olbat_ut1-blacklists_publicite.txt.raw              https://raw.githubusercontent.com/olbat/ut1-blacklists/master/blacklists/publicite/domains
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o olbat_ut1-blacklists_malware.txt.raw                https://raw.githubusercontent.com/olbat/ut1-blacklists/master/blacklists/malware/domains
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o kriskintel-com_ktip_ransomware_feeds.txt.raw        https://kriskintel.com/feeds/ktip_ransomware_feeds.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o kriskintel-com_ktip_covid_domains.txt.raw           https://kriskintel.com/feeds/ktip_covid_domains.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o kriskintel-com_ktip_malicious_domains.txt.raw       https://kriskintel.com/feeds/ktip_malicious_domains.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o kriskintel-com_ktip_malicious_ips.txt.raw           https://kriskintel.com/feeds/ktip_malicious_Ips.txt
#curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o managedsentinel-com_covid19_domains.txt.raw         https://managedsentinel.com/downloads/covid19_domains.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o rescure-me_malware_try2cry.txt.raw                  https://rescure.me/malware/try2cry.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o rescure-me_malware_netwalker.txt.raw                https://rescure.me/malware/netwalker.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o rescure-me_malware_wastedlocker.txt.raw             https://rescure.me/malware/wastedlocker.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o rescure-me_malware_sodinokibi.txt.raw               https://rescure.me/malware/sodinokibi.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o rescure-me_malware_clop.txt.raw                     https://rescure.me/malware/clop.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o rescure-me_malware_ryuk.txt.raw                     https://rescure.me/malware/ryuk.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o rescure-me_malware_ekans.txt.raw                    https://rescure.me/malware/ekans.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o rescure-me_malware_maze.txt.raw                     https://rescure.me/malware/maze.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o rescure-me_malware_covid.txt.raw                    https://rescure.me/covid.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o rescure-me_malware_ips.txt.raw                      https://rescure.me/rescure_blacklist.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o rooneymcnibnug_snafu.txt.raw                        https://raw.githubusercontent.com/RooneyMcNibNug/pihole-stuff/master/SNAFU.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o parseword_nolovia_hosts.txt.raw                     https://raw.githubusercontent.com/parseword/nolovia/master/skel/hosts-nolovia.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o fruxlabs-com_rescure_domain_blacklist.txt.raw       https://rescure.fruxlabs.com/rescure_domain_blacklist.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o pikamikatuu_huawei-block-list.txt.raw               https://raw.githubusercontent.com/PikaMikaTuu/huawei-block-list/master/huawei-block-host.txt

curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o gameindustry_main_hosts.txt.raw                     https://raw.githubusercontent.com/KodoPengin/GameIndustry-hosts-Template/master/Main-Template/hosts
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o gameindustry_android_full_hosts.txt.raw             https://raw.githubusercontent.com/KodoPengin/GameIndustry-hosts-Template/master/Android-Full-Template/hosts
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o gameindustry_gaming_full_hosts.txt.raw              https://raw.githubusercontent.com/KodoPengin/GameIndustry-hosts-Template/master/Gaming-Full-Template/hosts
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o gameindustry_spyware-services-in-games_ip.txt.raw   https://raw.githubusercontent.com/KodoPengin/Collection-of-IP-addresses/main/Spyware%20Services%20in%20Games/IPTable.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o gameindustry_webserver-security_ip.txt.raw          https://raw.githubusercontent.com/KodoPengin/Collection-of-IP-addresses/main/Webserver%20Security/IPTable.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o gameindustry_adobe-inc_hosts.txt.raw                https://hosts.gameindustry.eu/adobe-inc/
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o gameindustry_amazon-com-inc_hosts.txt.raw           https://hosts.gameindustry.eu/amazon-com-inc/
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o gameindustry_staedte-gemeinden_hosts.txt.raw        https://hosts.gameindustry.eu/staedte-und-gemeinden/
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o gameindustry_ministerien-behoerden_hosts.txt.raw    https://hosts.gameindustry.eu/ministerien-und-behoerden/
sed -i 's/<.*$//;/^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}$/!d' gameindustry_adobe-inc_hosts.txt.raw
sed -i '/^0\.0\.0\.0 /!d;s/^0\.0\.0\.0 //;s/<.*$//;s/ .*$//' gameindustry_amazon-com-inc_hosts.txt.raw gameindustry_staedte-gemeinden_hosts.txt.raw gameindustry_ministerien-behoerden_hosts.txt.raw


#curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o netlab-360_dga.txt.raw                              http://data.netlab.360.com/feeds/dga/dga.txt
#cat netlab-360_dga.txt.raw | sed '/^#/d' | awk '{print $2 }' > netlab-360_dga_domains.txt.raw
#rm -f netlab-360_dga.txt.raw

curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o exodus-privacy_trackers.json.raw                    https://etip.exodus-privacy.eu.org/trackers/export
#sed 's/}/\n/g' exodus-privacy_trackers.json.raw | sed 's/^.*:\/\///g;/.*\/.*\/.*/d;s/\/\"$//;s/\"$//;/\//d;/\./!d' > exodus-privacy_trackers.txt.raw
sed 's/"network_signature": "/\n/g' exodus-privacy_trackers.json.raw | sed 's/", "website": "/\n/g;s/"}.*//;s/|/\n/g' | sed 's/\\\\//g;s/^\.//;s/^https*:\/\///;s/:.*//;s/\/.*//;s/\.$/\.\*/;s/\.\./\./;s/\[0-9\]//g;/\./!d;/{\|^$\|^github\.com$\|^twitter\.com$\|^en\.wikipedia\.org$\|^www\.mozilla\.org$\|^wiki\.mozilla\.org$\|^developer\.amazon\.com$\|^www\.developer\.amazon\.com$\|^cloud\.google\.com$\|^www\.adobe\.com$\|^developers\.google\.com$\|^google\.com$\|^www\.google\.com$\|^www\.googletagmanager\.com$\|^azure\.microsoft\.com$\|^docs\.microsoft\.com$/d;' | sort -u -o exodus-privacy_trackers.txt.raw
rm -f exodus-privacy_trackers.json.raw

#curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o dga-feed.gz                                         https://osint.bambenekconsulting.com/feeds/dga-feed.gz
#gzip -N -d dga-feed.gz
#sed 's/,Domain .*$//' dga-feed-all.csv > dga-feed.txt.raw
#rm -f dga-feed-all.csv

touch mkb2091_whitelist_domains.txt.raw
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o mkb2091_whitelist_domains.txt.raw                   https://mkb2091.github.io/blockconvert/output/whitelist_domains.txt

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

sed '/[^\x00-\x7F]/d' 3-temp.txt > 2-no-www.txt

# pu:ny:co:de
sed '/[^\x00-\x7F]/!d' 3-temp.txt | while read line
do
    python -c "exec(\"import sys\nhost = sys.argv[1]\nprint(host.encode('idna').decode('utf8'))\")" $line >> 2-no-www.txt
done


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


## remove domains with invalid tlds (heavy process! for worst scenario only!)

mv 6-final-output.txt temp-output.txt
curl -L -R -s --compressed --connect-timeout 10 --retry 5 --retry-connrefused --retry-delay 5 -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -o tld.txt  https://data.iana.org/TLD/tlds-alpha-by-domain.txt
if [ $(wc -l < tld.txt) -lt 1000 ]; then
    sed '/\.aaa$\|\.aarp$\|\.abarth$\|\.abb$\|\.abbott$\|\.abbvie$\|\.abc$\|\.able$\|\.abogado$\|\.abudhabi$\|\.ac$\|\.academy$\|\.accenture$\|\.accountant$\|\.accountants$\|\.aco$\|\.actor$\|\.ad$\|\.adac$\|\.ads$\|\.adult$\|\.ae$\|\.aeg$\|\.aero$\|\.aetna$\|\.af$\|\.afamilycompany$\|\.afl$\|\.africa$\|\.ag$\|\.agakhan$\|\.agency$\|\.ai$\|\.aig$\|\.airbus$\|\.airforce$\|\.airtel$\|\.akdn$\|\.al$\|\.alfaromeo$\|\.alibaba$\|\.alipay$\|\.allfinanz$\|\.allstate$\|\.ally$\|\.alsace$\|\.alstom$\|\.am$\|\.amazon$\|\.americanexpress$\|\.americanfamily$\|\.amex$\|\.amfam$\|\.amica$\|\.amsterdam$\|\.analytics$\|\.android$\|\.anquan$\|\.anz$\|\.ao$\|\.aol$\|\.apartments$\|\.app$\|\.apple$\|\.aq$\|\.aquarelle$\|\.ar$\|\.arab$\|\.aramco$\|\.archi$\|\.army$\|\.arpa$\|\.art$\|\.arte$\|\.as$\|\.asda$\|\.asia$\|\.associates$\|\.at$\|\.athleta$\|\.attorney$\|\.au$\|\.auction$\|\.audi$\|\.audible$\|\.audio$\|\.auspost$\|\.author$\|\.auto$\|\.autos$\|\.avianca$\|\.aw$\|\.aws$\|\.ax$\|\.axa$\|\.az$\|\.azure$\|\.ba$\|\.baby$\|\.baidu$\|\.banamex$\|\.bananarepublic$\|\.band$\|\.bank$\|\.bar$\|\.barcelona$\|\.barclaycard$\|\.barclays$\|\.barefoot$\|\.bargains$\|\.baseball$\|\.basketball$\|\.bauhaus$\|\.bayern$\|\.bb$\|\.bbc$\|\.bbt$\|\.bbva$\|\.bcg$\|\.bcn$\|\.bd$\|\.be$\|\.beats$\|\.beauty$\|\.beer$\|\.bentley$\|\.berlin$\|\.best$\|\.bestbuy$\|\.bet$\|\.bf$\|\.bg$\|\.bh$\|\.bharti$\|\.bi$\|\.bible$\|\.bid$\|\.bike$\|\.bing$\|\.bingo$\|\.bio$\|\.biz$\|\.bj$\|\.black$\|\.blackfriday$\|\.blockbuster$\|\.blog$\|\.bloomberg$\|\.blue$\|\.bm$\|\.bms$\|\.bmw$\|\.bn$\|\.bnpparibas$\|\.bo$\|\.boats$\|\.boehringer$\|\.bofa$\|\.bom$\|\.bond$\|\.boo$\|\.book$\|\.booking$\|\.bosch$\|\.bostik$\|\.boston$\|\.bot$\|\.boutique$\|\.box$\|\.br$\|\.bradesco$\|\.bridgestone$\|\.broadway$\|\.broker$\|\.brother$\|\.brussels$\|\.bs$\|\.bt$\|\.budapest$\|\.bugatti$\|\.build$\|\.builders$\|\.business$\|\.buy$\|\.buzz$\|\.bv$\|\.bw$\|\.by$\|\.bz$\|\.bzh$\|\.ca$\|\.cab$\|\.cafe$\|\.cal$\|\.call$\|\.calvinklein$\|\.cam$\|\.camera$\|\.camp$\|\.cancerresearch$\|\.canon$\|\.capetown$\|\.capital$\|\.capitalone$\|\.car$\|\.caravan$\|\.cards$\|\.care$\|\.career$\|\.careers$\|\.cars$\|\.casa$\|\.case$\|\.caseih$\|\.cash$\|\.casino$\|\.cat$\|\.catering$\|\.catholic$\|\.cba$\|\.cbn$\|\.cbre$\|\.cbs$\|\.cc$\|\.cd$\|\.ceb$\|\.center$\|\.ceo$\|\.cern$\|\.cf$\|\.cfa$\|\.cfd$\|\.cg$\|\.ch$\|\.chanel$\|\.channel$\|\.charity$\|\.chase$\|\.chat$\|\.cheap$\|\.chintai$\|\.christmas$\|\.chrome$\|\.church$\|\.ci$\|\.cipriani$\|\.circle$\|\.cisco$\|\.citadel$\|\.citi$\|\.citic$\|\.city$\|\.cityeats$\|\.ck$\|\.cl$\|\.claims$\|\.cleaning$\|\.click$\|\.clinic$\|\.clinique$\|\.clothing$\|\.cloud$\|\.club$\|\.clubmed$\|\.cm$\|\.cn$\|\.co$\|\.coach$\|\.codes$\|\.coffee$\|\.college$\|\.cologne$\|\.com$\|\.comcast$\|\.commbank$\|\.community$\|\.company$\|\.compare$\|\.computer$\|\.comsec$\|\.condos$\|\.construction$\|\.consulting$\|\.contact$\|\.contractors$\|\.cooking$\|\.cookingchannel$\|\.cool$\|\.coop$\|\.corsica$\|\.country$\|\.coupon$\|\.coupons$\|\.courses$\|\.cpa$\|\.cr$\|\.credit$\|\.creditcard$\|\.creditunion$\|\.cricket$\|\.crown$\|\.crs$\|\.cruise$\|\.cruises$\|\.csc$\|\.cu$\|\.cuisinella$\|\.cv$\|\.cw$\|\.cx$\|\.cy$\|\.cymru$\|\.cyou$\|\.cz$\|\.dabur$\|\.dad$\|\.dance$\|\.data$\|\.date$\|\.dating$\|\.datsun$\|\.day$\|\.dclk$\|\.dds$\|\.de$\|\.deal$\|\.dealer$\|\.deals$\|\.degree$\|\.delivery$\|\.dell$\|\.deloitte$\|\.delta$\|\.democrat$\|\.dental$\|\.dentist$\|\.desi$\|\.design$\|\.dev$\|\.dhl$\|\.diamonds$\|\.diet$\|\.digital$\|\.direct$\|\.directory$\|\.discount$\|\.discover$\|\.dish$\|\.diy$\|\.dj$\|\.dk$\|\.dm$\|\.dnp$\|\.do$\|\.docs$\|\.doctor$\|\.dog$\|\.domains$\|\.dot$\|\.download$\|\.drive$\|\.dtv$\|\.dubai$\|\.duck$\|\.dunlop$\|\.dupont$\|\.durban$\|\.dvag$\|\.dvr$\|\.dz$\|\.earth$\|\.eat$\|\.ec$\|\.eco$\|\.edeka$\|\.edu$\|\.education$\|\.ee$\|\.eg$\|\.email$\|\.emerck$\|\.energy$\|\.engineer$\|\.engineering$\|\.enterprises$\|\.epson$\|\.equipment$\|\.er$\|\.ericsson$\|\.erni$\|\.es$\|\.esq$\|\.estate$\|\.et$\|\.etisalat$\|\.eu$\|\.eurovision$\|\.eus$\|\.events$\|\.exchange$\|\.expert$\|\.exposed$\|\.express$\|\.extraspace$\|\.fage$\|\.fail$\|\.fairwinds$\|\.faith$\|\.family$\|\.fan$\|\.fans$\|\.farm$\|\.farmers$\|\.fashion$\|\.fast$\|\.fedex$\|\.feedback$\|\.ferrari$\|\.ferrero$\|\.fi$\|\.fiat$\|\.fidelity$\|\.fido$\|\.film$\|\.final$\|\.finance$\|\.financial$\|\.fire$\|\.firestone$\|\.firmdale$\|\.fish$\|\.fishing$\|\.fit$\|\.fitness$\|\.fj$\|\.fk$\|\.flickr$\|\.flights$\|\.flir$\|\.florist$\|\.flowers$\|\.fly$\|\.fm$\|\.fo$\|\.foo$\|\.food$\|\.foodnetwork$\|\.football$\|\.ford$\|\.forex$\|\.forsale$\|\.forum$\|\.foundation$\|\.fox$\|\.fr$\|\.free$\|\.fresenius$\|\.frl$\|\.frogans$\|\.frontdoor$\|\.frontier$\|\.ftr$\|\.fujitsu$\|\.fujixerox$\|\.fun$\|\.fund$\|\.furniture$\|\.futbol$\|\.fyi$\|\.ga$\|\.gal$\|\.gallery$\|\.gallo$\|\.gallup$\|\.game$\|\.games$\|\.gap$\|\.garden$\|\.gay$\|\.gb$\|\.gbiz$\|\.gd$\|\.gdn$\|\.ge$\|\.gea$\|\.gent$\|\.genting$\|\.george$\|\.gf$\|\.gg$\|\.ggee$\|\.gh$\|\.gi$\|\.gift$\|\.gifts$\|\.gives$\|\.giving$\|\.gl$\|\.glade$\|\.glass$\|\.gle$\|\.global$\|\.globo$\|\.gm$\|\.gmail$\|\.gmbh$\|\.gmo$\|\.gmx$\|\.gn$\|\.godaddy$\|\.gold$\|\.goldpoint$\|\.golf$\|\.goo$\|\.goodyear$\|\.goog$\|\.google$\|\.gop$\|\.got$\|\.gov$\|\.gp$\|\.gq$\|\.gr$\|\.grainger$\|\.graphics$\|\.gratis$\|\.green$\|\.gripe$\|\.grocery$\|\.group$\|\.gs$\|\.gt$\|\.gu$\|\.guardian$\|\.gucci$\|\.guge$\|\.guide$\|\.guitars$\|\.guru$\|\.gw$\|\.gy$\|\.hair$\|\.hamburg$\|\.hangout$\|\.haus$\|\.hbo$\|\.hdfc$\|\.hdfcbank$\|\.health$\|\.healthcare$\|\.help$\|\.helsinki$\|\.here$\|\.hermes$\|\.hgtv$\|\.hiphop$\|\.hisamitsu$\|\.hitachi$\|\.hiv$\|\.hk$\|\.hkt$\|\.hm$\|\.hn$\|\.hockey$\|\.holdings$\|\.holiday$\|\.homedepot$\|\.homegoods$\|\.homes$\|\.homesense$\|\.honda$\|\.horse$\|\.hospital$\|\.host$\|\.hosting$\|\.hot$\|\.hoteles$\|\.hotels$\|\.hotmail$\|\.house$\|\.how$\|\.hr$\|\.hsbc$\|\.ht$\|\.hu$\|\.hughes$\|\.hyatt$\|\.hyundai$\|\.ibm$\|\.icbc$\|\.ice$\|\.icu$\|\.id$\|\.ie$\|\.ieee$\|\.ifm$\|\.ikano$\|\.il$\|\.im$\|\.imamat$\|\.imdb$\|\.immo$\|\.immobilien$\|\.in$\|\.inc$\|\.industries$\|\.infiniti$\|\.info$\|\.ing$\|\.ink$\|\.institute$\|\.insurance$\|\.insure$\|\.int$\|\.international$\|\.intuit$\|\.investments$\|\.io$\|\.ipiranga$\|\.iq$\|\.ir$\|\.irish$\|\.is$\|\.ismaili$\|\.ist$\|\.istanbul$\|\.it$\|\.itau$\|\.itv$\|\.iveco$\|\.jaguar$\|\.java$\|\.jcb$\|\.jcp$\|\.je$\|\.jeep$\|\.jetzt$\|\.jewelry$\|\.jio$\|\.jll$\|\.jm$\|\.jmp$\|\.jnj$\|\.jo$\|\.jobs$\|\.joburg$\|\.jot$\|\.joy$\|\.jp$\|\.jpmorgan$\|\.jprs$\|\.juegos$\|\.juniper$\|\.kaufen$\|\.kddi$\|\.ke$\|\.kerryhotels$\|\.kerrylogistics$\|\.kerryproperties$\|\.kfh$\|\.kg$\|\.kh$\|\.ki$\|\.kia$\|\.kim$\|\.kinder$\|\.kindle$\|\.kitchen$\|\.kiwi$\|\.km$\|\.kn$\|\.koeln$\|\.komatsu$\|\.kosher$\|\.kp$\|\.kpmg$\|\.kpn$\|\.kr$\|\.krd$\|\.kred$\|\.kuokgroup$\|\.kw$\|\.ky$\|\.kyoto$\|\.kz$\|\.la$\|\.lacaixa$\|\.lamborghini$\|\.lamer$\|\.lancaster$\|\.lancia$\|\.land$\|\.landrover$\|\.lanxess$\|\.lasalle$\|\.lat$\|\.latino$\|\.latrobe$\|\.law$\|\.lawyer$\|\.lb$\|\.lc$\|\.lds$\|\.lease$\|\.leclerc$\|\.lefrak$\|\.legal$\|\.lego$\|\.lexus$\|\.lgbt$\|\.li$\|\.lidl$\|\.life$\|\.lifeinsurance$\|\.lifestyle$\|\.lighting$\|\.like$\|\.lilly$\|\.limited$\|\.limo$\|\.lincoln$\|\.linde$\|\.link$\|\.lipsy$\|\.live$\|\.living$\|\.lixil$\|\.lk$\|\.llc$\|\.llp$\|\.loan$\|\.loans$\|\.locker$\|\.locus$\|\.loft$\|\.lol$\|\.london$\|\.lotte$\|\.lotto$\|\.love$\|\.lpl$\|\.lplfinancial$\|\.lr$\|\.ls$\|\.lt$\|\.ltd$\|\.ltda$\|\.lu$\|\.lundbeck$\|\.lupin$\|\.luxe$\|\.luxury$\|\.lv$\|\.ly$\|\.ma$\|\.macys$\|\.madrid$\|\.maif$\|\.maison$\|\.makeup$\|\.man$\|\.management$\|\.mango$\|\.map$\|\.market$\|\.marketing$\|\.markets$\|\.marriott$\|\.marshalls$\|\.maserati$\|\.mattel$\|\.mba$\|\.mc$\|\.mckinsey$\|\.md$\|\.me$\|\.med$\|\.media$\|\.meet$\|\.melbourne$\|\.meme$\|\.memorial$\|\.men$\|\.menu$\|\.merckmsd$\|\.mg$\|\.mh$\|\.miami$\|\.microsoft$\|\.mil$\|\.mini$\|\.mint$\|\.mit$\|\.mitsubishi$\|\.mk$\|\.ml$\|\.mlb$\|\.mls$\|\.mm$\|\.mma$\|\.mn$\|\.mo$\|\.mobi$\|\.mobile$\|\.moda$\|\.moe$\|\.moi$\|\.mom$\|\.monash$\|\.money$\|\.monster$\|\.mormon$\|\.mortgage$\|\.moscow$\|\.moto$\|\.motorcycles$\|\.mov$\|\.movie$\|\.mp$\|\.mq$\|\.mr$\|\.ms$\|\.msd$\|\.mt$\|\.mtn$\|\.mtr$\|\.mu$\|\.museum$\|\.mutual$\|\.mv$\|\.mw$\|\.mx$\|\.my$\|\.mz$\|\.na$\|\.nab$\|\.nagoya$\|\.name$\|\.nationwide$\|\.natura$\|\.navy$\|\.nba$\|\.nc$\|\.ne$\|\.nec$\|\.net$\|\.netbank$\|\.netflix$\|\.network$\|\.neustar$\|\.new$\|\.newholland$\|\.news$\|\.next$\|\.nextdirect$\|\.nexus$\|\.nf$\|\.nfl$\|\.ng$\|\.ngo$\|\.nhk$\|\.ni$\|\.nico$\|\.nike$\|\.nikon$\|\.ninja$\|\.nissan$\|\.nissay$\|\.nl$\|\.no$\|\.nokia$\|\.northwesternmutual$\|\.norton$\|\.now$\|\.nowruz$\|\.nowtv$\|\.np$\|\.nr$\|\.nra$\|\.nrw$\|\.ntt$\|\.nu$\|\.nyc$\|\.nz$\|\.obi$\|\.observer$\|\.off$\|\.office$\|\.okinawa$\|\.olayan$\|\.olayangroup$\|\.oldnavy$\|\.ollo$\|\.om$\|\.omega$\|\.one$\|\.ong$\|\.onl$\|\.online$\|\.onyourside$\|\.ooo$\|\.open$\|\.oracle$\|\.orange$\|\.org$\|\.organic$\|\.origins$\|\.osaka$\|\.otsuka$\|\.ott$\|\.ovh$\|\.pa$\|\.page$\|\.panasonic$\|\.paris$\|\.pars$\|\.partners$\|\.parts$\|\.party$\|\.passagens$\|\.pay$\|\.pccw$\|\.pe$\|\.pet$\|\.pf$\|\.pfizer$\|\.pg$\|\.ph$\|\.pharmacy$\|\.phd$\|\.philips$\|\.phone$\|\.photo$\|\.photography$\|\.photos$\|\.physio$\|\.pics$\|\.pictet$\|\.pictures$\|\.pid$\|\.pin$\|\.ping$\|\.pink$\|\.pioneer$\|\.pizza$\|\.pk$\|\.pl$\|\.place$\|\.play$\|\.playstation$\|\.plumbing$\|\.plus$\|\.pm$\|\.pn$\|\.pnc$\|\.pohl$\|\.poker$\|\.politie$\|\.porn$\|\.post$\|\.pr$\|\.pramerica$\|\.praxi$\|\.press$\|\.prime$\|\.pro$\|\.prod$\|\.productions$\|\.prof$\|\.progressive$\|\.promo$\|\.properties$\|\.property$\|\.protection$\|\.pru$\|\.prudential$\|\.ps$\|\.pt$\|\.pub$\|\.pw$\|\.pwc$\|\.py$\|\.qa$\|\.qpon$\|\.quebec$\|\.quest$\|\.qvc$\|\.racing$\|\.radio$\|\.raid$\|\.re$\|\.read$\|\.realestate$\|\.realtor$\|\.realty$\|\.recipes$\|\.red$\|\.redstone$\|\.redumbrella$\|\.rehab$\|\.reise$\|\.reisen$\|\.reit$\|\.reliance$\|\.ren$\|\.rent$\|\.rentals$\|\.repair$\|\.report$\|\.republican$\|\.rest$\|\.restaurant$\|\.review$\|\.reviews$\|\.rexroth$\|\.rich$\|\.richardli$\|\.ricoh$\|\.ril$\|\.rio$\|\.rip$\|\.rmit$\|\.ro$\|\.rocher$\|\.rocks$\|\.rodeo$\|\.rogers$\|\.room$\|\.rs$\|\.rsvp$\|\.ru$\|\.rugby$\|\.ruhr$\|\.run$\|\.rw$\|\.rwe$\|\.ryukyu$\|\.sa$\|\.saarland$\|\.safe$\|\.safety$\|\.sakura$\|\.sale$\|\.salon$\|\.samsclub$\|\.samsung$\|\.sandvik$\|\.sandvikcoromant$\|\.sanofi$\|\.sap$\|\.sarl$\|\.sas$\|\.save$\|\.saxo$\|\.sb$\|\.sbi$\|\.sbs$\|\.sc$\|\.sca$\|\.scb$\|\.schaeffler$\|\.schmidt$\|\.scholarships$\|\.school$\|\.schule$\|\.schwarz$\|\.science$\|\.scjohnson$\|\.scot$\|\.sd$\|\.se$\|\.search$\|\.seat$\|\.secure$\|\.security$\|\.seek$\|\.select$\|\.sener$\|\.services$\|\.ses$\|\.seven$\|\.sew$\|\.sex$\|\.sexy$\|\.sfr$\|\.sg$\|\.sh$\|\.shangrila$\|\.sharp$\|\.shaw$\|\.shell$\|\.shia$\|\.shiksha$\|\.shoes$\|\.shop$\|\.shopping$\|\.shouji$\|\.show$\|\.showtime$\|\.shriram$\|\.si$\|\.silk$\|\.sina$\|\.singles$\|\.site$\|\.sj$\|\.sk$\|\.ski$\|\.skin$\|\.sky$\|\.skype$\|\.sl$\|\.sling$\|\.sm$\|\.smart$\|\.smile$\|\.sn$\|\.sncf$\|\.so$\|\.soccer$\|\.social$\|\.softbank$\|\.software$\|\.sohu$\|\.solar$\|\.solutions$\|\.song$\|\.sony$\|\.soy$\|\.space$\|\.sport$\|\.spot$\|\.spreadbetting$\|\.sr$\|\.srl$\|\.ss$\|\.st$\|\.stada$\|\.staples$\|\.star$\|\.statebank$\|\.statefarm$\|\.stc$\|\.stcgroup$\|\.stockholm$\|\.storage$\|\.store$\|\.stream$\|\.studio$\|\.study$\|\.style$\|\.su$\|\.sucks$\|\.supplies$\|\.supply$\|\.support$\|\.surf$\|\.surgery$\|\.suzuki$\|\.sv$\|\.swatch$\|\.swiftcover$\|\.swiss$\|\.sx$\|\.sy$\|\.sydney$\|\.systems$\|\.sz$\|\.tab$\|\.taipei$\|\.talk$\|\.taobao$\|\.target$\|\.tatamotors$\|\.tatar$\|\.tattoo$\|\.tax$\|\.taxi$\|\.tc$\|\.tci$\|\.td$\|\.tdk$\|\.team$\|\.tech$\|\.technology$\|\.tel$\|\.temasek$\|\.tennis$\|\.teva$\|\.tf$\|\.tg$\|\.th$\|\.thd$\|\.theater$\|\.theatre$\|\.tiaa$\|\.tickets$\|\.tienda$\|\.tiffany$\|\.tips$\|\.tires$\|\.tirol$\|\.tj$\|\.tjmaxx$\|\.tjx$\|\.tk$\|\.tkmaxx$\|\.tl$\|\.tm$\|\.tmall$\|\.tn$\|\.to$\|\.today$\|\.tokyo$\|\.tools$\|\.top$\|\.toray$\|\.toshiba$\|\.total$\|\.tours$\|\.town$\|\.toyota$\|\.toys$\|\.tr$\|\.trade$\|\.trading$\|\.training$\|\.travel$\|\.travelchannel$\|\.travelers$\|\.travelersinsurance$\|\.trust$\|\.trv$\|\.tt$\|\.tube$\|\.tui$\|\.tunes$\|\.tushu$\|\.tv$\|\.tvs$\|\.tw$\|\.tz$\|\.ua$\|\.ubank$\|\.ubs$\|\.ug$\|\.uk$\|\.unicom$\|\.university$\|\.uno$\|\.uol$\|\.ups$\|\.us$\|\.uy$\|\.uz$\|\.va$\|\.vacations$\|\.vana$\|\.vanguard$\|\.vc$\|\.ve$\|\.vegas$\|\.ventures$\|\.verisign$\|\.versicherung$\|\.vet$\|\.vg$\|\.vi$\|\.viajes$\|\.video$\|\.vig$\|\.viking$\|\.villas$\|\.vin$\|\.vip$\|\.virgin$\|\.visa$\|\.vision$\|\.viva$\|\.vivo$\|\.vlaanderen$\|\.vn$\|\.vodka$\|\.volkswagen$\|\.volvo$\|\.vote$\|\.voting$\|\.voto$\|\.voyage$\|\.vu$\|\.vuelos$\|\.wales$\|\.walmart$\|\.walter$\|\.wang$\|\.wanggou$\|\.watch$\|\.watches$\|\.weather$\|\.weatherchannel$\|\.webcam$\|\.weber$\|\.website$\|\.wed$\|\.wedding$\|\.weibo$\|\.weir$\|\.wf$\|\.whoswho$\|\.wien$\|\.wiki$\|\.williamhill$\|\.win$\|\.windows$\|\.wine$\|\.winners$\|\.wme$\|\.wolterskluwer$\|\.woodside$\|\.work$\|\.works$\|\.world$\|\.wow$\|\.ws$\|\.wtc$\|\.wtf$\|\.xbox$\|\.xerox$\|\.xfinity$\|\.xihuan$\|\.xin$\|\.xn--11b4c3d$\|\.xn--1ck2e1b$\|\.xn--1qqw23a$\|\.xn--2scrj9c$\|\.xn--30rr7y$\|\.xn--3bst00m$\|\.xn--3ds443g$\|\.xn--3e0b707e$\|\.xn--3hcrj9c$\|\.xn--3oq18vl8pn36a$\|\.xn--3pxu8k$\|\.xn--42c2d9a$\|\.xn--45br5cyl$\|\.xn--45brj9c$\|\.xn--45q11c$\|\.xn--4gbrim$\|\.xn--54b7fta0cc$\|\.xn--55qw42g$\|\.xn--55qx5d$\|\.xn--5su34j936bgsg$\|\.xn--5tzm5g$\|\.xn--6frz82g$\|\.xn--6qq986b3xl$\|\.xn--80adxhks$\|\.xn--80ao21a$\|\.xn--80aqecdr1a$\|\.xn--80asehdb$\|\.xn--80aswg$\|\.xn--8y0a063a$\|\.xn--90a3ac$\|\.xn--90ae$\|\.xn--90ais$\|\.xn--9dbq2a$\|\.xn--9et52u$\|\.xn--9krt00a$\|\.xn--b4w605ferd$\|\.xn--bck1b9a5dre4c$\|\.xn--c1avg$\|\.xn--c2br7g$\|\.xn--cck2b3b$\|\.xn--cckwcxetd$\|\.xn--cg4bki$\|\.xn--clchc0ea0b2g2a9gcd$\|\.xn--czr694b$\|\.xn--czrs0t$\|\.xn--czru2d$\|\.xn--d1acj3b$\|\.xn--d1alf$\|\.xn--e1a4c$\|\.xn--eckvdtc9d$\|\.xn--efvy88h$\|\.xn--fct429k$\|\.xn--fhbei$\|\.xn--fiq228c5hs$\|\.xn--fiq64b$\|\.xn--fiqs8s$\|\.xn--fiqz9s$\|\.xn--fjq720a$\|\.xn--flw351e$\|\.xn--fpcrj9c3d$\|\.xn--fzc2c9e2c$\|\.xn--fzys8d69uvgm$\|\.xn--g2xx48c$\|\.xn--gckr3f0f$\|\.xn--gecrj9c$\|\.xn--gk3at1e$\|\.xn--h2breg3eve$\|\.xn--h2brj9c$\|\.xn--h2brj9c8c$\|\.xn--hxt814e$\|\.xn--i1b6b1a6a2e$\|\.xn--imr513n$\|\.xn--io0a7i$\|\.xn--j1aef$\|\.xn--j1amh$\|\.xn--j6w193g$\|\.xn--jlq480n2rg$\|\.xn--jlq61u9w7b$\|\.xn--jvr189m$\|\.xn--kcrx77d1x4a$\|\.xn--kprw13d$\|\.xn--kpry57d$\|\.xn--kput3i$\|\.xn--l1acc$\|\.xn--lgbbat1ad8j$\|\.xn--mgb9awbf$\|\.xn--mgba3a3ejt$\|\.xn--mgba3a4f16a$\|\.xn--mgba7c0bbn0a$\|\.xn--mgbaakc7dvf$\|\.xn--mgbaam7a8h$\|\.xn--mgbab2bd$\|\.xn--mgbah1a3hjkrd$\|\.xn--mgbai9azgqp6j$\|\.xn--mgbayh7gpa$\|\.xn--mgbbh1a$\|\.xn--mgbbh1a71e$\|\.xn--mgbc0a9azcg$\|\.xn--mgbca7dzdo$\|\.xn--mgbcpq6gpa1a$\|\.xn--mgberp4a5d4ar$\|\.xn--mgbgu82a$\|\.xn--mgbi4ecexp$\|\.xn--mgbpl2fh$\|\.xn--mgbt3dhd$\|\.xn--mgbtx2b$\|\.xn--mgbx4cd0ab$\|\.xn--mix891f$\|\.xn--mk1bu44c$\|\.xn--mxtq1m$\|\.xn--ngbc5azd$\|\.xn--ngbe9e0a$\|\.xn--ngbrx$\|\.xn--node$\|\.xn--nqv7f$\|\.xn--nqv7fs00ema$\|\.xn--nyqy26a$\|\.xn--o3cw4h$\|\.xn--ogbpf8fl$\|\.xn--otu796d$\|\.xn--p1acf$\|\.xn--p1ai$\|\.xn--pgbs0dh$\|\.xn--pssy2u$\|\.xn--q7ce6a$\|\.xn--q9jyb4c$\|\.xn--qcka1pmc$\|\.xn--qxa6a$\|\.xn--qxam$\|\.xn--rhqv96g$\|\.xn--rovu88b$\|\.xn--rvc1e0am3e$\|\.xn--s9brj9c$\|\.xn--ses554g$\|\.xn--t60b56a$\|\.xn--tckwe$\|\.xn--tiq49xqyj$\|\.xn--unup4y$\|\.xn--vermgensberater-ctb$\|\.xn--vermgensberatung-pwb$\|\.xn--vhquv$\|\.xn--vuq861b$\|\.xn--w4r85el8fhu5dnra$\|\.xn--w4rs40l$\|\.xn--wgbh1c$\|\.xn--wgbl6a$\|\.xn--xhq521b$\|\.xn--xkc2al3hye2a$\|\.xn--xkc2dl3a5ee0h$\|\.xn--y9a3aq$\|\.xn--yfro4i67o$\|\.xn--ygbi2ammx$\|\.xn--zfr164b$\|\.xxx$\|\.xyz$\|\.yachts$\|\.yahoo$\|\.yamaxun$\|\.yandex$\|\.ye$\|\.yodobashi$\|\.yoga$\|\.yokohama$\|\.you$\|\.youtube$\|\.yt$\|\.yun$\|\.za$\|\.zappos$\|\.zara$\|\.zero$\|\.zip$\|\.zm$\|\.zone$\|\.zuerich$\|\.zw$/!d' temp-output.txt > 6-final-output.txt
else
    echo $(sed '/^#/d;/.*/!d' tld.txt) | tr '[:upper:]' '[:lower:]' | sed 's/ /\$\\\|\\\./g;s/.*/\/\\\.&\$\/\!d/' > sedconf
    sed -f sedconf temp-output.txt > 6-final-output.txt
    rm -f sedconf
fi
rm -f temp-output.txt
rm -f tld.txt


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

sed -i 's/^www\.//' whitelist_domains.txt
sort -u -o wl.txt whitelist_domains.txt
rm -f whitelist_domains.txt
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

split -a 1 -C 20M -d pDNSf-hosts.txt pDNSf-hosts-part --additional-suffix=.txt

part0size="0 B"
if [ -f pDNSf-hosts-part0.txt ]; then
    part0size=$(du -abc pDNSf-hosts-part0.txt | print_size $(awk '{print $1}'))
else
    echo "#This list is temporarily empty at the moment." > pDNSf-hosts-part0.txt
fi
echo "# Updated on $currdate $currtime UTC - by J-Moriarti (https://github.com/j-moriarti/pDNSf-Hosts-collection)" | cat - pDNSf-hosts-part0.txt > temp && mv temp pDNSf-hosts-part0.txt

part1size="0 B"
if [ -f pDNSf-hosts-part1.txt ]; then
    part1size=$(du -abc pDNSf-hosts-part1.txt | print_size $(awk '{print $1}'))
else
    echo "#This list is temporarily empty at the moment." > pDNSf-hosts-part1.txt
fi
echo "# Updated on $currdate $currtime UTC - by J-Moriarti (https://github.com/j-moriarti/pDNSf-Hosts-collection)" | cat - pDNSf-hosts-part1.txt > temp && mv temp pDNSf-hosts-part1.txt

part2size="0 B"
if [ -f pDNSf-hosts-part2.txt ]; then
    part2size=$(du -abc pDNSf-hosts-part2.txt | print_size $(awk '{print $1}'))     
else
    echo "#This list is temporarily empty at the moment." > pDNSf-hosts-part2.txt
fi
echo "# Updated on $currdate $currtime UTC - by J-Moriarti (https://github.com/j-moriarti/pDNSf-Hosts-collection)" | cat - pDNSf-hosts-part2.txt > temp && mv temp pDNSf-hosts-part2.txt

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
