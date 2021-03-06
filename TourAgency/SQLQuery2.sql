CREATE DATABASE TourAgency

CREATE TABLE city ( 
	city_id              int  NOT NULL  ,
	name                 varchar(100)    ,
	description          varchar(100)    ,
	CONSTRAINT pk_city_city_id PRIMARY KEY ( city_id )
 ) 

CREATE TABLE country ( 
	country_id           int  NOT NULL  ,
	name                 varchar(100)    ,
	need_visa            BIT   ,
	description          varchar(100)    ,
	CONSTRAINT pk_country_country_id PRIMARY KEY ( country_id )
 ) 

CREATE TABLE hotel ( 
	hotel_id             int  NOT NULL  ,
	name                 varchar(100)    ,
	line                 int    ,
	stars                int    ,
	rating               int ,
	info                 varchar(100)    ,
	CONSTRAINT pk_hotel_hotel_id PRIMARY KEY ( hotel_id )
 ) 

CREATE TABLE person ( 
	person_id            int  NOT NULL  ,
	name                 varchar(100)    ,
	last_name            varchar(100)    ,
	second_name          varchar(100)    ,
	bth_date             date    ,
	email                varchar(100)    ,
	phone                varchar(100)    ,
	adress               varchar(100)    ,
	CONSTRAINT pk_person_person_id PRIMARY KEY ( person_id )
 ) 

CREATE TABLE types ( 
	type_id              int  NOT NULL  ,
	name                 varchar(100)    ,
	description          varchar(100)    ,
	CONSTRAINT pk_types_type_id PRIMARY KEY ( type_id )
 )

CREATE TABLE client ( 
	client_id            int  NOT NULL  ,
	person_id            int    ,
	counter              int    ,
	pay_methods          varchar(100)    ,
	pasport              varchar(100)    ,
	IS_SUPER             bit  NOT NULL, 
	CONSTRAINT pk_client_client_id PRIMARY KEY ( client_id )
 ) 

CREATE TABLE tour ( 
	tour_id              int  NOT NULL  ,
	name                 varchar(100)    ,
	type_id              int    ,
	country_id           int    ,
	city_id              int    ,
	hotel_id             int    ,
	date_takeoff         date    ,
	number_day           int    ,
	CONSTRAINT pk_tour_tour_id PRIMARY KEY ( tour_id )
 ) 

CREATE TABLE orders ( 
	order_id             int  NOT NULL  ,
	client_id            int    ,
	tour_id              int    ,
	date_order           date    ,
	price                int    ,
	IS_DONE              bit  NOT NULL,
	CONSTRAINT pk_table_order_id PRIMARY KEY ( order_id )
 )

ALTER TABLE client ADD CONSTRAINT fk_person_id FOREIGN KEY ( person_id ) REFERENCES person( person_id ) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE orders ADD CONSTRAINT fk_client_id FOREIGN KEY ( client_id ) REFERENCES client( client_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE orders ADD CONSTRAINT fk_tour_id FOREIGN KEY ( tour_id ) REFERENCES tour( tour_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE tour ADD CONSTRAINT fk_type_id FOREIGN KEY ( type_id ) REFERENCES types( type_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE tour ADD CONSTRAINT fk_country_id FOREIGN KEY ( country_id ) REFERENCES country( country_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE tour ADD CONSTRAINT fk_city_id FOREIGN KEY ( city_id ) REFERENCES city( city_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE tour ADD CONSTRAINT fk_hotel_id FOREIGN KEY ( hotel_id ) REFERENCES hotel( hotel_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;


INSERT INTO person(person.person_id, name, last_name, second_name, bth_date, email, phone, adress) VALUES (1, 'Roman', 'Abramov', 'Andreevich', '1998-03-21', 'roman@mail.ru', '89310933089', 'adress1');
INSERT INTO person(person.person_id, name, last_name, second_name, bth_date, email, phone, adress) VALUES (2, 'Alex', 'Smirnov', 'Lvovich', '1989-02-11', 'alex_smirnov@yandex.ru', '89110097865', 'adress2');
INSERT INTO person(person.person_id, name, last_name, second_name, bth_date, email, phone, adress) VALUES (3, 'Nikita', 'Litvinov', 'Yurievich', '1996-07-19', 'nik23@gmail.ru', '89054459876', 'adress3');
INSERT INTO person(person.person_id, name, last_name, second_name, bth_date, email, phone, adress) VALUES (4, 'Artem', 'Orlov', 'Sergeevih', '2001-11-24', 'art@mail.ri', '89213416576', 'adress4');
INSERT INTO person(person.person_id, name, last_name, second_name, bth_date, email, phone, adress) VALUES (6, 'Fedor', 'Zhilkin', 'Igorevich', '1998-05-11', 'fzhilkin@mail.ru', '89990560712', 'adress5');
INSERT INTO person(person.person_id, name, last_name, second_name, bth_date, email, phone, adress) VALUES (7, 'Ilya', 'Mishurov', 'Dmitrievich', '1999-04-21', 'mishurov@yandex.ru', '89020985612', 'adress6');

INSERT INTO client(client.client_id, person_id, counter, pay_methods, pasport, IS_SUPER) VALUES (1, 1, 13, 'visa', 'pasport1', 1);
INSERT INTO client(client.client_id, person_id, counter, pay_methods, pasport, IS_SUPER) VALUES (2, 2, 3, 'visa', 'pasport2', 0);
INSERT INTO client(client.client_id, person_id, counter, pay_methods, pasport, IS_SUPER) VALUES (3, 3, 6, 'visa', 'pasport3', 1);
INSERT INTO client(client.client_id, person_id, counter, pay_methods, pasport, IS_SUPER) VALUES (4, 4, 1, 'visa', 'pasport4', 0);
INSERT INTO client(client.client_id, person_id, counter, pay_methods, pasport, IS_SUPER) VALUES (6, 6, 3, 'cash', 'pasport6', 0);

INSERT INTO types(types.type_id, name, description) VALUES (1, 'ToGreece', 'des1');
INSERT INTO types(types.type_id, name, description) VALUES (2, 'ToCrete','des2');
INSERT INTO types(types.type_id, name, description) VALUES (3, 'ToCyprus','des3');
INSERT INTO types(types.type_id, name, description) VALUES (4, 'ToItalia','des4');

INSERT INTO country(country.country_id, name, need_visa, description) VALUES (1, 'Greece', 1,'des1');
INSERT INTO country(country.country_id, name,need_visa, description) VALUES (2, 'Crete',0,'des2');
INSERT INTO country(country.country_id, name, need_visa,description) VALUES (3, 'Cyprus',0,'des3');
INSERT INTO country(country.country_id, name, need_visa,description) VALUES (4, 'Italia',1,'des4');

INSERT INTO city(city.city_id, name, description) VALUES (1, 'Athnes','des1');
INSERT INTO city(city.city_id, name, description) VALUES (2, 'Crete','des2');
INSERT INTO city(city.city_id, name, description) VALUES (3, 'Limasol','des3');
INSERT INTO city(city.city_id, name, description) VALUES (4, 'Roma','des4');

INSERT INTO hotel(hotel.hotel_id, name, line, stars, rating, info) VALUES (1, 'Four_Seasons', 2, 5, 4,'des1');
INSERT INTO hotel(hotel.hotel_id, name,  line, stars, rating, info) VALUES (2, 'Corintia',9, 5, 5, 'des2');
INSERT INTO hotel(hotel.hotel_id, name,  line, stars, rating, info) VALUES (3, 'StarFals', 1, 2, 3, 'des3');
INSERT INTO hotel(hotel.hotel_id, name,  line, stars, rating, info) VALUES (4, 'Ritz',2, 5, 5, 'des4');

INSERT INTO tour(tour.tour_id, name, type_id, country_id, city_id, hotel_id, date_takeoff, number_day) VALUES (1, 'Trip to Greece', 1, 1, 4, 3, '2018-04-11', 4);
INSERT INTO tour(tour.tour_id, name, type_id, country_id, city_id, hotel_id, date_takeoff, number_day) VALUES (2, 'Sunrise under sea',3, 1, 1, 2, '2017-08-17', 15);
INSERT INTO tour(tour.tour_id, name, type_id, country_id, city_id, hotel_id, date_takeoff, number_day) VALUES (3, 'See stars', 3, 2, 3, 1, '2013-09-01', 14);
INSERT INTO tour(tour.tour_id, name, type_id, country_id, city_id, hotel_id, date_takeoff, number_day) VALUES (4, 'Run Away', 4, 2, 2,2, '2019-09-12', 7);

INSERT INTO orders(orders.order_id, client_id, tour_id, date_order, price, IS_DONE) VALUES (1, 1, 1, '2018-03-10',  12, 1);
INSERT INTO orders(orders.order_id, client_id, tour_id, date_order, price, IS_DONE) VALUES (2, 2, 3, '2018-09-10', 13, 1);
INSERT INTO orders(orders.order_id, client_id, tour_id, date_order, price, IS_DONE) VALUES (3, 3, 2, '2018-12-30', 14, 1);
INSERT INTO orders(orders.order_id, client_id, tour_id, date_order, price, IS_DONE) VALUES (4, 4, 1, '2019-04-30', 45, 0);
INSERT INTO orders(orders.order_id, client_id, tour_id, date_order, price, IS_DONE) VALUES (5, 4, 2, '2019-05-10', 22, 0);

--Добавление нового клиента
CREATE PROCEDURE AddNewClient
@var_name AS CHAR(20),
@var_last_name AS CHAR(20),
@var_second_name AS CHAR(20),
@var_bth_date AS DATE,
@var_email AS CHAR(20),
@var_phone AS CHAR(20),
@var_adress AS CHAR(50),
@var_counter AS INT,
@var_pay_methods AS CHAR(20),
@var_pasport AS CHAR(20),
@var_is_super AS BIT
AS
BEGIN
  DECLARE @var_new_person_id INTEGER;
  SELECT @var_new_person_id = MAX(person_id) + 1 FROM person;
  INSERT INTO person (person_id, name, last_name, second_name, bth_date, email, phone, adress)
        VALUES(@var_new_person_id, @var_name, @var_last_name, @var_second_name, @var_bth_date,@var_email, @var_phone,@var_adress);
  INSERT INTO client(client_id, person_id, counter, pay_methods, pasport, IS_SUPER) 
        SELECT MAX(client_id) + 1, @var_new_person_id, @var_counter, @var_pay_methods ,@var_pasport, @var_is_super FROM client;        
END;
-- Пример вызова процедуры:
EXECUTE AddNewClient @var_name = 'Eric', @var_last_name='Blair', @var_second_name = 'Arthur', @var_bth_date='1984-06-25',@var_email = 'eric1903@gmail.com',@var_phone = '19481901', @var_adress = 'London', @var_counter = 1,@var_pay_methods = 'cash', @var_pasport = '041300', @var_is_super = 1


--Создание нового тура
CREATE PROCEDURE AddNewTour
@var_name AS CHAR(20), 
@var_type_id AS INT ,
@var_country_id AS INT,
@var_hotel_id AS INT,
@var_date_takeoff AS DATE,  
@var_number_day AS INT
AS
BEGIN
  DECLARE @var_new_tour_id INTEGER;
  SELECT @var_new_tour_id = MAX(tour_id) + 1 FROM tour;
  INSERT INTO tour (tour_id, name, type_id, country_id, hotel_id, date_takeoff, number_day)
        VALUES(@var_new_tour_id, @var_name, @var_type_id,@var_country_id, @var_hotel_id, @var_date_takeoff, @var_number_day);
END;


--Перевод заказа в состояние "выполнен" или удаление
CREATE PROCEDURE UpdDelOrder
@var_upd_del AS CHAR(3),
@var_order_id AS INTEGER
AS
BEGIN
  IF @var_upd_del = 'UPD' 
      UPDATE orders SET IS_DONE = 1
         WHERE order_id = @var_order_id
  IF @var_upd_del = 'DEL'   
      DELETE FROM orders WHERE order_id = @var_order_id
END;


-- Запрет на удаление
CREATE TRIGGER TR_del_order ON orders FOR DELETE 
AS
   ROLLBACK;
--Проверка
DELETE FROM orders;


-- Деактивация вместо удаления клиента
CREATE TRIGGER TR_del_country ON country INSTEAD OF DELETE 
AS    
   UPDATE country SET description = ' DEACTIVATED  ' + description
       WHERE country_id = (SELECT country_id FROM DELETED);
-- Проверка:  DELETE FROM country WHERE country_id = 3;


-- После 5-го заказа клиент переводится в категорию "постоянный клиент"  
CREATE TRIGGER Tr_Ins_Client_Super ON orders FOR INSERT 
AS
   BEGIN
   IF (SELECT COUNT(*) FROM orders 
                   WHERE orders.client_id = (SELECT client_id FROM INSERTED) AND IS_DONE = 1) > 5
   UPDATE client SET IS_SUPER = 1 WHERE client.client_id = (SELECT client_id FROM INSERTED);
   END;


--Имя, Фамилия и количество заказов клиента
SELECT person.name, person.last_name, client.counter
   FROM person 
   INNER JOIN client on person.person_id = client.person_id 


--Данные о клиенте, дата заказа, дата вылета, описание тура
 SELECT person.name, person.last_name, client.pasport, orders.date_order, tour.date_takeoff, types.name 
 FROM person 
 JOIN client ON client.person_id = person.person_id 
 JOIN orders ON orders.client_id =  client.client_id
 JOIN tour ON orders.tour_id = tour.tour_id
 JOIN types ON types.type_id = tour.type_id
 

--Данные клиентов, которые платят картой
 SELECT person.name, person.last_name, client.pasport
 FROM person 
 JOIN client ON client.person_id = person.person_id 
 WHERE client.pay_methods = 'visa'


--Количество заказов оплаченных картой и наличными
SELECT pay_methods, SUM(counter) as sum FROM client GROUP BY pay_methods


--Сортировка отелей по обратному рейтингу, у которых звезд больше 2
SELECT name, rating 'рейтинг' FROM hotel WHERE stars BETWEEN 2 AND 5 ORDER BY rating DESC;


--Самый ближайший к морю отель.
SELECT name, line FROM hotel 
       WHERE line = (SELECT MIN(line) FROM hotel);


--Фамилии клиентов, не сделавших еще ни одного заказа
SELECT last_name 'Фамилия' FROM person, client
       WHERE person.person_id = client.person_id 
       AND client_id NOT IN (SELECT client_id FROM orders);


--Фамилии, имена и количества заказов клиентов
SELECT person.name 'Имя', person.last_name 'Фамилия', cnt
   FROM person JOIN (SELECT client.person_id, COUNT(*) AS cnt 
                        FROM client JOIN orders ON orders.client_id = client.client_id 
                        GROUP BY client.person_id) ttt 
               ON person.person_id = ttt.person_id


--Данные о пользователях и id клиентов.
SELECT name 'Имя', last_name, client_id 'id клиента'
	FROM person
		LEFT OUTER JOIN client ON person.person_id = client.person_id


--Все описания
SELECT 'О стране', description,  name FROM country WHERE description IS NOT NULL AND description <> ''
UNION 
SELECT 'О городе', description,  name FROM city WHERE description IS NOT NULL AND description <> ''
UNION 
SELECT 'О туре', description, name  FROM types WHERE description IS NOT NULL AND description <> ''
ORDER BY 2;


--Туры в страны с безвизовым въездом
SELECT name FROM tour WHERE country_id IN 	
   (SELECT country_id FROM country WHERE need_visa <> 1) 


--Клиенты, отдыхающие больше 10 дней
SELECT person.name, person.last_name, client.pasport
FROM person 
	JOIN client ON client.person_id = person.person_id 
	JOIN orders ON orders.client_id = client.client_id 
	JOIN tour ON orders.tour_id = tour.tour_id 
		WHERE tour.number_day > 10 


--Заказы за период дороже 13 у.е.
SELECT * FROM orders 
      WHERE (date_order BETWEEN '2010-09-04' AND '2017-09-11') AND price > 13
      ORDER BY price DESC;


--Выборка постоянных клиентов.
SELECT DISTINCT person.last_name, client.IS_SUPER 'Постоянный клиент' 
       FROM person, client WHERE person.person_id = client.person_id                              			   
             GROUP BY last_name, IS_SUPER
			 HAVING IS_SUPER = 1


--Представление – реестр заказов
CREATE VIEW V_ClientList(name, last_name, second_name, tour_name, date_takeoff, date_order, price, Is_Done)
AS
  SELECT person.name, person.last_name, person.second_name, tour.name, tour.date_takeoff, orders.date_order, orders.price, orders.IS_DONE
    FROM person, tour, orders, client
      WHERE person.person_id = client.person_id AND client.client_id = orders.client_id 
	  AND orders.tour_id = tour.tour_id;


--Представление – реестр туров.
CREATE VIEW V_TourList(tour_name, type_name, country, city, hotel, number_of_day)
AS
  SELECT tour.name, types.name, country.name, city.name, hotel.name, tour.number_day
    FROM tour, types, city, country, hotel
      WHERE tour.type_id = types.type_id AND tour.city_id = city.city_id 
	  AND tour.country_id = country.country_id AND tour.hotel_id = hotel.hotel_id;


--Представление – реестр клиентов.
CREATE VIEW V_ClientList(name, second_name, counter, pay, is_super)
AS
  SELECT person.name, person.second_name, client.counter, client.pay_methods, client.IS_SUPER
    FROM person, client
      WHERE person.person_id = client.person_id;


--Удаление таблиц
DROP TABLE city;
DROP TABLE client;
DROP TABLE country;
DROP TABLE hotel;
DROP TABLE orders;
DROP TABLE person;
DROP TABLE tour;
DROP TABLE types;