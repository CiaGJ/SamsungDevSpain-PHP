-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 08, 2023 at 06:04 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cursoSQL`
--

-- --------------------------------------------------------

--
-- Table structure for table `pedidos`
--

CREATE TABLE `pedidos` (
  `NUMERO_PEDIDO` int(4) NOT NULL,
  `CODIGO_CLIENTE` varchar(4) DEFAULT NULL,
  `FECHA_PEDIDO` date DEFAULT NULL,
  `FORMA_PAGO` varchar(8) DEFAULT NULL,
  `DESCUENTO` int(4) DEFAULT NULL,
  `ENVIADO` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pedidos`
--

INSERT INTO `pedidos` (`NUMERO_PEDIDO`, `CODIGO_CLIENTE`, `FECHA_PEDIDO`, `FORMA_PAGO`, `DESCUENTO`, `ENVIADO`) VALUES
(1, 'CT01', '2013-03-12', 'TARJETA', 0, 'SI'),
(2, 'CT02', '2013-02-19', 'EFECTIVO', 0, 'NO'),
(3, 'CT03', '2017-03-02', 'TARJETA', 0, 'SI'),
(4, 'CT04', '2018-02-05', 'EFECTIVO', 0, 'SI'),
(5, 'CT01', '2018-03-29', 'TARJETA', 0, 'SI'),
(6, 'CT03', '2018-01-01', 'EFECTIVO', 0, 'SI'),
(7, 'CT01', '2017-10-08', 'EFECTIVO', 0, 'SI'),
(8, 'CT02', '2017-03-06', 'EFECTIVO', 0, 'SI'),
(9, 'CT05', '2016-11-21', 'EFECTIVO', 0, 'SI'),
(10, 'CT06', '2017-07-12', 'EFECTIVO', 0, 'SI'),
(11, 'CT07', '2014-03-05', 'EFECTIVO', 0, 'SI'),
(12, 'CT08', '2013-02-08', 'EFECTIVO', 0, 'SI'),
(13, 'CT09', '2012-01-21', 'EFECTIVO', 0, 'SI'),
(14, 'CT10', '2014-11-15', 'EFECTIVO', 0, 'SI');

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `CODIGO_ARTICULO` varchar(4) NOT NULL,
  `SECCION` varchar(11) DEFAULT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  `PRECIO` decimal(8,2) DEFAULT NULL,
  `PAIS` varchar(6) DEFAULT NULL,
  `FECHA` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`CODIGO_ARTICULO`, `SECCION`, `NOMBRE`, `PRECIO`, `PAIS`, `FECHA`) VALUES
('AR02', 'HOGAR', 'LAMPARA', 120.50, 'ESPAÑA', '2018-03-30'),
('AR03', 'INFORMATICA', 'RATON', 30.35, 'CHINA', '2017-03-01'),
('AR04', 'INFORMATICA', 'TECLADO', 45.99, 'CHINA', '2016-05-13'),
('AR05', 'DEPORTES', 'BALON FUTBOL', 50.95, 'EEUU', '2018-01-11'),
('AR06', 'INFORMATICA', 'GTA V', 59.95, 'EEUU', '2017-01-07'),
('AR07', 'DEPORTES', 'CAMISETA REAL MADRID', 60.00, 'ESPAÑA', '2018-01-01'),
('AR08', 'HOGAR', 'MESA', 350.99, 'ESPAÑA', '2015-03-06'),
('AR09', 'HOGAR', 'SILLA', 180.50, 'ESPAÑA', '2015-03-06'),
('AR10', 'DEPORTES', 'BALON FIRMA RONALDO', 1200.00, 'ESPAÑA', '2013-03-01'),
('AR11', 'DEPORTES', 'CANOA', 650.00, 'ESPAÑA', '2018-02-07'),
('AR12', 'DEPORTES', 'MANCUERNA', 25.00, 'ESPAÑA', '2016-05-07'),
('AR13', 'HOGAR', 'TELEVISION', 1500.00, 'CHINA', '2017-03-26'),
('AR14', NULL, 'PANTALON', 50.00, 'ESPAÑA', NULL);

--
-- Triggers `productos`
--
DELIMITER $$
CREATE TRIGGER `PRODUCTOS_AI` AFTER INSERT ON `productos` FOR EACH ROW INSERT INTO REG_PRODUCTOS(CODIGO_ARTICULO, NOMBRE, PRECIO, MODIFICADO) VALUES(NEW.CODIGO_ARTICULO, NEW.NOMBRE, NEW.PRECIO, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(20) NOT NULL,
  `APELLIDO` varchar(20) NOT NULL,
  `EMAIL` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`ID`, `NOMBRE`, `APELLIDO`, `EMAIL`) VALUES
(1, 'Lucía', 'García Jiménez', 'lucia.gjim@gmail.com'),
(2, 'Alberto', 'Rodríguez Martín', 'alberto@example.com'),
(3, 'AITOR', 'ALONSO NUÑEZ', 'test@example.com'),
(4, 'Lucía', 'Test 3', 'lucia@test3.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`NUMERO_PEDIDO`),
  ADD KEY `CODIGO_CLIENTE` (`CODIGO_CLIENTE`),
  ADD KEY `NUMERO_PEDIDO` (`NUMERO_PEDIDO`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`CODIGO_ARTICULO`),
  ADD KEY `CODIGO_ARTICULO` (`CODIGO_ARTICULO`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
