# Notat

I forbindelse med en skattekrimsak er det gjort beslag av en pc. 
På maskinen ble det gjort funn av en virtuell maskin, og teknikerne har sikret en minnedump av denne.

Finnes det noen prosesser som inneholder notater med relevans for saken?

> Alle minneoppgavene har samme fil som utgangspunkt: [minneanalyse.7z](https://drive.google.com/file/d/1EDZZqcx0KhfKQUgKxn5qwFD4C-AU98LJ/view?usp=sharing)
Passordet er: `skattctf`

# Writeup

<Enter writeup here>
For å finne notater kan det være lurt å ta en titt på prosesslisten til minnedumpen:

```py
python vol.py -f Windows_10_x64_SkattCTF-bbc607b3.vmem windows.pslist

PID     PPID    ImageFileName   Offset(V)       Threads Handles SessionId       Wow64   CreateTime      ExitTime        File output
***
5140    4076    notepad.exe     0xbf8af00b62c0  4       -       1       False   2026-03-05 10:00:30.000000 UTC  N/A     Disabled
***
```

`notepad.exe` er en åpenbar kandidat.

Når man har PID til prosessen kan man dumpe prosessminnet vha:

```py
python vol.py Windows_10_x64_SkattCTF-bbc607b3.vmem -o ./notepad windows.memmap --pid 5140 --dump
```

Deretter kan man dumpe strengene og gå etter flagget direkte:

```sh
strings -el pid.5140.dmp | grep -i skatt
SKATTEN: skatt{denne_er_enkel}
SKATTEN: skatt{denne_er_enkel}
SKATTEN: skatt{denne_er_enkel}
```

Dette er det eneste flagget i minneoppgaven som er i klartekst, så det er også mulig å finne flagget direkte fra minnedumpen:

```sh
strings -el ~/Desktop/ProdOppgaveCTF/Windows_10_x64_SkattCTF-bbc607b3.vmem | grep -i skatt
 SKATTEN: skatt{denne_er_enkel}
Vooruitskatting ...
 SKATTEN: skatt{denne_er_enkel}
 SKATTEN: skatt{denne_er_enkel}
 SKATTEN: skatt{denne_er_enkel}
```

# Flag

```
skatt{denne_er_enkel}
```
