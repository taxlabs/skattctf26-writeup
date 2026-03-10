#!/usr/bin/env python3

from pwn import *
import string

abc = string.ascii_lowercase + "æøå"

def idx(ch):
    return abc.find(ch.lower())

def solve(plain, cipher):
    out = ""
    for i in range(len(plain)):
        if plain[i].lower() not in abc: continue
        pos = idx(cipher[i]) - idx(plain[i])
        out += abc[pos]
    return out

r = remote('skatt-uknekkbar.chals.io', 443, ssl=True)

r.recvuntil(b'Meldingen er: \n')
plain = r.recvline().decode("utf-8")
r.recvuntil(b'Cipherteksten er: \n')
cipher = r.recvline().decode("utf-8")

key = solve(plain, cipher)
# teit substring-detektor:
actual_key = key[:10+key[10:].find(key[:10])]
log.info("Key: " + actual_key)

r.sendline(actual_key.encode("utf-8"))
print(r.recvall().decode("utf-8"))
