# Passord

I forbindelse med en skattekrimsak er det gjort beslag av en pc. 
På maskinen ble det gjort funn av en virtuell maskin, og teknikerne har sikret en minnedump av denne.

Vi tror den mistenkte beskytter passordene sine i KeePass, klarer du å få tak i dem?

> Alle minneoppgavene har samme fil som utgangspunkt: [minneanalyse.7z](https://drive.google.com/file/d/1EDZZqcx0KhfKQUgKxn5qwFD4C-AU98LJ/view?usp=sharing)
Passordet er: `skattctf`

# Writeup

<Enter writeup here>

Her skal man finne passord låst inne i en KeePass-database, så her må man gjøre flere steg. Først finne selve KeePass-filen.  
Let etter filer med `.kdbx`-ending i fillisten man fikk etter å ha kjørt:

```py
python vol.py -f Windows_10_x64_SkattCTF-bbc607b3.vmem windows.filescan > filliste.txt
```

```py
grep -i kdbx filliste.txt                                                                                                                                                                
0xbf8af001e3e0  \Users\GrevenAvGråsone\Documents\privatePassord.kdbx
```

Så kan man dumpe databasen:

```py
python vol.py -f Windows_10_x64_SkattCTF-bbc607b3.vmem windows.dumpfiles -o ./filer --virtaddr 0xbf8af001e3e0
Volatility 3 Framework 2.27.0
Progress:  100.00		PDB scanning finished
Cache	FileObject	FileName	Result

DataSectionObject	0xbf8af001e3e0	privatePassord.kdbx	Error dumping file
```

Volatility gir en feilmelding, men filen blir dumpet.  
Nå må prosessminnet tilhørende KeePass-prosessen bli dumpet for å finne passord for å åpne selve databasen.  
Finn rett PID til KeePass-prosessen:

```py
python vol.py -f Windows_10_x64_SkattCTF-bbc607b3.vmem windows.pslist
Volatility 3 Framework 2.26.2
Progress:  100.00               PDB scanning finished                        
PID     PPID    ImageFileName   Offset(V)       Threads Handles SessionId       Wow64   CreateTime      ExitTime        File output
***
5836    4076    KeePass.exe     0xbf8af09130c0  11      -       1       False   2026-03-05 10:00:53.000000 UTC  N/A     Disabled
***
```

Nå kan man dumpe prosessminnet:

```py
python vol.py -f Windows_10_x64_SkattCTF-bbc607b3.vmem windows.memmap --pid 5836 --dump
```

Masterpassordet ligger et eller annet sted i minnet. Dette kan man bruke for å lukke opp KeePass-databasen man dumpet tidligere.  

```py
strings -el pid.5836.dmp | grep -i "open database" -C5
...
KeyPromptForm
ObjectDisposed_Generic
r ikke tilgang til et fjernet objekt.
Open Database - privatePassord.kdbx
Open Database - privatePassord.kdbx
(None)
(None)
svindeL3RLiiivet
svindeL3RLiiivet
...
```

Eventuelt bare kjør strings og let igjennom minnet, men husk rett enkoding.

```sh
strings -el pid.5836.dmp | less
```

Masterpassordet er `svindeL3RLiiivet` og dette vil åpne databasen hvor man finner flagget som et passord.

# Flag

```
skatt{passw0rdzInMemory}
```
