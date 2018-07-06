-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 05, 2018 at 07:57 PM
-- Server version: 5.7.22-0ubuntu18.04.1
-- PHP Version: 7.2.7-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siop`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer_docs`
--

CREATE TABLE `answer_docs` (
  `id_answer` int(11) NOT NULL,
  `id_status_doc` int(11) NOT NULL,
  `folio_doc` int(11) DEFAULT NULL,
  `date_answer` date DEFAULT NULL,
  `oficio_answer` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `char_tramits`
--

CREATE TABLE `char_tramits` (
  `id_char` int(11) NOT NULL,
  `desc_char` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `char_tramits`
--

INSERT INTO `char_tramits` (`id_char`, `desc_char`) VALUES
(1, 'Importante'),
(2, 'Urgente');

-- --------------------------------------------------------

--
-- Table structure for table `classifications`
--

CREATE TABLE `classifications` (
  `id_classif` int(11) NOT NULL,
  `desc_classif` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `classifications`
--

INSERT INTO `classifications` (`id_classif`, `desc_classif`) VALUES
(1, 'Informativo'),
(2, 'Solicitud');

-- --------------------------------------------------------

--
-- Table structure for table `departaments`
--

CREATE TABLE `departaments` (
  `id_dep` int(11) NOT NULL,
  `departament` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `departaments`
--

INSERT INTO `departaments` (`id_dep`, `departament`) VALUES
(1, 'Departemento de Recursos Humanos y Desarrollo Administrativo'),
(2, 'Departamento de Adquisiciones,\r\nRecursos Materiales y Servicios'),
(3, 'Departamento de Contabilidad y Finanzas'),
(4, 'Informática'),
(5, 'Archivo'),
(6, 'Almacen 1'),
(7, 'Almacen 2'),
(8, 'Seguimiento a Auditorias'),
(9, 'Departamento de Gestión de Derecho de Vía y Afectaciones'),
(10, 'Departamento de Obras por Administración y Equipamiento'),
(11, 'Departamento de Infraestructura Vial'),
(12, 'Departamento de Concertación Social y Apoyos de Maquinaria'),
(13, 'Departamento de Eventos Especiales'),
(14, 'Departamento de Agua Potable, Alcantarillado y Saneamiento'),
(15, 'Departamento de Infraestructura Urbana'),
(16, 'Departamento Jurídico'),
(17, 'Departamento de Planeación y Coordinación de Programas'),
(18, 'Departamento de Proyectos'),
(19, 'Departamento de Estadística e Información Geográfica'),
(20, 'Departamento de Programas y Registro del Desarrollo Urbano'),
(21, 'Departamento de Licitaciones y Contratos'),
(22, 'Precios Unitarios y Ajuste de Costos');

-- --------------------------------------------------------

--
-- Table structure for table `descriptions`
--

CREATE TABLE `descriptions` (
  `id_desc` int(11) NOT NULL,
  `content_desc` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `descriptions`
--

INSERT INTO `descriptions` (`id_desc`, `content_desc`) VALUES
(1, 'Notificaciones'),
(2, 'Dictamen de Congruencia'),
(3, 'Eventos Especiales'),
(4, 'Invitaciones'),
(5, 'Maquinaria'),
(6, 'Correo Electrónico'),
(7, 'Para su Conocimiento'),
(8, 'Tarjeta');

-- --------------------------------------------------------

--
-- Table structure for table `destiny_docs`
--

CREATE TABLE `destiny_docs` (
  `id_destiny` int(11) NOT NULL,
  `desc_destiny` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `destiny_position` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `destiny_docs`
--

INSERT INTO `destiny_docs` (`id_destiny`, `desc_destiny`, `destiny_position`) VALUES
(1, 'Arq. Francisco Javier Romero Ahuactzi', 'Secretario '),
(2, 'C.P. Carlos Sánchez Tamayo', 'Director Administrativo');

-- --------------------------------------------------------

--
-- Table structure for table `directions`
--

CREATE TABLE `directions` (
  `id_dir` int(11) NOT NULL,
  `dir_name` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `directions`
--

INSERT INTO `directions` (`id_dir`, `dir_name`) VALUES
(1, 'Dirección Administrativa'),
(2, 'Dirección de Obras Públicas'),
(3, 'Dirección de Desarrollo Urbano'),
(4, 'Dirección de Licitaciones, Precios Unitarios y Contratos');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id_doc` int(11) NOT NULL,
  `id_destiny` int(11) NOT NULL,
  `id_muni` int(11) NOT NULL,
  `id_type_doc` int(11) NOT NULL,
  `id_status_doc` int(11) NOT NULL,
  `id_classif` int(11) NOT NULL,
  `subject_doc` text COLLATE utf8_spanish_ci,
  `desc_send_position` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  `folio_doc` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `send_doc` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `origin_doc` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dir_sender` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `movil_doc` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tel_doc` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ext_doc` varchar(6) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email_doc` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `date_doc` date DEFAULT NULL,
  `date_recep` date DEFAULT NULL,
  `reference` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status` enum('0','1','2') COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id_doc`, `id_destiny`, `id_muni`, `id_type_doc`, `id_status_doc`, `id_classif`, `subject_doc`, `desc_send_position`, `folio_doc`, `send_doc`, `origin_doc`, `dir_sender`, `movil_doc`, `tel_doc`, `ext_doc`, `email_doc`, `date_doc`, `date_recep`, `reference`, `status`) VALUES
(1, 1, 1, 7, 1, 2, 'Asunto 1', 'CArgo Remitente 1', '1', 'Remitente 1', 'Origen 1', 'Domicilio 1', '9876543210', '1234567890', '123', 'primero@gmail.com', '2018-03-31', '2018-04-04', 'Referencia 1', '2'),
(2, 1, 2, 7, 1, 2, 'Asunto 2', 'Cargo 2', '2', 'Remitente 2', 'Origen 2', 'Domicilio 2', '22222222', '2222222222', '222', 'segundo@gmail.com', '2018-03-06', '2018-03-13', 'Referencia 2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `documents_turned`
--

CREATE TABLE `documents_turned` (
  `id_turn` int(11) NOT NULL,
  `id_doc` int(11) NOT NULL,
  `id_dir` int(11) NOT NULL,
  `id_status_doc` int(11) NOT NULL,
  `id_dep` int(11) NOT NULL,
  `id_char` int(11) NOT NULL,
  `id_classif` int(11) NOT NULL,
  `id_desc` int(11) NOT NULL,
  `folio_turned` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `doc_origin` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `doc_ccp` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `date_turned` date DEFAULT NULL,
  `instructions` text COLLATE utf8_spanish_ci,
  `answer` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `observation` text COLLATE utf8_spanish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `documents_turned`
--

INSERT INTO `documents_turned` (`id_turn`, `id_doc`, `id_dir`, `id_status_doc`, `id_dep`, `id_char`, `id_classif`, `id_desc`, `folio_turned`, `doc_origin`, `doc_ccp`, `date_turned`, `instructions`, `answer`, `observation`) VALUES
(1, 1, 1, 1, 4, 1, 2, 6, '1', 'Turnado 1', 'Copia 1', '2018-04-04', 'Instrucciones 1', '', ' '),
(2, 2, 1, 1, 4, 1, 2, 5, '2', 'Turnado 2', 'cpia 2', '2018-03-20', 'Instrucciones 2', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `history_access`
--

CREATE TABLE `history_access` (
  `id_history` int(11) NOT NULL,
  `ip` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `date_access` date DEFAULT NULL,
  `time_in` time DEFAULT NULL,
  `time_out` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `history_access`
--

INSERT INTO `history_access` (`id_history`, `ip`, `date_access`, `time_in`, `time_out`) VALUES
(1, '127.0.1.1', '2018-03-26', '14:28:26', NULL),
(2, '127.0.0.1', '2018-04-04', '11:33:46', NULL),
(3, '127.0.0.1', '2018-04-04', '11:42:23', NULL),
(4, '127.0.0.1', '2018-04-04', '13:03:33', NULL),
(5, '127.0.0.1', '2018-04-04', '13:03:43', NULL),
(6, '127.0.0.1', '2018-04-04', '13:43:24', NULL),
(7, '127.0.0.1', '2018-04-04', '17:33:47', NULL),
(8, '127.0.0.1', '2018-04-04', '18:00:07', NULL),
(9, '127.0.0.1', '2018-04-05', '13:08:10', NULL),
(10, '127.0.0.1', '2018-04-05', '14:09:28', NULL),
(11, '127.0.0.1', '2018-04-16', '12:45:09', NULL),
(12, '127.0.0.1', '2018-04-16', '13:50:42', NULL),
(13, '127.0.0.1', '2018-04-16', '14:26:43', NULL),
(14, '127.0.0.1', '2018-04-16', '17:53:13', NULL),
(15, '127.0.0.1', '2018-04-16', '17:57:27', NULL),
(16, '127.0.0.1', '2018-04-16', '19:01:53', NULL),
(17, '127.0.0.1', '2018-04-24', '14:21:35', NULL),
(18, '127.0.0.1', '2018-04-24', '14:35:57', NULL),
(19, '127.0.0.1', '2018-04-24', '17:37:27', NULL),
(20, '127.0.0.1', '2018-04-24', '17:46:57', NULL),
(21, '127.0.0.1', '2018-04-24', '17:56:40', NULL),
(22, '127.0.0.1', '2018-06-26', '17:52:30', NULL),
(23, '127.0.0.1', '2018-06-26', '18:46:18', NULL),
(24, '127.0.0.1', '2018-06-28', '11:25:01', NULL),
(25, '127.0.0.1', '2018-06-28', '14:13:16', NULL),
(26, '127.0.0.1', '2018-06-28', '14:34:41', NULL),
(27, '127.0.0.1', '2018-06-29', '14:54:15', NULL),
(28, '127.0.0.1', '2018-06-29', '14:54:25', NULL),
(29, '127.0.0.1', '2018-06-29', '15:44:29', NULL),
(30, '127.0.0.1', '2018-06-29', '15:50:59', NULL),
(31, '127.0.0.1', '2018-06-29', '19:55:55', NULL),
(32, '127.0.0.1', '2018-06-29', '19:56:38', NULL),
(33, '127.0.0.1', '2018-07-03', '13:38:42', NULL),
(34, '127.0.0.1', '2018-07-03', '18:26:08', NULL),
(35, '127.0.0.1', '2018-07-03', '18:35:29', NULL),
(36, '127.0.0.1', '2018-07-04', '10:18:52', NULL),
(37, '127.0.0.1', '2018-07-04', '12:22:15', NULL),
(38, '127.0.0.1', '2018-07-05', '12:03:54', NULL),
(39, '127.0.0.1', '2018-07-05', '18:23:10', NULL),
(40, '127.0.0.1', '2018-07-05', '19:50:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `municipalities`
--

CREATE TABLE `municipalities` (
  `id_muni` int(11) NOT NULL,
  `desc_muni` varchar(65) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `municipalities`
--

INSERT INTO `municipalities` (`id_muni`, `desc_muni`) VALUES
(1, 'Amaxac de Guerrero'),
(2, 'Apetatitlan de Antonio Carvajal'),
(3, 'Atlangatepec'),
(4, 'Atltzayanca'),
(5, 'Apizaco'),
(6, 'Calpulalpan'),
(7, 'El Carmen Tequexquitla'),
(8, 'Cuapiaxtla'),
(9, 'Cuaxomulco'),
(10, 'Chiautempan'),
(11, 'Muñoz de Domingo Arenas'),
(12, 'Españita'),
(13, 'Huamantla'),
(14, 'Hueyotlipan'),
(15, 'Ixtacuixtla de Mariano Matamoros'),
(16, 'Ixtenco'),
(17, 'Mazatecochco de José María Morelos'),
(18, 'Contla de Juan Cuamatzi'),
(19, 'Tepetitla de Lardizábal'),
(20, 'Sanctórum de Lázaro Cárdenas'),
(21, 'Nanacamilpa de Mariano Arista'),
(22, 'Acuamanala de Miguel Hidalgo'),
(23, 'Natívitas'),
(24, 'Panotla'),
(25, 'San Pablo del Monte'),
(26, 'Santa Cruz Tlaxcala'),
(27, 'Tenancingo'),
(28, 'Teolocholco'),
(29, 'Tepeyanco'),
(30, 'Terrenate'),
(31, 'Tetla de la Solidaridad'),
(32, 'Tetlatlahuca'),
(33, 'Tlaxcala'),
(34, 'Tlaxco'),
(35, 'Tocatlán'),
(36, 'Totolac'),
(37, 'Ziltlaltépec de Trinidad Sánchez '),
(38, 'Tzompantepec'),
(39, 'Xaloztoc'),
(40, 'Xaltocan'),
(41, 'Papalotla de Xicohténcatl'),
(42, 'Xicohtzinco'),
(43, 'Yauhquemehcan'),
(44, 'Zacatelco'),
(45, 'Benito Juárez'),
(46, 'Emiliano Zapata'),
(47, 'Lázaro Cárdenas'),
(48, 'La Magdalena Tlaltelulco'),
(49, 'San Damián Texóloc'),
(50, 'San Francisco Tetlanohcan'),
(51, 'San Jerónimo Zacualpan'),
(52, 'San José Teacalco'),
(53, 'San Juan Huactzinco'),
(54, 'San Lorenzo Axocomanitla'),
(55, 'San Lucas Tecopilco'),
(56, 'Santa Ana Nopalucan'),
(57, 'Santa Apolonia Teacalco'),
(58, 'Santa Catarina Ayometla'),
(59, 'Santa Cruz Quilehtla'),
(60, 'Santa Isabel Xiloxoxtla');

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id_org` int(11) NOT NULL,
  `org_nick` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `org_name` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `org_dir` varchar(99) COLLATE utf8_spanish_ci DEFAULT NULL,
  `org_pob` varchar(35) COLLATE utf8_spanish_ci DEFAULT NULL,
  `org_cp` varchar(6) COLLATE utf8_spanish_ci DEFAULT NULL,
  `org_tel` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `org_ext` char(6) COLLATE utf8_spanish_ci DEFAULT NULL,
  `org_email` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

CREATE TABLE `privileges` (
  `id_priv` int(11) NOT NULL,
  `desc_priv` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `create_priv` enum('N','Y') COLLATE utf8_spanish_ci DEFAULT NULL,
  `select_priv` enum('N','Y') COLLATE utf8_spanish_ci DEFAULT NULL,
  `insert_priv` enum('N','Y') COLLATE utf8_spanish_ci DEFAULT NULL,
  `update_priv` enum('N','Y') COLLATE utf8_spanish_ci DEFAULT NULL,
  `delete_priv` enum('N','Y') COLLATE utf8_spanish_ci DEFAULT NULL,
  `backup_priv` enum('N','Y') COLLATE utf8_spanish_ci DEFAULT NULL,
  `report_priv` enum('N','Y') COLLATE utf8_spanish_ci DEFAULT NULL,
  `status` enum('1','0') COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `privileges`
--

INSERT INTO `privileges` (`id_priv`, `desc_priv`, `create_priv`, `select_priv`, `insert_priv`, `update_priv`, `delete_priv`, `backup_priv`, `report_priv`, `status`) VALUES
(1, 'Administración del sistema', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', '1'),
(2, 'Dev', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '1'),
(3, 'Registro de Información', 'N', 'Y', 'Y', 'Y', 'N', 'N', 'N', '1'),
(4, 'Consulta de Información', 'N', 'Y', 'N', 'N', 'N', 'N', 'Y', '1'),
(5, 'Borrado de Información', 'N', 'Y', 'Y', 'Y', 'Y', 'N', 'N', '1'),
(6, 'Respaldo de Información', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', '1'),
(7, 'deleted', 'N', 'Y', 'N', 'Y', 'N', 'Y', 'N', '0'),
(8, 'modify', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '0'),
(9, 'alert', 'N', 'N', 'N', 'N', 'N', 'N', 'N', '0'),
(10, 'New Privilege', 'N', 'N', 'N', 'N', 'N', 'N', 'N', '0'),
(11, 'Privilege reedited', 'N', 'Y', 'N', 'Y', 'N', 'Y', 'N', '0');

-- --------------------------------------------------------

--
-- Table structure for table `status_docs`
--

CREATE TABLE `status_docs` (
  `id_status_doc` int(11) NOT NULL,
  `desc_status_docs` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `status_docs`
--

INSERT INTO `status_docs` (`id_status_doc`, `desc_status_docs`) VALUES
(1, 'Iniciado'),
(2, 'Enterado'),
(3, 'En Trámite'),
(4, 'Pendiente'),
(5, 'Concluido');

-- --------------------------------------------------------

--
-- Table structure for table `status_user`
--

CREATE TABLE `status_user` (
  `id_user_status` int(11) NOT NULL,
  `desc_user_status` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `status_user`
--

INSERT INTO `status_user` (`id_user_status`, `desc_user_status`) VALUES
(1, 'Active'),
(2, 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `type_docs`
--

CREATE TABLE `type_docs` (
  `id_type_doc` int(11) NOT NULL,
  `desc_type_doc` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `type_docs`
--

INSERT INTO `type_docs` (`id_type_doc`, `desc_type_doc`) VALUES
(1, 'Circular'),
(2, 'Convocatoria'),
(3, 'Email'),
(4, 'Engargolado'),
(5, 'Factura'),
(6, 'Invitación'),
(7, 'Oficio'),
(8, 'Sobre'),
(9, 'Tarjeta');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `id_priv` int(11) NOT NULL,
  `id_user_status` int(11) NOT NULL,
  `id_dir` int(11) NOT NULL,
  `id_dep` int(11) NOT NULL,
  `id_history` int(11) NOT NULL,
  `name` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `user_name` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `user_pass` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `user_movil` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `user_email` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `user_photo` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `user_position` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `user_resume` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  `user_tel` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `user_ext` varchar(6) COLLATE utf8_spanish_ci DEFAULT NULL,
  `active` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `user_online` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `date_reg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `about` text COLLATE utf8_spanish_ci,
  `status` enum('1','0') COLLATE utf8_spanish_ci DEFAULT NULL,
  `complete` enum('1','0') COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `id_priv`, `id_user_status`, `id_dir`, `id_dep`, `id_history`, `name`, `user_name`, `user_pass`, `user_movil`, `user_email`, `user_photo`, `user_position`, `user_resume`, `user_tel`, `user_ext`, `active`, `user_online`, `date_reg`, `about`, `status`, `complete`) VALUES
(1, 1, 1, 1, 4, 27, 'Klvst3r', 'klvst3r', '81dc9bdb52d04dc20036dbd8313ed055', '123456879', 'klvst3r@gmail.com', 'ui-danro.jpg', 'Dev', 'CEO Web developer + Edx + UX + UI', '1234567890', '0', '0', '0', '2018-06-29 19:54:15', 'I am admin user dev for Internet lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eros nibh, viverra a dui a, gravida varius velit. Vivamus tristique est non ipsum dapibus lacinia sed nec metus.', '1', '1'),
(2, 2, 1, 1, 4, 40, 'Kozlov', 'kozlov', '81dc9bdb52d04dc20036dbd8313ed055', '123456789', 'kozlov@gmail.com', 'ui-danro.jpg', 'Dev', 'Admin', '2461645449', '123', '0', '0', '2018-07-06 00:50:51', 'CEO Web developer + Edx + UX + UI', '1', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer_docs`
--
ALTER TABLE `answer_docs`
  ADD PRIMARY KEY (`id_answer`),
  ADD KEY `id_status_doc` (`id_status_doc`);

--
-- Indexes for table `char_tramits`
--
ALTER TABLE `char_tramits`
  ADD PRIMARY KEY (`id_char`);

--
-- Indexes for table `classifications`
--
ALTER TABLE `classifications`
  ADD PRIMARY KEY (`id_classif`);

--
-- Indexes for table `departaments`
--
ALTER TABLE `departaments`
  ADD PRIMARY KEY (`id_dep`);

--
-- Indexes for table `descriptions`
--
ALTER TABLE `descriptions`
  ADD PRIMARY KEY (`id_desc`);

--
-- Indexes for table `destiny_docs`
--
ALTER TABLE `destiny_docs`
  ADD PRIMARY KEY (`id_destiny`);

--
-- Indexes for table `directions`
--
ALTER TABLE `directions`
  ADD PRIMARY KEY (`id_dir`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id_doc`),
  ADD KEY `id_type_doc` (`id_type_doc`),
  ADD KEY `id_status_doc` (`id_status_doc`),
  ADD KEY `id_muni` (`id_muni`),
  ADD KEY `id_destiny` (`id_destiny`),
  ADD KEY `id_classif` (`id_classif`);

--
-- Indexes for table `documents_turned`
--
ALTER TABLE `documents_turned`
  ADD PRIMARY KEY (`id_turn`),
  ADD KEY `id_dep` (`id_dep`),
  ADD KEY `id_dir` (`id_dir`),
  ADD KEY `id_status_doc` (`id_status_doc`),
  ADD KEY `id_doc` (`id_doc`),
  ADD KEY `id_char` (`id_char`),
  ADD KEY `id_classif` (`id_classif`),
  ADD KEY `id_desc` (`id_desc`);

--
-- Indexes for table `history_access`
--
ALTER TABLE `history_access`
  ADD PRIMARY KEY (`id_history`);

--
-- Indexes for table `municipalities`
--
ALTER TABLE `municipalities`
  ADD PRIMARY KEY (`id_muni`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id_org`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `privileges`
--
ALTER TABLE `privileges`
  ADD PRIMARY KEY (`id_priv`);

--
-- Indexes for table `status_docs`
--
ALTER TABLE `status_docs`
  ADD PRIMARY KEY (`id_status_doc`);

--
-- Indexes for table `status_user`
--
ALTER TABLE `status_user`
  ADD PRIMARY KEY (`id_user_status`);

--
-- Indexes for table `type_docs`
--
ALTER TABLE `type_docs`
  ADD PRIMARY KEY (`id_type_doc`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_dep` (`id_dep`),
  ADD KEY `id_dir` (`id_dir`),
  ADD KEY `id_priv` (`id_priv`),
  ADD KEY `id_user_status` (`id_user_status`),
  ADD KEY `id_history` (`id_history`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer_docs`
--
ALTER TABLE `answer_docs`
  MODIFY `id_answer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `char_tramits`
--
ALTER TABLE `char_tramits`
  MODIFY `id_char` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `classifications`
--
ALTER TABLE `classifications`
  MODIFY `id_classif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `departaments`
--
ALTER TABLE `departaments`
  MODIFY `id_dep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `descriptions`
--
ALTER TABLE `descriptions`
  MODIFY `id_desc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `destiny_docs`
--
ALTER TABLE `destiny_docs`
  MODIFY `id_destiny` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `directions`
--
ALTER TABLE `directions`
  MODIFY `id_dir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id_doc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `documents_turned`
--
ALTER TABLE `documents_turned`
  MODIFY `id_turn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `history_access`
--
ALTER TABLE `history_access`
  MODIFY `id_history` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `municipalities`
--
ALTER TABLE `municipalities`
  MODIFY `id_muni` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id_org` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `privileges`
--
ALTER TABLE `privileges`
  MODIFY `id_priv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `status_docs`
--
ALTER TABLE `status_docs`
  MODIFY `id_status_doc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `status_user`
--
ALTER TABLE `status_user`
  MODIFY `id_user_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `type_docs`
--
ALTER TABLE `type_docs`
  MODIFY `id_type_doc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer_docs`
--
ALTER TABLE `answer_docs`
  ADD CONSTRAINT `answer_docs_ibfk_1` FOREIGN KEY (`id_status_doc`) REFERENCES `status_docs` (`id_status_doc`);

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`id_type_doc`) REFERENCES `type_docs` (`id_type_doc`),
  ADD CONSTRAINT `documents_ibfk_2` FOREIGN KEY (`id_status_doc`) REFERENCES `status_docs` (`id_status_doc`),
  ADD CONSTRAINT `documents_ibfk_3` FOREIGN KEY (`id_muni`) REFERENCES `municipalities` (`id_muni`),
  ADD CONSTRAINT `documents_ibfk_4` FOREIGN KEY (`id_destiny`) REFERENCES `destiny_docs` (`id_destiny`),
  ADD CONSTRAINT `documents_ibfk_5` FOREIGN KEY (`id_classif`) REFERENCES `classifications` (`id_classif`);

--
-- Constraints for table `documents_turned`
--
ALTER TABLE `documents_turned`
  ADD CONSTRAINT `documents_turned_ibfk_1` FOREIGN KEY (`id_dep`) REFERENCES `departaments` (`id_dep`),
  ADD CONSTRAINT `documents_turned_ibfk_2` FOREIGN KEY (`id_dir`) REFERENCES `directions` (`id_dir`),
  ADD CONSTRAINT `documents_turned_ibfk_3` FOREIGN KEY (`id_status_doc`) REFERENCES `status_docs` (`id_status_doc`),
  ADD CONSTRAINT `documents_turned_ibfk_4` FOREIGN KEY (`id_doc`) REFERENCES `documents` (`id_doc`),
  ADD CONSTRAINT `documents_turned_ibfk_5` FOREIGN KEY (`id_char`) REFERENCES `char_tramits` (`id_char`),
  ADD CONSTRAINT `documents_turned_ibfk_6` FOREIGN KEY (`id_classif`) REFERENCES `classifications` (`id_classif`),
  ADD CONSTRAINT `documents_turned_ibfk_7` FOREIGN KEY (`id_desc`) REFERENCES `descriptions` (`id_desc`);

--
-- Constraints for table `organizations`
--
ALTER TABLE `organizations`
  ADD CONSTRAINT `organizations_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_dep`) REFERENCES `departaments` (`id_dep`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`id_dir`) REFERENCES `directions` (`id_dir`),
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`id_priv`) REFERENCES `privileges` (`id_priv`),
  ADD CONSTRAINT `users_ibfk_4` FOREIGN KEY (`id_user_status`) REFERENCES `status_user` (`id_user_status`),
  ADD CONSTRAINT `users_ibfk_5` FOREIGN KEY (`id_history`) REFERENCES `history_access` (`id_history`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
