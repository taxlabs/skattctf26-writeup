# Underslag

Skattekrim har mistanke om at noen har underslått penger. Du finner oppdraget og relevant informasjon i den vedlagte filen. 

Passordet til filen er: `skattctf`

Finn personen og svar med: `skatt{<fødselsnummer>}`

[⬇️ underslag.zip](./underslag.zip)

# Writeup

Oppdragstekst fra zipfilen:
```
Det eksisterer mistanke om at en person har underslått penger fra staten og vi trenger hjelp til å finne ut hvem.

Vedlegg: datagrunnlag.csv

Gå igjennom datagrunnlaget og finn personen vi leter etter. Mistanken er basert på tips fra en tidligere benyttet kilde.
Dette vet vi om personen:

  - Vedkommende er ikke tidligere dømt, men er tidligere etterforsket
  - Vedkommende har en inntekt et sted mellom 900000 og 1.3 millioner kroner
  - Vedkommende er en mann
  - Vedkommende er selvstendig næringsdrivende
  - Vedkommende har gjeld mer enn 2 millioner kroner

Mvh Kontor for Skattekrim
```

[⬇️ datagrunnlag.csv](./datagrunnlag.csv)

Filtrerer vekk de som ikke passer (husk "Tips" fra teksten over punktlisten):

```py
import csv
reader = csv.DictReader(open("datagrunnlag.csv"))

for row in reader:
    if row['Grunn til mistanke'] != 'Tips': continue
    if row['Tidligere dømt'] == 'Ja': continue
    if row['Tidligere etterforsket'] == 'Nei': continue
    if row['\ufeffPersonnummer'][-3] not in ['1', '3', '5', '7', '9']: continue
    if row['Selvstendig næringsdrivende'] == 'Nei': continue
    if int(row['Gjeld']) < 2000000: continue
    if int(row['Inntekt']) < 900000: continue
    if int(row['Inntekt']) > 1300000: continue

    print(row)
    print("skatt{%s}" % row['\ufeffPersonnummer'])
```

# Flag

```
skatt{04014715792}
```