-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 13 2026 г., 21:35
-- Версия сервера: 5.7.39-log
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `cinema`
--

-- --------------------------------------------------------

--
-- Структура таблицы `film`
--

CREATE TABLE `film` (
  `id_film` int(11) NOT NULL,
  `genre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nazv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `film`
--

INSERT INTO `film` (`id_film`, `genre`, `nazv`) VALUES
(1, 'Комедия', 'Хохотушки'),
(2, 'Триллер', 'Снеговик с татуировкой'),
(3, 'Мелодрама', 'Белый лебедь');

-- --------------------------------------------------------

--
-- Структура таблицы `seans`
--

CREATE TABLE `seans` (
  `id_seans` int(11) NOT NULL,
  `data` date NOT NULL,
  `price` float NOT NULL,
  `id_zal` int(11) NOT NULL,
  `id_film` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `seans`
--

INSERT INTO `seans` (`id_seans`, `data`, `price`, `id_zal`, `id_film`) VALUES
(1, '2023-01-20', 200, 1, 1),
(2, '2024-02-20', 300, 2, 2),
(3, '2025-03-20', 400, 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `zal`
--

CREATE TABLE `zal` (
  `id_zal` int(1) NOT NULL,
  `name` varchar(8) DEFAULT NULL,
  `genre` varchar(9) DEFAULT NULL,
  `kolvo` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `zal`
--

INSERT INTO `zal` (`id_zal`, `name`, `genre`, `kolvo`) VALUES
(1, 'Апельсин', 'Комедия', 30),
(2, 'Манго', 'Триллер', 26),
(3, 'Киви', 'Мелодрама', 32);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id_film`);

--
-- Индексы таблицы `seans`
--
ALTER TABLE `seans`
  ADD PRIMARY KEY (`id_seans`),
  ADD KEY `id_film` (`id_film`),
  ADD KEY `id_zal` (`id_zal`);

--
-- Индексы таблицы `zal`
--
ALTER TABLE `zal`
  ADD PRIMARY KEY (`id_zal`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `film`
--
ALTER TABLE `film`
  MODIFY `id_film` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `seans`
--
ALTER TABLE `seans`
  MODIFY `id_seans` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `zal`
--
ALTER TABLE `zal`
  MODIFY `id_zal` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `seans`
--
ALTER TABLE `seans`
  ADD CONSTRAINT `seans_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  ADD CONSTRAINT `seans_ibfk_2` FOREIGN KEY (`id_zal`) REFERENCES `zal` (`id_zal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
