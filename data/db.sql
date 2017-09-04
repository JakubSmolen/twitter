-- phpMyAdmin SQL Dump
-- version 4.6.6deb1+deb.cihar.com~xenial.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 04 Wrz 2017, 19:50
-- Wersja serwera: 5.7.19-0ubuntu0.16.04.1
-- Wersja PHP: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `twitter`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Comment`
--

CREATE TABLE `Comment` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `postId` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `text` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Comment`
--

INSERT INTO `Comment` (`id`, `userId`, `postId`, `creation_date`, `text`) VALUES
(1, 1, 1, '2016-04-28 00:00:00', 'Lorem Ipsum jest tekstem '),
(2, 2, 5, '2017-04-23 00:00:00', 'Lorem Ipsum jest tekstem '),
(6, 2, 5, '2017-05-01 20:00:28', 'Lorem Ipsum jest tekstem '),
(7, 2, 5, '2017-05-01 20:31:28', 'Lorem Ipsum jest tekstem '),
(24, 103, 24, '2017-08-31 21:07:06', 'Lorem Ipsum jest tekstem ');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Message`
--

CREATE TABLE `Message` (
  `id` int(11) NOT NULL,
  `senderId` int(11) NOT NULL,
  `receiverId` int(11) NOT NULL,
  `isRead` int(11) DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8 NOT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Message`
--

INSERT INTO `Message` (`id`, `senderId`, `receiverId`, `isRead`, `message`, `creationDate`) VALUES
(1, 1, 2, 1, 'Lorem Ipsum jest tekstem ', '2017-05-07 11:36:31'),
(2, 1, 2, 0, 'Lorem Ipsum jest tekstem ', '2017-05-07 11:41:30'),
(3, 1, 2, 0, 'Lorem Ipsum jest tekstem ', '2017-05-07 11:42:06'),
(4, 1, 2, 0, 'Lorem Ipsum jest tekstem ', '2017-05-07 13:41:29'),
(5, 2, 1, 1, 'Lorem Ipsum jest tekstem ', '2017-05-07 11:30:31'),
(6, 1, 2, 0, 'Lorem Ipsum jest tekstem ', '2017-05-08 19:03:06'),
(8, 103, 1, 1, 'fdgfhgjhkjl;l', '2017-08-31 21:06:43');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Tweet`
--

CREATE TABLE `Tweet` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `tekst` varchar(600) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `creationDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Tweet`
--

INSERT INTO `Tweet` (`id`, `userId`, `tekst`, `creationDate`) VALUES
(1, 1, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle ', '2017-04-20'),
(2, 1, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle ', '2017-04-19'),
(5, 2, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle ', '2017-03-01'),
(19, 2, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle ', '2017-01-01'),
(20, 1, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle ', '2017-05-01'),
(21, 1, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle ', '2017-05-01'),
(22, 1, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle ', '2017-05-01'),
(23, 1, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle ', '2017-05-06'),
(24, 1, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle ', '2017-05-06'),
(25, 1, 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle ', '2017-05-08'),
(66, 103, 'qwerf', '2017-08-31'),
(67, 103, 'Ã³Ã³Ã³Ã³Å‚Å‚Å‚Å‚Å‚Å„Å„Å„Å„ÅºÅºÅºÅºÅºÅº', '2017-08-31');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Users`
--

CREATE TABLE `Users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `hash_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Zrzut danych tabeli `Users`
--

INSERT INTO `Users` (`id`, `username`, `email`, `hash_password`) VALUES
(1, 'test', 'test@test.pl', 'qwerty'),
(2, 'test2', 'test2@test.pl', 'qwerty'),
(3, 'test3', 'test3@test.pl', 'qwerty'),
(4, 'test4', 'test4@test.pl', 'qwerty'),
(5, 'test5', 'test5@test.pl', 'qwerty'),
(6, 'test6', 'test6@test.pl', 'qwerty'),
(7, 'test7', 'test7@test.pl', 'qwerty'),
(8, 'test8', 'test8@test.pl', 'qwerty'),
(100, 'sdf', 'test20@test.pl', 'qwerrty'),
(103, 'qw', 'qw@qw.pl', '$2y$05$RqViUBbRhDzIBBR8KXj3qO/./hhDq.ZBFNj0MTKoLt12J3rBk9IJ6');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `Comment`
--
ALTER TABLE `Comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `postId` (`postId`);

--
-- Indexes for table `Message`
--
ALTER TABLE `Message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `senderId` (`senderId`),
  ADD KEY `receiverId` (`receiverId`);

--
-- Indexes for table `Tweet`
--
ALTER TABLE `Tweet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `Comment`
--
ALTER TABLE `Comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT dla tabeli `Message`
--
ALTER TABLE `Message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT dla tabeli `Tweet`
--
ALTER TABLE `Tweet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT dla tabeli `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `Comment`
--
ALTER TABLE `Comment`
  ADD CONSTRAINT `Comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Comment_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `Tweet` (`id`);

--
-- Ograniczenia dla tabeli `Message`
--
ALTER TABLE `Message`
  ADD CONSTRAINT `Message_ibfk_1` FOREIGN KEY (`senderId`) REFERENCES `Users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Message_ibfk_2` FOREIGN KEY (`receiverId`) REFERENCES `Users` (`id`);

--
-- Ograniczenia dla tabeli `Tweet`
--
ALTER TABLE `Tweet`
  ADD CONSTRAINT `Tweet_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
