# Regnskap

Du har fått tilgang til en regnskapsfil fra et lite konsulentselskap. Tallene ser greie ut, men dokumentet skjuler mer enn det som vises i arkene.

[⬇️ Regnskap.zip](./Regnskap.zip)

# Writeup

```
regnskap.ods: OpenDocument Spreadsheet
```

Det er bare en zip-fil. Utpakket:
```
➜  Regnskap git:(main) ✗ unzip regnskap.ods
Archive:  regnskap.ods
 extracting: mimetype
  inflating: manifest.rdf
   creating: Configurations2
  inflating: styles.xml
  inflating: settings.xml
  inflating: meta.xml
 extracting: Thumbnails/thumbnail.png
  inflating: content.xml
  inflating: META-INF/manifest.xml
```

I `description`-feltet inne i meta.xml finner vi en lang base64-streng:

```
> echo TmljZSEgRmxhZ2dldCBlciA6IHNrYXR0e3NrYXR0X2VyX2lra2VfYmFyZV9ramVkZWxpZ30K|base64 -d
Nice! Flagget er : skatt{skatt_er_ikke_bare_kjedelig}
```


# Flag

```
skatt{skatt_er_ikke_bare_kjedelig}
```