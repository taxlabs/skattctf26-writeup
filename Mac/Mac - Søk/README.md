# Mac - Søk

Det har blitt gjennomført flere beslag hos den notoriske skattesvindleren Kjell T. Ringen. Taxman har startet analyse av Kjells Macbook med et hjemmesnekret collection verktøy, og har hentet ut delvis kopi av filsystemet og interessante artifakter.<br /><br />
Mac har en innebygd søkefunksjon som logger alt du skriver. Finner du et flagg i loggene til denne funksjonen?<br /><br />

> Alle Mac-oppgavene har samme fil som utgangspunkt: https://drive.proton.me/urls/NK9D7XR0E4#0tbSCce0ukHy <br /> Passord til zip-fil: `skattctf`

# Writeup

Den innebygde søkefunksjonen som oppgaveteksten hinter til er `Spotlight`.<br />
Grepper etter flaggformatet i filer som har `spotlight` i pathen:<br />
```bash
╰─$ grep -HER 'skatt{' | grep spotlight
Binary file ./Users/kjell.t.ringen/Library/Group Containers/group.com.apple.PegasusConfiguration/feedback/com.apple.spotlight/local/794317175117882 matches
Binary file ./Users/kjell.t.ringen/Library/Group Containers/group.com.apple.PegasusConfiguration/feedback/com.apple.spotlight/local/794066427020779 matches
Binary file ./Users/kjell.t.ringen/Library/Metadata/CoreSpotlight/Priority/index.spotlightV3/.store.db matches
Binary file ./Users/kjell.t.ringen/Library/Metadata/CoreSpotlight/Priority/index.spotlightV3/store.db matches
```
Kjører `strings` på filen og grepper etter flagget:
```bash
╰─$ strings "./Users/kjell.t.ringen/Library/Group Containers/group.com.apple.PegasusConfiguration/feedback/com.apple.spotlight/local/794317175117882" | grep -i "skatt{"

...

skatt{the_spotlight_is_on_you}

...
```

# Flag

```
skatt{the_spotlight_is_on_you}
```