DROP DATABASE IF EXISTS cupcake;
create database cupcake;

USE cupcake;

DROP USER IF EXISTS 'cupcake'@localhost;

create user 'cupcake'@'localhost';
grant all privileges on cupcake.* to 'cupcake'@'localhost';
flush privileges;

DROP TABLE IF EXISTS properties;
CREATE TABLE properties (
                            name VARCHAR(255) PRIMARY KEY,
                            value VARCHAR(255) NOT NULL
);

INSERT INTO properties (name, value) VALUES ("version", "0");


DROP TABLE IF EXISTS users;
CREATE TABLE users (
                       id INT PRIMARY KEY AUTO_INCREMENT,
                       name VARCHAR(25) NOT NULL UNIQUE,
                       email VARCHAR(70) NOT NULL,
                       createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                       salt BINARY(16) NOT NULL,
                       secret BINARY(32) NOT NULL,
                       role VARCHAR(25) NOT NULL,
                       bank DOUBLE DEFAULT 0,
                       ranked INT DEFAULT 1
);

UPDATE properties
SET value = '1'
WHERE name = "version";



DROP TABLE IF EXISTS cupcakeTop;
CREATE TABLE cupcakeTop
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    pris DOUBLE NOT NULL,
    type VARCHAR(255) NOT NULL
);

UPDATE properties
SET value = '2'
WHERE name = "version";


DROP TABLE IF EXISTS cupcakeBottom;
CREATE TABLE cupcakeBottom
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    pris DOUBLE       NOT NULL,
    type VARCHAR(255) NOT NULL
);

UPDATE properties
SET value = '3'
WHERE name = "version";


DROP TABLE IF EXISTS cupcake;
CREATE TABLE cupcake
(
    id            INT PRIMARY KEY AUTO_INCREMENT,
    orderid       INT NOT NULL,
    cupcakeBottom INT NOT NULL,
    cupcakeTop    INT NOT NULL,
    cupcakeBottomType VARCHAR(50),
    cupcakeTopType VARCHAR(50),
    pris          DOUBLE NOT NULL,
    antal         INT NOT NULL,
    FOREIGN KEY (cupcakeBottom) REFERENCES cupcakeBottom(id),
    FOREIGN KEY (cupcakeTop) REFERENCES cupcakeTop(id)
);

UPDATE properties
SET value = '4'
WHERE name = "version";


DROP TABLE IF EXISTS orders;
CREATE TABLE orders
(
    id            INT PRIMARY KEY AUTO_INCREMENT,
    userid        INT NOT NULL,
    paydate       TIMESTAMP NOT NULL,
    paid          BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (userid) REFERENCES users(id)
);

ALTER TABLE orders ADD delivered BOOLEAN DEFAULT FALSE;

ALTER TABLE cupcake ADD CONSTRAINT FOREIGN KEY (orderid) REFERENCES orders(id);

UPDATE properties
SET value = '5'
WHERE name = "version";



INSERT INTO cupcakeBottom (pris, type)
VALUES (5.00, "Chocolate"), (5.00, "Vanilla"), (5.00, "Nutmeg"), (6.00, "Pistacio"), (7.00, "Almond");

INSERT INTO cupcakeTop (pris, type)
VALUES (5.00, "Chokolade"), (5.00, "Blueberry"), (5.00, "Rasberry"), (6.00, "Crispy")
        ,(6.00, "Strawberry"), (7.00, "Rum/Raisin"), (8.00, "Orange")
        ,(8.00, "Lemon"), (9.00, "Blue cheese");