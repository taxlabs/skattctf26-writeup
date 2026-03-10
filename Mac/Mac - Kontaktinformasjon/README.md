# Mac - Kontaktinformasjon

Det har blitt gjennomført flere beslag hos den notoriske skattesvindleren Kjell T. Ringen. Taxman har startet analyse av Kjells Macbook med et hjemmesnekret collection verktøy, og har hentet ut delvis kopi av filsystemet og interessante artifakter.<br /><br />
Vi vet at Kjell har kommunisert med det kriminelle nettverket, og mistenker at det finnes mer informasjon om hvem de andre i nettverket, telefonnummer og hvilken rolle de har. Klarer du å finne dette notatet med kontaktinformasjonen?<br /><br />

> Alle Mac-oppgavene har samme fil som utgangspunkt: https://drive.proton.me/urls/NK9D7XR0E4#0tbSCce0ukHy <br /> Passord til zip-fil: `skattctf`

# Writeup

Denne oppgaven var meningen å løse etter å ha åpnet keychain til Kjell. 
Ved å få passordet fra keychain får man tilgang til det hemmelige notatet om kjeltringnettverket på `hemmlig.app` eller `pastebin.com`.
Passord til note: `committing_tax_fraud_since_1999`<br /><br />
URLs:<br />
https://hemmelig.app/secret/2aa20fa6-7c80-45a0-8eaf-06e6acf1d480<br />
https://pastebin.com/pQzaKhhS<br />
![alt text](image.png)

# Flag

```
skatt{k_r_iminell_er_coc}
```