# Chef Roulette

CyberChef er et veldig allsidig verktøy. Se om du kommer i mål. Ingen operasjon er brukt mer enn én gang. <br><br><a href='https://gchq.github.io/CyberChef/#input=SDRzSUFKK3hqV2tBLyszYjNRcUNRQkRGOFljUnZLNTBvdWo5MzBzdGlyd0orb0RjbWQvTmdya1NPenQ3em4vRzZyczRYdnB1UE0vRGNKaUhHTy9EN1RMV2Q3YzVlYmw3L2V4cDhtazFPWWJINVg0WmRwOTk3emZQdGpqNTlYcmZDbnUxWi9PbFN2SGxWMU9HZk52dDdKZUtCcHVnRzA1SzFtaUF6NytFRG94eEhJNUQyelZodUtRV0RTVkVCWFJETWlnODdUNHBnQkFRd2prU0RVMFl1dEdpNDZBUk5FSlYwQWovcFNyYUhaS2hpTVhJSEpuRGp5UVNlOElxa29GUVlCVUZvRzRBR1FHdXpwSGZCdEFOTENvWlJFTTBSQU16b0UyWkF6OFFoYktVVUNoTDZZYmt0L3Q0a2szZ2pRU3Y3SW5NRm1xTjRxOUhFYVBqYkxzVkNQNTloZ2xMOVJqNVBpUDQ1ZkluVlUyaHg5dGJBQUE9'>Klikk her for å starte</A>

# Writeup

Her får du mye hjelp ved å bruke "Magic"-funksjonen i CyberChef, men noen manuelle ROT13/ROT47-steg må til.


   1. URL Decode
   2. From base64
   3. Gunzip
   4. From HTML Entity
   5. From decimal
   6. ROT-13
   7. From Morse Code
   8. From Hex
   9. ROT-47
   10. Reverse


[Lenke til løsning i CyberChef](https://gchq.github.io/CyberChef/#recipe=From_Base64('A-Za-z0-9%2B/%3D',true,false)Gunzip()From_HTML_Entity()From_Decimal('Space',false)ROT13(true,true,false,13)From_Morse_Code('Space','Line%20feed')From_Hex('None')ROT47(47)Reverse('Character'))

# Flag

```
skatt{godt_jobbet_chef_her_var_det_my3_rart!}
```