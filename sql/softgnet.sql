-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-05-2022 a las 07:29:59
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `softgnet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `drivers`
--

CREATE TABLE `drivers` (
  `id` int(1) NOT NULL,
  `firs_name` varchar(50) NOT NULL,
  `last_name` varchar(90) NOT NULL,
  `ssn` int(20) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(90) DEFAULT NULL,
  `city` varchar(90) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `phone` char(20) NOT NULL,
  `active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `drivers`
--

INSERT INTO `drivers` (`id`, `firs_name`, `last_name`, `ssn`, `dob`, `address`, `city`, `zip`, `phone`, `active`) VALUES
(1, 'Roberto ', 'Molina', 454216565, '1997-11-29', 'cra 14 E1 N.49-37', 'Soledad, Atlantico', '000524', '+573016919752', 1),
(5, 'Tester', 'developer', 2147483647, '1997-12-29', 'cra 14 e1 N. 49-97', 'Soledad', '36352', '30169197554', 1),
(9, 'Roberto', 'Molina', 11321321, '1997-11-29', 'test', 'barranquilla', '0023321', '3016919752', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `routes`
--

CREATE TABLE `routes` (
  `id` int(1) NOT NULL,
  `description` varchar(450) DEFAULT NULL,
  `driver_id` int(1) NOT NULL,
  `vehicile_id` int(11) NOT NULL,
  `active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `routes`
--

INSERT INTO `routes` (`id`, `description`, `driver_id`, `vehicile_id`, `active`) VALUES
(7, 'testing developer', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schedulers`
--

CREATE TABLE `schedulers` (
  `routes_id` int(1) NOT NULL,
  `week_num` varchar(23) NOT NULL,
  `from_` varchar(90) NOT NULL,
  `to_` varchar(90) NOT NULL,
  `active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `user` varchar(25) NOT NULL,
  `pass` varchar(900) NOT NULL,
  `registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`user`, `pass`, `registro`) VALUES
('admin', 'abcd1234', '2022-05-18 10:57:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiciles`
--

CREATE TABLE `vehiciles` (
  `id` int(1) NOT NULL,
  `description` varchar(390) DEFAULT NULL,
  `year` varchar(15) NOT NULL,
  `make` varchar(20) NOT NULL,
  `capacity` int(5) NOT NULL,
  `active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vehiciles`
--

INSERT INTO `vehiciles` (`id`, `description`, `year`, `make`, `capacity`, `active`) VALUES
(2, 'tester', '2010', 'tester', 45, 1),
(4, 'en hangar', '2020', 'logan', 60, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_routes_driver_id` (`driver_id`),
  ADD UNIQUE KEY `unq_routes_vehicile_id` (`vehicile_id`);

--
-- Indices de la tabla `schedulers`
--
ALTER TABLE `schedulers`
  ADD PRIMARY KEY (`routes_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user`);

--
-- Indices de la tabla `vehiciles`
--
ALTER TABLE `vehiciles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `vehiciles`
--
ALTER TABLE `vehiciles`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
