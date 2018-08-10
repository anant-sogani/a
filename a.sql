--
-- Created on Sat Aug 11 02:38:46 IST 2018
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
    ('Sydney', 1000001),
    ('Mumbai', 1000002),
    ('Jaipur', 1000003),
    ('Berlin', 1000004),
    ('Moscow', 1000005)
;

UNLOCK TABLES;

-- ================================================
-- Inserting records into table >>Organization<<
-- ================================================
LOCK TABLES `Organization` WRITE;

INSERT INTO `Organization` VALUES
    ('Lqgevgl Consulting Services', 'regular-org', 1000001),
    ('Zlxgjbs Consulting Services', 'regular-org', 1000002),
    ('Yilkgfh Consulting Services', 'regular-org', 1000003),
    ('Hehqmen Consulting Services', 'regular-org', 1000004),
    ('Yrvtpgd Consulting Services', 'regular-org', 1000005),
    ('Rnsmbaz Consulting Services', 'regular-org', 1000006)
;

UNLOCK TABLES;

-- ================================================
-- Inserting records into table >>Phone<<
-- ================================================
LOCK TABLES `Phone` WRITE;

INSERT INTO `Phone` VALUES
    (329, 397367626, 1000001),
    (324, 372965448, 1000002),
    (612, 177785382, 1000003),
    (763, 985379999, 1000004)
;

UNLOCK TABLES;

-- ================================================
-- Inserting records into table >>User<<
-- ================================================
LOCK TABLES `User` WRITE;

INSERT INTO `User` VALUES
    ('kxmimuy@coldmail.com', 'Zgedhxn', 'Testman', 1000001),
    ('xvthyof@coldmail.com', 'Aaphoog', 'Testman', 1000002),
    ('nrhxxys@coldmail.com', 'Xjipqlp', 'Testman', 1000003)
;

UNLOCK TABLES;
