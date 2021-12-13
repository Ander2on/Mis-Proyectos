-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:33065 
-- Tiempo de generación: 29-11-2021 a las 06:08:54
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_prestamosabmj`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id_Usuario` int(4) NOT NULL,
  `Usuario` varchar(25) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_clientes` int(5) NOT NULL,
  `DUI` int(10) DEFAULT NULL,
  `Nombres` varchar(30) DEFAULT NULL,
  `Apellidos` varchar(30) DEFAULT NULL,
  `Sexo` varchar(10) DEFAULT NULL,
  `Telefono` int(10) DEFAULT NULL,
  `Departamento` varchar(50) DEFAULT NULL,
  `Ciudad` varchar(50) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Edad` int(3) DEFAULT NULL,
  `Sueldo` float(6,3) DEFAULT NULL,
  `Retraso` varchar(5) DEFAULT NULL,
  `Trabajo` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_clientes`, `DUI`, `Nombres`, `Apellidos`, `Sexo`, `Telefono`, `Departamento`, `Ciudad`, `Direccion`, `Edad`, `Sueldo`, `Retraso`, `Trabajo`) VALUES
(1, 2356849, 'Carlo Antonio', 'Rodríguez Soto', 'M', 3214423, 'Usulutan', 'Usulutan', 'Col. Real Campo Verde Casa #3', 25, 300.000, 'No', 'Si'),
(2, 5478921, 'Maricela Beatriz', 'Quintanilla Coto', 'F', 12459687, 'San Miguel', 'El Transito', 'Pasaje los cantares', 35, 500.000, 'No', 'Si'),
(3, 879798356, 'Maria Antonieta', 'De Las Nieves', 'F', 12459878, 'San Salvador', 'San Salvador', 'col. los pinos', 45, 300.000, 'No', 'Si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `id_Prestamo` int(4) NOT NULL,
  `DUI` int(10) DEFAULT NULL,
  `Cantidad` float(6,3) DEFAULT NULL,
  `Interes` int(3) DEFAULT NULL,
  `Cuotas_Cant` float(6,3) DEFAULT NULL,
  `Cuotas_Meses` int(4) DEFAULT NULL,
  `Fecha` varchar(12) DEFAULT NULL,
  `Sueldo` float(6,3) DEFAULT NULL,
  `Estado` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`id_Prestamo`, `DUI`, `Cantidad`, `Interes`, `Cuotas_Cant`, `Cuotas_Meses`, `Fecha`, `Sueldo`, `Estado`) VALUES
(1, 2356849, 300.000, 10, 27.500, 12, '2021-11-27', 300.000, 'Activo'),
(2, 5478921, 20.000, 5, 3.500, 6, '2021-11-25', 500.000, 'Cancelado'),
(3, 879798356, 600.000, 10, 28.000, 24, '2021-11-20', 300.000, 'Activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_Usuario`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_clientes`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`id_Prestamo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id_Usuario` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_clientes` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `id_Prestamo` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
