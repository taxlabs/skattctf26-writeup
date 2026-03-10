# Dropper

Det har blitt gjort funn av en mistenkelig fil på en maskin i nettverket vårt.

Vi mistenker at det er en form for skadevare, men vi er ikke sikre. Kan du ta en titt?

Passord på zip-filen er: `skattctf`

[⬇️ dropper.zip](./dropper.zip)

# Writeup

Det finnes flere måter å analysere filen på. Men om man bruker en miks av nettverksanalyse og debugging eller reversering av binæren så kan man se at det er en dropper for skadevare. 

Det vil si at det er et program som sjekker om det kjører på riktig målmaskin, og hvis det gjør det så laster det ned og kjører en payload.

Følgende krav må være oppfylt:

- Det må eksistere en fil `skattesats.txt` i `/home/futen/`
- Hostname må være `pengebingen`
- Miljøvariabelen `MOTTO` må være satt til `MoneyMoneyMoney`
- Plattform må være linux/amd64

Dette kan enkelt reproduseres ved å kjøre programmet i en Docker-container med riktig miljø:

```bash
docker run --hostname pengebingen --rm -it \
  --platform linux/amd64 -v $(pwd):/work ubuntu:22.04 /bin/bash -c \
  "mkdir -p /home/futen/ && touch /home/futen/skattesats.txt && MOTTO=MoneyMoneyMoney /work/dropper"
```

# Flag

```
skatt{giveTheMalwareWhatItWantzzzz}
```
