--
-- AUTO-GENERATED on Sun Aug 19 18:24:51 IST 2018
--

-- ==================
-- Build our database
-- ==================
DROP   DATABASE IF EXISTS `TestDB`;
CREATE DATABASE           `TestDB`;
USE                       `TestDB`;

-- ================================================
-- Definition of table >>Address<<
-- ================================================
DROP TABLE IF EXISTS `Address`;

CREATE TABLE `Address` (
    `city`         varchar(75)     DEFAULT NULL,
    `userId`       bigint(20)      NOT NULL,

    PRIMARY KEY (`userId`)
);

-- ================================================
-- Definition of table >>Organization<<
-- ================================================
DROP TABLE IF EXISTS `Organization`;

CREATE TABLE `Organization` (
    `name`         varchar(100)    DEFAULT NULL,
    `type`         varchar(75)     DEFAULT NULL,
    `userId`       bigint(20)      NOT NULL,

    PRIMARY KEY (`userId`)
);

-- ================================================
-- Definition of table >>Phone<<
-- ================================================
DROP TABLE IF EXISTS `Phone`;

CREATE TABLE `Phone` (
    `extension`    varchar(75)     DEFAULT NULL,
    `number`       varchar(75)     NOT NULL,
    `userId`       bigint(20)      DEFAULT NULL,

    PRIMARY KEY (`number`)
);

-- ================================================
-- Definition of table >>User<<
-- ================================================
DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
    `emailAddress` varchar(75)     DEFAULT NULL,
    `firstName`    varchar(75)     DEFAULT NULL,
    `lastName`     varchar(75)     DEFAULT NULL,
    `userId`       bigint(20)      NOT NULL,

    PRIMARY KEY (`userId`)
);

-- ================================================
-- Inserting records into table >>Address<<
-- ================================================
LOCK TABLES `Address` WRITE;

INSERT INTO `Address` VALUES
    ('Mumbai', 1000001),
    ('Moscow', 1000002),
    ('Jaipur', 1000003),
    ('Mumbai', 1000004),
    ('Berlin', 1000005)
;

UNLOCK TABLES;

-- ================================================
-- Inserting records into table >>Organization<<
-- ================================================
LOCK TABLES `Organization` WRITE;

INSERT INTO `Organization` VALUES
    ('Hsrsska Consulting Services', 'regular-org', 1000001),
    ('Teyztza Consulting Services', 'regular-org', 1000002),
    ('Llcnfrt Consulting Services', 'regular-org', 1000003),
    ('Xmunugp Consulting Services', 'regular-org', 1000004),
    ('Oiepnbn Consulting Services', 'regular-org', 1000005),
    ('Pdztedy Consulting Services', 'regular-org', 1000006)
;

UNLOCK TABLES;

-- ================================================
-- Inserting records into table >>Phone<<
-- ================================================
LOCK TABLES `Phone` WRITE;

INSERT INTO `Phone` VALUES
    (229, 729832853, 1000001),
    (496, 269697395, 1000002),
    (213, 729565666, 1000003),
    (113, 382444664, 1000004)
;

UNLOCK TABLES;

-- ================================================
-- Inserting records into table >>User<<
-- ================================================
LOCK TABLES `User` WRITE;

INSERT INTO `User` VALUES
    ('fopuwbn@coldmail.com', 'Cuvgzqi', 'Testman', 1000001),
    ('ltrmhob@coldmail.com', 'Uqjrrmg', 'Testman', 1000002),
    ('ikhzyga@coldmail.com', 'Veudoxo', 'Testman', 1000003)
;

UNLOCK TABLES;
