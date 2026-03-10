# Skattefuten Backup

`Skattefuten` har begynt å bruke den blå sky, men er usikker på om `backup`-løsningen er riktig konfigurert. Er den sikker?

# Writeup
En feilkonfigurert storage account eksponerer et python script som inneholder en SAS-URL. SAS-URL-en gir tilgang til en private container.

## MicroBurst
https://github.com/NetSPI/MicroBurst

#### Sørg for å legge til "backup" i permutations.txt slik at dette vil bli brukt under enumereringen
```powershell
PS C:\Users\maaten\tools\MicroBurst\Misc> cat .\permutations.txt | Select-String "backup"

backup
```

#### Importer modulen
```powershell
PS C:\Users\maaten\tools\MicroBurst> Import-Module .\MicroBurst.psm1
Imported Az MicroBurst functions
Imported AzureAD MicroBurst functions
Imported MSOnline MicroBurst functions
Imported Misc MicroBurst functions
Imported Azure REST API MicroBurst functions
```

#### Kjør MicroBurst
```powershell
PS C:\Users\maaten\tools\MicroBurst> Invoke-EnumerateAzureBlobs -Base skattefuten
Found Storage Account -  skattefutenstorage.blob.core.windows.net

Found Container - skattefutenstorage.blob.core.windows.net/backup
        Public File Available: https://skattefutenstorage.blob.core.windows.net/backup/blob_script.py
```
I python-scriptet finner man SAS-URL-en:
`https://skattefutenstorage.blob.core.windows.net/verysecretcontainer?sp=rl&st=2026-03-03T11:29:37Z&se=2026-03-11T19:44:37Z&spr=https&sv=2024-11-04&sr=c&sig=0aUixWdJIBfw3uky1r5eowEqqlC6TagDVacc%2FtGWqJI%3D`


## Åpne SAS-URL-en knyttet til den private containeren med Microsoft Azure Storage Explorer
#### 1.
![alt text](image.png)


#### 2. 
![alt text](image-1.png)

#### 3.
![alt text](image-2.png)

#### 4. Klask inn SAS-URL
![alt text](image-3.png)

#### 5. Last ned flag.txt for win
![alt text](image-4.png)




# Flag

```
skatt{ph4t_@nd_ju1cy_bl0b}
```
