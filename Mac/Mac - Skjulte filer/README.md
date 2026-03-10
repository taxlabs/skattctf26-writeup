# Mac - Skjulte filer

Det har blitt gjennomført flere beslag hos den notoriske skattesvindleren Kjell T. Ringen. Taxman har startet analyse av Kjells Macbook med et hjemmesnekret collection verktøy, og har hentet ut delvis kopi av filsystemet og interessante artifakter.<br /><br />
Det kan se ut som Kjell har hatt et ønske om å kunne vise skjulte filer i Finder. Kanskje han hadde noe hemmelig å skjule?<br /><br />

> Alle Mac-oppgavene har samme fil som utgangspunkt: https://drive.proton.me/urls/NK9D7XR0E4#0tbSCce0ukHy <br /> Passord til zip-fil: `skattctf`

# Writeup

I oppgaven `Mac - Bad habits` og `Mac - Infostealer` finner vi ut at Kjell har et ønske om å kunne vise skjulte filer i `Finder` på sin nye Mac.
Filer og mapper som starter med punktum (`.`) er en av filene som skjules som default på Mac.
I Kjells hjemmeområdet finner vi filen `.secrets` som inneholder et flagg.
```bash
cat Users/kjell.t.ringen/.secret
nothing to see here
skatt{noen_flagg_er_enklere_enn_andre}
```

# Flag

```
skatt{noen_flagg_er_enklere_enn_andre}
```