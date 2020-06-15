-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th6 15, 2020 lúc 06:39 AM
-- Phiên bản máy phục vụ: 10.4.10-MariaDB
-- Phiên bản PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `protify`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_album`
--

DROP TABLE IF EXISTS `tb_album`;
CREATE TABLE IF NOT EXISTS `tb_album` (
  `AlbumID` int(10) NOT NULL AUTO_INCREMENT,
  `AlbumName` varchar(30) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `ReleaseDate` date NOT NULL,
  `Desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ImageFile` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`AlbumID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_album`
--

INSERT INTO `tb_album` (`AlbumID`, `AlbumName`, `ReleaseDate`, `Desc`, `ImageFile`) VALUES
(1, 'I(Mini album)', '2015-10-07', NULL, '../html/assets/albumImg/I.jpg'),
(2, 'Rain(Single)', '2016-02-03', NULL, '../html/assets/albumImg/Rain.jpg'),
(3, 'Don\'t say no', '2017-01-17', NULL, '../html/assets/albumImg/Don\'tSayNo.jpg'),
(4, 'Secret', '2016-08-19', NULL, '../html/assets/albumImg/Secret.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_album_liked`
--

DROP TABLE IF EXISTS `tb_album_liked`;
CREATE TABLE IF NOT EXISTS `tb_album_liked` (
  `UserID` varchar(30) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `AlbumID` int(10) NOT NULL,
  `LikeDate` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`UserID`,`AlbumID`),
  KEY `UserABL` (`UserID`),
  KEY `AlbumABL` (`AlbumID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_album_track`
--

DROP TABLE IF EXISTS `tb_album_track`;
CREATE TABLE IF NOT EXISTS `tb_album_track` (
  `AlbumID` int(10) NOT NULL,
  `TrackID` int(10) NOT NULL,
  PRIMARY KEY (`AlbumID`,`TrackID`),
  KEY `AlbumABT` (`AlbumID`) USING BTREE,
  KEY `TrackABT` (`TrackID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
-- Error reading data for table protify.tb_album_track: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `protify`.`tb_album_track`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_album_type`
--

DROP TABLE IF EXISTS `tb_album_type`;
CREATE TABLE IF NOT EXISTS `tb_album_type` (
  `AlbumID` int(10) NOT NULL,
  `TypeID` int(10) NOT NULL,
  PRIMARY KEY (`AlbumID`,`TypeID`),
  KEY `TypeID` (`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_album_type`
--

INSERT INTO `tb_album_type` (`AlbumID`, `TypeID`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_artist`
--

DROP TABLE IF EXISTS `tb_artist`;
CREATE TABLE IF NOT EXISTS `tb_artist` (
  `ArtistID` int(10) NOT NULL AUTO_INCREMENT,
  `ArtistName` varchar(30) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `Desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ImageFile` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`ArtistID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_artist`
--

INSERT INTO `tb_artist` (`ArtistID`, `ArtistName`, `Desc`, `ImageFile`) VALUES
(1, 'Taeyeon', 'Kim Tae-yeon (born March 9, 1989), known mononymously as Taeyeon, is a South Korean singer.', '../html/assets/ArtistImg/Taeyeon.jpg'),
(2, 'Seohyun', 'Seo Ju-hyun (born June 28, 1991), known professionally as Seohyun, is a South Korean singer and actress.', '../html/assets/ArtistImg/Seohyun.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_artist_track`
--

DROP TABLE IF EXISTS `tb_artist_track`;
CREATE TABLE IF NOT EXISTS `tb_artist_track` (
  `ArtistID` int(10) NOT NULL,
  `TrackID` int(10) NOT NULL,
  PRIMARY KEY (`ArtistID`,`TrackID`),
  KEY `ArtistATT` (`ArtistID`) USING BTREE,
  KEY `TrackATT` (`TrackID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_artist_track`
--

INSERT INTO `tb_artist_track` (`ArtistID`, `TrackID`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_artist_type`
--

DROP TABLE IF EXISTS `tb_artist_type`;
CREATE TABLE IF NOT EXISTS `tb_artist_type` (
  `ArtistID` int(10) NOT NULL,
  `TypeID` int(10) NOT NULL,
  PRIMARY KEY (`ArtistID`,`TypeID`),
  KEY `TypeID` (`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_artist_type`
--

INSERT INTO `tb_artist_type` (`ArtistID`, `TypeID`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_comment`
--

DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE IF NOT EXISTS `tb_comment` (
  `CmtID` int(10) NOT NULL AUTO_INCREMENT,
  `ArtistID` int(10) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `Email` varchar(50) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `Content` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `DateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`CmtID`),
  KEY `ArtistID` (`ArtistID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
-- Error reading data for table protify.tb_comment: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `protify`.`tb_comment`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_playlist`
--

DROP TABLE IF EXISTS `tb_playlist`;
CREATE TABLE IF NOT EXISTS `tb_playlist` (
  `PlaylistID` int(10) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(30) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `PlaylistName` varchar(30) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `Desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ImageFile` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`PlaylistID`),
  KEY `UserPL` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_playlist`
--

INSERT INTO `tb_playlist` (`PlaylistID`, `UserID`, `PlaylistName`, `CreateDate`, `Desc`, `ImageFile`) VALUES
(1, 'M01', 'nhaccuagau', '2020-06-06 07:04:48', NULL, '../html/assets/Img/trackImg/i.jpg'),
(2, 'M02', 'nhaccuatho', '2020-06-06 07:04:48', NULL, '../html/assets/Img/trackImg/Rain.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_playlist_liked`
--

DROP TABLE IF EXISTS `tb_playlist_liked`;
CREATE TABLE IF NOT EXISTS `tb_playlist_liked` (
  `UserID` varchar(30) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `PlaylistID` int(10) NOT NULL,
  `LikeDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`UserID`,`PlaylistID`),
  KEY `UserPLL` (`UserID`),
  KEY `AlbumPLL` (`PlaylistID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_playlist_liked`
--

INSERT INTO `tb_playlist_liked` (`UserID`, `PlaylistID`, `LikeDate`) VALUES
('A02', 2, '2020-06-06 07:06:15'),
('M01', 1, '2020-06-06 07:06:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_playlist_track`
--

DROP TABLE IF EXISTS `tb_playlist_track`;
CREATE TABLE IF NOT EXISTS `tb_playlist_track` (
  `PlaylistID` int(10) NOT NULL,
  `TrackID` int(10) NOT NULL,
  PRIMARY KEY (`PlaylistID`,`TrackID`),
  KEY `TrackID` (`TrackID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_playlist_track`
--

INSERT INTO `tb_playlist_track` (`PlaylistID`, `TrackID`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_queue_track`
--

DROP TABLE IF EXISTS `tb_queue_track`;
CREATE TABLE IF NOT EXISTS `tb_queue_track` (
  `UserID` varchar(30) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `TrackID` int(10) NOT NULL,
  PRIMARY KEY (`UserID`),
  KEY `SongID` (`TrackID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_queue_track`
--

INSERT INTO `tb_queue_track` (`UserID`, `TrackID`) VALUES
('M01', 1),
('M02', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_reply`
--

DROP TABLE IF EXISTS `tb_reply`;
CREATE TABLE IF NOT EXISTS `tb_reply` (
  `ReplyID` int(10) NOT NULL AUTO_INCREMENT,
  `CmtID` int(10) NOT NULL,
  `Content` varchar(30) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `Datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ReplyID`),
  KEY `CmtRP` (`CmtID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_reply`
--

INSERT INTO `tb_reply` (`ReplyID`, `CmtID`, `Content`, `Datetime`) VALUES
(1, 1, 'Em cũng nghĩ vậy á hihi', '2020-06-06 07:17:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_track`
--

DROP TABLE IF EXISTS `tb_track`;
CREATE TABLE IF NOT EXISTS `tb_track` (
  `TrackID` int(10) NOT NULL AUTO_INCREMENT,
  `TrackName` varchar(30) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `ReleaseDate` date NOT NULL,
  `Length` time NOT NULL,
  `TypeID` int(10) NOT NULL,
  `Desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ImageFile` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `TrackFile` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`TrackID`),
  KEY `TypeID` (`TypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_track`
--

INSERT INTO `tb_track` (`TrackID`, `TrackName`, `ReleaseDate`, `Length`, `TypeID`, `Desc`, `ImageFile`, `TrackFile`) VALUES
(1, 'I', '2015-10-07', '00:03:26', 1, 'MV realease in 10-7-2015', '../html/assets/Img/trackImg/Rain.jpg', '../html/assets/Tracks/Rain.mp3'),
(2, 'Rain', '2016-02-03', '00:03:42', 1, NULL, '../html/assets/Img/trackImg/Rain.jpg', '../html/assets/Tracks/Rain.mp3');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_track_liked`
--

DROP TABLE IF EXISTS `tb_track_liked`;
CREATE TABLE IF NOT EXISTS `tb_track_liked` (
  `UserID` varchar(30) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `TrackID` int(10) NOT NULL,
  `LikeDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`UserID`,`TrackID`),
  KEY `UserTL` (`UserID`),
  KEY `TrackL` (`TrackID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_track_liked`
--

INSERT INTO `tb_track_liked` (`UserID`, `TrackID`, `LikeDate`) VALUES
('M01', 1, '2020-06-06 07:11:21'),
('M02', 2, '2020-06-06 07:11:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_track_listen`
--

DROP TABLE IF EXISTS `tb_track_listen`;
CREATE TABLE IF NOT EXISTS `tb_track_listen` (
  `TrackID` int(10) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `ListenTimes` int(10) DEFAULT NULL,
  PRIMARY KEY (`TrackID`,`Date`),
  KEY `TrackLT` (`TrackID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_track_listen`
--

INSERT INTO `tb_track_listen` (`TrackID`, `Date`, `ListenTimes`) VALUES
(1, '2020-06-06 07:12:19', 1),
(2, '2020-06-06 07:12:19', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_type`
--

DROP TABLE IF EXISTS `tb_type`;
CREATE TABLE IF NOT EXISTS `tb_type` (
  `TypeID` int(10) NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(30) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_type`
--

INSERT INTO `tb_type` (`TypeID`, `TypeName`) VALUES
(1, 'Pop'),
(2, 'Rock'),
(3, 'Jazz'),
(4, 'Blues'),
(5, 'R&B/Soul'),
(6, 'Hip hop'),
(7, ' Country'),
(8, 'Pop'),
(9, 'Dance'),
(10, 'Opera');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE IF NOT EXISTS `tb_user` (
  `UserID` varchar(30) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Name` varchar(30) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Password` varchar(30) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `Email` varchar(40) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `Role` tinyint(1) NOT NULL,
  `Locaiton` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `Website` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `MusicType` varchar(30) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_user`
--

INSERT INTO `tb_user` (`UserID`, `Name`, `Password`, `Email`, `Role`, `Locaiton`, `Website`, `MusicType`) VALUES
('A01', 'ADMIN', 'vominhthucute', 'minhthu@gmail.com', 1, NULL, NULL, NULL),
('A02', '', 'quynhconguoiyeunehihi', 'luongtrucquynh@gmail.com', 1, NULL, NULL, NULL),
('M01', '', 'cauvongbaymau', 'bibi@gmail.com', 0, NULL, NULL, NULL),
('M02', '', 'quangdeptrai', 'quangnguyen@gmail.com', 0, NULL, NULL, NULL);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `tb_album_liked`
--
ALTER TABLE `tb_album_liked`
  ADD CONSTRAINT `AlbumL` FOREIGN KEY (`AlbumID`) REFERENCES `tb_album` (`AlbumID`),
  ADD CONSTRAINT `UserABL` FOREIGN KEY (`UserID`) REFERENCES `tb_user` (`UserID`);

--
-- Các ràng buộc cho bảng `tb_album_track`
--
ALTER TABLE `tb_album_track`
  ADD CONSTRAINT `AlbumT` FOREIGN KEY (`AlbumID`) REFERENCES `tb_album` (`AlbumID`),
  ADD CONSTRAINT `TrackT1` FOREIGN KEY (`TrackID`) REFERENCES `tb_track` (`TrackID`);

--
-- Các ràng buộc cho bảng `tb_album_type`
--
ALTER TABLE `tb_album_type`
  ADD CONSTRAINT `tb_album_type_ibfk_1` FOREIGN KEY (`AlbumID`) REFERENCES `tb_album` (`AlbumID`),
  ADD CONSTRAINT `tb_album_type_ibfk_2` FOREIGN KEY (`TypeID`) REFERENCES `tb_type` (`TypeID`);

--
-- Các ràng buộc cho bảng `tb_artist_track`
--
ALTER TABLE `tb_artist_track`
  ADD CONSTRAINT `ArtistT` FOREIGN KEY (`ArtistID`) REFERENCES `tb_artist` (`ArtistID`),
  ADD CONSTRAINT `TrackT` FOREIGN KEY (`TrackID`) REFERENCES `tb_track` (`TrackID`);

--
-- Các ràng buộc cho bảng `tb_artist_type`
--
ALTER TABLE `tb_artist_type`
  ADD CONSTRAINT `tb_artist_type_ibfk_1` FOREIGN KEY (`ArtistID`) REFERENCES `tb_artist` (`ArtistID`),
  ADD CONSTRAINT `tb_artist_type_ibfk_2` FOREIGN KEY (`TypeID`) REFERENCES `tb_type` (`TypeID`);

--
-- Các ràng buộc cho bảng `tb_comment`
--
ALTER TABLE `tb_comment`
  ADD CONSTRAINT `tb_comment_ibfk_1` FOREIGN KEY (`ArtistID`) REFERENCES `tb_artist` (`ArtistID`);

--
-- Các ràng buộc cho bảng `tb_playlist`
--
ALTER TABLE `tb_playlist`
  ADD CONSTRAINT `UserPL` FOREIGN KEY (`UserID`) REFERENCES `tb_user` (`UserID`);

--
-- Các ràng buộc cho bảng `tb_track`
--
ALTER TABLE `tb_track`
  ADD CONSTRAINT `tb_track_ibfk_1` FOREIGN KEY (`TypeID`) REFERENCES `tb_type` (`TypeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
