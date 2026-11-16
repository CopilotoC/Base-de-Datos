-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 16-11-2026 a las 17:53:46
-- Versión del servidor: 9.7.2
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_barbería`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barberos`
--

CREATE TABLE `barberos` (
  `DNI_Barbero` int UNSIGNED NOT NULL,
  `Nombre/s` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Nicolás Manuel',
  `Apellido/s` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Bariles'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `barberos`
--

INSERT INTO `barberos` (`DNI_Barbero`, `Nombre/s`, `Apellido/s`) VALUES
(37884829, 'Marto Alberto', 'Pecarí'),
(57893645, 'Norberto Martín', 'Bayester'),
(99000001, 'Luciano Andrés', 'Molina'),
(99000002, 'Tomás Ezequiel', 'Ferreyra'),
(99000003, 'Agustín Rafael', 'Quiroga'),
(99000004, 'Julián Mateo', 'Sosa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barbero_servicio`
--

CREATE TABLE `barbero_servicio` (
  `DNI_Barbero` int UNSIGNED NOT NULL,
  `ID_Servicio` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `barbero_servicio`
--

INSERT INTO `barbero_servicio` (`DNI_Barbero`, `ID_Servicio`) VALUES
(37884829, 0),
(57893645, 0),
(99000001, 0),
(99000002, 0),
(99000003, 0),
(99000004, 0),
(37884829, 1),
(57893645, 1),
(99000001, 1),
(99000002, 1),
(99000003, 1),
(99000004, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calles`
--

CREATE TABLE `calles` (
  `ID_Calle` int UNSIGNED NOT NULL,
  `Nombre_Calle` varchar(500) COLLATE utf16_bin NOT NULL,
  `AltMin` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Altura mínima de la calle.',
  `AltMax` int UNSIGNED NOT NULL DEFAULT '8400' COMMENT 'Altur máxima de la calle.'
) ;

--
-- Volcado de datos para la tabla `calles`
--

INSERT INTO `calles` (`ID_Calle`, `Nombre_Calle`, `AltMin`, `AltMax`) VALUES
(1, 'Boulevard San Juan', 0, 1500),
(2, 'José Ramón Figueroa', 0, 700),
(3, 'Victoria', 0, 800),
(4, 'Doctor Silvestre Remonda', 0, 1300);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `DNI_Cliente` int UNSIGNED NOT NULL,
  `Nombre/s` varchar(100) COLLATE utf16_bin NOT NULL,
  `Apellido/s` varchar(100) COLLATE utf16_bin NOT NULL,
  `Sexo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`DNI_Cliente`, `Nombre/s`, `Apellido/s`, `Sexo`) VALUES
(47475599, 'Felipe', 'Schwindt Nebón', 0),
(99100101, 'Camila', 'Roldán', NULL),
(99100102, 'Mateo', 'Giménez', NULL),
(99100103, 'Valentina', 'Paz', NULL),
(99100104, 'Benjamín', 'López', NULL),
(99100105, 'Sofía', 'Herrera', NULL),
(99100106, 'Thiago', 'Acosta', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `días_semana`
--

CREATE TABLE `días_semana` (
  `ID_DíaSemana` int UNSIGNED NOT NULL,
  `Nombre_DíaSemana` varchar(9) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `días_semana`
--

INSERT INTO `días_semana` (`ID_DíaSemana`, `Nombre_DíaSemana`) VALUES
(0, 'Lunes'),
(1, 'Martes'),
(2, 'Miércoles'),
(3, 'Jueves'),
(4, 'Viernes'),
(5, 'Sábado'),
(6, 'Domingo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadoturnos`
--

CREATE TABLE `estadoturnos` (
  `ID_EstadoTurnos` int UNSIGNED NOT NULL,
  `NombreEstadoTurnos` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='estados de los turnos pueden variar a lo largo del tiempo.';

--
-- Volcado de datos para la tabla `estadoturnos`
--

INSERT INTO `estadoturnos` (`ID_EstadoTurnos`, `NombreEstadoTurnos`) VALUES
(0, 'Pendiente'),
(1, 'Confirmado'),
(2, 'Cancelado'),
(3, 'Completado'),
(4, 'En proceso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horariosbarberos`
--

CREATE TABLE `horariosbarberos` (
  `ID_Horario` int UNSIGNED NOT NULL,
  `DNI_Barbero` int UNSIGNED NOT NULL,
  `Inicio` time NOT NULL DEFAULT '00:00:07',
  `Fín` time NOT NULL DEFAULT '00:00:17',
  `ID_Sucursal` int UNSIGNED NOT NULL DEFAULT '0',
  `ID_DíaSemana` int UNSIGNED NOT NULL DEFAULT '0',
  `ID_Servicio` int UNSIGNED NOT NULL
) ;

--
-- Volcado de datos para la tabla `horariosbarberos`
--

INSERT INTO `horariosbarberos` (`ID_Horario`, `DNI_Barbero`, `Inicio`, `Fín`, `ID_Sucursal`, `ID_DíaSemana`, `ID_Servicio`) VALUES
(73, 37884829, '09:00:00', '13:00:00', 1, 0, 0),
(74, 37884829, '14:00:00', '18:00:00', 1, 0, 1),
(75, 37884829, '09:00:00', '13:00:00', 1, 1, 0),
(76, 37884829, '14:00:00', '18:00:00', 1, 1, 1),
(77, 37884829, '09:00:00', '13:00:00', 1, 2, 0),
(78, 37884829, '14:00:00', '18:00:00', 1, 2, 1),
(79, 37884829, '09:00:00', '13:00:00', 1, 3, 0),
(80, 37884829, '14:00:00', '18:00:00', 1, 3, 1),
(81, 37884829, '09:00:00', '13:00:00', 1, 4, 0),
(82, 37884829, '14:00:00', '18:00:00', 1, 4, 1),
(83, 37884829, '09:00:00', '13:00:00', 1, 5, 0),
(84, 37884829, '14:00:00', '18:00:00', 1, 5, 1),
(85, 57893645, '09:00:00', '13:00:00', 1, 0, 0),
(86, 57893645, '14:00:00', '18:00:00', 1, 0, 1),
(87, 57893645, '09:00:00', '13:00:00', 1, 1, 0),
(88, 57893645, '14:00:00', '18:00:00', 1, 1, 1),
(89, 57893645, '09:00:00', '13:00:00', 1, 2, 0),
(90, 57893645, '14:00:00', '18:00:00', 1, 2, 1),
(91, 57893645, '09:00:00', '13:00:00', 1, 3, 0),
(92, 57893645, '14:00:00', '18:00:00', 1, 3, 1),
(93, 57893645, '09:00:00', '13:00:00', 1, 4, 0),
(94, 57893645, '14:00:00', '18:00:00', 1, 4, 1),
(95, 57893645, '09:00:00', '13:00:00', 1, 5, 0),
(96, 57893645, '14:00:00', '18:00:00', 1, 5, 1),
(97, 99000001, '09:00:00', '13:00:00', 2, 0, 0),
(98, 99000001, '14:00:00', '18:00:00', 2, 0, 1),
(99, 99000001, '09:00:00', '13:00:00', 2, 1, 0),
(100, 99000001, '14:00:00', '18:00:00', 2, 1, 1),
(101, 99000001, '09:00:00', '13:00:00', 2, 2, 0),
(102, 99000001, '14:00:00', '18:00:00', 2, 2, 1),
(103, 99000001, '09:00:00', '13:00:00', 2, 3, 0),
(104, 99000001, '14:00:00', '18:00:00', 2, 3, 1),
(105, 99000001, '09:00:00', '13:00:00', 2, 4, 0),
(106, 99000001, '14:00:00', '18:00:00', 2, 4, 1),
(107, 99000001, '09:00:00', '13:00:00', 2, 5, 0),
(108, 99000001, '14:00:00', '18:00:00', 2, 5, 1),
(109, 99000002, '09:00:00', '13:00:00', 2, 0, 0),
(110, 99000002, '14:00:00', '18:00:00', 2, 0, 1),
(111, 99000002, '09:00:00', '13:00:00', 2, 1, 0),
(112, 99000002, '14:00:00', '18:00:00', 2, 1, 1),
(113, 99000002, '09:00:00', '13:00:00', 2, 2, 0),
(114, 99000002, '14:00:00', '18:00:00', 2, 2, 1),
(115, 99000002, '09:00:00', '13:00:00', 2, 3, 0),
(116, 99000002, '14:00:00', '18:00:00', 2, 3, 1),
(117, 99000002, '09:00:00', '13:00:00', 2, 4, 0),
(118, 99000002, '14:00:00', '18:00:00', 2, 4, 1),
(119, 99000002, '09:00:00', '13:00:00', 2, 5, 0),
(120, 99000002, '14:00:00', '18:00:00', 2, 5, 1),
(121, 99000003, '09:00:00', '13:00:00', 3, 0, 0),
(122, 99000003, '14:00:00', '18:00:00', 3, 0, 1),
(123, 99000003, '09:00:00', '13:00:00', 3, 1, 0),
(124, 99000003, '14:00:00', '18:00:00', 3, 1, 1),
(125, 99000003, '09:00:00', '13:00:00', 3, 2, 0),
(126, 99000003, '14:00:00', '18:00:00', 3, 2, 1),
(127, 99000003, '09:00:00', '13:00:00', 3, 3, 0),
(128, 99000003, '14:00:00', '18:00:00', 3, 3, 1),
(129, 99000003, '09:00:00', '13:00:00', 3, 4, 0),
(130, 99000003, '14:00:00', '18:00:00', 3, 4, 1),
(131, 99000003, '09:00:00', '13:00:00', 3, 5, 0),
(132, 99000003, '14:00:00', '18:00:00', 3, 5, 1),
(133, 99000004, '09:00:00', '13:00:00', 3, 0, 0),
(134, 99000004, '14:00:00', '18:00:00', 3, 0, 1),
(135, 99000004, '09:00:00', '13:00:00', 3, 1, 0),
(136, 99000004, '14:00:00', '18:00:00', 3, 1, 1),
(137, 99000004, '09:00:00', '13:00:00', 3, 2, 0),
(138, 99000004, '14:00:00', '18:00:00', 3, 2, 1),
(139, 99000004, '09:00:00', '13:00:00', 3, 3, 0),
(140, 99000004, '14:00:00', '18:00:00', 3, 3, 1),
(141, 99000004, '09:00:00', '13:00:00', 3, 4, 0),
(142, 99000004, '14:00:00', '18:00:00', 3, 4, 1),
(143, 99000004, '09:00:00', '13:00:00', 3, 5, 0),
(144, 99000004, '14:00:00', '18:00:00', 3, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horariosucursales`
--

CREATE TABLE `horariosucursales` (
  `ID_HorarioSucursal` int UNSIGNED NOT NULL,
  `ID_DíaSemana` int UNSIGNED NOT NULL,
  `ID_Sucursal` int UNSIGNED NOT NULL,
  `Apertura` time NOT NULL DEFAULT '00:00:07',
  `Clausura` time NOT NULL DEFAULT '00:00:15'
) ;

--
-- Volcado de datos para la tabla `horariosucursales`
--

INSERT INTO `horariosucursales` (`ID_HorarioSucursal`, `ID_DíaSemana`, `ID_Sucursal`, `Apertura`, `Clausura`) VALUES
(19, 0, 1, '09:00:00', '19:00:00'),
(20, 1, 1, '09:00:00', '19:00:00'),
(21, 2, 1, '09:00:00', '19:00:00'),
(22, 3, 1, '09:00:00', '19:00:00'),
(23, 4, 1, '09:00:00', '19:00:00'),
(24, 5, 1, '09:00:00', '19:00:00'),
(25, 0, 2, '09:00:00', '19:00:00'),
(26, 1, 2, '09:00:00', '19:00:00'),
(27, 2, 2, '09:00:00', '19:00:00'),
(28, 3, 2, '09:00:00', '19:00:00'),
(29, 4, 2, '09:00:00', '19:00:00'),
(30, 5, 2, '09:00:00', '19:00:00'),
(31, 0, 3, '09:00:00', '19:00:00'),
(32, 1, 3, '09:00:00', '19:00:00'),
(33, 2, 3, '09:00:00', '19:00:00'),
(34, 3, 3, '09:00:00', '19:00:00'),
(35, 4, 3, '09:00:00', '19:00:00'),
(36, 5, 3, '09:00:00', '19:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metpago`
--

CREATE TABLE `metpago` (
  `ID_MetPago` int UNSIGNED NOT NULL,
  `NombreMetPago` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Descripción` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `metpago`
--

INSERT INTO `metpago` (`ID_MetPago`, `NombreMetPago`, `Descripción`) VALUES
(1, 'Efectivo', 'Pago en efectivo en la sucursal.'),
(2, 'Tarjeta', 'Tarjetas de débito y crédito.'),
(3, 'Transferencia', 'Transferencia bancaria o billetera virtual.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metpago_sucursales`
--

CREATE TABLE `metpago_sucursales` (
  `ID_Sucursal` int UNSIGNED NOT NULL,
  `ID_MetPago` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `metpago_sucursales`
--

INSERT INTO `metpago_sucursales` (`ID_Sucursal`, `ID_MetPago`) VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(2, 2),
(3, 2),
(1, 3),
(2, 3),
(3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `ID_Servicio` int UNSIGNED NOT NULL,
  `Nombre` varchar(100) COLLATE utf16_bin NOT NULL,
  `Descripción` varchar(500) COLLATE utf16_bin DEFAULT NULL,
  `Precio` int UNSIGNED NOT NULL DEFAULT '15000' COMMENT 'Valores en pesos argentinos (ARS)',
  `Duración` int UNSIGNED NOT NULL DEFAULT '30' COMMENT 'Estimado y en minutos.',
  `Vigente` tinyint(1) NOT NULL COMMENT 'Determinar si el servicio aún se da en el establecimiento.'
) ;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`ID_Servicio`, `Nombre`, `Descripción`, `Precio`, `Duración`, `Vigente`) VALUES
(0, 'Corte de pelo (tijeras)', 'Corte de pelo con tijeras', 17000, 40, 1),
(1, 'Corte de pelo (Máquina)', 'Corte de pelo a máquina', 15000, 20, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_sucursales`
--

CREATE TABLE `servicios_sucursales` (
  `ID_Sucursal` int UNSIGNED NOT NULL,
  `ID_Servicio` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='no todas las sucursales pueden dar todos los servicios.';

--
-- Volcado de datos para la tabla `servicios_sucursales`
--

INSERT INTO `servicios_sucursales` (`ID_Sucursal`, `ID_Servicio`) VALUES
(1, 0),
(2, 0),
(3, 0),
(1, 1),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `ID_Sucursal` int UNSIGNED NOT NULL,
  `NombreSucursal` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Capacidad` int UNSIGNED NOT NULL DEFAULT '7' COMMENT 'Marca la capacidad máxima de clientes en una sucursal al mismo tiempo',
  `ID_Calle` int UNSIGNED NOT NULL,
  `Altura` int UNSIGNED NOT NULL,
  `Vigencia` tinyint(1) NOT NULL
) ;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`ID_Sucursal`, `NombreSucursal`, `Capacidad`, `ID_Calle`, `Altura`, `Vigencia`) VALUES
(1, 'BARBERÍA APOLO', 7, 4, 339, 1),
(2, 'NICO barbershop', 7, 3, 333, 1),
(3, 'GOLDEN GATE SALON - BARBERÍA', 7, 1, 620, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE `turnos` (
  `ID_Turno` int UNSIGNED NOT NULL,
  `DNI_Barbero` int UNSIGNED NOT NULL,
  `DNI_Cliente` int UNSIGNED NOT NULL,
  `ID_Servicio` int UNSIGNED NOT NULL,
  `ID_Sucursal` int UNSIGNED NOT NULL DEFAULT '0',
  `ID_MetPago` int UNSIGNED NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `ID_Estado` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin COMMENT='Los turnos que se van registrando.';

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`ID_Turno`, `DNI_Barbero`, `DNI_Cliente`, `ID_Servicio`, `ID_Sucursal`, `ID_MetPago`, `Fecha`, `Hora`, `ID_Estado`) VALUES
(3, 37884829, 99100101, 0, 1, 1, '2026-11-23', '10:00:00', 0),
(4, 57893645, 99100102, 0, 1, 1, '2026-11-23', '10:00:00', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `barberos`
--
ALTER TABLE `barberos`
  ADD PRIMARY KEY (`DNI_Barbero`);

--
-- Indices de la tabla `barbero_servicio`
--
ALTER TABLE `barbero_servicio`
  ADD PRIMARY KEY (`DNI_Barbero`,`ID_Servicio`),
  ADD KEY `ID_Servicio` (`ID_Servicio`);

--
-- Indices de la tabla `calles`
--
ALTER TABLE `calles`
  ADD PRIMARY KEY (`ID_Calle`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`DNI_Cliente`);

--
-- Indices de la tabla `días_semana`
--
ALTER TABLE `días_semana`
  ADD PRIMARY KEY (`ID_DíaSemana`);

--
-- Indices de la tabla `estadoturnos`
--
ALTER TABLE `estadoturnos`
  ADD PRIMARY KEY (`ID_EstadoTurnos`);

--
-- Indices de la tabla `horariosbarberos`
--
ALTER TABLE `horariosbarberos`
  ADD PRIMARY KEY (`ID_Horario`),
  ADD KEY `DNI_Barbero` (`DNI_Barbero`),
  ADD KEY `ID_DíaSemana` (`ID_DíaSemana`),
  ADD KEY `ID_Servicio` (`ID_Servicio`),
  ADD KEY `fk_horarios_servicios_sucursales` (`ID_Sucursal`,`ID_Servicio`);

--
-- Indices de la tabla `horariosucursales`
--
ALTER TABLE `horariosucursales`
  ADD PRIMARY KEY (`ID_HorarioSucursal`),
  ADD KEY `ID_DíaSemana` (`ID_DíaSemana`),
  ADD KEY `ID_Sucursal` (`ID_Sucursal`);

--
-- Indices de la tabla `metpago`
--
ALTER TABLE `metpago`
  ADD PRIMARY KEY (`ID_MetPago`),
  ADD UNIQUE KEY `idx_nbrMetPag_unq` (`NombreMetPago`);

--
-- Indices de la tabla `metpago_sucursales`
--
ALTER TABLE `metpago_sucursales`
  ADD PRIMARY KEY (`ID_Sucursal`,`ID_MetPago`),
  ADD KEY `ID_MetPago` (`ID_MetPago`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`ID_Servicio`),
  ADD UNIQUE KEY `idx_nombreServ_unq` (`Nombre`);

--
-- Indices de la tabla `servicios_sucursales`
--
ALTER TABLE `servicios_sucursales`
  ADD PRIMARY KEY (`ID_Sucursal`,`ID_Servicio`),
  ADD KEY `ID_Servicio` (`ID_Servicio`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`ID_Sucursal`),
  ADD KEY `ID_Calle` (`ID_Calle`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`ID_Turno`),
  ADD KEY `DNI_Cliente` (`DNI_Cliente`),
  ADD KEY `ID_Servicio` (`ID_Servicio`),
  ADD KEY `Suc_Serv` (`ID_Sucursal`,`ID_Servicio`),
  ADD KEY `Barb_Serv` (`DNI_Barbero`,`ID_Servicio`),
  ADD KEY `ID_Estado` (`ID_Estado`),
  ADD KEY `ID_MetPago` (`ID_MetPago`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calles`
--
ALTER TABLE `calles`
  MODIFY `ID_Calle` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `días_semana`
--
ALTER TABLE `días_semana`
  MODIFY `ID_DíaSemana` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `estadoturnos`
--
ALTER TABLE `estadoturnos`
  MODIFY `ID_EstadoTurnos` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `horariosbarberos`
--
ALTER TABLE `horariosbarberos`
  MODIFY `ID_Horario` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horariosucursales`
--
ALTER TABLE `horariosucursales`
  MODIFY `ID_HorarioSucursal` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metpago`
--
ALTER TABLE `metpago`
  MODIFY `ID_MetPago` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `ID_Servicio` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `ID_Sucursal` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `turnos`
--
ALTER TABLE `turnos`
  MODIFY `ID_Turno` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `barbero_servicio`
--
ALTER TABLE `barbero_servicio`
  ADD CONSTRAINT `barbero_servicio_ibfk_1` FOREIGN KEY (`DNI_Barbero`) REFERENCES `barberos` (`DNI_Barbero`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `barbero_servicio_ibfk_2` FOREIGN KEY (`ID_Servicio`) REFERENCES `servicios` (`ID_Servicio`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `horariosbarberos`
--
ALTER TABLE `horariosbarberos`
  ADD CONSTRAINT `fk_horarios_servicios_sucursales` FOREIGN KEY (`ID_Sucursal`,`ID_Servicio`) REFERENCES `servicios_sucursales` (`ID_Sucursal`, `ID_Servicio`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `horariosbarberos_ibfk_1` FOREIGN KEY (`DNI_Barbero`) REFERENCES `barberos` (`DNI_Barbero`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `horariosbarberos_ibfk_2` FOREIGN KEY (`ID_DíaSemana`) REFERENCES `días_semana` (`ID_DíaSemana`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `horariosbarberos_ibfk_3` FOREIGN KEY (`ID_Servicio`) REFERENCES `servicios` (`ID_Servicio`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `horariosbarberos_ibfk_4` FOREIGN KEY (`ID_Sucursal`) REFERENCES `sucursales` (`ID_Sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `horariosucursales`
--
ALTER TABLE `horariosucursales`
  ADD CONSTRAINT `horariosucursales_ibfk_1` FOREIGN KEY (`ID_DíaSemana`) REFERENCES `días_semana` (`ID_DíaSemana`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `horariosucursales_ibfk_2` FOREIGN KEY (`ID_Sucursal`) REFERENCES `sucursales` (`ID_Sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `metpago_sucursales`
--
ALTER TABLE `metpago_sucursales`
  ADD CONSTRAINT `metpago_sucursales_ibfk_1` FOREIGN KEY (`ID_MetPago`) REFERENCES `metpago` (`ID_MetPago`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `metpago_sucursales_ibfk_2` FOREIGN KEY (`ID_Sucursal`) REFERENCES `sucursales` (`ID_Sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `servicios_sucursales`
--
ALTER TABLE `servicios_sucursales`
  ADD CONSTRAINT `servicios_sucursales_ibfk_1` FOREIGN KEY (`ID_Servicio`) REFERENCES `servicios` (`ID_Servicio`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `servicios_sucursales_ibfk_2` FOREIGN KEY (`ID_Sucursal`) REFERENCES `sucursales` (`ID_Sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD CONSTRAINT `sucursales_ibfk_1` FOREIGN KEY (`ID_Calle`) REFERENCES `calles` (`ID_Calle`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD CONSTRAINT `Barb_Serv` FOREIGN KEY (`DNI_Barbero`,`ID_Servicio`) REFERENCES `barbero_servicio` (`DNI_Barbero`, `ID_Servicio`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Suc_Serv` FOREIGN KEY (`ID_Sucursal`,`ID_Servicio`) REFERENCES `servicios_sucursales` (`ID_Sucursal`, `ID_Servicio`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `turnos_ibfk_1` FOREIGN KEY (`DNI_Cliente`) REFERENCES `clientes` (`DNI_Cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `turnos_ibfk_2` FOREIGN KEY (`DNI_Barbero`) REFERENCES `barberos` (`DNI_Barbero`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `turnos_ibfk_3` FOREIGN KEY (`ID_Servicio`) REFERENCES `servicios` (`ID_Servicio`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `turnos_ibfk_4` FOREIGN KEY (`ID_Estado`) REFERENCES `estadoturnos` (`ID_EstadoTurnos`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `turnos_ibfk_5` FOREIGN KEY (`ID_Sucursal`) REFERENCES `sucursales` (`ID_Sucursal`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `turnos_ibfk_6` FOREIGN KEY (`ID_MetPago`) REFERENCES `metpago` (`ID_MetPago`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;