-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql_db
-- Время создания: Янв 19 2023 г., 20:11
-- Версия сервера: 8.0.32
-- Версия PHP: 8.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `testDB`
--

-- --------------------------------------------------------

--
-- Структура таблицы `department`
--

CREATE TABLE `department` (
  `id` int NOT NULL,
  `leader_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_ad` timestamp NOT NULL,
  `update_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `department`
--

INSERT INTO `department` (`id`, `leader_id`, `name`, `description`, `created_ad`, `update_at`) VALUES
(3, 3, 'HR', 'HR служба', '2013-12-28 18:38:09', '2014-02-28 12:32:54'),
(4, 2, 'IT', 'IT служба', '2013-12-28 18:38:09', '2013-12-28 18:38:09'),
(5, 9, 'Development', 'Отдел разработки', '2013-12-28 18:38:09', '2014-03-09 23:04:45'),
(6, 21, 'Management', 'Менеджмент', '2013-12-28 18:38:09', '2019-03-12 18:20:10'),
(7, 6, 'Lawyers', 'Юристы', '2013-12-28 18:38:09', '2014-03-14 13:16:08'),
(8, 8, 'Analytics', 'Отдел аналитики', '2013-12-28 18:38:09', '2019-03-12 18:22:34'),
(9, 4, 'Sales', 'Отдел продаж', '2013-12-28 18:38:09', '2020-05-12 18:37:38'),
(10, 5, 'Service', 'Обслуживающий персонал', '2013-12-28 18:38:09', '2019-03-12 18:23:15'),
(11, 7, 'Security', 'Охрана', '2013-12-28 18:38:09', '2014-03-14 12:55:20');

-- --------------------------------------------------------

--
-- Структура таблицы `dismission_reason`
--

CREATE TABLE `dismission_reason` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `dismission_reason`
--

INSERT INTO `dismission_reason` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'name', 'description', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'drugs', 'Наркотическое опьянение', '2013-12-28 18:38:09', '2013-12-28 18:38:09'),
(3, 'alcohol', 'Алкогольное опьянение', '2013-12-28 18:38:09', '2013-12-28 18:38:09'),
(4, 'at_will', 'По собственному желанию', '2013-12-28 18:38:09', '2013-12-28 18:38:09'),
(5, 'death', 'Умер', '2013-12-28 18:38:09', '2013-12-28 18:38:09'),
(6, 'transfer', 'Перевод', '2013-12-28 18:38:09', '2013-12-28 18:38:09');

-- --------------------------------------------------------

--
-- Структура таблицы `position`
--

CREATE TABLE `position` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `salary` int NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `position`
--

INSERT INTO `position` (`id`, `name`, `description`, `salary`, `created_at`, `updated_at`, `is_active`) VALUES
(2, 'Начальник IT службы', '', 120000, '2013-12-28 18:38:09', '2013-12-28 18:38:09', 1),
(3, 'Начальник HR службы', '', 90000, '2013-12-28 18:38:09', '2013-12-28 18:38:09', 1),
(4, 'Начальник отдела продаж', '', 85000, '2013-12-28 18:38:09', '2013-12-28 18:38:09', 1),
(5, 'Начальник отдела обслуживания', '', 55000, '2013-12-28 18:38:09', '2013-12-28 18:38:09', 1),
(6, 'Начальник юр. отдела', '', 80000, '2013-12-28 18:38:09', '2013-12-28 18:38:09', 1),
(7, 'Начальник охраны', '', 65000, '2013-12-28 18:38:09', '2013-12-28 18:38:09', 1),
(8, 'Начальник отдела аналитики', '', 70000, '2013-12-28 18:38:09', '2013-12-28 18:38:09', 1),
(9, 'Начальник отдела разработки', '', 190000, '2013-12-28 18:38:09', '2013-12-28 18:38:09', 1),
(10, 'Senior разарботчик', '', 180000, '2013-12-28 18:38:09', '2013-12-28 18:38:09', 1),
(11, 'Middle разработчик', '', 140000, '2013-12-28 18:38:09', '2013-12-28 18:38:09', 1),
(12, 'Junior разработчик', '', 85000, '2013-12-28 18:38:09', '2013-12-28 18:38:09', 1),
(13, 'Специалист IT службы', '', 50000, '2013-12-28 18:38:09', '2013-12-28 18:38:09', 1),
(14, 'Специалист HR службы', '', 45000, '2013-12-28 18:38:09', '2013-12-28 18:38:09', 1),
(15, 'Специалист отдела продаж', '', 55000, '2013-12-28 18:38:09', '2013-12-28 18:38:09', 1),
(16, 'Специалист отдела аналитики', '', 60000, '2013-12-28 18:38:09', '2013-12-28 18:38:09', 1),
(17, 'Юрист', '', 45000, '2013-12-28 18:38:09', '2013-12-28 18:38:09', 1),
(18, 'Охранник', '', 30000, '2013-12-28 18:38:09', '2013-12-28 18:38:09', 1),
(19, 'Уборщик', '', 27000, '2013-12-28 18:38:09', '2013-12-28 18:38:09', 1),
(20, 'Электрик', '', 35000, '2013-12-28 18:38:09', '2013-12-28 18:38:09', 1),
(21, 'Старший ПМ', '', 100000, '2013-12-28 18:38:09', '2013-12-28 18:38:09', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) NOT NULL,
  `data_of_birth` date NOT NULL,
  `created_at` timestamp NOT NULL,
  `update_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `middle_name`, `data_of_birth`, `created_at`, `update_at`) VALUES
(2, 'Александр', 'Попов', 'Евгеньевич', '1985-03-30', '2013-12-28 18:38:09', '2013-12-28 18:38:09'),
(3, 'Михаил', 'Татарков', 'Васильевич', '2000-07-09', '2013-12-30 18:37:03', '2013-12-30 18:37:03'),
(4, 'Юлия', 'Корнилова', 'Сергеевна', '1990-04-30', '2013-12-30 19:22:02', '2013-12-30 19:22:02'),
(5, 'Андрей', 'Киселев', 'Юрьевич', '1984-01-24', '2013-12-30 19:33:57', '2013-12-30 19:33:57'),
(6, 'Матвей', 'Бесков', 'Никитович', '1976-07-20', '2020-05-12 18:37:02', '2020-05-12 18:37:02'),
(7, 'Екатерина', 'Бурлаку', 'Олеговна', '2000-04-16', '2020-05-12 18:37:34', '2020-05-12 18:37:34'),
(8, 'Сергей', 'Тищенко', 'Сергеевич', '1999-08-30', '2020-05-12 18:37:38', '2020-05-12 18:37:38'),
(9, 'Анна', 'Седлецкая', 'Игоревна', '2001-06-25', '2020-05-12 18:37:44', '2020-05-12 18:37:44'),
(10, 'Виталий', 'Андреев', 'Игорьевич', '1990-11-17', '2020-05-12 18:37:44', '2020-05-12 18:37:44'),
(11, 'Ксения', 'Шакирова', 'Альбертовна', '2000-09-27', '2020-05-12 18:37:46', '2020-05-12 18:37:46'),
(12, 'Геннадий', 'Кольчурин', 'Викторович', '1996-05-12', '2020-05-12 18:39:10', '2020-05-12 18:39:10'),
(13, 'Нина', 'Богомол', 'Алексеевна', '2002-04-03', '2020-05-12 18:39:39', '2020-05-12 18:39:39'),
(14, 'Юлия', 'Старокожева', 'Сергеевна', '2000-10-26', '2020-05-12 18:39:54', '2020-05-12 18:39:54'),
(15, 'Ксения', 'Вишневская', 'Борисовна', '1981-08-16', '2020-05-12 18:40:01', '2020-05-12 18:40:01'),
(16, 'Степан', 'Абраменко', 'Иванович', '1971-08-30', '2020-05-12 18:40:25', '2020-05-12 18:40:25'),
(17, 'Нина', 'Серова', 'Олесьевна', '2001-01-19', '2020-05-12 18:40:26', '2020-05-12 18:40:26'),
(18, 'Алина', 'Паристова', 'Алексеевна', '1957-11-19', '2020-05-12 18:40:45', '2020-05-12 18:40:45'),
(19, 'Екатерина', 'Беднова', 'Владимировна', '1956-11-11', '2020-05-12 18:40:45', '2020-05-12 18:40:45'),
(20, 'Магомет', 'Амиров', 'Ахмедович', '1992-06-27', '2020-05-12 18:40:57', '2020-05-12 18:40:57'),
(21, 'Зульфугар', 'Бабаев', 'Новрузали', '1953-02-06', '2020-05-12 18:41:20', '2020-05-12 18:41:20'),
(22, 'Павел', 'Гурьянов', 'Германович', '1955-08-02', '2020-05-12 18:41:30', '2020-05-12 18:41:30'),
(23, 'Валентин', 'Богатов', 'Александрович', '1998-05-01', '2020-05-12 18:41:59', '2020-05-12 18:41:59'),
(24, 'Виктория', 'Абызова', 'Юрьевна', '2000-08-01', '2020-05-12 18:42:07', '2020-05-12 18:42:07'),
(25, 'Дахир', 'Хатуев', 'Мамедович', '1990-08-21', '2020-05-12 18:42:13', '2020-05-12 18:42:13'),
(26, 'Максим', 'Королев', 'Александрович', '2001-02-18', '2021-04-12 18:42:21', '2021-04-12 18:42:21'),
(27, 'Валерия', 'Валиева', 'Романовна', '1993-01-02', '2021-04-10 18:42:21', '2021-04-10 18:42:21'),
(28, 'Игорь', 'Бердников', 'Андреевич', '1977-10-25', '2021-04-08 18:42:21', '2021-04-08 18:42:21'),
(29, 'Алексей', 'Симонов', 'Викторович', '1999-02-09', '2021-04-12 18:42:21', '2021-04-12 18:42:21'),
(30, 'Руслан', 'Косолапов', 'Сергеевич', '1993-02-01', '2020-05-12 18:43:47', '2020-05-12 18:43:47'),
(31, 'Иван', 'Ревякин', 'Юрьевич', '2002-03-31', '2020-05-12 18:44:10', '2020-05-12 18:44:10'),
(32, 'Виктор', 'Телегин', 'Николаевич', '1992-07-02', '2020-05-12 18:44:25', '2020-05-12 18:44:25'),
(33, 'Александр', 'Войнов', 'Владимирович', '1992-04-02', '2020-05-12 18:44:51', '2020-05-12 18:44:51'),
(34, 'Ефим', 'Попов', 'Николаевич', '2000-03-15', '2020-05-12 18:45:17', '2020-05-12 18:45:17'),
(35, 'Екатерина', 'Смирнова', 'Сергеевна', '1979-10-12', '2020-05-12 18:45:17', '2020-05-12 18:45:17'),
(36, 'Надежда', 'Трухнева', 'Геннадиевна', '1986-05-04', '2020-05-12 18:45:32', '2020-05-12 18:45:32'),
(37, 'Роман', 'Иванов', 'Владимирович', '1978-06-16', '2020-05-12 18:46:19', '2020-05-12 18:46:19'),
(38, 'Евгений', 'Чучалин', 'Викторович', '2002-05-04', '2020-05-12 18:46:42', '2020-05-12 18:46:42'),
(39, 'Александр', 'Камский', 'Сергеевич', '1977-12-15', '2020-05-12 18:47:06', '2020-05-12 18:47:06'),
(40, 'Каиржан', 'Душанов', 'Хасанович', '1997-07-04', '2020-05-12 18:47:52', '2020-05-12 18:47:52'),
(41, 'Соня', 'Маркосян', 'Ервандовна', '1980-04-04', '2020-05-12 18:48:03', '2020-05-12 18:48:03'),
(42, 'Миляуша', 'Гильфанова', 'Эдуардовна', '1984-04-26', '2020-05-12 18:48:38', '2020-05-12 18:48:38'),
(43, 'Михаил', 'Чернявский', 'Сергеевич', '1967-03-06', '2020-05-12 18:48:40', '2020-05-12 18:48:40'),
(44, 'Валерий', 'Романов', 'Александрович', '1958-05-03', '2020-05-12 18:48:53', '2020-05-12 18:48:53'),
(45, 'Алиса', 'Забитова', 'Руслановна', '1996-04-24', '2020-05-12 18:48:55', '2020-05-12 18:48:55'),
(46, 'Роман', 'Ягодников', 'Олегович', '2002-02-03', '2020-05-12 18:49:14', '2020-05-12 18:49:14'),
(47, 'Алексей', 'Городских', 'Андреевич', '1987-02-09', '2020-05-12 18:49:38', '2020-05-12 18:49:38'),
(48, 'Александр', 'Федонов', 'Александрович', '1972-02-08', '2020-05-12 18:49:38', '2020-05-12 18:49:38'),
(49, 'Юлия', 'Кривова', 'Сергеевна', '1998-01-01', '2020-05-12 18:50:45', '2020-05-12 18:50:45'),
(50, 'Андрей', 'Панчин', 'Дезидерович', '1975-11-04', '2020-05-12 18:50:58', '2020-05-12 18:50:58'),
(51, 'Адам', 'Эстамулов', 'Салавдинович', '1977-03-09', '2020-05-12 18:51:06', '2020-05-12 18:51:06'),
(52, 'Георгий', 'Крылов', 'Александрович', '1977-08-31', '2020-05-12 18:51:17', '2020-05-12 18:51:17'),
(53, 'Мазахир', 'Гасанов', 'Латиф Оглы', '1996-07-14', '2020-05-12 18:51:35', '2020-05-12 18:51:35'),
(54, 'Александр', 'Негодин', 'Юрьевич', '1998-05-15', '2020-05-12 18:51:45', '2020-05-12 18:51:45'),
(55, 'Руслан', 'Якимов', 'Артемович', '1996-04-13', '2020-05-12 18:51:49', '2020-05-12 18:51:49'),
(56, 'Кристина', 'Якубец', 'Александровна', '2002-05-02', '2020-05-12 18:52:54', '2020-05-12 18:52:54'),
(57, 'Марина', 'Фокеева', 'Ильдусовна', '2002-04-06', '2020-05-12 18:53:55', '2020-05-12 18:53:55'),
(58, 'Артур', 'Габоян', 'Самвелович', '1981-02-09', '2020-05-12 18:54:29', '2020-05-12 18:54:29'),
(59, 'Виктор', 'Элькинд', 'Леонидович', '1987-06-28', '2020-05-12 18:54:52', '2020-05-12 18:54:52'),
(60, 'Салимат', 'Бисилова', 'Сейтбиевна', '2000-01-05', '2020-05-12 18:55:28', '2020-05-12 18:55:28'),
(61, 'Андрей', 'Ермаков', 'Борисович', '1988-10-03', '2020-05-12 18:55:33', '2020-05-12 18:55:33'),
(62, 'Евгения', 'Кукина', 'Владимировна', '1987-08-05', '2020-05-12 18:55:42', '2020-05-12 18:55:42'),
(63, 'Наталья', 'Тюрина', 'Викторовна', '1983-02-03', '2020-05-12 18:55:50', '2020-05-12 18:55:50'),
(64, 'Никита', 'Бабалыков', 'Геннадьевич', '1993-10-12', '2020-05-12 18:55:57', '2020-05-12 18:55:57'),
(65, 'Салман', 'Балакишиев', 'Габибович', '1978-11-19', '2020-05-12 18:56:24', '2020-05-12 18:56:24'),
(66, 'Надежда', 'Никонова', 'Сергеевна', '1990-12-18', '2020-05-12 18:56:34', '2020-05-12 18:56:34'),
(67, 'Екатерина', 'Капаева', 'Александровна', '1975-09-05', '2020-05-12 18:56:48', '2020-05-12 18:56:48'),
(68, 'Александр', 'Слишаевас', 'Дейвис-Александрасович', '1995-08-29', '2020-05-12 18:56:48', '2020-05-12 18:56:48'),
(69, 'Ольга', 'Старикова', 'Владимировна', '1996-04-16', '2020-05-12 18:57:05', '2020-05-12 18:57:05'),
(70, 'Андрей', 'Казанкин', 'Владимирович', '1970-11-26', '2020-05-12 18:57:05', '2020-05-12 18:57:05'),
(71, 'Сергей', 'Прешпективных', 'Иванович', '1972-04-17', '2014-02-22 20:10:58', '2014-02-22 20:10:58'),
(72, 'Владислав', 'Цеповязов', 'Олегович', '2002-02-18', '2014-02-22 22:14:34', '2014-02-22 22:14:34'),
(73, 'Александр', 'Храмеев', 'Юрьевич', '1992-03-20', '2014-02-23 13:44:49', '2014-02-23 13:44:49'),
(74, 'Шамиль', 'Сафин', 'Ришадович', '1986-08-20', '2014-02-24 11:42:51', '2014-02-24 11:42:51'),
(75, 'Александр', 'Горшенин', 'Геннадьевич', '1979-09-05', '2014-02-24 12:04:19', '2014-02-24 12:04:19'),
(76, 'Максим', 'Скоромец', 'Игоревич', '1989-02-20', '2014-02-24 12:54:11', '2014-02-24 12:54:11'),
(77, 'Евгений', 'Масленников', 'Иванович', '1983-03-28', '2014-02-24 15:39:37', '2014-02-24 15:39:37'),
(78, 'Евгений', 'Баяндин', 'Леонидович', '1949-09-27', '2014-02-24 15:45:16', '2014-02-24 15:45:16'),
(79, 'Ирек', 'Мударисов', 'Флурович', '1992-04-14', '2014-02-24 17:17:31', '2014-02-24 17:17:31'),
(80, 'Екатерина', 'Пережогина', 'Ивановна', '1991-06-03', '2014-02-24 17:59:16', '2014-02-24 17:59:16'),
(81, 'Марк', 'Стукан', 'Игоревич', '1995-12-11', '2014-02-24 18:45:48', '2014-02-24 18:45:48'),
(82, 'Алевтина', 'Рябокрис', 'Алексеевна', '1977-08-05', '2014-02-25 09:25:05', '2014-02-25 09:25:05'),
(83, 'Сергей', 'Омельченко', 'Васильевич', '1972-05-02', '2014-02-25 09:57:07', '2014-02-25 09:57:07'),
(84, 'Ольга', 'Федотова', 'Анатольевна', '1996-05-20', '2014-02-25 10:07:47', '2014-02-25 10:07:47'),
(85, 'Элисо', 'Куталия', 'Корнеловна', '1980-03-19', '2014-02-25 10:20:07', '2014-02-25 10:20:07'),
(86, 'Григорий', 'Юренко', 'Николаевич', '2000-03-06', '2014-02-25 10:26:59', '2014-02-25 10:26:59'),
(87, 'Антон', 'Акиншин', 'Игоревич', '1990-04-05', '2014-02-25 10:48:21', '2014-02-25 10:48:21'),
(88, 'Жанна', 'Родионова', 'Витальевна', '1980-04-22', '2014-02-25 11:04:02', '2014-02-25 11:04:02'),
(89, 'Шамшод', 'Азизов', 'Кодирович', '1960-02-05', '2014-02-25 11:29:36', '2014-02-25 11:29:36'),
(90, 'Вячеслав', 'Конопленко', 'Александрович', '1990-08-27', '2014-02-25 11:54:11', '2014-02-25 11:54:11'),
(91, 'Нина', 'Сычёва', 'Евгеньевна', '1986-06-13', '2014-02-25 12:06:18', '2014-02-25 12:06:18'),
(92, 'Анастасия', 'Сканцева', 'Дмитриевна', '1978-02-13', '2014-02-25 12:12:20', '2014-02-25 12:12:20'),
(93, 'Сергей', 'Губин', 'Вячеславович', '1981-02-09', '2014-02-25 12:16:32', '2014-02-25 12:16:32'),
(94, 'Анна', 'Пименова', 'Валерьевна', '1962-04-25', '2014-02-25 12:30:35', '2014-02-25 12:30:35'),
(95, 'Даниил', 'Прасолов', 'Андреевич', '1966-03-27', '2014-02-25 12:39:31', '2014-02-25 12:39:31'),
(96, 'Раиль', 'Харрасов', 'Рамилевич', '1980-03-25', '2014-02-25 12:41:53', '2014-02-25 12:41:53'),
(97, 'Вадим', 'Телятников', 'Юрьевич', '1981-11-24', '2014-02-25 12:53:56', '2014-02-25 12:53:56'),
(98, 'Михаил', 'Марков', 'Олегович', '1988-10-01', '2014-02-25 13:12:40', '2014-02-25 13:12:40'),
(99, 'Владимир', 'Лукиянчиков', 'Сергеевич', '1950-09-20', '2014-02-25 13:29:54', '2014-02-25 13:29:54'),
(100, 'Александр', 'Неустроев', 'Васильевич', '1978-12-17', '2014-02-25 13:37:06', '2014-02-25 13:37:06'),
(502, 'Василий', 'Зайцев', 'Семенович', '1984-07-17', '2014-02-25 13:37:06', '2014-02-25 13:37:06');

-- --------------------------------------------------------

--
-- Структура таблицы `user_dismission`
--

CREATE TABLE `user_dismission` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `reason_id` int DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  `update_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `user_dismission`
--

INSERT INTO `user_dismission` (`id`, `user_id`, `reason_id`, `is_active`, `created_at`, `update_at`) VALUES
(1, 502, 6, 0, '2016-02-25 13:37:06', '2016-02-25 13:37:06'),
(2, 93, 6, 0, '2017-02-25 13:37:06', '2017-02-25 13:37:06'),
(3, 94, 6, 1, '2016-03-22 13:37:06', '2020-03-22 13:37:06'),
(4, 95, 6, 1, '2016-05-23 13:37:06', '2020-01-22 13:37:06'),
(5, 96, 3, 0, '2019-06-16 13:37:06', '2019-06-16 13:37:06'),
(6, 97, 3, 0, '2019-06-16 13:37:06', '2019-06-16 13:37:06'),
(7, 98, 3, 0, '2019-06-16 13:37:06', '2019-06-16 13:37:06'),
(8, 99, 1, 0, '2017-02-16 13:37:06', '2017-02-16 13:37:06');

-- --------------------------------------------------------

--
-- Структура таблицы `user_position`
--

CREATE TABLE `user_position` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `department_id` int NOT NULL,
  `position_id` int NOT NULL,
  `created_at` timestamp NOT NULL,
  `update_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `user_position`
--

INSERT INTO `user_position` (`id`, `user_id`, `department_id`, `position_id`, `created_at`, `update_at`) VALUES
(3, 3, 3, 3, '2013-12-28 18:38:09', '2013-12-28 18:38:09'),
(4, 2, 4, 2, '2013-12-28 18:38:09', '2013-12-28 18:38:09'),
(5, 9, 5, 9, '2013-12-28 18:38:09', '2013-12-28 18:38:09'),
(6, 21, 6, 21, '2013-12-28 18:38:09', '2013-12-28 18:38:09'),
(7, 6, 7, 6, '2013-12-28 18:38:09', '2013-12-28 18:38:09'),
(8, 8, 8, 8, '2013-12-28 18:38:09', '2013-12-28 18:38:09'),
(9, 4, 9, 4, '2013-12-28 18:38:09', '2013-12-28 18:38:09'),
(10, 5, 10, 5, '2013-12-28 18:38:09', '2013-12-28 18:38:09'),
(11, 7, 11, 7, '2013-12-28 18:38:09', '2013-12-28 18:38:09'),
(12, 10, 3, 14, '2020-05-12 18:37:44', '2020-05-12 18:37:44'),
(13, 11, 3, 14, '2020-05-12 18:37:46', '2020-05-12 18:37:46'),
(14, 12, 5, 11, '2020-05-12 18:39:10', '2020-05-12 18:39:10'),
(15, 13, 5, 11, '2020-05-12 18:39:39', '2020-05-12 18:39:39'),
(16, 14, 9, 15, '2020-05-12 18:39:54', '2020-05-12 18:39:54'),
(17, 15, 9, 15, '2020-05-12 18:40:01', '2020-05-12 18:40:01'),
(18, 16, 9, 15, '2020-05-12 18:40:25', '2020-05-12 18:40:25'),
(19, 17, 9, 15, '2020-05-12 18:40:26', '2020-05-12 18:40:26'),
(20, 18, 5, 11, '2020-05-12 18:40:45', '2020-05-12 18:40:45'),
(21, 19, 5, 11, '2020-05-12 18:40:45', '2020-05-12 18:40:45'),
(22, 20, 5, 10, '2020-05-12 18:40:57', '2020-05-12 18:40:57'),
(23, 22, 5, 10, '2020-05-12 18:41:30', '2020-05-12 18:41:30'),
(24, 23, 5, 10, '2020-05-12 18:41:59', '2020-05-12 18:41:59'),
(25, 24, 5, 10, '2020-05-12 18:42:07', '2020-05-12 18:42:07'),
(26, 25, 5, 10, '2020-05-12 18:42:13', '2020-05-12 18:42:13'),
(27, 26, 5, 10, '2021-04-12 18:42:21', '2021-04-12 18:42:21'),
(28, 27, 5, 10, '2021-04-10 18:42:21', '2021-04-10 18:42:21'),
(29, 28, 5, 10, '2021-04-08 18:42:21', '2021-04-08 18:42:21'),
(30, 29, 5, 10, '2021-04-12 18:42:21', '2021-04-12 18:42:21'),
(31, 30, 5, 11, '2020-05-12 18:43:47', '2020-05-12 18:43:47'),
(32, 31, 5, 11, '2020-05-12 18:44:10', '2020-05-12 18:44:10'),
(33, 32, 5, 11, '2020-05-12 18:44:25', '2020-05-12 18:44:25'),
(34, 33, 8, 16, '2020-05-12 18:44:51', '2020-05-12 18:44:51'),
(35, 34, 8, 16, '2020-05-12 18:45:17', '2020-05-12 18:45:17'),
(36, 35, 8, 16, '2020-05-12 18:45:17', '2020-05-12 18:45:17'),
(37, 36, 5, 11, '2020-05-12 18:45:32', '2020-05-12 18:45:32'),
(38, 37, 5, 11, '2020-05-12 18:46:19', '2020-05-12 18:46:19'),
(39, 38, 5, 12, '2020-05-12 18:46:42', '2020-05-12 18:46:42'),
(40, 39, 5, 12, '2020-05-12 18:47:06', '2020-05-12 18:47:06'),
(41, 40, 5, 12, '2020-05-12 18:47:52', '2020-05-12 18:47:52'),
(42, 41, 5, 12, '2020-05-12 18:48:03', '2020-05-12 18:48:03'),
(43, 42, 5, 12, '2020-05-12 18:48:38', '2020-05-12 18:48:38'),
(44, 43, 5, 12, '2020-05-12 18:48:40', '2020-05-12 18:48:40'),
(45, 44, 5, 11, '2020-05-12 18:48:53', '2020-05-12 18:48:53'),
(46, 45, 4, 13, '2020-05-12 18:48:55', '2020-05-12 18:48:55'),
(47, 46, 4, 13, '2020-05-12 18:49:14', '2020-05-12 18:49:14'),
(48, 47, 4, 13, '2020-05-12 18:49:38', '2020-05-12 18:49:38'),
(49, 48, 4, 13, '2020-05-12 18:49:38', '2020-05-12 18:49:38'),
(50, 49, 4, 13, '2020-05-12 18:50:45', '2020-05-12 18:50:45'),
(51, 50, 5, 11, '2020-05-12 18:50:58', '2020-05-12 18:50:58'),
(52, 51, 5, 11, '2020-05-12 18:51:06', '2020-05-12 18:51:06'),
(53, 52, 5, 11, '2020-05-12 18:51:17', '2020-05-12 18:51:17'),
(54, 53, 10, 20, '2020-05-12 18:51:35', '2020-05-12 18:51:35'),
(55, 54, 10, 20, '2020-05-12 18:51:45', '2020-05-12 18:51:45'),
(56, 55, 5, 11, '2020-05-12 18:51:49', '2020-05-12 18:51:49'),
(57, 56, 5, 11, '2020-05-12 18:52:54', '2020-05-12 18:52:54'),
(58, 57, 7, 17, '2020-05-12 18:53:55', '2020-05-12 18:53:55'),
(59, 58, 7, 17, '2020-05-12 18:54:29', '2020-05-12 18:54:29'),
(60, 59, 5, 11, '2020-05-12 18:54:52', '2020-05-12 18:54:52'),
(61, 60, 5, 11, '2020-05-12 18:55:28', '2020-05-12 18:55:28'),
(62, 61, 5, 11, '2020-05-12 18:55:33', '2020-05-12 18:55:33'),
(63, 62, 5, 11, '2020-05-12 18:55:42', '2020-05-12 18:55:42'),
(64, 63, 10, 19, '2020-05-12 18:55:50', '2020-05-12 18:55:50'),
(65, 64, 10, 19, '2020-05-12 18:55:57', '2020-05-12 18:55:57'),
(66, 65, 10, 19, '2020-05-12 18:56:24', '2020-05-12 18:56:24'),
(67, 66, 10, 19, '2020-05-12 18:56:34', '2020-05-12 18:56:34'),
(68, 67, 10, 19, '2020-05-12 18:56:48', '2020-05-12 18:56:48'),
(69, 68, 5, 11, '2020-05-12 18:56:48', '2020-05-12 18:56:48'),
(70, 69, 5, 11, '2020-05-12 18:57:05', '2020-05-12 18:57:05'),
(71, 70, 5, 11, '2020-05-12 18:57:05', '2020-05-12 18:57:05'),
(72, 71, 5, 11, '2014-02-22 20:10:58', '2014-02-22 20:10:58'),
(73, 72, 5, 11, '2014-02-22 22:14:34', '2014-02-22 22:14:34'),
(74, 73, 5, 11, '2014-02-23 13:44:49', '2014-02-23 13:44:49'),
(75, 74, 11, 18, '2014-02-24 11:42:51', '2014-02-24 11:42:51'),
(76, 75, 11, 18, '2014-02-24 12:04:19', '2014-02-24 12:04:19'),
(77, 76, 11, 18, '2014-02-24 12:54:11', '2014-02-24 12:54:11'),
(78, 77, 11, 18, '2014-02-24 15:39:37', '2014-02-24 15:39:37'),
(79, 78, 11, 18, '2014-02-24 15:45:16', '2014-02-24 15:45:16'),
(80, 79, 11, 18, '2014-02-24 17:17:31', '2014-02-24 17:17:31'),
(81, 80, 11, 18, '2014-02-24 17:59:16', '2014-02-24 17:59:16'),
(82, 81, 11, 18, '2014-02-24 18:45:48', '2014-02-24 18:45:48'),
(83, 82, 11, 18, '2014-02-25 09:25:05', '2014-02-25 09:25:05'),
(84, 83, 11, 18, '2014-02-25 09:57:07', '2014-02-25 09:57:07'),
(85, 84, 11, 18, '2014-02-25 10:07:47', '2014-02-25 10:07:47'),
(86, 85, 11, 18, '2014-02-25 10:20:07', '2014-02-25 10:20:07'),
(87, 86, 5, 11, '2014-02-25 10:26:59', '2014-02-25 10:26:59'),
(88, 87, 5, 11, '2014-02-25 10:48:21', '2014-02-25 10:48:21'),
(89, 88, 5, 11, '2014-02-25 11:04:02', '2014-02-25 11:04:02'),
(90, 89, 5, 11, '2014-02-25 11:29:36', '2014-02-25 11:29:36'),
(91, 90, 5, 11, '2014-02-25 11:54:11', '2014-02-25 11:54:11'),
(92, 91, 5, 11, '2014-02-25 12:06:18', '2014-02-25 12:06:18'),
(93, 92, 5, 11, '2014-02-25 12:12:20', '2014-02-25 12:12:20'),
(94, 93, 5, 11, '2014-02-25 12:16:32', '2014-02-25 12:16:32'),
(95, 94, 5, 11, '2014-02-25 12:30:35', '2014-02-25 12:30:35'),
(96, 95, 5, 11, '2014-02-25 12:39:31', '2014-02-25 12:39:31'),
(97, 96, 5, 11, '2014-02-25 12:41:53', '2014-02-25 12:41:53'),
(98, 97, 5, 11, '2014-02-25 12:53:56', '2014-02-25 12:53:56'),
(99, 98, 5, 11, '2014-02-25 13:12:40', '2014-02-25 13:12:40'),
(100, 99, 5, 11, '2014-02-25 13:29:54', '2014-02-25 13:29:54'),
(101, 100, 5, 11, '2014-02-25 13:37:06', '2014-02-25 13:37:06'),
(102, 502, 5, 11, '2014-02-25 13:37:06', '2014-02-25 13:37:06');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_leader_id_index` (`leader_id`);

--
-- Индексы таблицы `dismission_reason`
--
ALTER TABLE `dismission_reason`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_dismission`
--
ALTER TABLE `user_dismission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_dismission_reason_id_index` (`reason_id`),
  ADD KEY `user_dismission_user_id_index` (`user_id`);

--
-- Индексы таблицы `user_position`
--
ALTER TABLE `user_position`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_position_department_id_index` (`department_id`),
  ADD KEY `user_position_position_id_index` (`position_id`),
  ADD KEY `user_position_user_id_index` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `department`
--
ALTER TABLE `department`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `dismission_reason`
--
ALTER TABLE `dismission_reason`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `position`
--
ALTER TABLE `position`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=503;

--
-- AUTO_INCREMENT для таблицы `user_dismission`
--
ALTER TABLE `user_dismission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `user_position`
--
ALTER TABLE `user_position`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_position_id_fk` FOREIGN KEY (`leader_id`) REFERENCES `position` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_dismission`
--
ALTER TABLE `user_dismission`
  ADD CONSTRAINT `user_dismission_dismission_reason_id_fk` FOREIGN KEY (`reason_id`) REFERENCES `dismission_reason` (`id`),
  ADD CONSTRAINT `user_dismission_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_position`
--
ALTER TABLE `user_position`
  ADD CONSTRAINT `user_position_department_id_fk` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  ADD CONSTRAINT `user_position_position_id_fk` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`),
  ADD CONSTRAINT `user_position_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
