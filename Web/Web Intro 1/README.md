# Web Intro 1

Her er en enkel introduksjonsutfordring for web-kategorien.

[🔗 https://skatt-webintro.chals.io/intro1](https://skatt-webintro.chals.io/intro1)

# Writeup

Her er det en liten JavaScript-kode som er interessant. Den sjekker om passordet som blir skrevet inn er riktig, og hvis det er det så dekoder den en base64-streng som inneholder flagget.

```javascript
const password = 'tehrekkis'

let attempts = 0

function check() {
    const input = document.getElementById('input').value
    const output = document.getElementById('output')
    const attemptEl = document.getElementById('attempts')
    attempts++

    if (input === password.split('').reverse().join('')) {
        output.className = 'output success'
        output.innerHTML = `> TILGANG INNVILGET <span class="cursor"></span>`

        const flagBox = document.getElementById('flagBox')
        const flagValue = document.getElementById('flagValue')
        flagValue.textContent = atob('c2thdHR7c2lra2VyaGV0X2xpa3NvbSF9')
        flagBox.style.display = 'block'
        attemptEl.textContent = `> forsøk: ${attempts}`
    } else {
        output.className = 'output error'
        output.textContent = `> FEIL PASSORD // TILGANG NEKTET`
        attemptEl.textContent = `> forsøk: ${attempts}`
        document.getElementById('input').value = ''
    }
}

document.getElementById('submit').addEventListener('click', check)
document.getElementById('input').addEventListener('keydown', e => {
    if (e.key === 'Enter') check()
})
```

To løsninger er å forstås å lese koden og se at passordet du skriver inn blir reversert og verifisert mot `tehrekkis`. Så det er bare å reversere det for å få passordet `sikkerhet`. Alternativt kan man også se at det er en base64-streng som blir dekodet når man skriver inn riktig passord, og dekode den for å få flagget.

# Flag

```
skatt{sikkerhet_liksom!}
```