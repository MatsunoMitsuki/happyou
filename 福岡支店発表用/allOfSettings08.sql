/* 強制テーブル削除(初回でも動かして良いです) */
DROP TABLE genre CASCADE CONSTRAINTS;
DROP TABLE card CASCADE CONSTRAINTS;
DROP TABLE items CASCADE CONSTRAINTS;
DROP TABLE users CASCADE CONSTRAINTS;
DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;


/* 以下、各テーブル作成 */
 /* ジャンル表 */
CREATE TABLE genre(
 genre_id number(6,0) not null PRIMARY KEY ,
 genre_name varchar(100) not null
);
COMMIT;

/* ユーザ表 */
CREATE TABLE users(
 user_id number(6,0) GENERATED ALWAYS AS IDENTITY not null PRIMARY KEY ,
 email varchar(100) not null,
 password varchar(100) not null,
 user_role number(6,0) not null,
 user_name varchar(100) not null
);
COMMIT;

/* クレジットカード表 */
CREATE TABLE card(
 card_id number(6,0) GENERATED ALWAYS AS IDENTITY not null PRIMARY KEY ,
 card_type varchar(100) not null,
 card_no varchar(16) not null,
 card_period varchar(100) not null,
 card_security_code varchar(100) not null,
 user_id number(6,0) not null  REFERENCES users(user_id)
);
COMMIT;

/* 商品表 */
CREATE TABLE items(
 items_id number(6,0) GENERATED ALWAYS AS IDENTITY not null PRIMARY KEY ,
 items_name varchar(100) not null,
 artist varchar(100) not null,
 release_date date not null,
 lyric varchar(4000),
 description varchar(500),
 price number(6,0) not null,
 image varchar(100),
 genre_id number(6,0) not null REFERENCES genre(genre_id),
 youtube_url varchar(500) ,
 dl_sales number(6,0) DEFAULT 0
 );
COMMIT;

/* カート表 */
CREATE TABLE cart(
 cart_id number(6,0) GENERATED ALWAYS AS IDENTITY not null PRIMARY KEY ,
 user_id number(6,0) not null  REFERENCES users(user_id),
 items_id number(6,0) not null  REFERENCES items(items_id)
 );
 COMMIT;
 
/* 注文履歴表 */
CREATE TABLE orders(
 order_id number(6,0) GENERATED ALWAYS AS IDENTITY not null PRIMARY KEY ,
 user_id number(6,0) not null REFERENCES users(user_id),
 created_at date not null ,
 items_id number(6,0) not null REFERENCES items(items_id),
 pay_method varchar(100) ,
 card_id number(6,0)  
 );
 
  COMMIT;


/* 以下、仮データの登録 */
 /* ジャンル表に登録 */
INSERT INTO genre (GENRE_ID, GENRE_NAME) VALUES ('1', 'ポップ');
INSERT INTO genre (GENRE_ID, GENRE_NAME) VALUES ('2','ロック');
INSERT INTO genre (GENRE_ID, GENRE_NAME) VALUES ('3','エレクトロニカ');
INSERT INTO genre (GENRE_ID, GENRE_NAME) VALUES ('4','ジャズ');
INSERT INTO genre (GENRE_ID, GENRE_NAME) VALUES ('5','クラシック');
INSERT INTO genre (GENRE_ID, GENRE_NAME) VALUES ('6','ヒップホップ');
INSERT INTO genre (GENRE_ID, GENRE_NAME) VALUES ('7','その他');
COMMIT;


 /* 商品表に登録 */
/* 1ポップ */

INSERT INTO items (ITEMS_NAME, ARTIST, RELEASE_DATE, PRICE, GENRE_ID)
VALUES ('エジソン','水曜日のカンパネラ','2022-2-25','500','1');

INSERT INTO items (ITEMS_NAME, ARTIST, RELEASE_DATE, PRICE, GENRE_ID)
VALUES ('KICK-BACK','米津玄師','2022-10-12','600','1');

INSERT INTO items (ITEMS_NAME, ARTIST, RELEASE_DATE, PRICE, GENRE_ID)
VALUES ('怪獣の花唄','Vaundy','2020-5-11','450','1');

/* 2ロック */

INSERT INTO items (ITEMS_NAME, ARTIST, RELEASE_DATE, PRICE, GENRE_ID)
VALUES ('リライト','ASIAN KUNG-FU GENERATION','2004-8-4','500','2');

INSERT INTO items (ITEMS_NAME, ARTIST, RELEASE_DATE, PRICE, GENRE_ID)
VALUES ('天体観測','BUMP OF CHICKEN','2001-3-14','550','2');

INSERT INTO items (ITEMS_NAME, ARTIST, RELEASE_DATE, PRICE, GENRE_ID)
VALUES ('完全感覚Dreamer','ONE OK ROCK','2010-2-3','600','2');

/* 3エレクトロニカ */

INSERT INTO items (ITEMS_NAME, ARTIST, RELEASE_DATE, PRICE, GENRE_ID)
VALUES ('Watch Me','banvox','2015-11-25','500','3');

INSERT INTO items (ITEMS_NAME, ARTIST, RELEASE_DATE, PRICE, GENRE_ID)
VALUES ('Wake Me Up','Avicii','2013-6-17','500','3');

INSERT INTO items (ITEMS_NAME, ARTIST, RELEASE_DATE, PRICE, GENRE_ID)
VALUES ('Alone','Marshmello','2016-8-25','500','3');


/* 4ジャズ */

INSERT INTO items (ITEMS_NAME, ARTIST, RELEASE_DATE, PRICE, GENRE_ID)
VALUES ('A列車で行こう','デューク・エリントン','1941-2-15','600','4');

INSERT INTO items (ITEMS_NAME, ARTIST, RELEASE_DATE, PRICE, GENRE_ID)
VALUES ('この素晴らしき世界','ルイ・アームストロング','1967-1-1','600','4');

INSERT INTO items (ITEMS_NAME, ARTIST, RELEASE_DATE, PRICE, GENRE_ID)
VALUES ('So what','マイルス＝デイヴィス','1959-1-1','600','4');


/* 5クラシック */

INSERT INTO items (ITEMS_NAME, ARTIST, RELEASE_DATE, PRICE, GENRE_ID)
VALUES ('カノン','ヨハン・パッヘルベル','1653-1-1','600','5');

INSERT INTO items (ITEMS_NAME, ARTIST, RELEASE_DATE, PRICE, GENRE_ID)
VALUES ('G線上のアリア','ヨハン・ゼバスティアン・バッハ','1717-1-1','600','5');

/* 6ヒップホップ */

INSERT INTO items (ITEMS_NAME, ARTIST, RELEASE_DATE, PRICE, GENRE_ID)
VALUES ('よふかしのうた','Creepy Nuts','2019-8-7','600','6');

INSERT INTO items (ITEMS_NAME, ARTIST, RELEASE_DATE, PRICE, GENRE_ID)
VALUES ('水星 feat.オノマトペ大臣','tofubeats','2012-6-30','500','6');

INSERT INTO items (ITEMS_NAME, ARTIST, RELEASE_DATE, PRICE, GENRE_ID)
VALUES ('My Way','Def Tech','2005-1-22','400','6');

/* 7その他 */

INSERT INTO items (ITEMS_NAME, ARTIST, RELEASE_DATE, PRICE, GENRE_ID)
VALUES ('上を向いて歩こう','坂本九','1961-10-15','400','7');

COMMIT;


/*画像*/

UPDATE items SET image = 'エジソン.jpg' WHERE items_id = 1;
COMMIT;

UPDATE items SET image = 'KICK-BACK.jpg' WHERE items_id = 2;
COMMIT;

UPDATE items SET image = '怪獣の花唄.jpg' WHERE items_id = 3;
COMMIT;

UPDATE items SET image = 'リライト.jpg' WHERE items_id = 4;
COMMIT;

UPDATE items SET image = '天体観測.jpg' WHERE items_id = 5;
COMMIT;

UPDATE items SET image = '完全感覚Dreamer.jpg' WHERE items_id = 6;
COMMIT;

UPDATE items SET image = 'Watch Me.jpg' WHERE items_id = 7;
COMMIT;

UPDATE items SET image = 'Wake Me Up.jpg' WHERE items_id = 8;
COMMIT;

UPDATE items SET image = 'Alone.jpg' WHERE items_id = 9;
COMMIT;

UPDATE items SET image = 'NoImage.jpg' WHERE items_id = 10;
COMMIT;

UPDATE items SET image = 'NoImage.jpg' WHERE items_id = 11;
COMMIT;

UPDATE items SET image = 'NoImage.jpg' WHERE items_id = 12;
COMMIT;

UPDATE items SET image = 'NoImage.jpg' WHERE items_id = 13;
COMMIT;

UPDATE items SET image = 'NoImage.jpg' WHERE items_id = 14;
COMMIT;

UPDATE items SET image = 'よふかしのうた.jpg' WHERE items_id = 15;
COMMIT;

UPDATE items SET image = '水星 feat.オノマトペ大臣.jpg' WHERE items_id = 16;
COMMIT;

UPDATE items SET image = 'My Way.jpg' WHERE items_id = 17;
COMMIT;

UPDATE items SET image = '上を向いて歩こう.jpg' WHERE items_id = 18;
COMMIT;

/* youtube */
UPDATE items SET 
youtube_url = '<iframe width="560" height="315" src="https://www.youtube.com/embed/8tOIjOPZ5sA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>' 
WHERE items_id = 1;
COMMIT;

UPDATE items SET 
youtube_url = '<iframe width="560" height="315" src="https://www.youtube.com/embed/M2cckDmNLMI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>' 
WHERE items_id = 2;
COMMIT;

UPDATE items SET 
youtube_url = '<iframe width="560" height="315" src="https://www.youtube.com/embed/UM9XNpgrqVk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>' 
WHERE items_id = 3;
COMMIT;

UPDATE items SET 
youtube_url = '<iframe width="560" height="315" src="https://www.youtube.com/embed/cr8magEp0Ho" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>' 
WHERE items_id = 4;
COMMIT;

UPDATE items SET 
youtube_url = '<iframe width="560" height="315" src="https://www.youtube.com/embed/j7CDb610Bg0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>' 
WHERE items_id = 5;
COMMIT;

UPDATE items SET 
youtube_url = '<iframe width="560" height="315" src="https://www.youtube.com/embed/xGbxsiBZGPI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>' 
WHERE items_id = 6;
COMMIT;



 /* ユーザ表に登録 */
INSERT INTO users(email,password,user_role,user_name)
VALUES('tanaka@mail.co.jp','11111111',1,'田中');

INSERT INTO users(email,password,user_role,user_name)
VALUES('nakamura@mail.co.jp','22222222',1,'中村');

INSERT INTO users(email,password,user_role,user_name)
VALUES('takahashi@mail.co.jp','33333333',2,'高橋');

INSERT INTO users(email,password,user_role,user_name)
VALUES('yamamoto@mail.co.jp','44444444',2,'山本');
COMMIT;

