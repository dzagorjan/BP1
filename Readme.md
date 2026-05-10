Sveučilište Jurja Dobrile u Puli
Fakultet Informatike u Puli

Kolegij Baze Podataka 1



Tim 15

Alen S.

Tablica kreirana pravilnim redoslijedom

Dodan AUTO_INCREMENT radi automatskog generiranja ID vrijednosti, bez korisnik bi morao ručno unositi.
AUTO_INCREMENT -> jednostavniji pregled, smanjuje mogućnost greške, sprječava dupliranje ID vrijednosti.

PRIMARY KEY ->  predstavlja primarni ključ tablice.

Primjer:

id INTEGER PRIMARY KEY

Svrha:
- jedinstveno identificira svaki redak
- ne dopušta NULL vrijednosti
- ne dopušta duplikate

Primjer:
Dva planinara ne mogu imati isti ID.


FOREIGN KEY (id_grupa) REFERENCES grupa(id) -> 


CONSTRAINT fk_planinar_grupa
FOREIGN KEY (id_grupa)
REFERENCES grupa(id)

Constraint ima vlastito ime, lakše održavanje baze, jednostavnije brisanje.



NOT NULL označava da vrijednost mora biti unesena.

Primjer:

ime VARCHAR(25) NOT NULL

To znači:
Planinar mora imati ime.

Nije dozvoljeno:

INSERT INTO planinar (ime)
VALUES (NULL);

Prednosti:
sprječava nepotpune podatke
povećava kvalitetu podataka





UNIQUE sprječava ponavljanje istih vrijednosti.

Primjer:

email VARCHAR(50) UNIQUE

To znači:
Dva planinara ne mogu imati isti email.

Primjer greške:

planinar1@gmail.com
planinar1@gmail.com

Prednosti:
 sprječava duplikate
 povećava točnost podataka


CHECK ograničava dopuštene vrijednosti.



CHECK (temperatura BETWEEN -50 AND 60)

Dopuštene vrijednosti:
-50 do 60

Nedopušteno:
200
-300

Svrha:
sprječava nerealne podatke.


Visina vrha


CHECK (visina > 0)

Planinski vrh ne može imati negativnu visinu.


Duljina i trajanje staze



CHECK (duljina > 0)

CHECK (trajanje > 0)

Svrha:
sprječava nelogične vrijednosti.



Težina staze

CHECK (tezina IN ('lagana', 'srednja', 'teska'))

Dopuštene vrijednosti:
- lagana
- srednja
- teska


Ocjena


CHECK (vrijednost BETWEEN 1 AND 5)

Dopuštene ocjene:
1, 2, 3, 4, 5

Nedopušteno:
0
6
100


Status prijave

CHECK (status_prijave IN ('prijavljen', 'otkazan', 'potvrden'))

Dopuštene vrijednosti:
- prijavljen
- otkazan
- potvrden



DEFAULT postavlja zadanu vrijednost.

Primjer:

datum DATETIME DEFAULT CURRENT_TIMESTAMP

Ako korisnik ne unese datum,
mysql automatski sprema trenutno vrijeme.

Koristi se u:
komentar
prijava








