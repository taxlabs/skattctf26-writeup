# Skjult dokument

Steganografi er kunsten å skjule informasjon innenfor et annet medium, for eksempel et bilde eller en tekstfil. Lykke til!

[⬇️ challenge.pdf](./challenge.pdf)

# Writeup

Tekst-fil som attachment i PDF. Generert med `pdftk`:
```
pdftk Lorem_ipsum.pdf attach_files secret.txt output handout/challenge.pdf
```

Binwalk henter den greit ut:
```
~/Downloads ❯❯❯ binwalk -e challenge.pdf                                                                                                            ✘ 130

DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
0             0x0             PDF document, version: "1.5"
143           0x8F            Zlib compressed data, default compression
979           0x3D3           Zlib compressed data, default compression
2957          0xB8D           Zlib compressed data, default compression

~/Downloads ❯❯❯ cat _challenge.pdf.extracted/8F
skatt{PDF_filer_er_en_gullgruve}
```

# Flag

```
skatt{PDF_filer_er_en_gullgruve}
```