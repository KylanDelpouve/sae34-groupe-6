-- Création de la table pour les utilisateurs
CREATE TABLE radcheck (
    id serial PRIMARY KEY,
    username text NOT NULL,
    attribute text NOT NULL,
    op varchar(2) NOT NULL DEFAULT '==',
    value text NOT NULL
);

-- Ajout de l'utilisateur Bob pour le test
INSERT INTO radcheck (username, attribute, op, value) 
VALUES ('bob', 'Cleartext-Password', ':=', 'hello');