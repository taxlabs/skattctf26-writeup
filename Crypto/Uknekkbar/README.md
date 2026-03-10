# Uknekkbar

Uknekkbart polyalfabetisk cipher fra 1553.

*Tilkobling:*

`openssl s_client -connect skatt-uknekkbar.chals.io:443 -servername skatt-uknekkbar.chals.io -quiet`

eller med [snicat](https://github.com/CTFd/snicat):

`sc skatt-uknekkbar.chals.io`

# Writeup

[Vigenère cipher](https://en.wikipedia.org/wiki/Vigen%C3%A8re_cipher) - men du må ta høyde for norske tegn, noe ikke alle online-verktøy gjør. 

[Script for å løse](./solver.py)

```
[+] Opening connection to skatt-uknekkbar.chals.io on port 443: Done
[*] Key: ikkenoetrøbbelmedæøå
[+] Receiving all data: Done (92B)
[*] Closed connection to skatt-uknekkbar.chals.io port 443

Nøkkel:
Gratulerer!  skatt{visste_du_at_vigenere_cipher_ikke_ble_oppfunnet_av_vigenere?}
```

# Flag

```
skatt{visste_du_at_vigenere_cipher_ikke_ble_oppfunnet_av_vigenere?}
```