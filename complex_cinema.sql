CREATE DATABASE IF NOT EXISTS `theater` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- backticks rajoutés car qqs mots réservés utilisés
USE `theater`;

-- Création de la table User
CREATE TABLE IF NOT EXISTS `User`
(
    `id_user` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `firstname` VARCHAR(30) NOT NULL,
    `lastname` VARCHAR(30) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `password` VARCHAR(60) NOT NULL,
    `birthdate` DATE,
    `is_student` TINYINT(1),
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME,
    UNIQUE (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Création de la table Movie
CREATE TABLE IF NOT EXISTS `Movie`
(
    `id_movie` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `title` VARCHAR(150) NOT NULL,
    `summary` TEXT NOT NULL,
    `director` VARCHAR(150) NOT NULL,
    `duration` INT NOT NULL,
    `released_at` DATE NOT NULL,
    `poster` VARCHAR(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- duration : durée en minute

-- Création de la table Price
CREATE TABLE IF NOT EXISTS `Price`
(
    `id_price` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `price` DECIMAL(5,2) NOT NULL,
    `category` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Création de la table Complex
CREATE TABLE IF NOT EXISTS `Complex`
(
    `id_complex` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(60) NOT NULL,
    `address` VARCHAR(200) NOT NULL,
    `postal_code` VARCHAR(5) NOT NULL,
    `city` VARCHAR(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Création de la table Room
CREATE TABLE IF NOT EXISTS `Room`
(
    `id_room` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(60) NOT NULL,
    `qty_place` INT NOT NULL,
    `complex_id` INT,
    CONSTRAINT `fk_complex_id` FOREIGN KEY (`complex_id`) REFERENCES `Complex`(`id_complex`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Création de la table Session
CREATE TABLE IF NOT EXISTS `Session`
(
    `id_session` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `start_date` DATETIME NOT NULL,
    `end_date` DATETIME NOT NULL,
    `room_id` INT,
    `movie_id` INT,
    `price_id` INT,
    CONSTRAINT `fk_room_id` FOREIGN KEY (`room_id`) REFERENCES `Room`(`id_room`) ON DELETE CASCADE,
    CONSTRAINT `fk_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `Movie`(`id_movie`) ON DELETE CASCADE,
    CONSTRAINT `fk_price_id` FOREIGN KEY (`price_id`) REFERENCES `Price`(`id_price`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Création de la table Booking (Table relationnelle)
CREATE TABLE IF NOT EXISTS `Booking`
(
    `session_id` INT,
    `user_id` INT,
    CONSTRAINT `pk_booking` PRIMARY KEY (`session_id`, `user_id`),
    FOREIGN KEY (`session_id`) REFERENCES `Session`(`id_session`) ON DELETE CASCADE,
    FOREIGN KEY (`user_id`) REFERENCES `User`(`id_user`) ON DELETE CASCADE,
    UNIQUE (session_id, user_id) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




-- Insert datas into User Table

INSERT INTO `User` (`id_user`, `firstname`, `lastname`, `email`, `password`, `birthdate`, `is_student`, `created_at`, `updated_at`) VALUES (1, 'Liè', 'McGeachie', 'lmcgeachie0@home.pl', '$2y$10$f/2xBbPUYe/ojHTzt0JMgeVHx0wIdioWqqoEit0LB/J6nQLVJ/q52', '1992-10-09', null, '2020-12-31 18:19:01', '2022-05-18 16:45:07');
INSERT INTO `User` (`id_user`, `firstname`, `lastname`, `email`, `password`, `birthdate`, `is_student`, `created_at`, `updated_at`) VALUES (2, 'Rébecca', 'Feyer', 'dfeyer1@vk.com', '$2y$10$tv0gBqFMvnSd14CkRqPl5OruRGymg4EKVofxtMGiDXGyTOtlVVc8S', '1969-11-22', null, '2020-11-04 17:03:41', '2022-11-06 16:44:09');
INSERT INTO `User` (`id_user`, `firstname`, `lastname`, `email`, `password`, `birthdate`, `is_student`, `created_at`, `updated_at`) VALUES (3, 'Åke', 'Olive', 'wolive2@biglobe.ne.jp', '$2y$10$ZM.V77u.3Sw8NZNIrRD2iuK/fMvPFPksDFvJ6GvMoSaTstbGWA0uu', '1995-04-10', true, '2022-04-02 02:31:45', null);
INSERT INTO `User` (`id_user`, `firstname`, `lastname`, `email`, `password`, `birthdate`, `is_student`, `created_at`, `updated_at`) VALUES (4, 'Yáo', 'Austick', 'laustick3@sogou.com', '$2y$10$fcx.TzxCzQE1FbTC4N0LuuenY3vQ5xXaGyskxN7SRcrJmRu1ZbOJ6', '1966-05-23', null, '2022-02-13 08:21:51', null);
INSERT INTO `User` (`id_user`, `firstname`, `lastname`, `email`, `password`, `birthdate`, `is_student`, `created_at`, `updated_at`) VALUES (5, 'Danièle', 'Leivesley', 'bleivesley4@walmart.com', '$2y$10$ZMOQ5YPu5w0H0BfizdORwegChTTG8QlF37GvoLKMA2cgQvt8rGPiC', '1987-02-26', null, '2021-09-03 23:30:50', '2022-03-20 09:32:11');
INSERT INTO `User` (`id_user`, `firstname`, `lastname`, `email`, `password`, `birthdate`, `is_student`, `created_at`, `updated_at`) VALUES (6, 'Åslög', 'Clixby', 'aclixby5@ask.com', '$2y$10$BzuCtwsrje5Hwnl.HQHuZOxSpvKodjGPUyL9LyQAMthP.tR0poyCq', '1971-01-11', false, '2020-04-21 22:14:05', '2021-10-06 08:00:28');
INSERT INTO `User` (`id_user`, `firstname`, `lastname`, `email`, `password`, `birthdate`, `is_student`, `created_at`, `updated_at`) VALUES (7, 'Åslög', 'Proschke', 'jproschke6@toplist.cz', '$2y$10$4QouI6DpnQIkARVyZDcHS.PkH9HjxSul6R7HI0w933AlRfXpwsqXG', '1966-08-10', false, '2022-04-06 04:09:50', null);
INSERT INTO `User` (`id_user`, `firstname`, `lastname`, `email`, `password`, `birthdate`, `is_student`, `created_at`, `updated_at`) VALUES (8, 'Céline', 'Bliben', 'abliben7@examiner.com', '$2y$10$yMGjd7yJVDYdPN1hMtXv/eapD/.DpqhwVtZ98psNrcpjuXm.EfYw.', '1994-07-10', null, '2020-10-11 18:36:51', null);
INSERT INTO `User` (`id_user`, `firstname`, `lastname`, `email`, `password`, `birthdate`, `is_student`, `created_at`, `updated_at`) VALUES (9, 'Méline', 'Phillp', 'lphillp8@admin.ch', '$2y$10$4QKyNBD37eVYvhFZBT8cc.ZaDN56WwfmXOtnSO.q6iSwtycmF3sH.', '1980-01-03', true, '2022-02-12 20:27:04', '2021-09-19 02:51:34');
INSERT INTO `User` (`id_user`, `firstname`, `lastname`, `email`, `password`, `birthdate`, `is_student`, `created_at`, `updated_at`) VALUES (10, 'Salomé', 'Hughill', 'ahughill9@acquirethisname.com', '$2y$10$U0avly3Z6H7UYla39kn/..FJds8iIhf7Vk4pGKuhO0nk8RDXzZTS.', '1977-03-06', null, '2022-09-02 06:07:11', '2021-08-16 11:04:34');


-- Insert datas into Movie Table

insert into `Movie` (`id_movie`, `title`, `summary`, `director`, `duration`, `released_at`, `poster`) values (1, 'Cornered', 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', 'Denyse Knath', 107, '2001-03-16', 'http://dummyimage.com/199x306.png/ff4444/ffffff');
insert into `Movie` (`id_movie`, `title`, `summary`, `director`, `duration`, `released_at`, `poster`) values (2, 'Powaqqatsi', 'Suspendisse potenti.', 'Rosella Arndtsen', 133, '2016-12-05', 'http://dummyimage.com/175x124.png/dddddd/000000');
insert into `Movie` (`id_movie`, `title`, `summary`, `director`, `duration`, `released_at`, `poster`) values (3, 'Cover-Up', 'Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.', 'Charmane Christall', 134, '2015-06-12', 'http://dummyimage.com/124x160.png/ff4444/ffffff');
insert into `Movie` (`id_movie`, `title`, `summary`, `director`, `duration`, `released_at`, `poster`) values (4, 'National Lampoon''s Van Wilder', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'Peg Mylechreest', 153, '2009-06-24', 'http://dummyimage.com/187x438.png/cc0000/ffffff');
insert into `Movie` (`id_movie`, `title`, `summary`, `director`, `duration`, `released_at`, `poster`) values (5, 'Tough and Deadly', 'In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.', 'Carma Baty', 132, '2007-04-04', 'http://dummyimage.com/100x385.png/dddddd/000000');
insert into `Movie` (`id_movie`, `title`, `summary`, `director`, `duration`, `released_at`, `poster`) values (6, 'Welcome to the Roses (Bienvenue chez les Rozes)', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.', 'Shirley Karpets', 121, '2020-11-24', 'http://dummyimage.com/189x335.png/5fa2dd/ffffff');
insert into `Movie` (`id_movie`, `title`, `summary`, `director`, `duration`, `released_at`, `poster`) values (7, 'They Came to Cordura', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'Fina Casin', 147, '1999-05-18', 'http://dummyimage.com/113x134.png/ff4444/ffffff');
insert into `Movie` (`id_movie`, `title`, `summary`, `director`, `duration`, `released_at`, `poster`) values (8, 'Motivation, The', 'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.', 'Ashley Wigelsworth', 122, '2008-06-23', 'http://dummyimage.com/136x314.png/dddddd/000000');
insert into `Movie` (`id_movie`, `title`, `summary`, `director`, `duration`, `released_at`, `poster`) values (9, 'Following', 'In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'Gherardo Neumann', 156, '2004-10-06', 'http://dummyimage.com/181x659.png/dddddd/000000');
insert into `Movie` (`id_movie`, `title`, `summary`, `director`, `duration`, `released_at`, `poster`) values (10, 'Wilder Napalm', 'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Gabie Jarvie', 146, '2012-07-24', 'http://dummyimage.com/154x414.png/ff4444/ffffff');


-- Insert datas into Price Table

insert into `Price` (`id_price`, `price`, `category`) values (1, 9.20, 'Plein tarif');
insert into `Price` (`id_price`, `price`, `category`) values (2, 7.60, 'Etudiant');
insert into `Price` (`id_price`, `price`, `category`) values (3, 5.90, 'Moins de 14 ans');


-- Insert datas into Complex Table

insert into `Complex` (`id_complex`, `name`, `address`, `postal_code`, `city`) values (1, 'Gaumont Annecy', '6 Rue de la Poste', '74000', 'Annecy');
insert into `Complex` (`id_complex`, `name`, `address`, `postal_code`, `city`) values (2, 'Gaumont Montpellier', '9 Bd de la paix', '34000', 'Montpellier');
insert into `Complex` (`id_complex`, `name`, `address`, `postal_code`, `city`) values (3, 'Gaumont Caen', '29 Rue Papins', '14000', 'Caen');
insert into `Complex` (`id_complex`, `name`, `address`, `postal_code`, `city`) values (4, 'Gaumont Marseille', '7 Bd des developpeurs', '13000', 'Marseille');
insert into `Complex` (`id_complex`, `name`, `address`, `postal_code`, `city`) values (5, 'Gaumont Lyon', '93 Rue des artistes Lane', '69000', 'Lyon');
insert into `Complex` (`id_complex`, `name`, `address`, `postal_code`, `city`) values (6, 'Gaumont Nancy', '3 Rue du Jardin', '54000', 'Nancy');
insert into `Complex` (`id_complex`, `name`, `address`, `postal_code`, `city`) values (7, 'Gaumont Belfort', '8 Rue de la Poste', '90000', 'Belfort');


-- Insert datas into Room Table
insert into `Room` (`id_room`, `name`, `qty_place`, `complex_id`) values (1, 'leo saloon', 80, 4);
insert into `Room` (`id_room`, `name`, `qty_place`, `complex_id`) values (2, 'pede ullamcorper augue', 59, 7);
insert into `Room` (`id_room`, `name`, `qty_place`, `complex_id`) values (3, 'capucine', 85, 3);
insert into `Room` (`id_room`, `name`, `qty_place`, `complex_id`) values (4, 'luctus', 60, 3);
insert into `Room` (`id_room`, `name`, `qty_place`, `complex_id`) values (5, 'nec semduis', 76, 6);
insert into `Room` (`id_room`, `name`, `qty_place`, `complex_id`) values (6, 'duis bibendum', 65, 6);
insert into `Room` (`id_room`, `name`, `qty_place`, `complex_id`) values (7, 'erat quisque erat', 87, 2);
insert into `Room` (`id_room`, `name`, `qty_place`, `complex_id`) values (8, 'ut ultrices vel', 58, 6);
insert into `Room` (`id_room`, `name`, `qty_place`, `complex_id`) values (9, 'quam pharetra magna', 85, 2);
insert into `Room` (`id_room`, `name`, `qty_place`, `complex_id`) values (10, 'astero', 62, 3);


-- Insert datas into Session Table

insert into `Session` (`id_session`, `start_date`, `end_date`, `room_id`, `movie_id`, `price_id`) values (1, '2022-11-10 11:49:45', '2022-11-10 12:55:38', 1, 1, 1);
insert into `Session` (`id_session`, `start_date`, `end_date`, `room_id`, `movie_id`, `price_id`) values (2, '2022-11-05 15:48:32', '2021-11-05 17:36:14', 2, 10, 3);
insert into `Session` (`id_session`, `start_date`, `end_date`, `room_id`, `movie_id`, `price_id`) values (3, '2022-11-10 10:42:18', '2021-11-10 11:31:51', 1, 6, 3);
insert into `Session` (`id_session`, `start_date`, `end_date`, `room_id`, `movie_id`, `price_id`) values (4, '2022-11-18 18:33:24', '2022-11-18 21:02:27', 1, 5, 3);
insert into `Session` (`id_session`, `start_date`, `end_date`, `room_id`, `movie_id`, `price_id`) values (5, '2022-11-27 23:12:37', '2022-11-28 00:30:58', 5, 9, 3);
insert into `Session` (`id_session`, `start_date`, `end_date`, `room_id`, `movie_id`, `price_id`) values (6, '2022-11-20 16:28:29', '2022-11-20 18:13:33', 4, 4, 1);
insert into `Session` (`id_session`, `start_date`, `end_date`, `room_id`, `movie_id`, `price_id`) values (7, '2022-11-15 10:10:45', '2022-11-15 12:22:10', 4, 10, 1);
insert into `Session` (`id_session`, `start_date`, `end_date`, `room_id`, `movie_id`, `price_id`) values (8, '2022-11-17 15:31:46', '2022-11-17 16:43:30', 6, 10, 1);
insert into `Session` (`id_session`, `start_date`, `end_date`, `room_id`, `movie_id`, `price_id`) values (9, '2022-11-10 11:01:57', '2022-11-10 12:11:53', 5, 10, 1);
insert into `Session` (`id_session`, `start_date`, `end_date`, `room_id`, `movie_id`, `price_id`) values (10, '2021-11-18 16:42:53', '2022-11-18 18:25:07', 1, 10, 2);


-- Insert datas into Booking Table

insert into `Booking` (`session_id`, `user_id`) values (10, 8);
insert into `Booking` (`session_id`, `user_id`) values (2, 5);
insert into `Booking` (`session_id`, `user_id`) values (10, 3);
insert into `Booking` (`session_id`, `user_id`) values (10, 1);
insert into `Booking` (`session_id`, `user_id`) values (4, 10);
insert into `Booking` (`session_id`, `user_id`) values (5, 6);
insert into `Booking` (`session_id`, `user_id`) values (7, 7);
insert into `Booking` (`session_id`, `user_id`) values (8, 9);
insert into `Booking` (`session_id`, `user_id`) values (10, 4);
insert into `Booking` (`session_id`, `user_id`) values (10, 2);
