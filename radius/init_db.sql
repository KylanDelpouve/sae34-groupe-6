-- Création de la table pour les utilisateurs
CREATE TABLE radcheck (
    id serial PRIMARY KEY,
    username text NOT NULL,
    attribute text NOT NULL,
    op varchar(2) NOT NULL DEFAULT '==',
    value text NOT NULL
);

CREATE TABLE radreply (
    id serial PRIMARY KEY,
    username text NOT NULL,
    attribute text NOT NULL,
    op varchar(2) NOT NULL DEFAULT '=',
    value text NOT NULL
);

CREATE TABLE radgroupcheck (
    id serial PRIMARY KEY,
    groupname text NOT NULL,
    attribute text NOT NULL,
    op varchar(2) NOT NULL DEFAULT '==',
    value text NOT NULL
);

CREATE TABLE radgroupreply (
    id serial PRIMARY KEY,
    groupname text NOT NULL,
    attribute text NOT NULL,
    op varchar(2) NOT NULL DEFAULT '=',
    value text NOT NULL
);

CREATE TABLE radusergroup (
    id serial PRIMARY KEY,
    username text NOT NULL,
    groupname text NOT NULL,
    priority integer NOT NULL DEFAULT 1
);

CREATE TABLE nas (
    id serial PRIMARY KEY,
    nasname text NOT NULL,
    shortname text NOT NULL,
    type text NOT NULL DEFAULT 'other',
    ports integer,
    secret text NOT NULL,
    server text,
    community text,
    description text
);

CREATE TABLE radpostauth (
    id serial PRIMARY KEY,
    username text NOT NULL,
    pass text,
    reply text,
    authdate timestamp without time zone DEFAULT now()
);

CREATE TABLE radacct (
    radacctid bigserial PRIMARY KEY,
    acctsessionid text NOT NULL,
    acctuniqueid text NOT NULL,
    username text NOT NULL,
    groupname text,
    realm text,
    nasipaddress inet NOT NULL,
    nasportid text,
    nasporttype text,
    acctstarttime timestamp without time zone,
    acctupdatetime timestamp without time zone,
    acctstoptime timestamp without time zone,
    acctinterval integer,
    acctsessiontime integer,
    acctauthentic text,
    connectinfo_start text,
    connectinfo_stop text,
    acctinputoctets bigint,
    acctoutputoctets bigint,
    calledstationid text,
    callingstationid text,
    acctterminatecause text,
    servicetype text,
    framedprotocol text,
    framedipaddress inet
);

-- Ajout des utilisateurs
INSERT INTO radcheck (username, attribute, op, value) 
VALUES ('bob', 'Cleartext-Password', ':=', 'hello'),
       ('toto', 'Cleartext-Password', ':=', 'hellos');
