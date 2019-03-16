-- Specify to use burgers_db for use 
USE propertydb;

-- Insert a set of records.
INSERT INTO propertydb.burgers
    (burger_name, devoured)
VALUES
    ('All stuffed burger', false);

INSERT INTO propertydb.burgers
    (burger_name, devoured)
VALUES
    ('Double Cheese Burger', false);

INSERT INTO propertydb.burgers
    (burger_name, devoured)
VALUES
    ('Veggie Burger', false);

-- Get the first 10 elements of the new table
SELECT *
FROM propertydb.burgers LIMIT
10;



CREATE TABLE
IF NOT EXISTS `clients`
(`id` INTEGER NOT NULL auto_increment , `username` VARCHAR
(255) NOT NULL, `password` TEXT NOT NULL, `firstName` VARCHAR
(255) NOT NULL, `lastName` VARCHAR
(255) NOT NULL, `email` VARCHAR
(255) NOT NULL, `phone` VARCHAR
(255) NOT NULL, `createdAt` DATETIME NOT NULL, `updatedAt` DATETIME NOT NULL, `seenbyId` INTEGER, PRIMARY KEY
(`id`), FOREIGN KEY
(`seenbyId`) REFERENCES `seenbies`
(`id`) ON
DELETE
SET NULL
ON
UPDATE CASCADE) ENGINE=InnoDB;


CREATE TABLE
IF NOT EXISTS `seenbies`
(`id` INTEGER NOT NULL auto_increment , `createdAt` DATETIME NOT NULL, `updatedAt` DATETIME NOT NULL, PRIMARY KEY
(`id`)) ENGINE=InnoDB;

CREATE TABLE
IF NOT EXISTS `favorites`
(`id` INTEGER NOT NULL auto_increment , `createdAt` DATETIME NOT NULL, `updatedAt` DATETIME NOT NULL, `clientId` INTEGER, PRIMARY KEY
(`id`), FOREIGN KEY
(`clientId`) REFERENCES `clients`
(`id`) ON
DELETE CASCADE ON
UPDATE CASCADE) ENGINE=InnoDB;

CREATE TABLE
IF NOT EXISTS `owners`
(`id` INTEGER NOT NULL auto_increment , `username` VARCHAR
(255) NOT NULL, `password` VARCHAR
(255) NOT NULL DEFAULT 'owner', `firstName` VARCHAR
(255) NOT NULL, `lastName` VARCHAR
(255) NOT NULL, `email` VARCHAR
(255) NOT NULL, `phone` VARCHAR
(255) NOT NULL, `address1` VARCHAR
(255) NOT NULL, `address2` VARCHAR
(255) NOT NULL, `city` VARCHAR
(255) NOT NULL, `province` VARCHAR
(255) NOT NULL, `country` VARCHAR
(255) NOT NULL, `createdAt` DATETIME NOT NULL, `updatedAt` DATETIME NOT NULL, PRIMARY KEY
(`id`)) ENGINE=InnoDB;


CREATE TABLE
IF NOT EXISTS `properties`
(`id` INTEGER NOT NULL auto_increment , `info` TEXT NOT NULL, `address1` TEXT NOT NULL, `address2` VARCHAR
(255) NOT NULL, `postalcode` VARCHAR
(255) NOT NULL, `propertype` VARCHAR
(255) DEFAULT '', `price_string` VARCHAR
(255) NOT NULL, `price_dec` DECIMAL
(10,2) NOT NULL, `bedrooms` VARCHAR
(255), `bathrooms` VARCHAR
(255), `ownershiptype` VARCHAR
(255), `ammenities` VARCHAR
(255), `ammenitiesnearby` VARCHAR
(255), `createdAt` DATETIME NOT NULL, `updatedAt` DATETIME NOT NULL, `favoriteId` INTEGER, `ownerId` INTEGER, `seenbyId` INTEGER, PRIMARY KEY
(`id`), FOREIGN KEY
(`favoriteId`) REFERENCES `favorites`
(`id`) ON
DELETE
SET NULL
ON
UPDATE CASCADE, FOREIGN KEY (`ownerId`) REFERENCES `owners`
(`id`) ON
DELETE CASCADE ON
UPDATE CASCADE, FOREIGN KEY (`seenbyId`) REFERENCES `seenbies`
(`id`) ON
DELETE CASCADE ON
UPDATE CASCADE) ENGINE=InnoDB;




