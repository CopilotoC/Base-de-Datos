-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 24-08-2026 a las 20:07:05
-- Versión del servidor: 8.4.10-0ubuntu0.26.04.1
-- Versión de PHP: 8.5.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `TP7_Rol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atributos`
--

CREATE TABLE `atributos` (
  `ID_Atributo` int UNSIGNED NOT NULL,
  `NombreAtributo` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `DescripciónAtributo` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atributos_especies`
--

CREATE TABLE `atributos_especies` (
  `ID_Atributo+` int UNSIGNED NOT NULL,
  `ID_Atributo-` int UNSIGNED NOT NULL,
  `ID_Especie` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atributo_personaje`
--

CREATE TABLE `atributo_personaje` (
  `ID_Atributo` int UNSIGNED NOT NULL,
  `ID_Personaje` int UNSIGNED NOT NULL,
  `Valor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bagajes`
--

CREATE TABLE `bagajes` (
  `ID_Bagaje` int NOT NULL,
  `NombreBagaje` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `DescripciónBagaje` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `ID_DoteHabilidad` int UNSIGNED NOT NULL,
  `ID_Saber` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoríalugares`
--

CREATE TABLE `categoríalugares` (
  `ID_CatLugares` int UNSIGNED NOT NULL,
  `NombreCategoríaLugares` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

CREATE TABLE `clases` (
  `ID_Clase` int NOT NULL,
  `NombreClase` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `DescrpciónClase` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `ID_Atributo` int UNSIGNED NOT NULL,
  `ptsGolpe` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Conjuros`
--

CREATE TABLE `Conjuros` (
  `ID_Conjuro` int UNSIGNED NOT NULL,
  `NombreConjuro` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `RangoConjuro` int UNSIGNED NOT NULL,
  `Area` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `Distancia` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `Objetivo` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `Duración` int DEFAULT NULL,
  `Desencadenante` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `Efecto` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Conjuros_Personajes`
--

CREATE TABLE `Conjuros_Personajes` (
  `ID_Conjuro` int UNSIGNED NOT NULL,
  `ID_Personaje` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Conjuros_Rasgos`
--

CREATE TABLE `Conjuros_Rasgos` (
  `ID_Conjuro` int UNSIGNED NOT NULL,
  `ID_Rasgo` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Conjuros_tradiciones`
--

CREATE TABLE `Conjuros_tradiciones` (
  `ID_Conjuro` int UNSIGNED NOT NULL,
  `ID_Tradición` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dotehabilidades`
--

CREATE TABLE `dotehabilidades` (
  `ID_Habilidad` int UNSIGNED NOT NULL,
  `NombreHabilidad` varchar(50) CHARACTER SET utf32 COLLATE utf32_bin NOT NULL,
  `ID_Atributo` int UNSIGNED NOT NULL,
  `ID_Rasgos` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dotesascendencia`
--

CREATE TABLE `dotesascendencia` (
  `ID_DoteAscendencia` int NOT NULL,
  `NombreDoteAsc` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Nivel` int NOT NULL,
  `ID_Especie` int NOT NULL,
  `Descripción` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Efecto` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Prerrequisitos` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Frecuencia` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `ID_Rareza` int NOT NULL,
  `Desencadenante` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `ID_Rasgo` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Acordate de enlazar las FK de esta tabla';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especies`
--

CREATE TABLE `especies` (
  `ID_Especie` int NOT NULL,
  `NombreEspecie` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `PtoGolpe` int NOT NULL,
  `Descripción` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Velocidad` int NOT NULL,
  `Tamaño` int UNSIGNED NOT NULL,
  `Rasgo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herencias`
--

CREATE TABLE `herencias` (
  `ID_Herencia` int NOT NULL,
  `NombreHerencia` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `DescripciónHerencia` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Efecto` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `ID_Especie` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomas`
--

CREATE TABLE `idiomas` (
  `ID_Idioma` int NOT NULL,
  `NombreIdioma` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `ID_Rareza` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugares`
--

CREATE TABLE `lugares` (
  `ID_Lugar` int NOT NULL,
  `NombreLugar` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `ID_CatLugar` int UNSIGNED NOT NULL,
  `DescripciónLugar` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `ContenidoPor` int NOT NULL,
  `ID_PtoCardin` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestría`
--

CREATE TABLE `maestría` (
  `ID_Maestría` int UNSIGNED NOT NULL,
  `NombreMaestría` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Bonificador` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `percepción`
--

CREATE TABLE `percepción` (
  `ID_Atributo` int UNSIGNED NOT NULL COMMENT 'Se supone que siempre apunta a Sabiduría',
  `ID_Personaje` int UNSIGNED NOT NULL,
  `ID_Maestría` int UNSIGNED NOT NULL,
  `Valor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajes`
--

CREATE TABLE `personajes` (
  `ID_Personaje` int UNSIGNED NOT NULL,
  `NombrePersonaje` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `NombreJugador` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Nivel` int NOT NULL,
  `PuntosEXP` int NOT NULL,
  `PuntosHéroe` int NOT NULL,
  `ID_Ascendencia` int NOT NULL,
  `ID_Bagaje` int NOT NULL,
  `ID_Clase` int NOT NULL,
  `ID_Tamaño` int NOT NULL,
  `ID_Herencia` int NOT NULL,
  `PuntosGolpeMAX` int NOT NULL,
  `GrupoÉtnico` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Nacionalidad` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `ID_LugarNacimiento` int NOT NULL,
  `Edad` int NOT NULL,
  `Género` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Altura` double NOT NULL,
  `Peso` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajes_habilidades`
--

CREATE TABLE `personajes_habilidades` (
  `ID_Personaje` int UNSIGNED NOT NULL,
  `ID_Habilidad` int UNSIGNED NOT NULL,
  `ID_Maestría` int UNSIGNED NOT NULL,
  `Valor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntoscardinales`
--

CREATE TABLE `puntoscardinales` (
  `ID_ptoCardin` int UNSIGNED NOT NULL,
  `NombrePtoCardin` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rarezas`
--

CREATE TABLE `rarezas` (
  `ID_Rareza` int UNSIGNED NOT NULL,
  `NombreRareza` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgos`
--

CREATE TABLE `rasgos` (
  `ID_Rasgo` int UNSIGNED NOT NULL,
  `NombreRasgo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `DescripciónRasgo` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saberes`
--

CREATE TABLE `saberes` (
  `ID_Saber` int UNSIGNED NOT NULL,
  `NombreSaber` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Saberes varios asociados al Atributo Inteligencia';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salvación`
--

CREATE TABLE `salvación` (
  `ID_Salvación` int UNSIGNED NOT NULL,
  `NombreSalvación` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `ID_Atributo` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tamaños`
--

CREATE TABLE `tamaños` (
  `ID_Tamaño` int UNSIGNED NOT NULL,
  `NombreTamaño` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tradiciones`
--

CREATE TABLE `Tradiciones` (
  `ID_Tradición` int UNSIGNED NOT NULL,
  `NombreTradición` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `atributos`
--
ALTER TABLE `atributos`
  ADD PRIMARY KEY (`ID_Atributo`),
  ADD UNIQUE KEY `idxNmrAtrUnq` (`NombreAtributo`);

--
-- Indices de la tabla `atributos_especies`
--
ALTER TABLE `atributos_especies`
  ADD PRIMARY KEY (`ID_Especie`),
  ADD KEY `ID_Atributo+` (`ID_Atributo+`),
  ADD KEY `ID_Atributo-` (`ID_Atributo-`);

--
-- Indices de la tabla `atributo_personaje`
--
ALTER TABLE `atributo_personaje`
  ADD PRIMARY KEY (`ID_Atributo`),
  ADD KEY `ID_Personaje` (`ID_Personaje`);

--
-- Indices de la tabla `bagajes`
--
ALTER TABLE `bagajes`
  ADD PRIMARY KEY (`ID_Bagaje`),
  ADD KEY `ID_DoteHabilidad` (`ID_DoteHabilidad`),
  ADD KEY `bagajes_ibfk_3` (`ID_Saber`);

--
-- Indices de la tabla `categoríalugares`
--
ALTER TABLE `categoríalugares`
  ADD PRIMARY KEY (`ID_CatLugares`),
  ADD UNIQUE KEY `idxNomCatLug_unq` (`NombreCategoríaLugares`);

--
-- Indices de la tabla `clases`
--
ALTER TABLE `clases`
  ADD PRIMARY KEY (`ID_Clase`),
  ADD KEY `ID_Atributo` (`ID_Atributo`);

--
-- Indices de la tabla `Conjuros`
--
ALTER TABLE `Conjuros`
  ADD PRIMARY KEY (`ID_Conjuro`),
  ADD UNIQUE KEY `idx:unq_nbrConj` (`NombreConjuro`);

--
-- Indices de la tabla `Conjuros_Personajes`
--
ALTER TABLE `Conjuros_Personajes`
  ADD PRIMARY KEY (`ID_Conjuro`,`ID_Personaje`),
  ADD KEY `ID_Personaje` (`ID_Personaje`);

--
-- Indices de la tabla `Conjuros_Rasgos`
--
ALTER TABLE `Conjuros_Rasgos`
  ADD PRIMARY KEY (`ID_Conjuro`),
  ADD KEY `ID_Rasgo` (`ID_Rasgo`);

--
-- Indices de la tabla `Conjuros_tradiciones`
--
ALTER TABLE `Conjuros_tradiciones`
  ADD PRIMARY KEY (`ID_Conjuro`),
  ADD KEY `ID_Tradición` (`ID_Tradición`);

--
-- Indices de la tabla `dotehabilidades`
--
ALTER TABLE `dotehabilidades`
  ADD PRIMARY KEY (`ID_Habilidad`),
  ADD KEY `ID_Atributo` (`ID_Atributo`),
  ADD KEY `ID_Rasgos` (`ID_Rasgos`);

--
-- Indices de la tabla `dotesascendencia`
--
ALTER TABLE `dotesascendencia`
  ADD PRIMARY KEY (`ID_DoteAscendencia`),
  ADD KEY `ID_Especie` (`ID_Especie`),
  ADD KEY `ID_Rasgo` (`ID_Rasgo`);

--
-- Indices de la tabla `especies`
--
ALTER TABLE `especies`
  ADD PRIMARY KEY (`ID_Especie`),
  ADD KEY `Tamaño` (`Tamaño`);

--
-- Indices de la tabla `herencias`
--
ALTER TABLE `herencias`
  ADD PRIMARY KEY (`ID_Herencia`),
  ADD KEY `ID_Especie` (`ID_Especie`);

--
-- Indices de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  ADD PRIMARY KEY (`ID_Idioma`),
  ADD KEY `ID_Rareza` (`ID_Rareza`);

--
-- Indices de la tabla `lugares`
--
ALTER TABLE `lugares`
  ADD PRIMARY KEY (`ID_Lugar`),
  ADD KEY `ID_CatLugar` (`ID_CatLugar`),
  ADD KEY `ID_PtoCardin` (`ID_PtoCardin`);

--
-- Indices de la tabla `maestría`
--
ALTER TABLE `maestría`
  ADD PRIMARY KEY (`ID_Maestría`);

--
-- Indices de la tabla `percepción`
--
ALTER TABLE `percepción`
  ADD PRIMARY KEY (`ID_Atributo`,`ID_Personaje`,`ID_Maestría`),
  ADD KEY `ID_Maestría` (`ID_Maestría`),
  ADD KEY `ID_Personaje` (`ID_Personaje`);

--
-- Indices de la tabla `personajes`
--
ALTER TABLE `personajes`
  ADD PRIMARY KEY (`ID_Personaje`),
  ADD KEY `ID_Ascendencia` (`ID_Ascendencia`),
  ADD KEY `ID_Bagaje` (`ID_Bagaje`),
  ADD KEY `ID_Clase` (`ID_Clase`),
  ADD KEY `ID_Herencia` (`ID_Herencia`),
  ADD KEY `ID_LugarNacimiento` (`ID_LugarNacimiento`);

--
-- Indices de la tabla `personajes_habilidades`
--
ALTER TABLE `personajes_habilidades`
  ADD KEY `ID_Habilidad` (`ID_Habilidad`),
  ADD KEY `ID_Maestría` (`ID_Maestría`),
  ADD KEY `ID_Personaje` (`ID_Personaje`);

--
-- Indices de la tabla `puntoscardinales`
--
ALTER TABLE `puntoscardinales`
  ADD PRIMARY KEY (`ID_ptoCardin`),
  ADD UNIQUE KEY `idx_unq_nbrPtoCardin` (`NombrePtoCardin`);

--
-- Indices de la tabla `rarezas`
--
ALTER TABLE `rarezas`
  ADD PRIMARY KEY (`ID_Rareza`),
  ADD UNIQUE KEY `idx_unq_NmrRrz` (`NombreRareza`);

--
-- Indices de la tabla `rasgos`
--
ALTER TABLE `rasgos`
  ADD PRIMARY KEY (`ID_Rasgo`);

--
-- Indices de la tabla `saberes`
--
ALTER TABLE `saberes`
  ADD PRIMARY KEY (`ID_Saber`);

--
-- Indices de la tabla `salvación`
--
ALTER TABLE `salvación`
  ADD KEY `ID_Atributo` (`ID_Atributo`);

--
-- Indices de la tabla `tamaños`
--
ALTER TABLE `tamaños`
  ADD PRIMARY KEY (`ID_Tamaño`);

--
-- Indices de la tabla `Tradiciones`
--
ALTER TABLE `Tradiciones`
  ADD PRIMARY KEY (`ID_Tradición`),
  ADD UNIQUE KEY `idx_nbrTdc_unq` (`NombreTradición`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `atributos`
--
ALTER TABLE `atributos`
  MODIFY `ID_Atributo` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoríalugares`
--
ALTER TABLE `categoríalugares`
  MODIFY `ID_CatLugares` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Conjuros`
--
ALTER TABLE `Conjuros`
  MODIFY `ID_Conjuro` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dotehabilidades`
--
ALTER TABLE `dotehabilidades`
  MODIFY `ID_Habilidad` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personajes`
--
ALTER TABLE `personajes`
  MODIFY `ID_Personaje` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `puntoscardinales`
--
ALTER TABLE `puntoscardinales`
  MODIFY `ID_ptoCardin` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rarezas`
--
ALTER TABLE `rarezas`
  MODIFY `ID_Rareza` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rasgos`
--
ALTER TABLE `rasgos`
  MODIFY `ID_Rasgo` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `saberes`
--
ALTER TABLE `saberes`
  MODIFY `ID_Saber` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tamaños`
--
ALTER TABLE `tamaños`
  MODIFY `ID_Tamaño` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Tradiciones`
--
ALTER TABLE `Tradiciones`
  MODIFY `ID_Tradición` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `atributos_especies`
--
ALTER TABLE `atributos_especies`
  ADD CONSTRAINT `atributos_especies_ibfk_1` FOREIGN KEY (`ID_Atributo+`) REFERENCES `atributos` (`ID_Atributo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `atributos_especies_ibfk_2` FOREIGN KEY (`ID_Atributo-`) REFERENCES `atributos` (`ID_Atributo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `atributos_especies_ibfk_3` FOREIGN KEY (`ID_Especie`) REFERENCES `especies` (`ID_Especie`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `atributo_personaje`
--
ALTER TABLE `atributo_personaje`
  ADD CONSTRAINT `atributo_personaje_ibfk_1` FOREIGN KEY (`ID_Personaje`) REFERENCES `personajes` (`ID_Personaje`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `atributo_personaje_ibfk_2` FOREIGN KEY (`ID_Atributo`) REFERENCES `atributos` (`ID_Atributo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `bagajes`
--
ALTER TABLE `bagajes`
  ADD CONSTRAINT `bagajes_ibfk_1` FOREIGN KEY (`ID_DoteHabilidad`) REFERENCES `dotehabilidades` (`ID_Habilidad`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `bagajes_ibfk_2` FOREIGN KEY (`ID_Saber`) REFERENCES `saberes` (`ID_Saber`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `bagajes_ibfk_3` FOREIGN KEY (`ID_Saber`) REFERENCES `saberes` (`ID_Saber`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `clases`
--
ALTER TABLE `clases`
  ADD CONSTRAINT `clases_ibfk_1` FOREIGN KEY (`ID_Atributo`) REFERENCES `atributos` (`ID_Atributo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Conjuros_Personajes`
--
ALTER TABLE `Conjuros_Personajes`
  ADD CONSTRAINT `Conjuros_Personajes_ibfk_1` FOREIGN KEY (`ID_Conjuro`) REFERENCES `Conjuros` (`ID_Conjuro`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Conjuros_Personajes_ibfk_2` FOREIGN KEY (`ID_Personaje`) REFERENCES `personajes` (`ID_Personaje`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Conjuros_Rasgos`
--
ALTER TABLE `Conjuros_Rasgos`
  ADD CONSTRAINT `Conjuros_Rasgos_ibfk_1` FOREIGN KEY (`ID_Conjuro`) REFERENCES `Conjuros` (`ID_Conjuro`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Conjuros_Rasgos_ibfk_2` FOREIGN KEY (`ID_Rasgo`) REFERENCES `rasgos` (`ID_Rasgo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Conjuros_tradiciones`
--
ALTER TABLE `Conjuros_tradiciones`
  ADD CONSTRAINT `Conjuros_tradiciones_ibfk_1` FOREIGN KEY (`ID_Conjuro`) REFERENCES `Conjuros` (`ID_Conjuro`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Conjuros_tradiciones_ibfk_2` FOREIGN KEY (`ID_Tradición`) REFERENCES `Tradiciones` (`ID_Tradición`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `dotehabilidades`
--
ALTER TABLE `dotehabilidades`
  ADD CONSTRAINT `dotehabilidades_ibfk_1` FOREIGN KEY (`ID_Atributo`) REFERENCES `atributos` (`ID_Atributo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `dotehabilidades_ibfk_2` FOREIGN KEY (`ID_Rasgos`) REFERENCES `rasgos` (`ID_Rasgo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `dotesascendencia`
--
ALTER TABLE `dotesascendencia`
  ADD CONSTRAINT `dotesascendencia_ibfk_1` FOREIGN KEY (`ID_Especie`) REFERENCES `especies` (`ID_Especie`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `dotesascendencia_ibfk_2` FOREIGN KEY (`ID_Rasgo`) REFERENCES `rasgos` (`ID_Rasgo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `especies`
--
ALTER TABLE `especies`
  ADD CONSTRAINT `especies_ibfk_1` FOREIGN KEY (`Tamaño`) REFERENCES `tamaños` (`ID_Tamaño`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `herencias`
--
ALTER TABLE `herencias`
  ADD CONSTRAINT `herencias_ibfk_1` FOREIGN KEY (`ID_Especie`) REFERENCES `especies` (`ID_Especie`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `idiomas`
--
ALTER TABLE `idiomas`
  ADD CONSTRAINT `idiomas_ibfk_1` FOREIGN KEY (`ID_Rareza`) REFERENCES `rarezas` (`ID_Rareza`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `lugares`
--
ALTER TABLE `lugares`
  ADD CONSTRAINT `lugares_ibfk_1` FOREIGN KEY (`ID_CatLugar`) REFERENCES `categoríalugares` (`ID_CatLugares`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `lugares_ibfk_2` FOREIGN KEY (`ID_PtoCardin`) REFERENCES `puntoscardinales` (`ID_ptoCardin`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `percepción`
--
ALTER TABLE `percepción`
  ADD CONSTRAINT `percepción_ibfk_1` FOREIGN KEY (`ID_Atributo`) REFERENCES `atributos` (`ID_Atributo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `percepción_ibfk_2` FOREIGN KEY (`ID_Maestría`) REFERENCES `maestría` (`ID_Maestría`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `percepción_ibfk_3` FOREIGN KEY (`ID_Personaje`) REFERENCES `personajes` (`ID_Personaje`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `personajes`
--
ALTER TABLE `personajes`
  ADD CONSTRAINT `personajes_ibfk_1` FOREIGN KEY (`ID_Ascendencia`) REFERENCES `especies` (`ID_Especie`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `personajes_ibfk_2` FOREIGN KEY (`ID_Bagaje`) REFERENCES `bagajes` (`ID_Bagaje`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `personajes_ibfk_3` FOREIGN KEY (`ID_Clase`) REFERENCES `clases` (`ID_Clase`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `personajes_ibfk_4` FOREIGN KEY (`ID_Herencia`) REFERENCES `herencias` (`ID_Herencia`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `personajes_ibfk_5` FOREIGN KEY (`ID_LugarNacimiento`) REFERENCES `lugares` (`ID_Lugar`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `personajes_habilidades`
--
ALTER TABLE `personajes_habilidades`
  ADD CONSTRAINT `personajes_habilidades_ibfk_1` FOREIGN KEY (`ID_Habilidad`) REFERENCES `dotehabilidades` (`ID_Habilidad`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `personajes_habilidades_ibfk_2` FOREIGN KEY (`ID_Maestría`) REFERENCES `maestría` (`ID_Maestría`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `personajes_habilidades_ibfk_3` FOREIGN KEY (`ID_Personaje`) REFERENCES `personajes` (`ID_Personaje`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `salvación`
--
ALTER TABLE `salvación`
  ADD CONSTRAINT `salvación_ibfk_1` FOREIGN KEY (`ID_Atributo`) REFERENCES `atributos` (`ID_Atributo`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
