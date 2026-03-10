# Web Intro 2

Roboter er kule, men vi må passe på at de ikke tar over verden. Kanskje denne nettsiden har noen mekanismer for å holde roboter unna?

[🔗 https://skatt-webintro.chals.io/intro2](https://skatt-webintro.chals.io/intro2)

# Writeup

Hintet om å holde roboter unnna kan tyde på at det er en form for botbeskyttelse på nettsiden. En fil som er godt kjent for å brukes i slike sammenhenger er `robots.txt`. Denne filen forteller søkemotorer og andre roboter hvilke deler av nettsiden de ikke skal besøke.

Ved å navigere til `https://skatt-webintro.chals.io/robots.txt` så får man 

```
User-agent: *
Disallow: /intro2/human-only
```

Og der ligger flagget!

# Flag

```
skatt{disallow_r0b0ts}
```