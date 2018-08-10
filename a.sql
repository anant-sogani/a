--
-- AUTO-GENERATED on Sat Aug 11 02:48:49 IST 2018
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
    ('London', 1000001),
    ('Mumbai', 1000002),
    ('Jaipur', 1000003),
    ('Moscow', 1000004),
    ('Berlin', 1000005)
;

UNLOCK TABLES;

-- ================================================
-- Inserting records into table >>Organization<<
-- ================================================
LOCK TABLES `Organization` WRITE;

INSERT INTO `Organization` VALUES
    ('Znwnsrp Consulting Services', 'regular-org', 1000001),
    ('Loasvno Consulting Services', 'regular-org', 1000002),
    ('Rpvsqrj Consulting Services', 'regular-org', 1000003),
    ('Cvvddwi Consulting Services', 'regular-org', 1000004),
    ('Sxjusqt Consulting Services', 'regular-org', 1000005),
    ('Klaaxbl Consulting Services', 'regular-org', 1000006)
;

UNLOCK TABLES;

-- ================================================
-- Inserting records into table >>Phone<<
-- ================================================
LOCK TABLES `Phone` WRITE;

INSERT INTO `Phone` VALUES
    (675, 764857534, 1000001),
    (995, 433248334, 1000002),
    (819, 611131411, 1000003),
    (749, 249843255, 1000004)
;

UNLOCK TABLES;

-- ================================================
-- Inserting records into table >>User<<
-- ================================================
LOCK TABLES `User` WRITE;

INSERT INTO `User` VALUES
    ('jctkalj@coldmail.com', 'Ctnlkgn', 'Testman', 1000001),
    ('lmaqoir@coldmail.com', 'Rlkmnyq', 'Testman', 1000002),
    ('lwsjufz@coldmail.com', 'Bmpcoqz', 'Testman', 1000003)
;

UNLOCK TABLES;
