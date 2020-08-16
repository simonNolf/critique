/* Tables nécessaires au système d inscription */
CREATE TABLE tbUsers (username VARCHAR(16) NOT NULL,
                      "password" VARCHAR(20) NOT NULL,
                      CONSTRAINT pkUsers PRIMARY KEY (username));

CREATE TABLE tbSession (username VARCHAR(16) NOT NULL,
                        token VARCHAR(20) NOT NULL,
                        dateCreation DATE DEFAULT CURRENT DATE,
                        CONSTRAINT fkSessionUsers FOREIGN KEY (username) REFERENCES tbUsers(username) ON DELETE CASCADE);
						
/*table des film et des livres*/
CREATE TABLE film (
filmid VARCHAR(10) NOT NULL,
titrefilm varchar(50) NOT NULL,
auteur varchar(20) NOT NULL,
duree int,
suite varchar(3),
film_suite int,
duree_suite int,
CONSTRAINT pkID primary key(titrefilm)
);

CREATE TABLE livre (
livreid VARCHAR(10) NOT NULL,
titrelivre varchar(50) NOT NULL,
auteur varchar(30) NOT NULL,
pages int NOT NULL,
tomes int NOT NULL,
suite VARCHAR(3) NOT NULL,
pages_suite int,
tomes_suite int,
CONSTRAINT pkID primary key(titrelivre)
);

CREATE TABLE groupe(
groupeid INT NOT NULL AUTOINCREMENT,
lib VARCHAR(20),
CONSTRAINT  pkID PRIMARY KEY(id)
);

INSERT INTO film(filmid, titrefilm, auteur, duree, suite, film_suite, duree_suite) values
('DP', 'Deadpool', 'Fabian Nicieza', 108, 'oui', 2, 227),
('SW', 'Star-Wars', 'Georges Lucas', 136, 'oui', 11, 135321),
('HP', 'Harry Potter', 'J.K.Rowling', 152, 'oui', 7, 1027),
('SDA', 'Le Seigneur des Anneaux', 'J.R.R.Toklien',178, 'oui', 2, 380),
('AV', 'Avengers', 'Joss Whedon', 143, 'oui', 3, 472),
('FF', 'Fast and Furious', 'Rob Cohen', 106, 'oui', 8, 854);

INSERT INTO livre(livreid, titrelivre, auteur, pages, tomes, suite, pages_suite, tomes_suite) values
('A', 'after', 'Anna Todd', 3718, 5, 'non', 0, 0),
('CE', 'Les chevaliers d''émeraudes', 'Anne Robillard', 4719, 12, 'oui', 12742, 24),
('HP', 'Harry Potter', 'J.K.Rowling', 4496, 7, 'non', 0, 0),
('HB', 'Le Hobbit', 'J.R.R.Toklien', 310, 1, 'oui', 1526, 3),
('BP', 'les bannis et les Proscrits', 'James Clemens', 3804, 5, 'non', 0, 0),
('AR', 'L''apprendti d''Araluen', 'John Flanagan', 4970, 12, 'oui', 5834, 2),
('SINF', 'Les Secrets de l''immortel Nicolas Flamel', 'Michael Scott', 2683, 6, 'non', 0, 0),
('PJ', 'Percy Jackson', 'Rick Riordan', 1948, 5, 'oui', 6993, 10),
('TD', 'Tara Duncan', 'Sophie Audouin-Mamikonian', 6467, 13, 'non', 0, 0),
('HG', 'Hunger Games', 'Suzanne Collins', 1155, 3, 'non', 0, 0),
('EV', 'L''épée de Véritée', 'Terry Goodkind', 15000, 17, 'non', 0, 0),


INSERT INTO groupe(lib) values
('film'),
('livre');