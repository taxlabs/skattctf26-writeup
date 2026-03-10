# Snikende Bacon - Del 3

Du har klart å utnytte enda en sårbarhet i intranettet og fikk se en fil som ikke var direkte eksponert!

Enda et hakk i rustningen, og du er nærmere målet enn noen gang!

Da skriver vi opp LFI på rapporten også. Ser Tommy nevner noe om logging i filen, det kan være verdt å få tilgang på? 🥓

[🔗 https://skatt-intranett.chals.io/](https://skatt-intranett.chals.io/)

# Writeup

Fra `logg.txt` vi fant får vi følgende:

```
╔══════════════════════════════════════════════════════════════╗
║   ____                        _____  _   _  _______          ║
║  |  _ \                      |_   _|| \ | ||__   __|         ║
║  | |_) | __ _  ___ ___  _ __   | |  |  \| |   | |            ║
║  |  _ < / _` |/ __/ _ \| '_ \  | |  | . ` |   | |            ║
║  | |_) | (_| | (_| (_) | | | |_| |_ | |\  |   | |            ║
║  |____/ \__,_|\___\___/|_| |_|_____||_| \_|   |_|            ║
║                                                              ║
║                 V I K T I G  -  I N T E R N T                ║
║                        D O K U M E N T                       ║
╚══════════════════════════════════════════════════════════════╝

Ansvarlig: Tommy Røkt

Status:
Det utvikles for tiden et internt loggsystem for feilsøking og teknisk oppfølging.

Aktivering:
For å aktivere logging må følgende fil eksistere `/app/.debug`

Tilgang til logger:
Når logging er aktivert, kan logger gjennomgås via endepunktet:

/logs

Bruk:
Loggsystemet skal kun benyttes ved feilsøking, testing eller ved behov for teknisk gjennomgang.

Kontakt:
tommy.rokt@matkrimbaconenheten.no
```

Ved å opprette en fil som heter `.debug` i `/app` så får vi tilgang til loggene via `/logs`. Og om man ser i HTML koden til filopplasteren ser man følgende:

```html
<form method="post" action="/files" enctype="multipart/form-data">
    <input type="file" class="file-input" id="file-upload" name="file" accept="image/*,.pdf,.txt" />
    <label for="file-upload" class="upload-label">Velg en fil</label>
    <span id="file-name" class="file_name"></span>
    <button class="upload-button">Last opp</button>
    <!-- <input type="text" value="" name="customPath" /> !-->
    <span class="error"></span>
    <span class="success"></span>
</form>
```

Ved å fjerne kommentaren på custoPath og sette den til `../../../../../app/` og laste opp en .debug fil så vil kriteriene være oppfylt og vi får tilgang til `/logs` endepunktet. Her ligger et flagg i loggen.

# Flag

````
skatt{upl04d_wh4t3v3r_u_w4nt}
```
