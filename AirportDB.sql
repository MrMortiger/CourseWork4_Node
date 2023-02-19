-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               8.0.31 - MySQL Community Server - GPL
-- Операционная система:         Win64
-- HeidiSQL Версия:              12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных airport
CREATE DATABASE IF NOT EXISTS `airport` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `airport`;

-- Дамп структуры для таблица airport.address
CREATE TABLE IF NOT EXISTS `address` (
  `IdAdress` int unsigned NOT NULL AUTO_INCREMENT,
  `IdPerson` int unsigned NOT NULL,
  `IdCountry` int unsigned NOT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Building` int DEFAULT NULL,
  `Flat` int DEFAULT NULL,
  PRIMARY KEY (`IdAdress`),
  KEY `FK_adress_country` (`IdCountry`),
  KEY `FK_adress_person` (`IdPerson`),
  CONSTRAINT `FK_adress_country` FOREIGN KEY (`IdCountry`) REFERENCES `country` (`IdCountry`),
  CONSTRAINT `FK_adress_person` FOREIGN KEY (`IdPerson`) REFERENCES `person` (`idPerson`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.address: ~13 rows (приблизительно)
INSERT INTO `address` (`IdAdress`, `IdPerson`, `IdCountry`, `Street`, `City`, `Building`, `Flat`) VALUES
	(1, 1, 1, 'Ponomarska', 'Kiev', 6, 213),
	(3, 11, 1, 'Ponomarska', 'Kiev', 6, 324),
	(4, 10, 3, 'Grimmauld Place', 'London', 6, 342),
	(5, 3, 1, 'Peremogi', 'Kharkiv', 6, 535),
	(6, 5, 3, 'Grimmauld Place', 'London', 6, 123),
	(7, 6, 1, 'Ponomarska', 'Kharkiv', 6, 23),
	(8, 7, 1, 'Peremogi', 'Kiev', 6, 453),
	(9, 8, 3, 'Grimmauld Place', 'London', 6, 53),
	(10, 9, 1, 'Ponomarska', 'Kiev', 6, 56),
	(11, 2, 3, 'Grimmauld Place', 'London', 6, 23),
	(12, 4, 1, 'Peremogi', 'Kiev', 6, 64);

-- Дамп структуры для таблица airport.airstrip
CREATE TABLE IF NOT EXISTS `airstrip` (
  `IdAirstrip` int unsigned NOT NULL AUTO_INCREMENT,
  `IdAirstripStatus` int unsigned NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`IdAirstrip`) USING BTREE,
  KEY `FK_airstrip_airstrip_status` (`IdAirstripStatus`),
  CONSTRAINT `FK_airstrip_airstrip_status` FOREIGN KEY (`IdAirstripStatus`) REFERENCES `airstrip_status` (`IdAirstripStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.airstrip: ~0 rows (приблизительно)

-- Дамп структуры для таблица airport.airstrip_status
CREATE TABLE IF NOT EXISTS `airstrip_status` (
  `IdAirstripStatus` int unsigned NOT NULL AUTO_INCREMENT,
  `Status` varchar(50) NOT NULL,
  PRIMARY KEY (`IdAirstripStatus`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.airstrip_status: ~2 rows (приблизительно)
INSERT INTO `airstrip_status` (`IdAirstripStatus`, `Status`) VALUES
	(1, 'FREE'),
	(2, 'NOT FREE');

-- Дамп структуры для таблица airport.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `IdBrand` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdBrand`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.brand: ~3 rows (приблизительно)
INSERT INTO `brand` (`IdBrand`, `Name`) VALUES
	(1, 'Ukraine'),
	(2, 'USA'),
	(3, 'UK');

-- Дамп структуры для таблица airport.captain
CREATE TABLE IF NOT EXISTS `captain` (
  `IdCaptain` int unsigned NOT NULL AUTO_INCREMENT,
  `IdPerson` int unsigned NOT NULL,
  `IdTDG` int unsigned NOT NULL,
  PRIMARY KEY (`IdCaptain`),
  KEY `FK_captain_person` (`IdPerson`),
  KEY `FK_captain_tdg` (`IdTDG`),
  CONSTRAINT `FK_captain_person` FOREIGN KEY (`IdPerson`) REFERENCES `person` (`idPerson`),
  CONSTRAINT `FK_captain_tdg` FOREIGN KEY (`IdTDG`) REFERENCES `tdg` (`IdTDG`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.captain: ~2 rows (приблизительно)
INSERT INTO `captain` (`IdCaptain`, `IdPerson`, `IdTDG`) VALUES
	(1, 10, 1),
	(2, 3, 1);

-- Дамп структуры для таблица airport.coach
CREATE TABLE IF NOT EXISTS `coach` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.coach: ~0 rows (приблизительно)

-- Дамп структуры для таблица airport.coaches
CREATE TABLE IF NOT EXISTS `coaches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.coaches: ~0 rows (приблизительно)

-- Дамп структуры для таблица airport.country
CREATE TABLE IF NOT EXISTS `country` (
  `IdCountry` int unsigned NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(50) NOT NULL,
  PRIMARY KEY (`IdCountry`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.country: ~3 rows (приблизительно)
INSERT INTO `country` (`IdCountry`, `CountryName`) VALUES
	(1, 'Ukraine'),
	(2, 'USA'),
	(3, 'UK');

-- Дамп структуры для таблица airport.flights
CREATE TABLE IF NOT EXISTS `flights` (
  `IdFlight` int unsigned NOT NULL AUTO_INCREMENT,
  `IdPlane` int unsigned NOT NULL,
  `IdStatus` int unsigned NOT NULL,
  `IdAirstrip` int unsigned NOT NULL,
  `Number of passengers` int DEFAULT NULL,
  `Shipping time` datetime DEFAULT NULL,
  `Arrival time` datetime DEFAULT NULL,
  `Place of dispatch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Place of arrival` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`IdFlight`) USING BTREE,
  KEY `IDStatus` (`IdStatus`) USING BTREE,
  KEY `IDAirstrip` (`IdAirstrip`) USING BTREE,
  KEY `FK_flights_plane` (`IdPlane`),
  CONSTRAINT `FK_flights_airstrip` FOREIGN KEY (`IdAirstrip`) REFERENCES `airstrip` (`IdAirstrip`),
  CONSTRAINT `FK_flights_flight_status` FOREIGN KEY (`IdStatus`) REFERENCES `flight_status` (`IdStatus`),
  CONSTRAINT `FK_flights_plane` FOREIGN KEY (`IdPlane`) REFERENCES `plane` (`IdPlane`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.flights: ~0 rows (приблизительно)

-- Дамп структуры для таблица airport.flight_attendant
CREATE TABLE IF NOT EXISTS `flight_attendant` (
  `IdFlightAttendant` int unsigned NOT NULL AUTO_INCREMENT,
  `IdPerson` int unsigned NOT NULL,
  `IdTDG` int unsigned NOT NULL,
  PRIMARY KEY (`IdFlightAttendant`),
  KEY `FK_flight_attendant_person` (`IdPerson`),
  KEY `FK_flight_attendant_tdg` (`IdTDG`),
  CONSTRAINT `FK_flight_attendant_person` FOREIGN KEY (`IdPerson`) REFERENCES `person` (`idPerson`),
  CONSTRAINT `FK_flight_attendant_tdg` FOREIGN KEY (`IdTDG`) REFERENCES `tdg` (`IdTDG`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.flight_attendant: ~2 rows (приблизительно)
INSERT INTO `flight_attendant` (`IdFlightAttendant`, `IdPerson`, `IdTDG`) VALUES
	(1, 5, 1),
	(2, 4, 1);

-- Дамп структуры для таблица airport.flight_engineer
CREATE TABLE IF NOT EXISTS `flight_engineer` (
  `IdFlightEngineer` int unsigned NOT NULL AUTO_INCREMENT,
  `IdPerson` int unsigned NOT NULL,
  `IdTDG` int unsigned NOT NULL,
  PRIMARY KEY (`IdFlightEngineer`),
  KEY `FK_flight_engineer_person` (`IdPerson`),
  KEY `FK_flight_engineer_tdg` (`IdTDG`),
  CONSTRAINT `FK_flight_engineer_person` FOREIGN KEY (`IdPerson`) REFERENCES `person` (`idPerson`),
  CONSTRAINT `FK_flight_engineer_tdg` FOREIGN KEY (`IdTDG`) REFERENCES `tdg` (`IdTDG`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.flight_engineer: ~2 rows (приблизительно)
INSERT INTO `flight_engineer` (`IdFlightEngineer`, `IdPerson`, `IdTDG`) VALUES
	(1, 2, 1),
	(2, 1, 2);

-- Дамп структуры для таблица airport.flight_status
CREATE TABLE IF NOT EXISTS `flight_status` (
  `IdStatus` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`IdStatus`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.flight_status: ~2 rows (приблизительно)
INSERT INTO `flight_status` (`IdStatus`, `Name`) VALUES
	(1, 'OK'),
	(2, 'NOT OK');

-- Дамп структуры для таблица airport.gender
CREATE TABLE IF NOT EXISTS `gender` (
  `IdGender` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`IdGender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.gender: ~2 rows (приблизительно)
INSERT INTO `gender` (`IdGender`, `Name`) VALUES
	(1, 'Male'),
	(2, 'Female');

-- Дамп структуры для таблица airport.passenger
CREATE TABLE IF NOT EXISTS `passenger` (
  `IdPassenger` int unsigned NOT NULL AUTO_INCREMENT,
  `IdGender` int unsigned NOT NULL,
  `IdPerson` int unsigned NOT NULL,
  `IdFlight` int unsigned NOT NULL,
  `TicketNumber` int NOT NULL,
  PRIMARY KEY (`IdPassenger`),
  KEY `FK_passenger_person` (`IdPerson`),
  KEY `FK_passenger_gender` (`IdGender`),
  KEY `FK_passenger_flights` (`IdFlight`),
  CONSTRAINT `FK_passenger_flights` FOREIGN KEY (`IdFlight`) REFERENCES `flights` (`IdFlight`),
  CONSTRAINT `FK_passenger_gender` FOREIGN KEY (`IdGender`) REFERENCES `gender` (`IdGender`),
  CONSTRAINT `FK_passenger_person` FOREIGN KEY (`IdPerson`) REFERENCES `person` (`idPerson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.passenger: ~0 rows (приблизительно)

-- Дамп структуры для таблица airport.person
CREATE TABLE IF NOT EXISTS `person` (
  `idPerson` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `surname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `dateOfBirth` date NOT NULL,
  PRIMARY KEY (`idPerson`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.person: ~14 rows (приблизительно)
INSERT INTO `person` (`idPerson`, `name`, `surname`, `dateOfBirth`) VALUES
	(1, 'Олексій', 'Арестович', '1984-11-19'),
	(2, 'Володимир', 'Зеленський', '1975-01-19'),
	(3, 'Богдан', 'Хмельницький', '1955-09-11'),
	(4, 'Андрій', 'Мацола', '1965-01-14'),
	(5, 'Олег', 'Хмельницький', '1978-07-11'),
	(6, 'Андрій', 'Коцюбинський', '1995-08-14'),
	(7, 'Анатолій', 'Мономах', '1990-01-12'),
	(8, 'Максим', 'Залізняк', '1991-09-17'),
	(9, 'Андрій', 'Мацола', '1965-01-30'),
	(10, 'Богдан', 'Хмельницький', '1955-09-11'),
	(11, 'Максим', 'Мацола', '1965-01-14');

-- Дамп структуры для таблица airport.plane
CREATE TABLE IF NOT EXISTS `plane` (
  `IdPlane` int unsigned NOT NULL AUTO_INCREMENT,
  `IdBrand` int unsigned NOT NULL,
  `IdCaptain` int unsigned NOT NULL,
  `IdSecoundPilot` int unsigned NOT NULL,
  `IdFlightEngineer` int unsigned NOT NULL,
  `IdFlightAttendant` int unsigned NOT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `NumOfPassagers` int DEFAULT NULL,
  PRIMARY KEY (`IdPlane`),
  KEY `FK_plane_brand` (`IdBrand`),
  KEY `FK_plane_captain` (`IdCaptain`),
  KEY `FK_plane_secound_pilot` (`IdSecoundPilot`),
  KEY `FK_plane_flight_engineer` (`IdFlightEngineer`),
  KEY `FK_plane_flight_attendant` (`IdFlightAttendant`),
  CONSTRAINT `FK_plane_brand` FOREIGN KEY (`IdBrand`) REFERENCES `brand` (`IdBrand`),
  CONSTRAINT `FK_plane_captain` FOREIGN KEY (`IdCaptain`) REFERENCES `captain` (`IdCaptain`),
  CONSTRAINT `FK_plane_flight_attendant` FOREIGN KEY (`IdFlightAttendant`) REFERENCES `flight_attendant` (`IdFlightAttendant`),
  CONSTRAINT `FK_plane_flight_engineer` FOREIGN KEY (`IdFlightEngineer`) REFERENCES `flight_engineer` (`IdFlightEngineer`),
  CONSTRAINT `FK_plane_secound_pilot` FOREIGN KEY (`IdSecoundPilot`) REFERENCES `secound_pilot` (`IdSecoundPilot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.plane: ~0 rows (приблизительно)

-- Дамп структуры для таблица airport.secound_pilot
CREATE TABLE IF NOT EXISTS `secound_pilot` (
  `IdSecoundPilot` int unsigned NOT NULL AUTO_INCREMENT,
  `IdPerson` int unsigned NOT NULL,
  `IdTDG` int unsigned NOT NULL,
  PRIMARY KEY (`IdSecoundPilot`),
  KEY `FK_secound_pilot_tdg` (`IdTDG`),
  KEY `FK_secound_pilot_person` (`IdPerson`),
  CONSTRAINT `FK_secound_pilot_person` FOREIGN KEY (`IdPerson`) REFERENCES `person` (`idPerson`),
  CONSTRAINT `FK_secound_pilot_tdg` FOREIGN KEY (`IdTDG`) REFERENCES `tdg` (`IdTDG`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.secound_pilot: ~2 rows (приблизительно)
INSERT INTO `secound_pilot` (`IdSecoundPilot`, `IdPerson`, `IdTDG`) VALUES
	(1, 8, 9),
	(2, 10, 1),
	(3, 3, 6);

-- Дамп структуры для таблица airport.tdg
CREATE TABLE IF NOT EXISTS `tdg` (
  `IdTDG` int unsigned NOT NULL AUTO_INCREMENT,
  `Gender` varchar(50) NOT NULL,
  `DateOfEmployment` date NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`IdTDG`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.tdg: ~12 rows (приблизительно)
INSERT INTO `tdg` (`IdTDG`, `Gender`, `DateOfEmployment`, `PhoneNumber`) VALUES
	(1, 'Male', '2013-01-19', '+380XX-XXX-XX-XX'),
	(2, 'Male', '2012-09-12', '+380XX-XXX-XX-XX'),
	(3, 'Male', '2015-02-02', '+380XX-XXX-XX-XX'),
	(4, 'Male', '2003-02-01', '+380XX-XXX-XX-XX'),
	(5, 'Male', '2003-02-01', '+380XX-XXX-XX-XX'),
	(6, 'Male', '2002-02-01', '+380XX-XXX-XX-XX'),
	(7, 'Male', '2001-02-01', '+380XX-XXX-XX-XX'),
	(8, 'Male', '2000-02-01', '+380XX-XXX-XX-XX'),
	(9, 'Male', '2004-02-01', '+380XX-XXX-XX-XX'),
	(10, 'Male', '2005-02-01', '+380XX-XXX-XX-XX'),
	(11, 'Male', '2006-02-01', '+380XX-XXX-XX-XX'),
	(12, 'Male', '2007-02-01', '+380XX-XXX-XX-XX');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
