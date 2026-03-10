# Mac - Nøkkelring

Det har blitt gjennomført flere beslag hos den notoriske skattesvindleren Kjell T. Ringen. Taxman har startet analyse av Kjells Macbook med et hjemmesnekret collection verktøy, og har hentet ut delvis kopi av filsystemet og interessante artifakter.<br /><br />
Kjells nøkkelring ble hentet ut blant artifaktene. Kan du finne nøkkelringen og åpne den? <br /><br />

> Alle Mac-oppgavene har samme fil som utgangspunkt: https://drive.proton.me/urls/NK9D7XR0E4#0tbSCce0ukHy <br /> Passord til zip-fil: `skattctf`

# Writeup

Åpne Kjells keychain på en Mac eller med verktøy. Passordet til brukeren finner mann i `Notes` i oppgaven `Mac - Passord`.<br />
Fil: `Users/kjell.t.ringen/Library/Keychains/kjell.t.ringen.keychain-db`<br />
Verktøy for å åpne keychain uten Mac: https://github.com/n0fate/chainbreaker


# Flag

```
skatt{im_gonna_buy_me_a_(key)chain}
```