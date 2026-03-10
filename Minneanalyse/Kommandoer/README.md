# Kommandoer

I forbindelse med en skattekrimsak er det gjort beslag av en pc. 
På maskinen ble det gjort funn av en virtuell maskin, og teknikerne har sikret en minnedump av denne.

Har den mistenkte kjørt noen merkelige kommandoer nylig?

> Alle minneoppgavene har samme fil som utgangspunkt: [minneanalyse.7z](https://drive.google.com/file/d/1EDZZqcx0KhfKQUgKxn5qwFD4C-AU98LJ/view?usp=sharing)
Passordet er: `skattctf`

# Writeup

<Enter writeup here>

`Volatility3` har en plugin for å hente i kommandoer fra `cmd.exe`:

```py
python vol.py -f Windows_10_x64_SkattCTF-bbc607b3.vmem windows.cmdscan                                                     
Volatility 3 Framework 2.26.2
Progress:  100.00               PDB scanning finished                        
PID     Process ConsoleInfo     Property        Address Data

6112    conhost.exe     0x2064fad1130   _COMMAND_HISTORY        0x2064fad1130   None
* 6112  conhost.exe     0x2064fad1130   _COMMAND_HISTORY.Application    0x2064fad1160   cmd.exe
* 6112  conhost.exe     0x2064fad1130   _COMMAND_HISTORY.ProcessHandle  0x2064dba5e50   0x114
* 6112  conhost.exe     0x2064fad1130   _COMMAND_HISTORY.CommandCount   N/A     6
* 6112  conhost.exe     0x2064fad1130   _COMMAND_HISTORY.LastDisplayed  0x2064fad118c   5
* 6112  conhost.exe     0x2064fad1130   _COMMAND_HISTORY.CommandCountMax        0x2064fad1158   50
* 6112  conhost.exe     0x2064fad1130   _COMMAND_HISTORY.CommandBucket  0x2064fad1140
** 6112 conhost.exe     0x2064fad1130   _COMMAND_HISTORY.CommandBucket_Command_0        0x2064dbba550   dir
** 6112 conhost.exe     0x2064fad1130   _COMMAND_HISTORY.CommandBucket_Command_1        0x2064dbba570   cd Documents
** 6112 conhost.exe     0x2064fad1130   _COMMAND_HISTORY.CommandBucket_Command_2        0x2064dbba590   type nul > wipeEverything.bat
** 6112 conhost.exe     0x2064fad1130   _COMMAND_HISTORY.CommandBucket_Command_3        0x2064dbba5b0   c2thdHR7aW50ZXJlc3NhbnRLb21tYW5kb30=
** 6112 conhost.exe     0x2064fad1130   _COMMAND_HISTORY.CommandBucket_Command_4        0x2064dbba5d0   mkdir falskeFakturaer
** 6112 conhost.exe     0x2064fad1130   _COMMAND_HISTORY.CommandBucket_Command_5        0x2064dbba5f0   cd falskeFakturaer
** 6112 conhost.exe     0x2064fad1130   _COMMAND_HISTORY.CommandBucket_Command_6        0x2064dbba610   䞐䶺Ȇ
1336    conhost.exe     0x7ff880d62165  _COMMAND_HISTORY        N/A     History Not Found
```

Etter å ha hentet ut kommandoene fra `cmd.exe` ser man tydelig at det er en som skiller seg ut:

```sh
echo -n "c2thdHR7aW50ZXJlc3NhbnRLb21tYW5kb30=" | base64 -d
skatt{interessantKommando}
```

# Flag

```
skatt{interessantKommando}
```
