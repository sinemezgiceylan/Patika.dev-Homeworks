-- Create table users --

CREATE TABLE users (
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	is_active BOOLEAN
);


-- Create table categories --
 
CREATE TABLE categories (
	category_id SERIAL PRIMARY KEY,
	name VARCHAR(50) UNIQUE NOT NULL,
	creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Create table posts --
 
CREATE TABLE posts (
	post_id SERIAL PRIMARY KEY,
	user_id INTEGER NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users (user_id),
	category_id INTEGER NOT NULL,
	FOREIGN KEY (category_id) REFERENCES categories (category_id),
	title VARCHAR(50) NOT NULL,
	content TEXT NOT NULL,
	view_count INTEGER DEFAULT 0,
	creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	is_published BOOLEAN
);

-- Create table comments -- 

CREATE TABLE comments (
	comment_id SERIAL PRIMARY KEY,
	post_id INTEGER NOT NULL,
	FOREIGN KEY (post_id) REFERENCES posts (post_id),
	user_id INTEGER,
	FOREIGN KEY (user_id) REFERENCES users (user_id),
	comment TEXT NOT NULL,
	creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	is_confirmed BOOLEAN
);


-- Add table users data --

INSERT INTO users (username, email, creation_date, is_active)
VALUES
	('Bobby Lanfer', 'blanfer0@usgs.gov', '2022-11-22 06:44:10', false),
	('Isac Lampl', 'ilampl1@cisco.com', '2023-06-04 09:20:25', false),
	('Kahlil Defont', 'kdefont2@flickr.com', '2023-06-04 04:01:37', true),
	('Corbett Thackeray', 'cthackeray3@altervista.org', '2022-11-20 13:03:14', true),
	('Donal Kelby', 'dkelby4@ebay.com', '2022-08-07 15:17:57', true),
	('Sibylla Guiver', 'sguiver5@timesonline.co.uk', '2022-06-28 09:20:55', false),
	('Zabrina Rittmeier', 'zrittmeier6@businesswire.com', '2022-12-17 22:27:11', false),
	('Marga Blowfield', 'mblowfield7@vimeo.com', '2023-02-24 13:43:32', false),
	('Clementia Joret', 'cjoret8@ucsd.edu', '2022-09-28 08:37:50', true),
	('Mathilda McGauhy', 'mmcgauhy9@bloglines.com', '2022-08-12 03:50:02', false);


-- Add table categories data --

INSERT INTO categories (name, creation_date)
VALUES
	('Computers', '2023-04-13 21:48:57'),
	('Beauty', '2022-12-18 13:29:06'),
	('Kids', '2023-02-06 23:44:16'),
	('Art', '2023-06-15 22:17:14'),
	('Sports', '2022-07-20 14:41:26');


-- Add table post data --

INSERT INTO posts (user_id, category_id, title, content, view_count, creation_date, is_published)
VALUES
	(7, 2, 'Pray the Devil Back to Hell', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 10, '2022-07-03 22:26:38', false),
	(4, 1, 'Wake of the Red Witch', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 45, '2023-01-31 10:03:44', true),
	(9, 4, 'Two: The Story of Roman & Nyro', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 47, '2022-12-24 20:41:41', false),
	(4, 4, 'Women of the Night (Yoru no onnatachi)', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 50, '2022-07-18 01:41:28', false),
	(6, 3, 'Year One', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 35, '2022-09-24 04:02:08', false),
	(7, 1, 'Last Days', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 18, '2022-12-05 15:14:37', true),
	(7, 2, 'Tunnel Rats (1968 Tunnel Rats)', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 27, '2022-08-31 09:00:14', false),
	(9, 3, 'American Graffiti', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 58, '2023-01-28 04:32:48', true),
	(2, 3, 'Swan and the Wanderer, The (Kulkuri ja joutsen)', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 17, '2022-06-27 08:01:09', true),
	(10, 4, 'Outlaw Josey Wales, The', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 21, '2022-10-19 07:08:12', true),
	(3, 5, 'Tuskegee Airmen, The', 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 13, '2022-09-23 03:44:27', false),
	(4, 1, 'Mr. Wonderful', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 20, '2022-09-08 20:41:13', true),
	(1, 5, 'Attack of the Giant Leeches', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 52, '2023-03-29 15:32:30', false),
	(9, 2, 'Singer, The (Quand j''étais chanteur)', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 68, '2023-03-31 03:43:17', true),
	(1, 1, 'Almost Heroes', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 32, '2023-04-05 19:00:48', true),
	(9, 3, 'In Therapy (Divã)', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 23, '2023-01-19 14:25:32', false),
	(3, 4, 'Rasen', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 7, '2023-02-15 18:21:14', false),
	(3, 2, 'People Will Talk', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 14, '2022-12-07 12:32:06', true),
	(7, 4, 'Patriots, The (Patriotes, Les)', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 20, '2022-11-13 16:28:29', false),
	(1, 1, 'Topper', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 10, '2022-08-18 23:38:31', false),
	(6, 1, 'Fired Up', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 17, '2023-05-21 14:36:06', false),
	(8, 5, 'Haunted Echoes', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices.', 25, '2022-08-28 23:16:53', false),
	(8, 2, 'Show People', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 11, '2023-05-14 08:21:53', true),
	(5, 3, 'King Kong Lives', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 35, '2023-02-16 18:13:35', false),
	(3, 5, 'Ursul', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 38, '2022-12-31 01:29:17', true),
	(7, 1, 'Mondo', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 77, '2023-03-18 12:10:22', true),
	(10, 2, 'Rain People, The', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 56, '2022-07-27 00:08:35', false),
	(8, 1, 'Taste of Honey, A', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 27, '2022-11-12 01:53:52', false),
	(2, 1, 'My Little Pony: Equestria Girls', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 28, '2022-10-19 16:51:21', false),
	(10, 3, 'Long John Silver', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 19, '2022-06-18 19:54:03', true),
	(8, 4, 'Return with Honor', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 73, '2022-08-24 02:34:46', true),
	(5, 5, 'Young and Innocent', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 13, '2022-08-30 22:16:15', false),
	(9, 1, 'Giallo', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 65, '2022-11-12 14:31:16', true),
	(9, 3, 'My Childhood', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 58, '2022-06-25 19:13:29', false),
	(2, 4, 'Privates on Parade', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 29, '2023-05-22 08:41:52', true),
	(2, 4, 'Bad Karma', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 87, '2023-06-12 01:33:00', true),
	(2, 1, 'No One Dies in Lily Dale', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 85, '2023-03-26 11:01:16', false),
	(2, 1, 'Virtuality', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 67, '2023-03-25 12:00:10', true),
	(6, 2, 'Shame', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 91, '2022-07-07 16:11:38', false),
	(3, 2, 'Rink, The', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 63, '2023-02-10 15:01:15', true),
	(9, 3, 'Alone with Her', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 72, '2022-09-24 07:18:30', false),
	(2, 4, 'Metro Manila', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 47, '2023-05-22 12:00:56', false),
	(5, 2, 'Gigantic', 'Fusce consequat. Nulla nisl. Nunc nisl.', 2, '2023-05-22 18:09:08', true),
	(3, 3, 'Human Scale, The', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 1, '2022-07-16 07:21:34', true),
	(3, 5, 'Fanny and Alexander (Fanny och Alexander)', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 24, '2022-12-15 16:03:37', true),
	(5, 5, 'Brothers, The', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 31, '2023-03-25 17:16:52', false),
	(6, 5, 'Saw VI', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 3, '2023-06-05 16:23:54', false),
	(6, 4, 'Only Two Can Play', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 6, '2023-04-07 17:36:21', true),
	(7, 1, 'Kukuli', 'In congue. Etiam justo. Etiam pretium iaculis justo.', 7, '2023-04-02 18:26:43', true),
	(3, 1, 'Hammer, The', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 43, '2023-01-30 01:35:39', true);


-- Update data with same view count in posts table --

UPDATE posts
SET view_count = 100
WHERE title = 'Rasen';

UPDATE posts
SET view_count = 101
WHERE title = 'Topper';

UPDATE posts
SET view_count = 148
WHERE title = 'Young and Innocent';

UPDATE posts
SET view_count = 132
WHERE title = 'Fired Up';

UPDATE posts
SET view_count = 115
WHERE title = 'Mr. Wonderful';

UPDATE posts
SET view_count = 123
WHERE title = 'Taste of Honey, A';

UPDATE posts
SET view_count = 111
WHERE title = 'Metro Manila';

UPDATE posts
SET view_count = 158
WHERE title = 'My Childhood';

UPDATE posts
SET view_count = 97
WHERE title = 'Year One';


-- Add table comments data --

INSERT INTO comments (post_id, user_id, comment, creation_date, is_confirmed)
VALUES
	(170, null, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', '2020-11-20 02:39:21', true),
	(162, 10, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', '2020-09-26 18:38:53', false),
	(171, 9, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', '2021-05-16 02:42:46', false),
	(163, 7, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', '2020-09-11 19:53:00', false),
	(184, 2, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', '2021-02-21 19:30:59', true),
	(154, 3, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', '2020-07-12 11:12:25', true),
	(189, 9, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', '2020-12-14 22:56:21', false),
	(191, 3, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', '2020-09-07 13:38:49', false),
	(170, 2, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', '2020-11-12 04:05:54', true),
	(159, 2, 'In congue. Etiam justo. Etiam pretium iaculis justo.', '2020-08-20 19:15:58', false),
	(152, 8, 'Fusce consequat. Nulla nisl. Nunc nisl.', '2020-08-30 12:11:52', false),
	(169, 3, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', '2021-06-08 17:06:10', true),
	(169, 7, 'In congue. Etiam justo. Etiam pretium iaculis justo.', '2021-03-06 05:50:25', false),
	(165, 6, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', '2020-09-10 10:07:44', true),
	(185, 3, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', '2021-01-22 06:30:25', false),
	(161, null, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', '2020-12-13 10:53:34', true),
	(166, 3, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', '2021-05-04 02:22:24', false),
	(187, 2, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', '2020-07-29 12:08:08', false),
	(163, 3, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', '2020-08-20 13:00:43', false),
	(156, 10, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', '2021-05-13 07:31:33', false),
	(170, 6, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', '2021-05-28 15:04:26', true),
	(165, 5, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', '2021-01-05 06:38:26', false),
	(174, 9, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', '2021-05-19 21:39:25', false),
	(190, 4, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', '2020-12-06 14:27:24', true),
	(163, 8, 'In congue. Etiam justo. Etiam pretium iaculis justo.', '2021-05-30 23:37:38', true),
	(164, 4, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', '2021-05-18 02:09:08', false),
	(164, 6, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', '2021-05-04 05:14:16', true),
	(154, 6, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', '2020-06-29 15:36:34', true),
	(153, 1, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', '2021-05-21 18:40:26', true),
	(155, 8, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', '2020-09-03 13:08:51', false),
	(200, 3, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', '2020-07-27 12:59:26', true),
	(159, 6, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-03-14 12:22:41', false),
	(157, null, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', '2020-12-31 09:31:51', true),
	(159, 4, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', '2020-09-07 22:33:52', true),
	(198, 1, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', '2020-10-30 22:58:11', false),
	(155, 10, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', '2021-03-01 05:03:12', true),
	(155, 10, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', '2021-01-28 08:45:14', false),
	(157, 4, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', '2020-09-20 03:12:34', true),
	(155, 8, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', '2021-04-13 13:07:49', true),
	(163, 1, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', '2020-09-11 11:35:22', false),
	(168, 10, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2020-12-05 09:35:29', true),
	(197, 4, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', '2020-10-04 06:57:46', true),
	(168, 10, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', '2021-01-17 14:17:29', true),
	(172, 1, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', '2020-12-22 13:58:03', true),
	(181, 5, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', '2021-04-28 12:46:00', true),
	(190, 9, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', '2020-09-25 12:02:57', true),
	(174, 2, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', '2021-02-09 17:14:15', false),
	(165, null, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', '2021-03-10 08:16:10', false),
	(193, 8, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', '2020-09-30 18:19:02', false),
	(184, 4, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', '2021-05-07 06:06:36', true),
	(182, 5, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', '2020-08-29 17:18:42', true),
	(182, 9, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', '2021-03-14 21:41:05', false),
	(161, 3, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', '2020-08-17 05:58:24', true),
	(186, 5, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', '2020-09-04 09:29:37', true),
	(166, 7, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', '2021-05-30 23:29:55', true),
	(168, 10, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', '2021-04-25 05:21:14', false),
	(191, 8, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', '2020-12-23 02:56:08', false),
	(157, 6, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', '2021-05-09 06:03:02', true),
	(190, 7, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', '2020-07-18 14:05:42', true),
	(192, 9, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', '2020-12-28 05:46:54', false),
	(174, 9, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', '2020-10-25 03:19:58', true),
	(152, null, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', '2021-05-09 04:54:49', false),
	(157, 2, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', '2021-02-18 06:14:14', false),
	(157, 7, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', '2021-02-06 21:40:32', false),
	(164, 4, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', '2021-03-31 17:45:30', false),
	(172, 1, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', '2021-02-26 08:52:36', false),
	(155, 8, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', '2020-11-28 08:48:25', true),
	(174, 8, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', '2020-10-26 09:57:04', false),
	(184, 9, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '2021-05-29 12:09:06', true),
	(151, 3, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2020-09-07 01:38:28', false),
	(191, 10, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', '2021-02-17 05:41:26', true),
	(170, 1, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', '2020-09-24 03:58:20', true),
	(163, 8, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', '2021-01-29 01:47:26', false),
	(152, 1, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', '2020-12-18 00:53:57', true),
	(194, 10, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', '2021-03-10 18:08:49', true),
	(195, 2, 'In congue. Etiam justo. Etiam pretium iaculis justo.', '2020-08-13 23:21:36', false),
	(158, 5, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', '2020-12-09 18:12:11', false),
	(155, 5, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', '2020-10-30 17:07:50', true),
	(155, 10, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', '2020-10-21 12:45:59', false),
	(189, 1, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', '2021-05-27 09:45:08', true),
	(163, 2, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', '2020-07-14 05:55:36', false),
	(182, 5, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '2020-07-10 20:19:35', true),
	(175, 3, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', '2020-10-17 10:17:53', false),
	(174, 10, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', '2020-08-28 14:08:01', true),
	(179, 5, 'In congue. Etiam justo. Etiam pretium iaculis justo.', '2020-12-09 23:22:28', true),
	(153, 10, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', '2021-05-01 14:25:04', false),
	(175, 10, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', '2020-10-05 03:12:06', false),
	(159, 8, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', '2020-11-21 15:39:13', false),
	(177, 5, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', '2021-01-05 20:44:44', false),
	(200, 8, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', '2020-08-02 05:39:49', false),
	(200, 4, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '2020-09-19 06:59:02', true),
	(155, 1, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', '2020-11-21 02:54:14', true),
	(164, 8, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', '2021-06-09 04:08:20', true),
	(176, 1, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '2020-10-31 15:53:22', true),
	(177, 8, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', '2021-05-29 13:13:07', true),
	(166, 3, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', '2020-08-22 20:57:09', false),
	(197, 5, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', '2020-10-12 12:03:18', true),
	(172, 3, 'In congue. Etiam justo. Etiam pretium iaculis justo.', '2020-09-08 00:11:38', true),
	(178, 10, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', '2021-03-24 08:34:27', false),
	(166, 6, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', '2021-03-03 03:05:49', true),
	(197, 3, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', '2021-01-31 16:57:17', false),
	(155, 7, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', '2021-01-13 14:46:54', true),
	(163, 5, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', '2021-01-07 18:55:35', true),
	(155, 2, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', '2020-11-18 19:05:51', false),
	(182, 9, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', '2021-04-04 03:49:29', false),
	(184, 10, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', '2021-02-12 02:00:41', true),
	(171, 6, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', '2020-08-02 18:47:39', true),
	(155, 6, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', '2020-10-14 05:57:25', false),
	(164, 9, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', '2020-12-17 01:07:02', true),
	(174, 7, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', '2020-11-10 04:52:03', true),
	(176, 10, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', '2020-08-08 09:13:35', false),
	(177, 3, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', '2021-03-25 10:10:37', true),
	(188, 3, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', '2020-12-21 04:40:41', false),
	(200, 9, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', '2020-07-08 23:04:25', true),
	(184, 5, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', '2020-09-09 18:42:07', true),
	(151, 1, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', '2021-02-07 05:22:30', false),
	(184, 5, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', '2021-06-05 00:19:27', false),
	(177, 1, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', '2020-12-28 14:04:05', true),
	(176, 6, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', '2021-03-17 10:37:44', true),
	(163, 6, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', '2021-04-15 15:45:53', true),
	(151, 3, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', '2020-09-12 00:44:47', false),
	(168, 2, 'Fusce consequat. Nulla nisl. Nunc nisl.', '2020-12-09 05:38:28', false),
	(167, 8, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', '2020-08-01 20:04:14', true),
	(165, 4, 'Fusce consequat. Nulla nisl. Nunc nisl.', '2021-01-27 23:12:55', false),
	(184, 4, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', '2020-12-12 15:14:16', false),
	(200, 8, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', '2020-07-27 16:20:42', true),
	(169, 9, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', '2021-02-15 16:38:01', true),
	(188, 6, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', '2021-03-30 23:55:06', false),
	(189, 4, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', '2021-05-03 17:04:10', false),
	(151, 3, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', '2021-02-20 12:18:38', false),
	(152, 9, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', '2021-04-07 22:51:45', true),
	(190, 10, 'In congue. Etiam justo. Etiam pretium iaculis justo.', '2021-02-24 05:49:20', true),
	(190, 3, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', '2020-08-03 09:09:13', true),
	(193, 4, 'In congue. Etiam justo. Etiam pretium iaculis justo.', '2020-10-20 20:13:11', false),
	(194, 9, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', '2021-02-27 03:57:45', false),
	(196, null, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', '2020-10-27 00:46:14', false),
	(168, 10, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', '2020-08-26 19:17:03', false),
	(160, 4, 'Fusce consequat. Nulla nisl. Nunc nisl.', '2020-09-02 17:15:07', true),
	(161, null, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', '2020-10-14 01:34:39', true),
	(177, 4, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '2020-10-30 18:49:59', true),
	(155, 6, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', '2021-01-26 06:42:05', true),
	(152, 3, 'In congue. Etiam justo. Etiam pretium iaculis justo.', '2021-01-13 23:22:07', false),
	(164, 4, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', '2020-08-12 07:08:09', false),
	(152, 10, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', '2021-05-15 21:14:23', false),
	(177, 8, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', '2020-10-28 21:08:22', false),
	(173, 8, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', '2021-04-17 23:20:28', false),
	(166, 10, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', '2021-05-31 05:56:00', true),
	(153, 8, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '2020-10-02 19:24:05', true),
	(163, 4, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', '2020-10-14 02:45:49', true),
	(166, 6, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', '2020-12-29 22:00:15', false),
	(162, 9, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', '2020-10-29 21:15:42', false),
	(174, 3, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', '2020-06-30 05:28:45', true),
	(177, 4, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', '2021-05-21 04:23:37', false),
	(164, 9, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', '2021-05-25 03:55:32', false),
	(183, 10, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', '2021-02-21 18:52:00', false),
	(187, null, 'Fusce consequat. Nulla nisl. Nunc nisl.', '2020-08-11 22:01:28', false),
	(172, 4, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', '2021-03-07 02:56:52', false),
	(183, 8, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', '2020-07-20 12:07:15', false),
	(168, 9, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', '2021-03-22 03:14:44', false),
	(198, 5, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', '2020-09-09 05:21:37', true),
	(152, 8, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', '2021-04-19 08:35:43', false),
	(171, 10, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2020-12-07 14:12:30', false),
	(166, 10, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', '2020-08-02 10:34:26', false),
	(166, 10, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', '2020-11-19 20:58:10', true),
	(188, 4, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', '2021-01-27 04:20:35', false),
	(156, 9, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', '2021-01-31 02:19:28', true),
	(176, 4, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', '2020-11-13 02:11:45', true),
	(186, 9, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', '2020-08-30 11:09:36', true),
	(186, 2, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', '2020-12-27 07:30:04', false),
	(173, 7, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', '2021-02-22 22:50:49', true),
	(168, 7, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', '2020-10-19 04:40:16', true),
	(174, 5, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', '2020-08-15 16:55:22', true),
	(153, 2, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', '2021-02-06 17:22:34', true),
	(156, 9, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', '2020-07-16 07:29:16', false),
	(172, 8, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', '2021-04-16 13:04:12', false),
	(177, 7, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', '2020-09-20 02:57:32', true),
	(155, 2, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', '2021-03-24 04:07:14', true),
	(179, 8, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', '2021-04-06 21:34:12', false),
	(166, 6, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', '2020-09-21 16:41:13', false),
	(155, 4, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', '2021-03-20 20:50:14', true),
	(154, 7, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', '2021-05-19 21:08:10', true),
	(190, 4, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', '2020-08-14 13:11:59', true),
	(177, 3, 'Fusce consequat. Nulla nisl. Nunc nisl.', '2021-05-20 08:29:43', true),
	(177, 4, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', '2021-05-19 22:42:29', true),
	(155, 1, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-01-29 12:05:11', true),
	(182, 10, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', '2021-02-01 10:47:18', false),
	(151, 2, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '2020-06-27 17:51:58', false),
	(189, 3, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '2021-04-01 19:04:17', true),
	(153, 1, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', '2021-01-29 08:42:46', false),
	(189, 8, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', '2021-05-02 05:17:59', true),
	(158, 2, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', '2020-12-30 22:11:27', false),
	(158, 6, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', '2020-08-11 14:52:15', true),
	(156, 10, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', '2020-09-13 10:58:57', false),
	(174, 7, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', '2020-08-14 01:58:17', false),
	(171, 3, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', '2020-09-13 15:24:37', true),
	(177, 9, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', '2020-06-28 09:56:46', false),
	(152, 10, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', '2021-05-29 02:54:31', false),
	(166, 7, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2020-06-30 12:03:25', false),
	(154, 2, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', '2020-09-24 11:33:01', false),
	(173, 9, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', '2020-09-04 18:49:38', true),
	(196, null, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', '2021-04-27 09:46:09', false),
	(186, 6, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', '2021-04-18 07:27:42', true),
	(154, 4, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', '2020-08-19 01:17:29', false),
	(176, 1, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', '2021-05-05 20:02:00', false),
	(153, 10, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', '2020-09-08 13:22:14', false),
	(155, 10, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', '2021-03-12 03:03:29', false),
	(189, 2, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', '2021-04-05 16:29:23', false),
	(153, 2, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', '2020-12-31 09:51:26', true),
	(189, 7, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', '2021-01-13 08:16:44', false),
	(151, 2, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '2021-02-12 09:38:32', true),
	(169, 7, 'In congue. Etiam justo. Etiam pretium iaculis justo.', '2021-05-05 00:15:36', false),
	(200, 7, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', '2020-08-05 02:52:44', true),
	(183, 5, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', '2021-03-07 22:43:11', false),
	(188, 2, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', '2021-01-26 21:38:22', true),
	(189, 5, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', '2021-01-23 07:10:01', false),
	(177, 10, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', '2020-11-08 05:58:54', false),
	(163, 8, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', '2021-06-12 14:26:21', true),
	(156, 10, 'Fusce consequat. Nulla nisl. Nunc nisl.', '2020-12-09 16:21:06', false),
	(177, 5, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', '2020-10-30 18:02:46', false),
	(154, 2, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', '2021-05-08 14:40:37', false),
	(171, 5, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', '2020-09-28 23:19:58', true),
	(164, 5, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', '2020-07-15 13:55:29', true),
	(153, 1, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', '2021-05-14 06:54:13', true),
	(172, 10, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', '2020-07-19 22:13:29', true),
	(172, 7, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', '2020-08-01 01:00:10', false),
	(179, 2, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', '2021-05-02 13:44:10', true),
	(175, 7, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', '2021-02-12 21:17:33', false),
	(155, 9, 'In congue. Etiam justo. Etiam pretium iaculis justo.', '2020-09-21 15:50:33', false),
	(155, 2, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', '2021-04-17 15:43:54', false),
	(200, 1, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', '2020-08-17 11:05:49', true),
	(160, 1, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', '2021-04-23 18:11:45', false),
	(155, 4, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', '2021-05-01 03:06:04', false),
	(163, 1, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', '2021-06-16 21:10:38', false),
	(172, 5, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', '2021-04-22 19:41:34', true),
	(173, 9, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', '2020-10-19 13:49:53', true),
	(172, 3, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', '2020-07-28 08:40:49', true),
	(163, 9, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', '2020-07-06 01:36:49', true),
	(155, 6, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', '2020-07-06 17:13:02', false),
	(164, 3, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', '2020-10-17 05:01:15', false),
	(191, 1, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', '2021-05-11 22:54:47', true),
	(200, 10, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', '2020-11-14 09:35:51', false),
	(155, 4, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', '2020-09-07 19:08:57', false),
	(189, 9, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', '2020-11-02 23:33:22', true),
	(177, 8, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', '2021-06-04 04:15:45', false),
	(155, 9, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', '2020-11-05 10:29:13', false),
	(151, 3, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', '2021-01-29 07:30:17', false),
	(166, 5, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', '2020-08-24 11:07:05', true),
	(152, 7, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', '2021-03-01 21:57:00', true),
	(161, 7, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', '2021-05-20 04:37:20', false),
	(197, 1, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', '2021-03-24 13:56:42', false);


-- Questions --


-- 1 -- Tüm blog yazılarını başlıkları, yazarları ve kategorileriyle birlikte getirin.

SELECT posts.title, users.username, categories.name
FROM posts
JOIN users ON posts.user_id = users.user_id
JOIN categories ON posts.category_id = categories.category_id;



-- 2 -- En son yayınlanan 5 blog yazısını başlıkları, yazarları ve yayın tarihleriyle birlikte alın.

SELECT posts.title, users.username, posts.creation_date
FROM posts
INNER JOIN users ON posts.user_id = users.user_id
ORDER BY posts.creation_date DESC
LIMIT 5;



-- 3 -- Her blog yazısı için yorum sayısını gösterin

SELECT posts.title, COUNT(comments.comment) 
FROM comments
JOIN posts ON posts.post_id = comments.post_id
GROUP BY posts.post_id;



-- 4 -- Tüm kayıtlı kullanıcıların kullanıcı adlarını ve e-posta adreslerini gösterin.

SELECT username, email FROM users;



-- 5 -- En son 10 yorumu, ilgili gönderi başlıklarıyla birlikte alın.

SELECT posts.title, comments.creation_date 
FROM comments
JOIN  posts ON posts.post_id = comments.post_id
ORDER BY comments.creation_date DESC
LIMIT 10;



-- 6 -- Belirli bir kullanıcı tarafından yazılan tüm blog yazılarını bulun.

SELECT users.username, posts.content
FROM users
INNER JOIN posts ON users.user_id = posts.user_id
WHERE username = 'Bobby Lanfer';



-- 7 -- Her kullanıcının yazdığı toplam gönderi sayısını alın.

SELECT users.username, COUNT(posts.content) 
FROM users
JOIN posts ON posts.user_id = users.user_id
GROUP BY username;



-- 8 -- Her kategoriyi, kategorideki gönderi sayısıyla birlikte gösterin.

SELECT categories.name, COUNT(posts.post_id)
FROM categories
INNER JOIN posts ON posts.category_id = categories.category_id
GROUP BY categories.name;



-- 9 -- Gönderi sayısına göre en popüler kategoriyi bulun.

SELECT categories.name, COUNT(posts.post_id) AS total_count
FROM categories
JOIN posts ON posts.category_id = categories.category_id
GROUP BY categories.name
ORDER BY total_count DESC
LIMIT 1;



-- 10 -- Gönderilerindeki toplam görüntülenme sayısına göre en popüler kategoriyi bulun.

SELECT categories.name, SUM(posts.view_count) AS total_view
FROM categories
JOIN posts ON posts.category_id = categories.category_id
GROUP BY categories.name
ORDER BY total_view DESC
LIMIT 1;



-- 11 -- En fazla yoruma sahip gönderiyi alın.

SELECT posts.title, COUNT(comments.comment_id) AS total_comment
FROM posts
JOIN comments ON comments.post_id = posts.post_id
GROUP BY posts.title
ORDER BY total_comment DESC
LIMIT 1;



-- 12 -- Belirli bir gönderinin yazarının kullanıcı adını ve e-posta adresini gösterin.

SELECT users.username, users.email 
FROM posts
JOIN users ON users.user_id = posts.user_id
WHERE posts.post_id = 170;



-- 13 --  Başlık veya içeriklerinde belirli bir anahtar kelime bulunan tüm gönderileri bulun.

SELECT * FROM posts
WHERE title LIKE '%The' OR content ILIKE '%lorem%';



-- 14 --  Belirli bir kullanıcının en son yorumunu gösterin.

SELECT users.username, comments.comment FROM users
JOIN comments ON comments.user_id = users.user_id 
WHERE username = 'Mathilda McGauhy'
ORDER BY comments.creation_date DESC
LIMIT 1;



-- 15 --  Gönderi başına ortalama yorum sayısını bulun.

SELECT AVG(comment_count) AS avg_comment_count
FROM (
  SELECT post_id, COUNT(*) AS comment_count
  FROM comments
  GROUP BY post_id
) AS comment_counts;



-- 16 --  Son 30 günde yayınlanan gönderileri gösterin.

SELECT * FROM posts
WHERE creation_date > NOW() - INTERVAL '30 day';



-- 17 --  Belirli bir kullanıcının yaptığı yorumları alın.

SELECT users.username, comments.comment
FROM users
JOIN comments ON comments.user_id = users.user_id
WHERE users.username = 'Isac Lampl';



-- 18 --  Belirli bir kategoriye ait tüm gönderileri bulun.

SELECT categories.name, posts.content
FROM categories
JOIN posts ON posts.category_id = categories.category_id
WHERE categories.name = 'Computers';



-- 19 --  5'ten az yazıya sahip kategorileri bulun.

SELECT categories.name, COUNT(posts.post_id)
FROM categories 
JOIN posts ON categories.category_id = posts.category_id
GROUP BY categories.category_id, categories.name
HAVING COUNT(posts.post_id) < 5;



-- 20 --  Hem bir yazı hem de bir yoruma sahip olan kullanıcıları gösterin.

SELECT users.username FROM users
WHERE (SELECT COUNT(*) FROM posts 
	   WHERE posts.user_id = users.user_id) > 0
AND
	  (SELECT COUNT(*) FROM comments 
	   WHERE comments.user_id = users.user_id) > 0;



-- 21 --  En az 2 farklı yazıya yorum yapmış kullanıcıları alın.

SELECT users.username
FROM users
WHERE (SELECT COUNT(DISTINCT comment_id) 
	   FROM comments 
	   WHERE users.user_id = comments.user_id) >= 2;



-- 22 -- En az 3 yazıya sahip kategorileri görüntüleyin.

SELECT categories.name, COUNT(posts.post_id)
FROM categories 
JOIN posts ON categories.category_id = posts.category_id
GROUP BY categories.category_id, categories.name
HAVING COUNT(posts.post_id) >= 3;



-- 23 -- 5'ten fazla blog yazısı yazan yazarları bulun.

SELECT users.username, COUNT(posts.content)
FROM users 
JOIN posts ON posts.user_id = users.user_id
GROUP BY users.user_id, users.username
HAVING COUNT(posts.post_id) > 5;



-- 24 -- Bir blog yazısı yazmış veya bir yorum yapmış kullanıcıların e-posta adreslerini görüntüleyin. (UNION kullanarak)

(SELECT users.email FROM users 
 	WHERE (SELECT COUNT(*) FROM posts 
		   WHERE posts.user_id = users.user_id) = 1)
UNION
(SELECT users.email	FROM users 
 	WHERE (SELECT COUNT(*) FROM comments 
		   WHERE comments.user_id = users.user_id) = 1);



-- 25 -- Bir blog yazısı yazmış ancak hiç yorum yapmamış yazarları bulun.

SELECT users.username FROM users
WHERE (SELECT COUNT(*) FROM posts 
	   WHERE posts.user_id = users.user_id) > 0
AND
	  (SELECT COUNT(*) FROM comments 
	   WHERE comments.user_id = users.user_id) = 0;