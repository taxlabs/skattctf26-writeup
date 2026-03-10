#!/usr/bin/env python3

from pwn import *

r = remote("skatt-math.chals.io", 443, ssl=True)
log.info('Venter på treg skriving..')
r.recvuntil(b'ready?\n')
r.sendline()

while True:
    inp = r.recvline().decode("utf-8")
    if inp.startswith("CAKE"):
      log.success(inp)
      break
    puzzle = inp.split("=")[0]
    log.info(puzzle)
    if puzzle.startswith("sys"):
      log.warning("Bounced a trap")
      continue
    if puzzle.startswith("skatt"):
       log.critical(puzzle)
       sys.exit()
    try:
        svar = int(eval(puzzle))
    except SyntaxError as e:
        log.critical(inp, e)
        print(r.recvall())
        break
    r.sendline(str(svar))
    response = r.recvline().decode("utf-8")
#    log.info(response)

r.close()
