# BabyRSA

Her får du en kryptert fil og den offentlige nøkkelen som ble brukt for å kryptere den.

Klarer du å knekke RSA?

Passordet til zip-filen er: `skattctf`

[⬇️ babyrsa.zip](./babyrsa.zip)

# Writeup

Pubkey har `n` og `e`. Løsningen er å utnytte at `n` allerede er faktorisert i kjente primtall. Man kan bruke factor.db til å finne `p` og `q` (`p*q=n`), eller bare google `n` og få nyhetssaker om at den ble knekt. 

Med den infoen kan man regne ut `d` og da har vi en fullstendig privatnøkkel som kan dekryptere meldingen.

Eksempel-løsning i [./solver.py](./solver.py).

Annen måte er å bruke rsactftool:
```
❯❯❯ docker pull razaborg/rsactftool
❯❯❯ xxd -r -p ciphertext.hex cipher.bin
❯❯❯ docker run -it --rm -v $PWD:/data razaborg/rsactftool --publickey /data/pubkey.pem --uncipher /data/ciphertext

[+] Clear text :?|??F*Y9?F?5;???????
?$??UHBx pV??B????NuDЯ???['Jq??skatt{large_random_primes_pretty_please}
```

https://en.wikipedia.org/wiki/RSA_numbers#RSA-250

# Flag

```
skatt{large_random_primes_pretty_please}
```