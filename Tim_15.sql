
DROP DATABASE IF EXISTS planinarski_sustav;

CREATE DATABASE planinarski_sustav;
USE planinarski_sustav;

-- ( kreirati po redoslijedu (radi FK): grupa, lokacija, planina, prognoza, oprema, planinar, vrh, staza, izlet, komentar, ocjena, prijava, oprema_izlet  )

CREATE TABLE grupa (
	id INTEGER PRIMARY KEY,
    naziv VARCHAR(50) NOT NULL UNIQUE,
    opis VARCHAR(100)
);

CREATE TABLE planinar (
	id INTEGER PRIMARY KEY,
    id_grupa INTEGER NOT NULL,
    ime VARCHAR(25) NOT NULL,
    prezime VARCHAR(35) NOT NULL,
    godiste INTEGER, 
    email VARCHAR(50), 
    telefon VARCHAR(20), 
    visina DECIMAL(3,2), 
    tezina DECIMAL(5,2),
    FOREIGN KEY (id_grupa) REFERENCES grupa(id)
);

CREATE TABLE izlet (
	id INTEGER PRIMARY KEY,
    id_staza INTEGER NOT NULL,
    id_prognoza INTEGER NOT NULL,
    naziv VARCHAR(100) NOT NULL,
    datum DATETIME,
    trajanje DECIMAL(4,2), 
    tezina VARCHAR(50), 
    FOREIGN KEY (id_staza) REFERENCES staza(id),
    FOREIGN KEY (id_prognoza) REFERENCES prognoza(id)
);

CREATE TABLE staza (
	id INTEGER PRIMARY KEY,
    id_lokacija INTEGER NOT NULL,
    id_vrh INTEGER NOT NULL,
    naziv VARCHAR(100) NOT NULL,
    duljina INTEGER NOT NULL,
    trajanje DECIMAL(4,2), 
    tezina VARCHAR(50), 
    FOREIGN KEY (id_lokacija) REFERENCES lokacija(id),
    FOREIGN KEY (id_vrh) REFERENCES vrh(id)
);

CREATE TABLE lokacija (
	id INTEGER PRIMARY KEY,
    naziv VARCHAR(50) NOT NULL UNIQUE,
    regija VARCHAR(100)
);

CREATE TABLE vrh (
	id INTEGER PRIMARY KEY,
    id_planina INTEGER NOT NULL,
    naziv VARCHAR(40) NOT NULL,
    visina INTEGER NOT NULL,
    FOREIGN KEY (id_planina) REFERENCES planina(id)
);

CREATE TABLE planina (
	id INTEGER PRIMARY KEY,
    naziv VARCHAR(50) NOT NULL UNIQUE,
    drzava VARCHAR(50)
);

CREATE TABLE komentar (
	id INTEGER PRIMARY KEY,
    id_planinar INTEGER NOT NULL,
    id_izlet INTEGER NOT NULL,
    tekst VARCHAR(200) NOT NULL,
    datum DATETIME,
    FOREIGN KEY (id_planinar) REFERENCES planinar(id),
    FOREIGN KEY (id_izlet) REFERENCES izlet(id)
);

CREATE TABLE prognoza (
	id INTEGER PRIMARY KEY,
    temperatura DECIMAL(4,2),
    vremenski_uvjeti VARCHAR(50),
    datum DATETIME
);

CREATE TABLE ocjena (
	id INTEGER PRIMARY KEY,
    id_izlet INTEGER NOT NULL,
    id_planinar INTEGER NOT NULL,
    vrijednost INTEGER NOT NULL,
    FOREIGN KEY (id_izlet) REFERENCES izlet(id),
    FOREIGN KEY (id_planinar) REFERENCES planinar(id)
);

CREATE TABLE oprema (
	id INTEGER PRIMARY KEY,
    naziv VARCHAR(50),
    tip VARCHAR(50),
    opis VARCHAR(50)
);

CREATE TABLE prijava (
	id INTEGER PRIMARY KEY,
    id_planinar INTEGER NOT NULL,
    id_izlet INTEGER NOT NULL,
    datum_prijave DATETIME NOT NULL,
    status_prijave VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_planinar) REFERENCES planinar(id),
    FOREIGN KEY (id_izlet) REFERENCES izlet(id)
);

CREATE TABLE oprema_izlet (
	id INTEGER PRIMARY KEY,
    id_izlet INTEGER NOT NULL,
    id_oprema INTEGER NOT NULL,
    FOREIGN KEY (id_izlet) REFERENCES izlet(id),
    FOREIGN KEY (id_oprema) REFERENCES oprema(id)
);








