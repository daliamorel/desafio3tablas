-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-11-2023 a las 21:19:25
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `desafio_3tablas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `dni` int(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`dni`, `nombre`, `apellidos`) VALUES
(22791680, 'micaela', 'cordovana'),
(25998412, 'elvira', 'gomez'),
(32111444, 'manuel', 'caceres'),
(32698754, 'alejo', 'acosta'),
(33666555, 'juliana', 'torres'),
(38562596, 'franco', 'fresa'),
(39563563, 'candela', 'marino'),
(42434544, 'ludmila', 'sanchez'),
(44236233, 'dalia', 'ramirez'),
(46503120, 'guillermo', 'casares');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `concepto` varchar(20) NOT NULL,
  `clientes_dni` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `concepto`, `clientes_dni`) VALUES
(3, 'olla', 32698754),
(4, 'sarten', 39563563),
(5, 'tenedor', 44236233),
(6, 'cuchara', 25998412),
(7, 'cuchillo', 38562596),
(8, 'plato', 46503120),
(9, 'mantel', 33666555),
(10, 'vaso', 42434544),
(11, 'copa', 32111444),
(12, 'ensaladera', 22791680);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineascompra`
--

CREATE TABLE `lineascompra` (
  `numero` int(20) NOT NULL,
  `compras_id` int(20) NOT NULL,
  `producto` varchar(20) NOT NULL,
  `importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lineascompra`
--

INSERT INTO `lineascompra` (`numero`, `compras_id`, `producto`, `importe`) VALUES
(1, 11, 'copa de vidrio', 250),
(2, 6, 'cuchara', 30),
(3, 7, 'cuchillo', 40),
(4, 12, 'ensaladera de plasti', 200),
(5, 9, 'mantel liso negro', 200),
(6, 3, 'olla essen', 2000),
(7, 8, 'plato playo de vidri', 80),
(8, 4, 'sarten de teflon ', 1000),
(9, 5, 'tenedor', 40),
(10, 10, 'vaso de vidrio', 150);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientes_dni` (`clientes_dni`);

--
-- Indices de la tabla `lineascompra`
--
ALTER TABLE `lineascompra`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `compras_id` (`compras_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `dni` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46503121;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `lineascompra`
--
ALTER TABLE `lineascompra`
  MODIFY `numero` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`clientes_dni`) REFERENCES `clientes` (`dni`);

--
-- Filtros para la tabla `lineascompra`
--
ALTER TABLE `lineascompra`
  ADD CONSTRAINT `lineascompra_ibfk_1` FOREIGN KEY (`compras_id`) REFERENCES `compras` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
