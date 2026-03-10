import sys
import rsa
from binascii import unhexlify

# python3 -m pip install factordb-python
# evnt bare hopp over dette og hent ut tallene fra http://factordb.com/ manuelt

# RSA-250 https://en.wikipedia.org/wiki/RSA_numbers#RSA-250
#p = 64135289477071580278790190170577389084825014742943447208116859632024532344630238623598752668347708737661925585694639798853367
#q = 33372027594978156556226010605355114227940760344767554666784520987023841729210037080257448673296881877565718986258036932062711

from factordb.factordb import FactorDB 

def calculate_d(p,q,e):
    phi = (p-1)*(q-1)
    return pow(e, -1, phi)

def get_pq(n):
    f = FactorDB(n)
    f.connect()
    return f.get_factor_list()    

pub = rsa.PublicKey.load_pkcs1(open(sys.argv[1], "rb").read(), "PEM")
message = unhexlify(open(sys.argv[2]).read())

p, q = get_pq(pub.n)

priv = rsa.PrivateKey(p*q, pub.e, calculate_d(p,q,pub.e), p, q)

print(rsa.decrypt(message, priv).decode("utf-8"))
