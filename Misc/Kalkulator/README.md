# Kalkulator

Våre revisorer tar dette i hodet. Er du like rask i hoderegning?

*Tilkobling:*

`openssl s_client -connect skatt-math.chals.io:443 -servername skatt-math.chals.io -quiet`

eller med [snicat](https://github.com/CTFd/snicat):

`sc skatt-math.chals.io`

eller fra [pwntools](https://docs.pwntools.com/en/stable/index.html):

`r = remote("skatt-math.chals.io", 443, ssl=True)`

# Writeup

Klassisk kodeoppgave. Du må kode noe som regner ut oppgaver i økende vanskelighetsgrad. Siden oppgavemakeren er en kødd må du også hoppe over én linje med `sys.exit() = trust issues?` ;)

Eksempel på løsning: [solver.py](./solver.py)

# Flag

```
skatt{du_er_rask_paa_avtrekkeren!}
```