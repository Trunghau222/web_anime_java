-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 15, 2022 lúc 03:58 AM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `anime`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `commet_userId` int(11) NOT NULL,
  `commet_film` int(11) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_time` varchar(100) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `episode`
--

CREATE TABLE `episode` (
  `episode_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `episode_name` int(11) NOT NULL,
  `episode_video` text DEFAULT NULL,
  `episode_start_day` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `film`
--

CREATE TABLE `film` (
  `film_id` int(11) NOT NULL,
  `flim_name` varchar(255) NOT NULL,
  `film_name_real` varchar(255) NOT NULL,
  `film_trangthai` varchar(50) NOT NULL,
  `film_type` int(11) NOT NULL,
  `film_mota` text NOT NULL,
  `film_tacgia` varchar(255) DEFAULT NULL,
  `film_date_aired` varchar(50) NOT NULL,
  `film_views` int(11) NOT NULL DEFAULT 0,
  `film_quality` varchar(10) NOT NULL,
  `film_duration` varchar(20) NOT NULL,
  `film_rating` int(11) NOT NULL DEFAULT 0,
  `film_scores` int(11) NOT NULL DEFAULT 0,
  `flim_assessor` int(11) NOT NULL DEFAULT 0,
  `film_img` varchar(255) DEFAULT NULL,
  `film_traller` text DEFAULT '""',
  `film_current_episode` int(11) DEFAULT NULL,
  `film_end_episode` varchar(11) NOT NULL,
  `film_showtimes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type`
--

CREATE TABLE `type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `type`
--

INSERT INTO `type` (`type_id`, `type_name`) VALUES
(1, 'Hành Động'),
(2, 'Võ Thuật'),
(3, 'Kiếm Hiệp'),
(4, 'Dị Giới'),
(5, 'Viễn Tưởng'),
(6, 'Xuyên Không'),
(7, 'Siêu Nhiên'),
(8, 'Trùng Sinh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `id_1` int(11) NOT NULL DEFAULT 0,
  `tentk` varchar(100) NOT NULL,
  `matkhau` varchar(200) NOT NULL,
  `first_name` varchar(50) NOT NULL DEFAULT 'Chưa cập nhật',
  `last_name` varchar(50) NOT NULL DEFAULT 'Chưa cập nhật',
  `url_hinhanh` varchar(100) NOT NULL DEFAULT 'not_avatar.png',
  `phone` varchar(11) NOT NULL DEFAULT '',
  `quyen` int(11) NOT NULL DEFAULT 0,
  `ban` int(11) NOT NULL DEFAULT 0,
  `diachi` text NOT NULL DEFAULT 'Chưa cập nhật',
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Chỉ mục cho bảng `episode`
--
ALTER TABLE `episode`
  ADD PRIMARY KEY (`episode_id`);

--
-- Chỉ mục cho bảng `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`film_id`);

--
-- Chỉ mục cho bảng `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`tentk`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `episode`
--
ALTER TABLE `episode`
  MODIFY `episode_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `film`
--
ALTER TABLE `film`
  MODIFY `film_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
