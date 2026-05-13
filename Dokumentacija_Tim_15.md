##### Sveučilište Jurja Dobrile u Puli
##### Fakultet Informatike u Puli

### DOKUMENTACIJA ZA PROJEKTNI ZADATAK IZ KOLEGIJA BAZE PODATAKA 1

#### „SUSTAV ZA EVIDENCIJU PLANINARSKIH AKTIVNOST“ 



#### **Tim 15**

###### **Članovi:**
**Ivana Rukavina** (JMBAG: xxxxxxxxxxx)
**Ivan Božinović** (JMBAG: xxxxxxxxxxx)
**Alen Selimović** (JMBAG: xxxxxxxxxxx)
**Domagoj Marković** (JMBAG: xxxxxxxxxxx)
**Domagoj Zagorjan** (JMBAG: xxxxxxxxxxx)



## 1. UVOD




## 2. OPIS POSLOVNOG PROCESA
Sustav za evidenciju planinarskih aktivnosti omogućuje organizaciju i praćenje izleta, planinara i povezanih podataka. Planinari su organizirani u grupe, odnosno više planinara pripada jednoj grupi. Svaki planinar ima osnovne podatke kao što su ime, prezime, godište, email, telefon, visina, težina. Svaki planinar može sudjelovati u više planinarskih izleta putem prijave. Prijava sadrži i podatke o datumu prijave i statusu. 
Izlet sadrži podatke kao što su naziv, datum, trajanje, težina. Svaki izlet se odvija na određenoj stazi. Staza je definirana svojim nazivom, duljinom, trajanjem i težinom. Staza se nalazi na određenoj lokaciji, dok se na jednoj lokaciji može nalaziti više staza. Lokacija opisuje geografski položaj svojim nazivom i regijom u kojoj se nalazi. Više staza može voditi na jedan vrh. Vrh ima svoj naziv i visinu na kojoj se nalazi, dok jedna planina može imati više vrhova.
Za svaki izlet se pojedinačno evidentira vremenska prognoza koja uključuje temperaturu, vremenske uvjete i datum, kako bi se bolje planirale planinarske aktivnosti. Planinari mogu pisati komentare o izletima, gdje svaki komentar sadrži tekst komentara i datum kada je pisan.  Također, planinari ocjenjuju izlete, ocjena sadrži vrijednost.
Oprema se koristi na izletima, odnosno na jednom izletu se može koristiti više komada opreme, ali se ista oprema može koristiti na više izleta.


## 3.	ENTITY RELATIONSHIP (ER) DIJAGRAM

 ![ER](./pics/ER.jpg)

### 3.1.	Opis Entity Relatonship (ER) dijagrama

| Veze između entiteta	 | Kardinalnost	   |  Opis  |
| :----------------------: | :------------:    | :------: |
| Grupa - Planinar | 1:M (One-to-Many)    | Jednoj grupi može pripadati više planinara, ali jedan planinar pripada samo jednoj grupi. |
| Planinar - Izlet | M:N (Many-to-Many)    | Planinar može sudjelovati u više planinarskih izleta putem prijave, jedan izlet ima više planinara. |






``` sql
CREATE TABLE planina (
	id INTEGER PRIMARY KEY,
    naziv VARCHAR(50) NOT NULL UNIQUE,
    drzava VARCHAR(50)
);

```