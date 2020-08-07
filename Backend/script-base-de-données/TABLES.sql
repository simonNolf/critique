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
titrefilm text NOT NULL,
auteur text NOT NULL,
CONSTRAINT pkID primary key(titrefilm)
);

CREATE TABLE livre (
livreid VARCHAR(10) NOT NULL,
titrelivre text NOT NULL,
auteur text NOT NULL,
CONSTRAINT pkID primary key(titrelivre)
);

INSERT INTO film(filmid, titrefilm, auteur) values
('SW', 'Star-Wars', 'Georges Lucas'),
('SDA', 'Le Seigneur des Anneaux', 'J.R.R.Toklien'),
('AV', 'Avengers', 'Joss Whedon'),
('DP', 'Deadpool', 'Fabian Nicieza'),
('HP', 'Harry Potter', 'J.K.Rowling'),
('FF', 'Fast and Furious', 'Rob Cohen');

INSERT INTO livre(livreid, titrelivre, auteur) values
('HB', 'Le Hobbit', 'J.R.R.Toklien'),
('CE', 'Les chevaliers d''émeraudes', 'Anne Robillard'),
('A', 'after', 'Anna Todd'),
('TD', 'Tara Duncan', 'Sophie Audouin-Mamikonian'),
('HP', 'Harry Potter', 'J.K.Rowling'),
('PC', 'Percy Jackson', 'Rick Riordan'),
('SINF', 'Les Secrets de l''immortel Nicolas Flamel', 'Michael Scott'),
('HG', 'Hunger Games', 'Suzanne Collins'),
('AR', 'L''apprendti rôdeur', 'John Flanagan'),
('D', 'Divergent', 'Veronica Roth'),
('FH', 'Fablehaven', 'Brandon Mull'),
('HO', 'Héros de l''olympe', 'Rick Riordan');