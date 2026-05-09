
DROP DATABASE IF EXISTS planinarski_sustav;

CREATE DATABASE planinarski_sustav;
USE planinarski_sustav;


CREATE TABLE grupa (
	id INTEGER PRIMARY KEY,
    naziv VARCHAR(30) NOT NULL UNIQUE,
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
    naziv VARCHAR(100),
    datum DATETIME,
    trajanje DECIMAL(4,2), 
    tezina VARCHAR(50), 
    FOREIGN KEY (id_staza) REFERENCES staza(id),
    FOREIGN KEY (id_prognoza) REFERENCES prognoza(id)
);







