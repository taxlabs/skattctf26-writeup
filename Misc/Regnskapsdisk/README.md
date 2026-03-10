# Regnskapsdisk

Du har mottatt en fil fra et regnskapsfirma som mistenkes å ha skjult informasjon i sine interne filer.

[⬇️ skatt.img](./skatt.img)

# Writeup

```
> sudo mount -o loop skatt.img /mnt/skatt/
> ls -l /mnt/skatt/
total 16K
-rw-r--r-- 1 root root 111 Oct 28 14:49 budsjett_2026.csv
-rw-r--r-- 1 root root  88 Oct 28 14:49 lønnsliste.csv
drwx------ 2 root root 12K Oct 28 14:48 lost+found/
-rw-r--r-- 1 root root 404 Oct 28 14:49 mva_rapport.pdf
-rw-r--r-- 1 root root 147 Oct 28 14:49 notater.txt

> ls -la /mnt/skatt/
total 22K
drwxr-xr-x 3 root root 1.0K Oct 28 14:49 ./
drwxr-xr-x 3 root root 4.0K Apr  8  2025 ../
-rw-r--r-- 1 root root  111 Oct 28 14:49 budsjett_2026.csv
-rw-r--r-- 1 root root   88 Oct 28 14:49 lønnsliste.csv
drwx------ 2 root root  12K Oct 28 14:48 lost+found/
-rw-r--r-- 1 root root  404 Oct 28 14:49 mva_rapport.pdf
-rw-r--r-- 1 root root  147 Oct 28 14:49 notater.txt
-rw-r--r-- 1 root root  287 Oct 28 14:49 .regnskap.csv.gz

> cp /mnt/skatt/.regnskap.csv.gz .
> gunzip .regnskap.csv.gz
> cat .regnskap.csv
Dato,Bilag,Beskrivelse,Konto,Debet,Kredit
2025-01-05,1001,Faktura fra leverandør,4000,12500,
2025-01-10,1002,Betaling av faktura,1920,,12500
2025-01-15,1003,Lønn til ansatte,5000,30000,
2025-01-20,1004,Skattetrekk,2600,,9000
2025-01-25,1005,MVA-rapportering,2740,,6250
2025-01-30,1006,Overføring: c2thdHR7c2thdHRfZXJfbW9yb30=,2999,1337,
2025-02-01,1007,Kontorrekvisita,6800,1200,

> echo c2thdHR7c2thdHRfZXJfbW9yb30= | base64 -d; echo
skatt{skatt_er_moro}
```

# Flag

```
skatt{skatt_er_moro}
```