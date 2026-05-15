DROP DATABASE IF EXISTS planinarski_sustav;

CREATE DATABASE planinarski_sustav;
USE planinarski_sustav;

-- ( kreirati po redoslijedu (radi FK): grupa, lokacija, planina, prognoza, oprema, planinar, vrh, staza, izlet, komentar, ocjena, prijava, oprema_izlet  )

-- Alen Selimović
CREATE TABLE grupa (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(50) NOT NULL UNIQUE,
    opis VARCHAR(100)
);

-- Alen Selimović
CREATE TABLE lokacija (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(50) NOT NULL UNIQUE,
    regija VARCHAR(100)
);

-- Domagoj Zagorjan
CREATE TABLE planina (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(50) NOT NULL UNIQUE,
    drzava VARCHAR(50)
);

-- Domagoj Zagorjan
CREATE TABLE prognoza (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    temperatura DECIMAL(4,2) NOT NULL,
    vremenski_uvjeti VARCHAR(50),
    datum DATETIME,
	 CONSTRAINT chk_prognoza_temperatura
        CHECK (temperatura BETWEEN -50 AND 60)
);

-- Alen Selimović
CREATE TABLE oprema (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(50) NOT NULL UNIQUE,
    tip VARCHAR(50),
    opis VARCHAR(50)
);


-- Alen Selimović
CREATE TABLE planinar (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_grupa INTEGER NOT NULL,
    ime VARCHAR(25) NOT NULL,
    prezime VARCHAR(35) NOT NULL,
    godiste INTEGER, 
    email VARCHAR(50) UNIQUE,
    telefon VARCHAR(20), 
    visina DECIMAL(3,2), 
    tezina DECIMAL(5,2),
    FOREIGN KEY (id_grupa) REFERENCES grupa(id),
        CHECK (godiste BETWEEN 1900 AND 2026),

     CONSTRAINT chk_planinar_visina
        CHECK (visina > 0),

     CONSTRAINT chk_planinar_tezina
        CHECK (tezina > 0)
);

-- Domagoj Zagorjan
CREATE TABLE vrh (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_planina INTEGER NOT NULL,
    naziv VARCHAR(40) NOT NULL,
    visina INTEGER NOT NULL,
    FOREIGN KEY (id_planina) REFERENCES planina(id),
	  CONSTRAINT chk_vrh_visina
        CHECK (visina > 0),

    CONSTRAINT uq_vrh_planina_naziv
        UNIQUE (id_planina, naziv)
);

-- Domagoj Zagorjan
CREATE TABLE staza (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_lokacija INTEGER NOT NULL,
    id_vrh INTEGER NOT NULL,
    naziv VARCHAR(100) NOT NULL,
    duljina INTEGER NOT NULL,
    trajanje DECIMAL(4,2), 
    tezina VARCHAR(50), 
    FOREIGN KEY (id_lokacija) REFERENCES lokacija(id),
    FOREIGN KEY (id_vrh) REFERENCES vrh(id),
	 CONSTRAINT chk_staza_duljina
        CHECK (duljina > 0),

    CONSTRAINT chk_staza_trajanje
        CHECK (trajanje > 0),

    CONSTRAINT chk_staza_tezina
        CHECK (tezina IN ('lagana', 'srednja', 'teska')),

    CONSTRAINT uq_staza_lokacija_naziv
        UNIQUE (id_lokacija, naziv)
);


-- Alen Selimović
CREATE TABLE izlet (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_staza INTEGER NOT NULL,
    id_prognoza INTEGER NOT NULL,
    naziv VARCHAR(100) NOT NULL,
    datum DATETIME,
    trajanje DECIMAL(4,2), 
    tezina VARCHAR(50), 
    FOREIGN KEY (id_staza) REFERENCES staza(id),
    FOREIGN KEY (id_prognoza) REFERENCES prognoza(id),
	   CONSTRAINT chk_izlet_trajanje
        CHECK (trajanje > 0),

    CONSTRAINT chk_izlet_tezina
        CHECK (tezina IN ('lagana', 'srednja', 'teska'))
);

-- Alen Selimović
CREATE TABLE komentar (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_planinar INTEGER NOT NULL,
    id_izlet INTEGER NOT NULL,
    tekst VARCHAR(200) NOT NULL,
    datum DATETIME,
    FOREIGN KEY (id_planinar) REFERENCES planinar(id),
    FOREIGN KEY (id_izlet) REFERENCES izlet(id)
);

-- Alen Selimović
CREATE TABLE ocjena (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_izlet INTEGER NOT NULL,
    id_planinar INTEGER NOT NULL,
    vrijednost INTEGER NOT NULL,
    FOREIGN KEY (id_izlet) REFERENCES izlet(id),
    FOREIGN KEY (id_planinar) REFERENCES planinar(id),
	    CONSTRAINT chk_ocjena_vrijednost
        CHECK (vrijednost BETWEEN 1 AND 5),

    CONSTRAINT uq_ocjena_planinar_izlet
        UNIQUE (id_planinar, id_izlet)
);

-- Domagoj Zagorjan
CREATE TABLE prijava (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_planinar INTEGER NOT NULL,
    id_izlet INTEGER NOT NULL,
    datum_prijave DATETIME NOT NULL,
    status_prijave VARCHAR(20) NOT NULL DEFAULT 'prijavljen',
    FOREIGN KEY (id_planinar) REFERENCES planinar(id),
    FOREIGN KEY (id_izlet) REFERENCES izlet(id),
	 CONSTRAINT chk_prijava_status
        CHECK (status_prijave IN ('prijavljen', 'otkazan', 'potvrden')),

     CONSTRAINT uq_prijava_planinar_izlet
        UNIQUE (id_planinar, id_izlet)
);

-- Domagoj Zagorjan
CREATE TABLE oprema_izlet (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_izlet INTEGER NOT NULL,
    id_oprema INTEGER NOT NULL,
    FOREIGN KEY (id_izlet) REFERENCES izlet(id),
    FOREIGN KEY (id_oprema) REFERENCES oprema(id),
	 CONSTRAINT uq_oprema_izlet
        UNIQUE (id_izlet, id_oprema)
);


-- UPITI
-- Domagoj Zagorjan

SELECT
	i.id,
    i.naziv AS naziv_izleta,
    COUNT(p.id_planinar) AS broj_prijavljenih
FROM izlet i   
JOIN prijava p ON i.id = p.id_izlet
GROUP BY i.id, i.naziv
ORDER BY broj_prijavljenih DESC;

    
    


