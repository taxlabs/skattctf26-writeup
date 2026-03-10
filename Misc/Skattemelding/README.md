# Skattemelding

Dokumentene rundt skattemeldingen virker tilsynelatende normale, men én fil lar seg ikke åpne. Passordet finnes et sted i det du har mottatt.

[⬇️ Skattemelding.zip](./Skattemelding.zip)

# Writeup

Zip-filen inneholder:
- kryptert zip-fil med flagg
- PDF-fil
- Epost
- Tekstfil med litt hint

Passord for å låse opp zip-filen med flagget er skjult i en header i eposten:
```
X-Compliance-ID: RnhuZ2dyd254ZzIwMjU
```

Base64-decode gir `Fxnggrwnxg2025` som ser lovende ut, men ikke helt. Tallene bakerst ser fine ut, og det er en stor forbokstav. Hvis du prøver rot13 i tillegg blir det `Skattejakt2025`.


# Flag

```
skatt{du_har_funnet_passordet}
```