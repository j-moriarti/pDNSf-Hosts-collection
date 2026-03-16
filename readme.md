<div align="center">

##### In this Repo, I've created a shell script to automate the process of collecting and compiling all the Hosts from various sources, then cleaning and optimizing it to be used in ["PersonalDNSfilter"](https://www.zenz-solutions.de/personaldnsfilter/)
##### This collection is suitable for blocking the domains containing ads, tracking, malware, phishing, ransomware, spyware, trojans and virus (for PC and Smartphones).

#### ℹ️ Updates & News 📢
<h4 align="left">
 
    2021/07/27
    📌 Added support for converting sources from [AdBlockPlus/uBlock/AdGuard] format to Domains/Hosts format!
    📌 Added many new sources!
    📌 Improved the code to reduce false positives.

</h4>
 
<details>
  <summary>Expand to see previous changes!</summary>
  
  <h4 align="left">
 
    2021/07/18
    📌 Improved checking TLDs of domains + fixes
    📌 Implemented "idna to dns (utf8)" converting function for domains and TLDs.
    📌 Optimized the code speed.
    📌 Added support for checking more TLDs (IANA / Blockchain-registered / OpenNIC / FurNIC / Emercoin / New Nations / Onion).
    
    2021/07/10
    📌 Implemented personal Allow-List for falsely blocked domains.
    
    2021/07/03
    📌 Implemented parallel downloading of sources.(disabled by default due to github limitations)
    📌 Separated the sources list from code.
    
    2021/03/18
    📌 Improved removing redundant subdomains! (thanks @badmojr for reporting 😉)
    
    2021/03/15
    📌 Implemented removing redundant subdomains!
    📌 Greatly reduced blocklist size without affecting the quality!(same blocking power)
    📌 The original blocklist (without whitelisting / subdomains removing) is also available in Section "B: (Manual Method)"
    
    2021/03/13
    📌 Implemented Whitelisting: For now I apply mkb2091's whitelist source!
    📌 Also, the original Hosts is preserved, too (without applying whitelists)↩️
       You can find it in Section "B: (Manual Method)"
    📌 To get statistics about the (input) sources used in this Repo, check 'stats' file.
    📌 The previous Hosts releases and backups of the input sources (in compressed format)↩️
       can be found in 'Releases' page, under tha tag 'v1.0.0-backup'.
    
  </h4>

</details>

<br>
</br>

### ⚠️ Disclaimer:

<details>
  <summary>Click to expand!</summary>
  
  The Hosts sources that are used in this Repository, have their own Licenses. The links of the HOSTS sources that are used in this repo (which includes their own licenses) can be found here: ["sources.conf"](https://github.com/j-moriarti/pDNSf-Hosts-collection/blob/master/sources.conf). The compiled hosts in this Repo are meant for my personal usage only. I have no responsibility about others misusing of these files.
  ###### ⚠️YOU HAVE BEEN WARNED⚠️ :wink:
</details>

#### ℹ️ Notes:

<details>
  <summary>Click to expand!</summary>
  
  This hosts file is specially optimized for ["PersonalDNSfilter"](https://www.zenz-solutions.de/personaldnsfilter/) app. This [Open-Source](https://github.com/IngoZenz/personaldnsfilter) app can handle Huge number of Domains without affecting on battery or ram usage! So there would be no problems adding these hosts to it!
  ###### !!! THIS HOSTS FILE IS EXTREMELY LARGE, and only pDNSf can easily handle it !!!
  ###### !!! Although applied whitelists to remove falsely blocked domains, but There may be a possibility of FALSE-POSITIVE or UNWANTED BLOCKING !!!
  ###### !!! Be prepared for manual whitelisting in pDNSf !!!
  ###### !!!YOU HAVE BEEN WARNED AGAIN!!!
  
</details>

<br>
</br>

#### ℹ️ Hosts Info
<h4>
 
    [Original Blocklist]
    Blocked Domains: 4,320,361
    Blocklist size: 94.5 MB
    
    [Optimized Blocklist 🚀]
    Blocked Domains: 2,552,926
    Blocklist size: 46.0 MB
    
    Number of Blocked IPs: 651,007
    IP Blocklist size: 9.0 MB
    
    Auto Updates: Every 24 hours
    
</h4>

<br>
</br>


### A: (Set & Forget Method)
### Download Hosts in multi-part (Domains-only Format)

(Add these links directly to pDNSf config)

(Additionally, you also can add IP blocklist.(links can be found at 'Extra Hosts' table below))

| Name | Download Link | Mirror Link | Size |
|:----:|:-------:|:-------:|:-------:|
| pDNSf-hosts-part0.txt | [Domains (Part 0)](https://github.com/j-moriarti/pDNSf-Hosts-collection/releases/download/v1.0.0/pDNSf-hosts-part0.txt) | [Mirror (Part 0)](https://www.dl.dropboxusercontent.com/s/9jpe80edva776ei/pDNSf-hosts-part0.txt?dl=1) | 15.3 MB |
| pDNSf-hosts-part1.txt | [Domains (Part 1)](https://github.com/j-moriarti/pDNSf-Hosts-collection/releases/download/v1.0.0/pDNSf-hosts-part1.txt) | [Mirror (Part 1)](https://www.dl.dropboxusercontent.com/s/d1x9nrjn8wmdgkn/pDNSf-hosts-part1.txt?dl=1) | 15.3 MB |
| pDNSf-hosts-part2.txt | [Domains (Part 2)](https://github.com/j-moriarti/pDNSf-Hosts-collection/releases/download/v1.0.0/pDNSf-hosts-part2.txt) | [Mirror (Part 2)](https://www.dl.dropboxusercontent.com/s/500rbwazmyotd5c/pDNSf-hosts-part2.txt?dl=1) | 15.3 MB |

<br>
</br>

### B: (Manual Method)
### Download GZip Compressed Hosts (Domains-only Format)
(First, download and extract (uncompress) 'pDNSf-hosts.txt.gz' to somewhere, then add the LOCAL PATH of 'pDNSf-hosts.txt' to pDNSf config)

| Name | Download Link | Mirror Link | Size |
|:----:|:-------:|:-------:|:-------:|
| pDNSf-hosts.txt.gz | [Download](https://github.com/j-moriarti/pDNSf-Hosts-collection/releases/download/v1.0.0/pDNSf-hosts.txt.gz) | [Mirror](https://www.dl.dropboxusercontent.com/s/0qkl500uldf0ryo/pDNSf-hosts.txt.gz) | 14.5 MB |
| pDNSf-hosts_no-whitelist.txt.gz | [Download](https://github.com/j-moriarti/pDNSf-Hosts-collection/releases/download/v1.0.0/pDNSf-hosts_no-whitelist.txt.gz) | [Mirror](https://www.dl.dropboxusercontent.com/s/b1dzuemxspu7j73/pDNSf-hosts_no-whitelist.txt.gz?dl=1) | 24.2 MB |

ℹ️ Notes:

<details>
  <summary>Click to expand!</summary>
  
  <h4 align="left">
    
    📌 Example of a LOCAL PATH format in pDNSf:
    PC version: file:///D:/Downloads folder/pDNSf-hosts.txt
    Mobile version: file:///sdcard/Downloads/pDNSf-hosts.txt
    
    📌 Use "pDNSf-hosts_no-whitelist.txt.gz" if you want to use the Hosts without applying "whitelists" or "redundant subdomains removing".
    
  </h4>
 
</details>

<br>
</br>

### Download Extra Hosts (IPs-only & Domains-only Format)

| Name | Download Link | Mirror Link | Size | # of Lines |
|:---------:|:-------:|:--------:|:-------:|:-------:|
| CIDR-IPs Block-List | [Download](https://github.com/j-moriarti/pDNSf-Hosts-collection/releases/download/v1.0.0/CIDR-IPs.txt) | [Mirror](https://www.dl.dropboxusercontent.com/s/ef6ya9o2wf0rqy0/CIDR-IPs.txt?dl=1) | 93.8 KB | 5,978 |
| Wildcard Block-List | [Download](https://github.com/j-moriarti/pDNSf-Hosts-collection/releases/download/v1.0.0/Wildcards.txt) | [Mirror](https://www.dl.dropboxusercontent.com/s/v1hdmolkekzevhl/Wildcards.txt) | 16.5 KB | 832 |
| IP Addresses Block-List | [Download](https://github.com/j-moriarti/pDNSf-Hosts-collection/releases/download/v1.0.0/just-IPs.txt) | [Mirror](https://www.dl.dropboxusercontent.com/s/r7685b8ahxhro2d/just-IPs.txt?dl=1) | 9.0 MB | 651,007 |

</div>
