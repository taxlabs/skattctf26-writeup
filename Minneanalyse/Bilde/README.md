# Bilde

I forbindelse med en skattekrimsak er det gjort beslag av en pc. 
På maskinen ble det gjort funn av en virtuell maskin, og teknikerne har sikret en minnedump av denne.

Det kan også være informasjon i bilder. Si ifra om du finner noe interessant.

> Alle minneoppgavene har samme fil som utgangspunkt: [minneanalyse.7z](https://drive.google.com/file/d/1EDZZqcx0KhfKQUgKxn5qwFD4C-AU98LJ/view?usp=sharing)
Passordet er: `skattctf`

# Writeup

<Enter writeup here>

Denne oppgaven ber spesifikt om bilder så da begynner kan det være lurt å ta en titt på hvilke filer som er tilgjengelig.

```py
python vol.py -f Windows_10_x64_SkattCTF-bbc607b3.vmem windows.filescan > filliste.txt
```

Etter man har en liste over filer kan man lete etter bilder:

```sh
grep -i jpg filliste.txt                                                           
0xbf8aef7c3d10  \Users\GrevenAvGråsone\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles\CachedImage_2326_1275_POS4.jpg
0xbf8aef969720  \Users\GrevenAvGråsone\AppData\Roaming\Microsoft\Windows\Recent\huskeliste.jpg.lnk
0xbf8aeff64880  \Users\GrevenAvGråsone\Desktop\huskeliste.jpg
```

Nå har man minneadressen og kan dumpe filen:

```py
python vol.py -f Windows_10_x64_SkattCTF-bbc607b3.vmem -o ./filer windows.dumpfiles --virtaddr 0xbf8aeff64880
```
![huskeliste](huskeliste.png)

# Flag

```
skatt{inkriminerendeBevis}
```
