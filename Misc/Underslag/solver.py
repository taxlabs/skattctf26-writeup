#!/usr/bin/env python3

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
