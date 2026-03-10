# Brukernavn

I forbindelse med en skattekrimsak er det gjort beslag av en pc. 
På maskinen ble det gjort funn av en virtuell maskin, og teknikerne har sikret en minnedump av denne.

Det spekuleres i om den mistenke benytter flere alias.  `GrevenAvGråsone` er ett, men finnes det noen andre brukere av maskinen?

Du må selv legge `skatt{}` rundt brukernavnet: `skatt{brukernavn}`

> Alle minneoppgavene har samme fil som utgangspunkt: [minneanalyse.7z](https://drive.google.com/file/d/1EDZZqcx0KhfKQUgKxn5qwFD4C-AU98LJ/view?usp=sharing)
Passordet er: `skattctf`

# Writeup

<Enter writeup here>
Den andre brukeren av maskinen kan man finne ved i titte i SAM-hivet i registeret. Denne brukeren har aldri logget inn på maskinen, derfor finnes ingen spor av hjemmekatalog for brukeren.
  
`Volatility3` har en egen plugin for å printe spesifikke "keys" fra et hive:
  
```py
python3 vol.py -f Windows_10_x64_SkattCTF-bbc607b3.vmem windows.registry.printkey --key  "SAM\\Domains\\Account\\Users\\Names"

Volatility 3 Framework 2.27.0
Progress:  100.00		PDB scanning finished
Last Write Time	Hive Offset	Type	Key	Name	Data	Volatile

-	0xa88106a74000	Key	[NONAME]\SAM\Domains\Account\Users\Names	-	-	-
-	0xa88106a8b000	Key	\REGISTRY\MACHINE\SYSTEM\SAM\Domains\Account\Users\Names	-	-	-
-	0xa88106ae9000	Key	\REGISTRY\MACHINE\HARDWARE\SAM\Domains\Account\Users\Names	-	-	-
-	0xa88108477000	Key	\Device\HarddiskVolume1\EFI\Microsoft\Boot\BCD\SAM\Domains\Account\Users\Names	-	-	-
-	0xa88108498000	Key	\SystemRoot\System32\Config\SOFTWARE\SAM\Domains\Account\Users\Names	-	-	-
-	0xa8810a0c5000	Key	\SystemRoot\System32\Config\DEFAULT\SAM\Domains\Account\Users\Names	-	-	-
-	0xa8810a282000	Key	\SystemRoot\System32\Config\SECURITY\SAM\Domains\Account\Users\Names	-	-	-
2026-03-02 08:41:53.000000 UTC	0xa8810a2f7000	Key	\SystemRoot\System32\Config\SAM\SAM\Domains\Account\Users\Names	Administrator	N/A	False
2026-03-05 09:54:34.000000 UTC	0xa8810a2f7000	Key	\SystemRoot\System32\Config\SAM\SAM\Domains\Account\Users\Names	Fakturafyrsten	N/A	False
2026-03-02 08:41:53.000000 UTC	0xa8810a2f7000	Key	\SystemRoot\System32\Config\SAM\SAM\Domains\Account\Users\Names	Gjest	N/A	False
2026-03-02 08:53:17.000000 UTC	0xa8810a2f7000	Key	\SystemRoot\System32\Config\SAM\SAM\Domains\Account\Users\Names	GrevenAvGråsone	N/A	False
2026-03-02 08:41:53.000000 UTC	0xa8810a2f7000	Key	\SystemRoot\System32\Config\SAM\SAM\Domains\Account\Users\Names	Standardkonto	N/A	False
2026-03-02 08:41:53.000000 UTC	0xa8810a2f7000	Key	\SystemRoot\System32\Config\SAM\SAM\Domains\Account\Users\Names	WDAGUtilityAccount	N/A	False
2026-03-05 09:54:34.000000 UTC	0xa8810a2f7000	REG_NONE	\SystemRoot\System32\Config\SAM\SAM\Domains\Account\Users\Names	(Default)		False
```

Her er det da en annen bruker utenom standardbrukere og GrevenAvGråsone, nemlig Fakturafyrsten.

# Flag

```
skatt{Fakturafyrsten}
```
