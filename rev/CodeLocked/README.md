# CodeLocked

Kodelåsen beskytter et flagg.

Passord til zip-filen er: `skattctf`

[⬇️ CodeLocked.zip](./CodeLocked.zip)

# Writeup

Flagget er rotert (ROT13) og XORet med en key før det er gjort til hex og lagt i koden som `524a595f53494346415447426b420749466d4153524a`.

Kodekalkulatoren tar 6 siffer og gjør en sjekk av om bytestringen da vil starte med `skatt{`. Dersom den gjør det vil et nytt form poppe opp som gjør samme operasjon, men legger på koden baklengs som en ekstra del av XOR-nøkkelen.

Riktig kode er `427842` (som tall/tekst, ikke hex). 

Kun dette som nøkkel vil gi `skatt{jgiyfc_c0de_hnre` etter rot13. Det er nærme, men uten nøkkelen baklengs blir det ikke nok til å få flagget.

Full dekrypteringsnøkkel med revers streng blir da `427842248724`.

Delphikode vedlagt for de med ekstra morbid nysgjerrighet.

# Flag

```
skatt{delphi_c0de_ftw}
```