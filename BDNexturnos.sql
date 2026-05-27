-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-05-2026 a las 02:01:47
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
-- Base de datos: `proyectos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id_notif` int(11) NOT NULL,
  `id_reserva` int(11) NOT NULL,
  `mensaje` text DEFAULT NULL,
  `enviado_en` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `id_personal` int(11) NOT NULL,
  `id_negocio` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id_personal`, `id_negocio`, `nombre`, `cargo`, `hora_inicio`, `hora_fin`, `activo`, `foto`) VALUES
(7, 11, 'Tuno', 'Peluquero', '08:30:00', '17:30:00', 1, NULL),
(8, 11, 'Tunein', 'Peluquero', '08:30:00', '17:30:00', 1, NULL),
(9, 12, 'Andres Caceres', 'Barbero', '08:30:00', '17:30:00', 1, NULL),
(10, 12, 'Jose Abarca', 'Peluquero', '08:30:00', '17:30:00', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_servicio`
--

CREATE TABLE `personal_servicio` (
  `id_personal_servicio` int(11) NOT NULL,
  `id_personal` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personal_servicio`
--

INSERT INTO `personal_servicio` (`id_personal_servicio`, `id_personal`, `id_servicio`) VALUES
(19, 7, 6),
(20, 8, 7),
(24, 10, 10),
(33, 9, 8),
(34, 9, 9),
(35, 9, 10),
(36, 9, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id_reserva` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_servicio` int(11) NOT NULL,
  `id_personal` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `estado` enum('pendiente','confirmada','cancelada','vencida') DEFAULT 'pendiente',
  `cliente_nombre` varchar(100) DEFAULT NULL,
  `cliente_apellido` varchar(100) DEFAULT NULL,
  `cliente_numero` varchar(30) DEFAULT NULL,
  `cliente_email` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id_reserva`, `id_usuario`, `id_servicio`, `id_personal`, `fecha`, `hora`, `estado`, `cliente_nombre`, `cliente_apellido`, `cliente_numero`, `cliente_email`) VALUES
(7, NULL, 6, 8, '2026-05-25', '08:30:00', 'pendiente', 'Felipe ', 'Roa', '967043198', 'felipe@gmail.com'),
(9, NULL, 6, 7, '2026-05-30', '12:00:00', 'pendiente', 'Martin ', 'Abarca', '967043198', 'martin@gmail.com'),
(10, NULL, 10, 9, '2026-05-30', '12:30:00', 'pendiente', 'Martin ', 'Abarca', '967043198', 'martin@gmail.com'),
(11, NULL, 10, 9, '2026-05-30', '12:30:00', 'pendiente', 'Martin ', 'Abarca', '967043198', 'martin@gmail.com'),
(12, NULL, 10, 10, '2026-05-30', '13:00:00', 'pendiente', 'Martin ', 'Abarca', '967043198', 'martin@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL,
  `id_negocio` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `duracion` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id_servicio`, `id_negocio`, `nombre`, `duracion`, `precio`) VALUES
(6, 11, 'Corte de Pelo Mujer ', 60, '20000.00'),
(7, 11, 'Alisado Permanente ', 120, '30000.00'),
(8, 12, 'Degradado Hombre ', 30, '10000.00'),
(9, 12, 'Degradado Barba + Cejas', 10, '5000.00'),
(10, 12, 'Corte de pelo Varón Normal', 30, '8000.00'),
(11, 12, 'Tintura Cabello Hombre ', 60, '20000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tipo` enum('admin','usuario','negocio') NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `descripcion_publica` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `email`, `password`, `tipo`, `slug`, `descripcion_publica`, `logo`, `activo`) VALUES
(1, 'Admin NexTurnos', 'admin@nexturnos.cl', '1234', 'admin', NULL, NULL, NULL, 1),
(11, 'Peluqueria Paula', 'paula@peluqueriapaula.com', '123', 'negocio', 'peluqueriapaula', 'Somos especialistas en Peluqueria hace 10 años. ', NULL, 1),
(12, 'Barberia Jano', 'jano@barberiajano.com', '123', 'negocio', 'barberiajano', 'Bienvenido a nuestra barbería ✂️\r\nAquí no solo hacemos cortes, creamos estilo. Ofrecemos atención personalizada, degradados modernos, perfilado de barba y un ambiente cómodo para que te sientas como en casa.\r\n\r\nReserva tu hora y dale a tu imagen el cambio que merece 💈🔥', 'logos/logo_12_1779924544.png', 1),
(13, 'Peluqueria BlackJack', 'peluqueria@blackjack.com', '123', 'negocio', 'blackjack', NULL, NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id_notif`),
  ADD KEY `id_reserva` (`id_reserva`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id_personal`),
  ADD KEY `id_negocio` (`id_negocio`);

--
-- Indices de la tabla `personal_servicio`
--
ALTER TABLE `personal_servicio`
  ADD PRIMARY KEY (`id_personal_servicio`),
  ADD KEY `id_personal` (`id_personal`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `id_negocio` (`id_negocio`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id_notif` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id_personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `personal_servicio`
--
ALTER TABLE `personal_servicio`
  MODIFY `id_personal_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`);

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`id_negocio`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `personal_servicio`
--
ALTER TABLE `personal_servicio`
  ADD CONSTRAINT `personal_servicio_ibfk_1` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`),
  ADD CONSTRAINT `personal_servicio_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`);

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `servicios_ibfk_1` FOREIGN KEY (`id_negocio`) REFERENCES `usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
