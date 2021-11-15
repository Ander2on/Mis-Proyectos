-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 15-11-2021 a las 01:32:19
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_prestamos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id_admin` varchar(4) NOT NULL,
  `cuenta` varchar(20) DEFAULT NULL,
  `contraseña` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id_admin`, `cuenta`, `contraseña`) VALUES
('0001', 'ea0001@abmj.org.sv', '1234578'),
('0002', 'ea0002@abmj.org.sv', '1234578');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(4) NOT NULL,
  `nombres` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `dui` varchar(12) DEFAULT NULL,
  `departamento` varchar(30) DEFAULT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `sexo` varchar(9) DEFAULT NULL,
  `edad` int(3) DEFAULT NULL,
  `telefono` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombres`, `apellido`, `dui`, `departamento`, `ciudad`, `direccion`, `sexo`, `edad`, `telefono`) VALUES
(1, 'Ernesto Alexander', 'Melendez Mereria', '15748514-5', 'Usulután', 'Usulután', 'Barrio la Merced calle 6 av norte', 'Masculino', 24, '7485-6545'),
(2, 'Diego Ernesto', 'Bonilla López', '65458545-5', 'Usulután', 'Usulután', 'Barrio la Parroquia calle 4 av norte', 'Masculino', 29, '4585-6514');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_prestamo`
--

CREATE TABLE `registro_prestamo` (
  `id_registro` int(4) NOT NULL,
  `cantidad_prestamo` decimal(8,2) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `id_cliente2` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `registro_prestamo`
--

INSERT INTO `registro_prestamo` (`id_registro`, `cantidad_prestamo`, `fecha_registro`, `estado`, `id_cliente2`) VALUES
(1, '2000.00', '2021-11-12', 'Aprobado', 2),
(2, '5200.00', '2021-11-14', 'Rechazado', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_prestamo`
--

CREATE TABLE `solicitud_prestamo` (
  `id_prestamo` varchar(4) NOT NULL,
  `moroso` varchar(2) DEFAULT NULL,
  `trabaja` varchar(2) DEFAULT NULL,
  `cuota` decimal(8,2) DEFAULT NULL,
  `sueldo` decimal(8,2) DEFAULT NULL,
  `prestamo` decimal(8,2) DEFAULT NULL,
  `id_cliente1` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `solicitud_prestamo`
--

INSERT INTO `solicitud_prestamo` (`id_prestamo`, `moroso`, `trabaja`, `cuota`, `sueldo`, `prestamo`, `id_cliente1`) VALUES
('0001', 'no', 'si', '150.00', '430.00', '0.00', 2),
('0002', 'no', 'si', '375.00', '350.00', '0.00', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `registro_prestamo`
--
ALTER TABLE `registro_prestamo`
  ADD PRIMARY KEY (`id_registro`),
  ADD KEY `id_cliente2` (`id_cliente2`);

--
-- Indices de la tabla `solicitud_prestamo`
--
ALTER TABLE `solicitud_prestamo`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `id_cliente1` (`id_cliente1`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `registro_prestamo`
--
ALTER TABLE `registro_prestamo`
  ADD CONSTRAINT `registro_prestamo_ibfk_1` FOREIGN KEY (`id_cliente2`) REFERENCES `clientes` (`id_cliente`);

--
-- Filtros para la tabla `solicitud_prestamo`
--
ALTER TABLE `solicitud_prestamo`
  ADD CONSTRAINT `solicitud_prestamo_ibfk_1` FOREIGN KEY (`id_cliente1`) REFERENCES `clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
