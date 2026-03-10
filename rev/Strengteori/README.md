# Strengteori

Finner du hemmeligheten?

[⬇️ string_theory](./string_theory)

# Writeup

Filnavnet og oppgaven hinter om `strings`-kommandoen i Linux, som kan brukes til å finne lesbar tekst i binære filer.

Med string + grep får man flagget:

```bash
$ strings string_theory | grep skatt
skatt{det_er_mye_godsaker_i_binaerfiler}
```

# Flag

```
skatt{det_er_mye_godsaker_i_binaerfiler}
```