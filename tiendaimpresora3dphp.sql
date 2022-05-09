-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-05-2022 a las 04:51:53
-- Versión del servidor: 8.0.28
-- Versión de PHP: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `tiendaimpresora3dphp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrativos`
--

CREATE TABLE `administrativos` (
  `idAdministrativo` int NOT NULL,
  `nivelOfficeAdministrativo` varchar(140) COLLATE utf8_spanish2_ci NOT NULL,
  `idEmpleadoFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `administrativos`
--

INSERT INTO `administrativos` (`idAdministrativo`, `nivelOfficeAdministrativo`, `idEmpleadoFK`) VALUES
(1, 'Alto', 7),
(2, 'Medio', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacenes`
--

CREATE TABLE `almacenes` (
  `idAllmacen` int NOT NULL,
  `idArticuloFK` int NOT NULL,
  `cantidadArticuloAlmacen` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `almacenes`
--

INSERT INTO `almacenes` (`idAllmacen`, `idArticuloFK`, `cantidadArticuloAlmacen`) VALUES
(1, 1, 400),
(2, 2, 250);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `idArticulo` int NOT NULL,
  `desccripcionArticulo` varchar(140) COLLATE utf8_spanish2_ci NOT NULL,
  `precioVentaArticulo` decimal(10,2) NOT NULL,
  `esImpresora` varchar(2) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`idArticulo`, `desccripcionArticulo`, `precioVentaArticulo`, `esImpresora`) VALUES
(1, 'Extrusor 0.5 1.75mm tipo volano', '1.00', 'no'),
(2, 'NTC 100k', '2.00', 'no');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idEmpleado` int NOT NULL,
  `nombreEmpleado` varchar(75) COLLATE utf8_spanish2_ci NOT NULL,
  `primerApellidoEmpleado` varchar(75) COLLATE utf8_spanish2_ci NOT NULL,
  `segundoApellidoEmpleado` varchar(75) COLLATE utf8_spanish2_ci NOT NULL,
  `dniEmpleado` varchar(9) COLLATE utf8_spanish2_ci NOT NULL,
  `telefonoEmpleado` int NOT NULL,
  `correoEmpleado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `domicilioEmpleado` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idEmpleado`, `nombreEmpleado`, `primerApellidoEmpleado`, `segundoApellidoEmpleado`, `dniEmpleado`, `telefonoEmpleado`, `correoEmpleado`, `domicilioEmpleado`) VALUES
(1, 'Manuel', 'Ramírez', 'Romero', '28756545b', 698654321, 'manuel_ra@tuimpresora3d.com', 'C/Maestro Jiménez 4 Sevilla'),
(2, 'Manuel', 'Fernández', 'López', '42568596b', 666525841, 'manuel_lo@tuimpresora3d.com', 'C/Blas Infante nº3 1ºA Sevilla'),
(3, 'Laura ', 'López', 'González', '46141436h', 685525410, 'laura_lo@tuimpresora3d.com', 'C/ La Huerta nº8 Alcalá del Río'),
(4, 'José Manuel', 'Gutiérrez', 'Soria', '87525245j', 699999999, 'josema_gu@tuimpresora3d.com', 'C/Rosa nº 10 Lora del Río'),
(7, 'Obdulia', 'González ', 'López', '29455827r', 625145879, 'obdulia_go@tuimpresora3d.com', 'Paseo Limones nº10 Los Palacios'),
(8, 'Ricardo', 'López', 'López', '25877413g', 954862543, 'ricardo_lo@tuimpresora3d.com', 'C/Plutonio nº43 Dos Hermanas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idPedido` int NOT NULL,
  `fechaPedido` date NOT NULL,
  `idTecnicoFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`idPedido`, `fechaPedido`, `idTecnicoFK`) VALUES
(1, '2022-01-01', 1),
(2, '2022-03-04', 2),
(3, '2022-03-05', 3),
(4, '2022-03-06', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidosarticulos`
--

CREATE TABLE `pedidosarticulos` (
  `idPedidoArticulo` int NOT NULL,
  `idArticuloFK` int NOT NULL,
  `idPedidoFK` int NOT NULL,
  `cantidadArticuloPedido` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pedidosarticulos`
--

INSERT INTO `pedidosarticulos` (`idPedidoArticulo`, `idArticuloFK`, `idPedidoFK`, `cantidadArticuloPedido`) VALUES
(1, 1, 1, 20),
(2, 2, 1, 5),
(3, 1, 3, 3),
(4, 2, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idProveedor` int NOT NULL,
  `tiempoEnvioProveedor` int NOT NULL,
  `nombreProveedor` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `direccionProveedor` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `provinciaProveedor` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `vatProveedor` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `daTrazabilidad` varchar(2) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idProveedor`, `tiempoEnvioProveedor`, `nombreProveedor`, `direccionProveedor`, `provinciaProveedor`, `vatProveedor`, `daTrazabilidad`) VALUES
(1, 7, 'Wuah Imp.', 'Mahucun 17', 'Wuhan', '91441300MA5F', 'sí'),
(2, 7, 'Nam Store', 'Lijiating 20', 'Wuhan', '88841300MA5F', 'no'),
(3, 7, 'Xunsi Cop.', 'Ring Line 25', 'Wuhan', '91558701MA5F', 'sí');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedoresarticulos`
--

CREATE TABLE `proveedoresarticulos` (
  `idProveedorArticulo` int NOT NULL,
  `idProveedorFK` int NOT NULL,
  `idArticuloFK` int NOT NULL,
  `precioCompraArticulo` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `proveedoresarticulos`
--

INSERT INTO `proveedoresarticulos` (`idProveedorArticulo`, `idProveedorFK`, `idArticuloFK`, `precioCompraArticulo`) VALUES
(1, 1, 1, '0.12'),
(2, 1, 2, '0.13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnicos`
--

CREATE TABLE `tecnicos` (
  `idTecnico` int NOT NULL,
  `nivelTecnicoElectronico` varchar(140) COLLATE utf8_spanish2_ci NOT NULL,
  `idEmpleadoFK` int NOT NULL,
  `idTecnicoCoordinadorFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tecnicos`
--

INSERT INTO `tecnicos` (`idTecnico`, `nivelTecnicoElectronico`, `idEmpleadoFK`, `idTecnicoCoordinadorFK`) VALUES
(1, 'Ing. Electrónico Ind. Universidad de Sevilla', 1, 1),
(2, 'Tco. Electrónico', 2, 1),
(3, 'Tco. Electrónico', 3, 1),
(4, 'Tco. Electrónico', 4, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrativos`
--
ALTER TABLE `administrativos`
  ADD PRIMARY KEY (`idAdministrativo`),
  ADD KEY `idEmpleadoFK` (`idEmpleadoFK`);

--
-- Indices de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  ADD PRIMARY KEY (`idAllmacen`),
  ADD KEY `idArticuloFK` (`idArticuloFK`);

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`idArticulo`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idEmpleado`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `idTecnicoFK` (`idTecnicoFK`);

--
-- Indices de la tabla `pedidosarticulos`
--
ALTER TABLE `pedidosarticulos`
  ADD PRIMARY KEY (`idPedidoArticulo`),
  ADD KEY `idArticuloFK` (`idArticuloFK`),
  ADD KEY `idTecnicoFK` (`idPedidoFK`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `proveedoresarticulos`
--
ALTER TABLE `proveedoresarticulos`
  ADD PRIMARY KEY (`idProveedorArticulo`),
  ADD KEY `idProveedorFK` (`idProveedorFK`),
  ADD KEY `idArticuloFK` (`idArticuloFK`);

--
-- Indices de la tabla `tecnicos`
--
ALTER TABLE `tecnicos`
  ADD PRIMARY KEY (`idTecnico`),
  ADD KEY `idEmpleadoFK` (`idEmpleadoFK`),
  ADD KEY `idTecnicoCoordinadorFK` (`idTecnicoCoordinadorFK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrativos`
--
ALTER TABLE `administrativos`
  MODIFY `idAdministrativo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  MODIFY `idAllmacen` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `idArticulo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idEmpleado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idPedido` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedidosarticulos`
--
ALTER TABLE `pedidosarticulos`
  MODIFY `idPedidoArticulo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProveedor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `proveedoresarticulos`
--
ALTER TABLE `proveedoresarticulos`
  MODIFY `idProveedorArticulo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tecnicos`
--
ALTER TABLE `tecnicos`
  MODIFY `idTecnico` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrativos`
--
ALTER TABLE `administrativos`
  ADD CONSTRAINT `administrativos_ibfk_1` FOREIGN KEY (`idEmpleadoFK`) REFERENCES `empleados` (`idEmpleado`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `almacenes`
--
ALTER TABLE `almacenes`
  ADD CONSTRAINT `almacenes_ibfk_1` FOREIGN KEY (`idArticuloFK`) REFERENCES `articulos` (`idArticulo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`idTecnicoFK`) REFERENCES `tecnicos` (`idTecnico`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `pedidosarticulos`
--
ALTER TABLE `pedidosarticulos`
  ADD CONSTRAINT `pedidosarticulos_ibfk_1` FOREIGN KEY (`idArticuloFK`) REFERENCES `articulos` (`idArticulo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pedidosarticulos_ibfk_2` FOREIGN KEY (`idPedidoFK`) REFERENCES `pedidos` (`idPedido`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `proveedoresarticulos`
--
ALTER TABLE `proveedoresarticulos`
  ADD CONSTRAINT `proveedoresarticulos_ibfk_1` FOREIGN KEY (`idProveedorFK`) REFERENCES `proveedores` (`idProveedor`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `proveedoresarticulos_ibfk_2` FOREIGN KEY (`idArticuloFK`) REFERENCES `articulos` (`idArticulo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `tecnicos`
--
ALTER TABLE `tecnicos`
  ADD CONSTRAINT `tecnicos_ibfk_1` FOREIGN KEY (`idEmpleadoFK`) REFERENCES `empleados` (`idEmpleado`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tecnicos_ibfk_2` FOREIGN KEY (`idTecnicoCoordinadorFK`) REFERENCES `tecnicos` (`idTecnico`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;
