# Falske Penger

Skattekrim har avdekket et parti med tusenlapper og de mistenker at de kan inneholde 1 forfalsket seddel. 

Passordet til zip-filen er: `skattctf`

Finn seddelen og svar med: `skatt{filnavn}`

[⬇️ falske_penger.zip](./falske_penger.zip)

# Writeup

En av filene er ulike. En sortert md5sum av alle viser fort hvem som skiller seg ut:

```
➜ md5sum * | sort
179443ed85aa45614b7c2c98b0e9ec8c  1000_1.jpg
...
179443ed85aa45614b7c2c98b0e9ec8c  1000_999.jpg
9161b73d58d42329d7ae1af367180219  1000_671.jpg
```

# Flag

```
skatt{1000_671.jpg}
```
