-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-12-2020 a las 20:55:00
-- Versión del servidor: 10.4.16-MariaDB
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jardines`
--

DELIMITER $$
--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `valida_usr` (`nameuser` VARCHAR(60), `pass` VARCHAR(60)) RETURNS INT(11) SQL SECURITY INVOKER
BEGIN
    DECLARE _tipo  INT DEFAULT 0;
    SET _tipo  = ( SELECT tipo FROM usuarios where user=nameuser and password=pass );
    RETURN _tipo ;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `domicilio` varchar(60) NOT NULL,
  `rfc` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `telefono` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `domicilio`, `rfc`, `email`, `telefono`) VALUES
(1, 'Faris', 'Valle 23', 'asder34t555y', 'oakaj@gmail.com', 3421059),
(4, 'hh', 'hh', 'hh', 'hh', 20033);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente-contrato`
--

CREATE TABLE `cliente-contrato` (
  `id_cliente` int(11) NOT NULL,
  `id_contrato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `id_contrato` int(11) NOT NULL,
  `duracion` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `contrato`
--

INSERT INTO `contrato` (`id_contrato`, `duracion`) VALUES
(1, '3 meses'),
(4, '1 mes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato_jardin`
--

CREATE TABLE `contrato_jardin` (
  `id_contrato` int(11) NOT NULL,
  `id_jardin` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `domicilio` varchar(60) NOT NULL,
  `rfc` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `telefono` int(16) NOT NULL,
  `idtipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_tareas_jardin`
--

CREATE TABLE `empleado_tareas_jardin` (
  `id_tareas_jardin` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jardin`
--

CREATE TABLE `jardin` (
  `id_jardin` int(11) NOT NULL,
  `extension` int(11) NOT NULL,
  `tiempodedicado` float NOT NULL,
  `tipojardin` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jardin_planta`
--

CREATE TABLE `jardin_planta` (
  `id_jardin` int(11) NOT NULL,
  `id_planta` int(11) NOT NULL,
  `cantplanta` int(11) NOT NULL,
  `tipo_planta` varchar(60) NOT NULL,
  `fecha_plantacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiales`
--

CREATE TABLE `materiales` (
  `id_materiales` int(11) NOT NULL,
  `abonos` varchar(60) NOT NULL,
  `tipotierra` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planta`
--

CREATE TABLE `planta` (
  `id_planta` int(11) NOT NULL,
  `aspecto` varchar(60) NOT NULL,
  `tipohjas` varchar(60) NOT NULL,
  `tipoflores` varchar(60) NOT NULL,
  `floracion` varchar(60) NOT NULL,
  `origen` varchar(60) NOT NULL,
  `fampertenece` varchar(60) NOT NULL,
  `temporada` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id_tareas` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `tiempo` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas_jardin`
--

CREATE TABLE `tareas_jardin` (
  `id_tareas_jardin` int(11) NOT NULL,
  `id_jardin` int(11) NOT NULL,
  `id_tareas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas_materiales`
--

CREATE TABLE `tareas_materiales` (
  `id_tareas` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_materiales` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `user` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `tipo` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `user`, `password`, `tipo`) VALUES
(1, 'qwerty', '1234', '1'),
(2, 'esteban', '12', '2'),
(3, 'omar', '1', '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `cliente-contrato`
--
ALTER TABLE `cliente-contrato`
  ADD KEY `fk-cliente` (`id_cliente`),
  ADD KEY `fk-contrato` (`id_contrato`);

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`id_contrato`);

--
-- Indices de la tabla `contrato_jardin`
--
ALTER TABLE `contrato_jardin`
  ADD KEY `fk-emplead` (`id_empleado`),
  ADD KEY `fk_contrat` (`id_contrato`),
  ADD KEY `id_jard` (`id_jardin`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `empleado_tareas_jardin`
--
ALTER TABLE `empleado_tareas_jardin`
  ADD KEY `fk-tareasjardin` (`id_tareas_jardin`),
  ADD KEY `fk-empleado` (`id_empleado`);

--
-- Indices de la tabla `jardin`
--
ALTER TABLE `jardin`
  ADD PRIMARY KEY (`id_jardin`);

--
-- Indices de la tabla `jardin_planta`
--
ALTER TABLE `jardin_planta`
  ADD KEY `fk-jard` (`id_jardin`),
  ADD KEY `fk_plant` (`id_planta`);

--
-- Indices de la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD PRIMARY KEY (`id_materiales`);

--
-- Indices de la tabla `planta`
--
ALTER TABLE `planta`
  ADD PRIMARY KEY (`id_planta`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id_tareas`);

--
-- Indices de la tabla `tareas_jardin`
--
ALTER TABLE `tareas_jardin`
  ADD PRIMARY KEY (`id_tareas_jardin`),
  ADD KEY `fk_jardinplanta` (`id_jardin`),
  ADD KEY `fk-tareas` (`id_tareas`);

--
-- Indices de la tabla `tareas_materiales`
--
ALTER TABLE `tareas_materiales`
  ADD KEY `fk_tarea` (`id_tareas`),
  ADD KEY `fk-mater` (`id_materiales`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `contrato`
--
ALTER TABLE `contrato`
  MODIFY `id_contrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jardin`
--
ALTER TABLE `jardin`
  MODIFY `id_jardin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materiales`
--
ALTER TABLE `materiales`
  MODIFY `id_materiales` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `planta`
--
ALTER TABLE `planta`
  MODIFY `id_planta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id_tareas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tareas_jardin`
--
ALTER TABLE `tareas_jardin`
  MODIFY `id_tareas_jardin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente-contrato`
--
ALTER TABLE `cliente-contrato`
  ADD CONSTRAINT `fk-cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-contrato` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id_contrato`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `contrato_jardin`
--
ALTER TABLE `contrato_jardin`
  ADD CONSTRAINT `fk-emplead` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_contrat` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id_contrato`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_jard` FOREIGN KEY (`id_jardin`) REFERENCES `jardin` (`id_jardin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado_tareas_jardin`
--
ALTER TABLE `empleado_tareas_jardin`
  ADD CONSTRAINT `fk-empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-tareasjardin` FOREIGN KEY (`id_tareas_jardin`) REFERENCES `tareas_jardin` (`id_tareas_jardin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `jardin_planta`
--
ALTER TABLE `jardin_planta`
  ADD CONSTRAINT `fk-jard` FOREIGN KEY (`id_jardin`) REFERENCES `jardin` (`id_jardin`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_plant` FOREIGN KEY (`id_planta`) REFERENCES `planta` (`id_planta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD CONSTRAINT `materiales_ibfk_1` FOREIGN KEY (`id_materiales`) REFERENCES `tareas_materiales` (`id_materiales`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `fk-tareas-jardin` FOREIGN KEY (`id_tareas`) REFERENCES `tareas_jardin` (`id_tareas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tareas_jardin`
--
ALTER TABLE `tareas_jardin`
  ADD CONSTRAINT `fk-tareas` FOREIGN KEY (`id_tareas`) REFERENCES `tareas` (`id_tareas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jardinplanta` FOREIGN KEY (`id_jardin`) REFERENCES `jardin_planta` (`id_jardin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tareas_materiales`
--
ALTER TABLE `tareas_materiales`
  ADD CONSTRAINT `fk-mater` FOREIGN KEY (`id_materiales`) REFERENCES `materiales` (`id_materiales`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tarea` FOREIGN KEY (`id_tareas`) REFERENCES `tareas` (`id_tareas`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
