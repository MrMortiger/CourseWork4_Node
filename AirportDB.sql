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
  `IdAddress` int unsigned NOT NULL AUTO_INCREMENT,
  `IdCountry` int unsigned NOT NULL,
  `Street` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `City` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Building` int DEFAULT NULL,
  `Flat` int DEFAULT NULL,
  PRIMARY KEY (`IdAddress`) USING BTREE,
  KEY `FK_address_country` (`IdCountry`) USING BTREE,
  CONSTRAINT `FK_address_country` FOREIGN KEY (`IdCountry`) REFERENCES `country` (`IdCountry`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.address: ~21 rows (приблизительно)
INSERT INTO `address` (`IdAddress`, `IdCountry`, `Street`, `City`, `Building`, `Flat`) VALUES
	(1, 3, 'Oxford Street', 'London', 10, 3),
	(2, 1, 'Rue de la Paix', 'Paris', 25, 6),
	(3, 5, 'Avenida Paulista', 'Sao Paulo', 45, 24),
	(4, 2, 'Park Avenue', 'New York', 100, 8),
	(5, 4, 'Alexanderplatz', 'Berlin', 12, 37),
	(6, 2, 'Fifth Avenue', 'New York', 57, 15),
	(7, 3, 'Baker Street', 'London', 221, 1),
	(8, 5, 'Av. Atlantica', 'Rio de Janeiro', 300, 18),
	(9, 1, 'Champs Elysees', 'Paris', 78, 4),
	(10, 4, 'Potsdamer Platz', 'Berlin', 1, 10),
	(11, 2, 'Madison Avenue', 'New York', 450, 21),
	(12, 1, 'Place Vendome', 'Paris', 12, 2),
	(13, 3, 'Kings Road', 'London', 7, 6),
	(14, 5, 'Av. Ibirapuera', 'Sao Paulo', 150, 27),
	(15, 2, 'Broadway', 'New York', 1560, 34),
	(16, 4, 'Friedrichstrasse', 'Berlin', 40, 20),
	(17, 1, 'Main Street', 'New York', 10, 5),
	(18, 2, 'Main Boulevard', 'Paris', 20, 7),
	(19, 3, 'Lincoln Street', 'Los Angeles', 30, 1),
	(20, 4, 'Baker Street', 'London', 40, 9),
	(21, 5, 'Alexanderplatz', 'Berlin', 50, 3);

-- Дамп структуры для таблица airport.airstrip
CREATE TABLE IF NOT EXISTS `airstrip` (
  `IdAirstrip` int unsigned NOT NULL AUTO_INCREMENT,
  `IdAirstripStatus` int unsigned NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`IdAirstrip`) USING BTREE,
  KEY `FK_airstrip_airstrip_status` (`IdAirstripStatus`),
  CONSTRAINT `FK_airstrip_airstrip_status` FOREIGN KEY (`IdAirstripStatus`) REFERENCES `airstrip_status` (`IdAirstripStatus`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.airstrip: ~15 rows (приблизительно)
INSERT INTO `airstrip` (`IdAirstrip`, `IdAirstripStatus`, `Name`) VALUES
	(1, 1, 'JFK'),
	(2, 1, 'LAX'),
	(3, 2, 'ORD'),
	(4, 2, 'DFW'),
	(5, 3, 'DEN'),
	(6, 3, 'ATL'),
	(7, 1, 'SFO'),
	(8, 2, 'MIA'),
	(9, 3, 'SEA'),
	(10, 1, 'BOS'),
	(11, 2, 'EWR'),
	(12, 3, 'PHX'),
	(13, 1, 'MCO'),
	(14, 2, 'CLT'),
	(15, 3, 'IAH');

-- Дамп структуры для таблица airport.airstrip_status
CREATE TABLE IF NOT EXISTS `airstrip_status` (
  `IdAirstripStatus` int unsigned NOT NULL AUTO_INCREMENT,
  `Status` varchar(50) NOT NULL,
  PRIMARY KEY (`IdAirstripStatus`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.airstrip_status: ~3 rows (приблизительно)
INSERT INTO `airstrip_status` (`IdAirstripStatus`, `Status`) VALUES
	(1, 'Open'),
	(2, 'Under Maintenance'),
	(3, 'Closed');

-- Дамп структуры для таблица airport.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `IdBrand` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdBrand`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.brand: ~11 rows (приблизительно)
INSERT INTO `brand` (`IdBrand`, `Name`) VALUES
	(1, 'Boeing'),
	(2, 'Airbus'),
	(3, 'Embraer'),
	(4, 'Bombardier'),
	(5, 'Cessna'),
	(6, 'Gulfstream'),
	(7, 'Dassault'),
	(8, 'Hawker Beechcraft'),
	(9, 'Piaggio'),
	(10, 'Sukhoi'),
	(11, 'Antonov');

-- Дамп структуры для таблица airport.captain
CREATE TABLE IF NOT EXISTS `captain` (
  `IdCaptain` int unsigned NOT NULL AUTO_INCREMENT,
  `IdPerson` int unsigned NOT NULL,
  `IdPDG` int unsigned NOT NULL,
  PRIMARY KEY (`IdCaptain`),
  KEY `FK_captain_person` (`IdPerson`),
  KEY `FK_captain_tdg` (`IdPDG`) USING BTREE,
  CONSTRAINT `FK_captain_person` FOREIGN KEY (`IdPerson`) REFERENCES `person` (`idPerson`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_captain_tdg` FOREIGN KEY (`IdPDG`) REFERENCES `pdg` (`IdPDG`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.captain: ~5 rows (приблизительно)
INSERT INTO `captain` (`IdCaptain`, `IdPerson`, `IdPDG`) VALUES
	(1, 30, 30),
	(2, 29, 29),
	(3, 28, 28),
	(4, 27, 27),
	(5, 26, 26);

-- Дамп структуры для таблица airport.country
CREATE TABLE IF NOT EXISTS `country` (
  `IdCountry` int unsigned NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(50) NOT NULL,
  PRIMARY KEY (`IdCountry`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.country: ~10 rows (приблизительно)
INSERT INTO `country` (`IdCountry`, `CountryName`) VALUES
	(1, 'USA'),
	(2, 'Canada'),
	(3, 'Mexico'),
	(4, 'France'),
	(5, 'Germany'),
	(6, 'Italy'),
	(7, 'Spain'),
	(8, 'Russia'),
	(9, 'China'),
	(10, 'Japan');

-- Дамп структуры для таблица airport.flights
CREATE TABLE IF NOT EXISTS `flights` (
  `IdFlight` int unsigned NOT NULL AUTO_INCREMENT,
  `IdPlane` int unsigned NOT NULL,
  `IdStatus` int unsigned NOT NULL,
  `IdAirstrip` int unsigned NOT NULL,
  `NumberOfPassengers` int DEFAULT NULL,
  `ShippingTime` datetime DEFAULT NULL,
  `ArrivalTime` datetime DEFAULT NULL,
  `PlaceOfDispatch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PlaceOfArrival` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`IdFlight`) USING BTREE,
  KEY `IDStatus` (`IdStatus`) USING BTREE,
  KEY `IDAirstrip` (`IdAirstrip`) USING BTREE,
  KEY `FK_flights_plane` (`IdPlane`) USING BTREE,
  CONSTRAINT `FK_flights_airstrip` FOREIGN KEY (`IdAirstrip`) REFERENCES `airstrip` (`IdAirstrip`),
  CONSTRAINT `FK_flights_flight_status` FOREIGN KEY (`IdStatus`) REFERENCES `flight_status` (`IdStatus`),
  CONSTRAINT `FK_flights_plane` FOREIGN KEY (`IdPlane`) REFERENCES `plane` (`IdPlane`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.flights: ~5 rows (приблизительно)
INSERT INTO `flights` (`IdFlight`, `IdPlane`, `IdStatus`, `IdAirstrip`, `NumberOfPassengers`, `ShippingTime`, `ArrivalTime`, `PlaceOfDispatch`, `PlaceOfArrival`) VALUES
	(1, 1, 1, 2, 150, '2023-02-22 10:30:00', '2023-02-22 15:45:00', 'London', 'New York'),
	(2, 2, 2, 5, 80, '2023-02-23 08:00:00', '2023-02-23 12:30:00', 'Paris', 'Dubai'),
	(3, 3, 1, 12, 200, '2023-02-24 11:15:00', '2023-02-24 18:00:00', 'Los Angeles', 'Tokyo'),
	(4, 4, 2, 8, 100, '2023-02-25 16:45:00', '2023-02-25 22:00:00', 'Dublin', 'Miami'),
	(5, 5, 1, 6, 120, '2023-02-26 09:30:00', '2023-02-26 13:15:00', 'Berlin', 'Madrid');

-- Дамп структуры для таблица airport.flight_attendant
CREATE TABLE IF NOT EXISTS `flight_attendant` (
  `IdFlightAttendant` int unsigned NOT NULL AUTO_INCREMENT,
  `IdPerson` int unsigned NOT NULL,
  `IdPDG` int unsigned NOT NULL,
  PRIMARY KEY (`IdFlightAttendant`),
  KEY `FK_flight_attendant_person` (`IdPerson`),
  KEY `FK_flight_attendant_tdg` (`IdPDG`) USING BTREE,
  CONSTRAINT `FK_flight_attendant_person` FOREIGN KEY (`IdPerson`) REFERENCES `person` (`idPerson`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_flight_attendant_tdg` FOREIGN KEY (`IdPDG`) REFERENCES `pdg` (`IdPDG`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.flight_attendant: ~5 rows (приблизительно)
INSERT INTO `flight_attendant` (`IdFlightAttendant`, `IdPerson`, `IdPDG`) VALUES
	(1, 20, 20),
	(2, 19, 19),
	(3, 18, 18),
	(4, 17, 17),
	(5, 16, 16);

-- Дамп структуры для таблица airport.flight_engineer
CREATE TABLE IF NOT EXISTS `flight_engineer` (
  `IdFlightEngineer` int unsigned NOT NULL AUTO_INCREMENT,
  `IdPerson` int unsigned NOT NULL,
  `IdPDG` int unsigned NOT NULL,
  PRIMARY KEY (`IdFlightEngineer`),
  KEY `FK_flight_engineer_person` (`IdPerson`),
  KEY `FK_flight_engineer_tdg` (`IdPDG`) USING BTREE,
  CONSTRAINT `FK_flight_engineer_person` FOREIGN KEY (`IdPerson`) REFERENCES `person` (`idPerson`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_flight_engineer_tdg` FOREIGN KEY (`IdPDG`) REFERENCES `pdg` (`IdPDG`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.flight_engineer: ~5 rows (приблизительно)
INSERT INTO `flight_engineer` (`IdFlightEngineer`, `IdPerson`, `IdPDG`) VALUES
	(1, 15, 15),
	(2, 14, 14),
	(3, 13, 13),
	(4, 12, 12),
	(5, 11, 11);

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
  CONSTRAINT `FK_passenger_gender` FOREIGN KEY (`IdGender`) REFERENCES `gender` (`IdGender`) ON UPDATE CASCADE,
  CONSTRAINT `FK_passenger_person` FOREIGN KEY (`IdPerson`) REFERENCES `person` (`idPerson`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.passenger: ~10 rows (приблизительно)
INSERT INTO `passenger` (`IdPassenger`, `IdGender`, `IdPerson`, `IdFlight`, `TicketNumber`) VALUES
	(1, 1, 1, 1, 12345),
	(2, 2, 2, 2, 23456),
	(3, 1, 3, 1, 34567),
	(4, 1, 4, 3, 45678),
	(5, 2, 5, 2, 56789),
	(6, 1, 6, 4, 67890),
	(7, 2, 7, 5, 78901),
	(8, 1, 8, 1, 89012),
	(9, 1, 9, 3, 90123),
	(10, 2, 10, 4, 10111);

-- Дамп структуры для таблица airport.pdg
CREATE TABLE IF NOT EXISTS `pdg` (
  `IdPDG` int unsigned NOT NULL AUTO_INCREMENT,
  `Gender` varchar(50) NOT NULL,
  `DateOfEmployment` date NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`IdPDG`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.pdg: ~30 rows (приблизительно)
INSERT INTO `pdg` (`IdPDG`, `Gender`, `DateOfEmployment`, `PhoneNumber`) VALUES
	(1, 'Male', '2020-02-12', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(2, 'Female', '2019-05-20', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(3, 'Male', '2021-01-05', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(4, 'Female', '2018-10-15', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(5, 'Male', '2022-02-01', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(6, 'Female', '2021-09-01', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(7, 'Male', '2022-01-15', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(8, 'Female', '2021-07-20', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(9, 'Male', '2020-06-10', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(10, 'Female', '2021-12-05', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(11, 'Male', '2020-02-12', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(12, 'Female', '2019-05-20', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(13, 'Male', '2021-01-05', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(14, 'Female', '2018-10-15', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(15, 'Male', '2022-02-01', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(16, 'Female', '2021-09-01', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(17, 'Male', '2022-01-15', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(18, 'Female', '2021-07-20', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(19, 'Male', '2020-06-10', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(20, 'Female', '2021-12-05', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(21, 'Male', '2020-02-12', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(22, 'Female', '2019-05-20', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(23, 'Male', '2021-01-05', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(24, 'Female', '2018-10-15', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(25, 'Male', '2022-02-01', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(26, 'Female', '2021-09-01', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(27, 'Male', '2022-01-15', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(28, 'Female', '2021-07-20', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(29, 'Male', '2020-06-10', '+380-ХХ-ХХХ-ХХ-ХХ'),
	(30, 'Female', '2021-12-05', '+380-ХХ-ХХХ-ХХ-ХХ');

-- Дамп структуры для таблица airport.person
CREATE TABLE IF NOT EXISTS `person` (
  `idPerson` int unsigned NOT NULL AUTO_INCREMENT,
  `idAddress` int unsigned NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `surname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `dateOfBirth` date NOT NULL,
  PRIMARY KEY (`idPerson`) USING BTREE,
  KEY `FK_person_address` (`idAddress`),
  CONSTRAINT `FK_person_address` FOREIGN KEY (`idAddress`) REFERENCES `address` (`IdAddress`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.person: ~31 rows (приблизительно)
INSERT INTO `person` (`idPerson`, `idAddress`, `name`, `surname`, `dateOfBirth`) VALUES
	(1, 1, 'John', 'Smith', '1990-01-01'),
	(2, 2, 'Emma', 'Johnson', '1992-03-15'),
	(3, 3, 'Michael', 'Williams', '1985-07-10'),
	(4, 4, 'Olivia', 'Brown', '1998-11-23'),
	(5, 5, 'William', 'Jones', '1978-05-29'),
	(6, 6, 'Sophia', 'Garcia', '1987-09-04'),
	(7, 7, 'David', 'Miller', '1983-02-14'),
	(8, 8, 'Isabella', 'Davis', '1996-06-08'),
	(9, 9, 'Alexander', 'Rodriguez', '1980-12-18'),
	(10, 10, 'Mia', 'Martinez', '1994-04-30'),
	(11, 11, 'Ethan', 'Hernandez', '1975-08-09'),
	(12, 12, 'Charlotte', 'Lopez', '1991-12-02'),
	(13, 13, 'Daniel', 'Gonzalez', '1989-06-16'),
	(14, 14, 'Ava', 'Perez', '1997-03-21'),
	(15, 15, 'Matthew', 'Turner', '1981-05-25'),
	(16, 16, 'Emily', 'Carter', '1995-09-03'),
	(17, 17, 'Benjamin', 'Phillips', '1979-11-12'),
	(18, 18, 'Sofia', 'Martin', '1984-02-28'),
	(19, 19, 'Joseph', 'Lee', '1993-07-22'),
	(20, 20, 'Chloe', 'King', '1982-01-07'),
	(21, 21, 'David', 'Scott', '1988-04-12'),
	(22, 1, 'Aiden', 'Baker', '1991-10-05'),
	(23, 2, 'Natalie', 'Nelson', '1986-12-17'),
	(24, 3, 'Lucas', 'Cruz', '1999-02-28'),
	(25, 4, 'Lily', 'Murphy', '1980-06-30'),
	(26, 5, 'Jacob', 'Rivera', '1997-09-22'),
	(27, 6, 'Avery', 'Cooper', '1994-08-13'),
	(28, 7, 'Evelyn', 'Reed', '1988-05-17'),
	(29, 8, 'Mason', 'Bailey', '1992-11-07'),
	(30, 9, 'Madison', 'Flores', '1983-03-11'),
	(31, 10, 'Logan', 'Gomez', '1986-04-18');

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
  KEY `FK_plane_flight_attendant` (`IdFlightAttendant`),
  KEY `FK_plane_flight_engineer` (`IdFlightEngineer`),
  KEY `FK_plane_secound_pilot` (`IdSecoundPilot`),
  CONSTRAINT `FK_plane_brand` FOREIGN KEY (`IdBrand`) REFERENCES `brand` (`IdBrand`) ON UPDATE CASCADE,
  CONSTRAINT `FK_plane_captain` FOREIGN KEY (`IdCaptain`) REFERENCES `captain` (`IdCaptain`) ON UPDATE CASCADE,
  CONSTRAINT `FK_plane_flight_attendant` FOREIGN KEY (`IdFlightAttendant`) REFERENCES `flight_attendant` (`IdFlightAttendant`) ON UPDATE CASCADE,
  CONSTRAINT `FK_plane_flight_engineer` FOREIGN KEY (`IdFlightEngineer`) REFERENCES `flight_engineer` (`IdFlightEngineer`) ON UPDATE CASCADE,
  CONSTRAINT `FK_plane_secound_pilot` FOREIGN KEY (`IdSecoundPilot`) REFERENCES `secound_pilot` (`IdSecoundPilot`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.plane: ~10 rows (приблизительно)
INSERT INTO `plane` (`IdPlane`, `IdBrand`, `IdCaptain`, `IdSecoundPilot`, `IdFlightEngineer`, `IdFlightAttendant`, `Status`, `NumOfPassagers`) VALUES
	(1, 1, 1, 2, 3, 4, 'available', 200),
	(2, 2, 2, 3, 4, 5, 'available', 200),
	(3, 3, 3, 4, 5, 1, 'available', 200),
	(4, 4, 4, 5, 1, 2, 'unavailable', 200),
	(5, 5, 5, 1, 2, 3, 'unavailable', 200),
	(6, 6, 1, 2, 3, 4, 'available', 200),
	(7, 7, 2, 3, 4, 5, 'available', 200),
	(8, 8, 3, 4, 5, 1, 'available', 200),
	(9, 9, 4, 5, 1, 2, 'unavailable', 200),
	(10, 10, 5, 1, 2, 3, 'unavailable', 200);

-- Дамп структуры для таблица airport.secound_pilot
CREATE TABLE IF NOT EXISTS `secound_pilot` (
  `IdSecoundPilot` int unsigned NOT NULL AUTO_INCREMENT,
  `IdPerson` int unsigned NOT NULL,
  `IdPDG` int unsigned NOT NULL,
  PRIMARY KEY (`IdSecoundPilot`),
  KEY `FK_secound_pilot_tdg` (`IdPDG`) USING BTREE,
  KEY `FK_secound_pilot_person` (`IdPerson`),
  CONSTRAINT `FK_secound_pilot_person` FOREIGN KEY (`IdPerson`) REFERENCES `person` (`idPerson`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_secound_pilot_tdg` FOREIGN KEY (`IdPDG`) REFERENCES `pdg` (`IdPDG`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы airport.secound_pilot: ~5 rows (приблизительно)
INSERT INTO `secound_pilot` (`IdSecoundPilot`, `IdPerson`, `IdPDG`) VALUES
	(1, 25, 25),
	(2, 24, 24),
	(3, 23, 23),
	(4, 22, 22),
	(5, 21, 21);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
