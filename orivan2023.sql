-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2023 a las 01:38:21
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `orivan2023`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artículos`
--

CREATE TABLE `artículos` (
  `id_articulos` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `fabricante_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `artículos`
--

INSERT INTO `artículos` (`id_articulos`, `nombre`, `precio`, `fabricante_id`) VALUES
(1, 'mouse', '600', 103),
(2, 'Teclado', '1050', 103),
(3, 'Monitor', '25000', 105);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID_Cliente` varchar(10) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Apellido` varchar(25) NOT NULL,
  `Dirección` varchar(50) NOT NULL,
  `Ciudad` varchar(25) NOT NULL,
  `País` varchar(25) NOT NULL,
  `Teléfono` int(16) NOT NULL,
  `Correo Electrónico` varchar(25) NOT NULL,
  `producto_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID_Cliente`, `Nombre`, `Apellido`, `Dirección`, `Ciudad`, `País`, `Teléfono`, `Correo Electrónico`, `producto_ID`) VALUES
('C1001', 'Orlando', 'Luján', 'Capital Federal', 'CABA', 'Argentina', 1155005500, 'cliente@orivan.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fabricante`
--

CREATE TABLE `fabricante` (
  `ID_fabricante` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fabricante`
--

INSERT INTO `fabricante` (`ID_fabricante`, `nombre`) VALUES
(101, 'Assus'),
(102, 'Acer'),
(103, 'Toshiba'),
(104, 'Dell'),
(105, 'Samsung'),
(106, '3com'),
(107, 'Cisco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Producto_ID` int(11) NOT NULL,
  `Nombre_¨Producto` varchar(25) NOT NULL,
  `Descripción` varchar(100) NOT NULL,
  `Precio` int(11) NOT NULL,
  `Categoría` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Producto_ID`, `Nombre_¨Producto`, `Descripción`, `Precio`, `Categoría`) VALUES
(1, 'Slip Clásico', 'Confeccionado con tela de Algodón con Lycra', 2500, 'Lencería'),
(2, 'Slip Tanga', 'Confeccionado con Tela 100% Lycra', 2500, 'Lencería'),
(3, 'Boxer Clásico', 'Confeccionado con Tela 100% Algodón', 2500, 'Lencería');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `artículos`
--
ALTER TABLE `artículos`
  ADD PRIMARY KEY (`id_articulos`),
  ADD KEY `fabricante_id` (`fabricante_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_Cliente`),
  ADD KEY `producto_ID` (`producto_ID`);

--
-- Indices de la tabla `fabricante`
--
ALTER TABLE `fabricante`
  ADD PRIMARY KEY (`ID_fabricante`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Producto_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `artículos`
--
ALTER TABLE `artículos`
  MODIFY `id_articulos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `producto_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `fabricante`
--
ALTER TABLE `fabricante`
  MODIFY `ID_fabricante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `Producto_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `artículos`
--
ALTER TABLE `artículos`
  ADD CONSTRAINT `artículos_ibfk_1` FOREIGN KEY (`fabricante_id`) REFERENCES `fabricante` (`ID_fabricante`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`producto_ID`) REFERENCES `productos` (`Producto_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
