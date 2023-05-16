drop database if exists OnlineRetailStore;
create database OnlineRetailStore;
use OnlineRetailStore;
CREATE TABLE `Wallet`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `wname` VARCHAR(255) NOT NULL,
    `amount` INT NOT NULL,
    primary key (id)
);
CREATE TABLE `Customer`(
    `customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `email_id` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `contact`  VARCHAR(255) NOT NULL,
    `date_of_birth` DATETIME NOT NULL,
    `wallet_id` INT UNSIGNED NOT NULL,
    primary key(customer_id),
    foreign key(wallet_id) references Wallet(id)

);
CREATE TABLE `customer_address`(
    `customer_id` INT UNSIGNED NOT NULL ,
    `house_no` INT NOT NULL,
    `locality` VARCHAR(255) NOT NULL,
    `city` VARCHAR(255) NOT NULL,
    `pincode` INT NOT NULL,
    foreign key (customer_id) references Customer(customer_id)
);
CREATE TABLE `Delivery_Agent`(
    `id`  INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `contact` VARCHAR(255) NOT NULL,
    primary key(id)
);
CREATE TABLE `Products`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
    `name` VARCHAR(255) NOT NULL,
    `price` INT NOT NULL,
    `image_url` VARCHAR(255) NOT NULL,
    `rating` INT NOT NULL,
    `stock` INT NOT NULL,
    primary key (id)
);
CREATE TABLE `Cart`(
    `customer_id` INT UNSIGNED NOT NULL ,
    
    `product_id` INT UNSIGNED NOT NULL ,
    `no_of_items` INT NOT NULL default 0 ,
   
    foreign key (customer_id) references Customer(customer_id),
    foreign key (product_id) references Products(id)
    
);
CREATE TABLE `Transactions`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `wallet_id` INT UNSIGNED NOT NULL,
    `amount` INT NOT NULL,
    primary key(id),
    foreign key (wallet_id) references wallet(id)

);
CREATE TABLE `O_rder`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `delivery_agent_id` INT UNSIGNED NOT NULL,
    `customer_id` INT UNSIGNED NOT NULL,
    `transaction_id` INT UNSIGNED NOT NULL,
    `date` DATETIME NOT NULL,
    primary key (id),
    foreign key (customer_id) references Customer(customer_id),
    foreign key (delivery_agent_id) references Delivery_Agent(id),
    foreign key (transaction_id) references Transactions(id)
);

CREATE TABLE `Sold_Items`(
    `customer_id` INT UNSIGNED NOT NULL,
    `order_id` INT UNSIGNED NOT NULL,
    `product_id` INT UNSIGNED NOT NULL,
    `items` INT NOT NULL,
    foreign key (customer_id) references Customer(customer_id),
    foreign key (product_id) references Products(id),
    foreign key (order_id) references O_rder(id)
);

CREATE TABLE `Employee`(
    `employee_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `email_id` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `contact`  VARCHAR(255) NOT NULL,
    `date_of_birth` DATETIME NOT NULL,
    primary key(employee_id)
    );

/* Wallet*/

INSERT INTO Wallet(id,wname,amount) VALUES (900,'Vlad',2959);
INSERT INTO Wallet(id,wname,amount) VALUES (901,'Tiffanie',3976);
INSERT INTO Wallet(id,wname,amount) VALUES (902,'Haroun',6595);
INSERT INTO Wallet(id,wname,amount) VALUES (903,'Philippe',2514);
INSERT INTO Wallet(id,wname,amount) VALUES (904,'Jacquelyn',4897);
INSERT INTO Wallet(id,wname,amount) VALUES (905,'Chickie',9236);
INSERT INTO Wallet(id,wname,amount) VALUES (906,'Neala',6900);
INSERT INTO Wallet(id,wname,amount) VALUES (907,'Onfre',2572);
INSERT INTO Wallet(id,wname,amount) VALUES (908,'Salem',7455);
INSERT INTO Wallet(id,wname,amount) VALUES (909,'Evelina',3280);
INSERT INTO Wallet(id,wname,amount) VALUES (910,'Kristel',8341);
INSERT INTO Wallet(id,wname,amount) VALUES (911,'Melloney',2690);
INSERT INTO Wallet(id,wname,amount) VALUES (912,'Sansone',9894);
INSERT INTO Wallet(id,wname,amount) VALUES (913,'Aleksandr',5546);
INSERT INTO Wallet(id,wname,amount) VALUES (914,'Kala',4559);
INSERT INTO Wallet(id,wname,amount) VALUES (915,'Bendite',8928);
INSERT INTO Wallet(id,wname,amount) VALUES (916,'Calida',7228);
INSERT INTO Wallet(id,wname,amount) VALUES (917,'Quintana',9390);
INSERT INTO Wallet(id,wname,amount) VALUES (918,'Christal',8380);
INSERT INTO Wallet(id,wname,amount) VALUES (919,'Cecelia',3580);
INSERT INTO Wallet(id,wname,amount) VALUES (920,'Merry',6824);
INSERT INTO Wallet(id,wname,amount) VALUES (921,'Tiphany',2845);
INSERT INTO Wallet(id,wname,amount) VALUES (922,'Pavel',9809);
INSERT INTO Wallet(id,wname,amount) VALUES (923,'Quintina',6283);
INSERT INTO Wallet(id,wname,amount) VALUES (924,'Stephanus',3218);
INSERT INTO Wallet(id,wname,amount) VALUES (925,'Candice',9937);
INSERT INTO Wallet(id,wname,amount) VALUES (926,'Kinny',7096);
INSERT INTO Wallet(id,wname,amount) VALUES (927,'Agustin',6495);
INSERT INTO Wallet(id,wname,amount) VALUES (928,'Denys',7397);
INSERT INTO Wallet(id,wname,amount) VALUES (929,'Jamil',4146);
INSERT INTO Wallet(id,wname,amount) VALUES (930,'Abbe',7851);
INSERT INTO Wallet(id,wname,amount) VALUES (931,'Bryna',9247);
INSERT INTO Wallet(id,wname,amount) VALUES (932,'Teressa',3421);
INSERT INTO Wallet(id,wname,amount) VALUES (933,'Gaven',3035);
INSERT INTO Wallet(id,wname,amount) VALUES (934,'Veronika',6352);
INSERT INTO Wallet(id,wname,amount) VALUES (935,'Bernardo',4275);
INSERT INTO Wallet(id,wname,amount) VALUES (936,'Kean',6305);
INSERT INTO Wallet(id,wname,amount) VALUES (937,'Quintana',9007);
INSERT INTO Wallet(id,wname,amount) VALUES (938,'Kearney',2873);
INSERT INTO Wallet(id,wname,amount) VALUES (939,'Oralie',6849);
INSERT INTO Wallet(id,wname,amount) VALUES (940,'Christos',5274);
INSERT INTO Wallet(id,wname,amount) VALUES (941,'Cilka',3441);
INSERT INTO Wallet(id,wname,amount) VALUES (942,'Jacinda',6077);
INSERT INTO Wallet(id,wname,amount) VALUES (943,'Babs',9203);
INSERT INTO Wallet(id,wname,amount) VALUES (944,'Dale',3632);
INSERT INTO Wallet(id,wname,amount) VALUES (945,'Arch',9789);
INSERT INTO Wallet(id,wname,amount) VALUES (946,'Scotty',2815);
INSERT INTO Wallet(id,wname,amount) VALUES (947,'Ingelbert',7021);
INSERT INTO Wallet(id,wname,amount) VALUES (948,'Mona',5329);
INSERT INTO Wallet(id,wname,amount) VALUES (949,'Malynda',5749);
INSERT INTO Wallet(id,wname,amount) VALUES (950,'Bibbie',8485);
INSERT INTO Wallet(id,wname,amount) VALUES (951,'Karlen',3343);
INSERT INTO Wallet(id,wname,amount) VALUES (952,'Heriberto',6454);
INSERT INTO Wallet(id,wname,amount) VALUES (953,'Vincent',2918);
INSERT INTO Wallet(id,wname,amount) VALUES (954,'Tyrone',7979);
INSERT INTO Wallet(id,wname,amount) VALUES (955,'Malvina',2659);
INSERT INTO Wallet(id,wname,amount) VALUES (956,'Renate',9878);
INSERT INTO Wallet(id,wname,amount) VALUES (957,'Moises',4136);
INSERT INTO Wallet(id,wname,amount) VALUES (958,'Dyanne',9683);
INSERT INTO Wallet(id,wname,amount) VALUES (959,'Evered',3217);
INSERT INTO Wallet(id,wname,amount) VALUES (960,'Kaila',2988);
INSERT INTO Wallet(id,wname,amount) VALUES (961,'Violet',6852);
INSERT INTO Wallet(id,wname,amount) VALUES (962,'Farly',2921);
INSERT INTO Wallet(id,wname,amount) VALUES (963,'Gennifer',3321);
INSERT INTO Wallet(id,wname,amount) VALUES (964,'Ynez',7048);
INSERT INTO Wallet(id,wname,amount) VALUES (965,'Isacco',5070);
INSERT INTO Wallet(id,wname,amount) VALUES (966,'Mufinella',5305);
INSERT INTO Wallet(id,wname,amount) VALUES (967,'Kylen',4997);
INSERT INTO Wallet(id,wname,amount) VALUES (968,'Cristen',9507);
INSERT INTO Wallet(id,wname,amount) VALUES (969,'Tannie',5328);
INSERT INTO Wallet(id,wname,amount) VALUES (970,'Pooh',5449);
INSERT INTO Wallet(id,wname,amount) VALUES (971,'Adriane',8469);
INSERT INTO Wallet(id,wname,amount) VALUES (972,'Glynda',5310);
INSERT INTO Wallet(id,wname,amount) VALUES (973,'Ursulina',8737);
INSERT INTO Wallet(id,wname,amount) VALUES (974,'Arda',8669);
INSERT INTO Wallet(id,wname,amount) VALUES (975,'Emelyne',5881);
INSERT INTO Wallet(id,wname,amount) VALUES (976,'Julie',7119);
INSERT INTO Wallet(id,wname,amount) VALUES (977,'Lezlie',6386);
INSERT INTO Wallet(id,wname,amount) VALUES (978,'Nita',3407);
INSERT INTO Wallet(id,wname,amount) VALUES (979,'Dolorita',2583);
INSERT INTO Wallet(id,wname,amount) VALUES (980,'Janifer',5158);
INSERT INTO Wallet(id,wname,amount) VALUES (981,'Bealle',4332);
INSERT INTO Wallet(id,wname,amount) VALUES (982,'Maxine',6837);
INSERT INTO Wallet(id,wname,amount) VALUES (983,'Peirce',6619);
INSERT INTO Wallet(id,wname,amount) VALUES (984,'Reggie',7399);
INSERT INTO Wallet(id,wname,amount) VALUES (985,'Myrvyn',4449);
INSERT INTO Wallet(id,wname,amount) VALUES (986,'Kalina',9338);
INSERT INTO Wallet(id,wname,amount) VALUES (987,'Marius',9322);
INSERT INTO Wallet(id,wname,amount) VALUES (988,'Romy',5142);
INSERT INTO Wallet(id,wname,amount) VALUES (989,'Sheff',3758);
INSERT INTO Wallet(id,wname,amount) VALUES (990,'Meghann',6849);
INSERT INTO Wallet(id,wname,amount) VALUES (991,'Gerik',7053);
INSERT INTO Wallet(id,wname,amount) VALUES (992,'Jess',7701);
INSERT INTO Wallet(id,wname,amount) VALUES (993,'Charlean',9716);
INSERT INTO Wallet(id,wname,amount) VALUES (994,'Mead',7430);
INSERT INTO Wallet(id,wname,amount) VALUES (995,'Reinaldo',3752);
INSERT INTO Wallet(id,wname,amount) VALUES (996,'Sig',2777);
INSERT INTO Wallet(id,wname,amount) VALUES (997,'Maddi',5101);
INSERT INTO Wallet(id,wname,amount) VALUES (998,'Ardith',3741);
INSERT INTO Wallet(id,wname,amount) VALUES (999,'Sioux',8417);

/* Customer */

INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (1,'Vlad','Dennidge','vdennidge0@shareasale.com','815 769 9573','2022-11-19','o9iLCaYYUi8',900);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (2,'Tiffanie','Berkelay','tberkelay1@census.gov','920 719 5070','23-02-06','KZFxAnID',901);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (3,'Haroun','Mousdall','hmousdall2@oracle.com','378 398 3114','2022-02-11','wCLHdoJwd',902);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (4,'Philippe','Aimson','paimson3@youku.com','701 840 5107','2022-11-04','m9YKIh',903);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (5,'Jacquelyn','Coils','jcoils4@mail.ru','959 109 5949','2022-06-13','nmCgYtL5lK',904);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (6,'Chickie','Velti','cvelti5@cocolog-nifty.com','850 546 3630','2022-08-16','s9QcdixnjFZU',905);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (7,'Neala','Tointon','ntointon6@hugedomains.com','926 964 0892','2022-04-28','24SzFD5xkTF5',906);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (8,'Onfre','Millichip','omillichip7@google.nl','560 974 6823','2022-10-28','X1S2F5T',907);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (9,'Salem','Klemenz','sklemenz8@e-recht24.de','986 611 7073','2022-05-07','JsXFnSS',908);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (10,'Evelina','Kings','ekings9@slate.com','983 807 2783','2022-06-26','XJzvFjQR2ib',909);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (11,'Kristel','Molloy','kmolloya@illinois.edu','700 765 2842','2022-04-21','3egqaa',910);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (12,'Melloney','Soden','msodenb@miibeian.gov.cn','655 293 8464','2022-08-04','LJbsvEUA7ND',911);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (13,'Sansone','Zapatero','szapateroc@walmart.com','177 525 7567','23-01-01','FtXnsW',912);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (14,'Aleksandr','Elwel','aelweld@berkeley.edu','457 829 7196','2023-01-16','UC5rUx73TK2Y',913);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (15,'Kala','Ellcock','kellcocke@washington.edu','129 835 8037','2022-08-11','Mr93hcqUgWp',914);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (16,'Bendite','Strange','bstrangef@senate.gov','734 169 5804','2022-05-21','dqXUL54mu',915);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (17,'Calida','Bickerstaffe','cbickerstaffeg@who.int','335 493 9161','2022-08-22','koZfFAcnmSO',916);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (18,'Quintana','Walworche','qwalworcheh@topsy.com','936 725 2345','2022-08-04','0Dh3VY3w6',917);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (19,'Christal','Calcraft','ccalcrafti@gravatar.com','117 842 2465','2023-01-19','UGwfcqwc',918);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (20,'Cecelia','Streak','cstreakj@mozilla.com','991 997 8306','2022-11-21','NuhZHmwH1cpA',919);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (21,'Merry','Wittier','mwittierk@amazon.de','700 860 8814','2022-12-22','8Pb2eW6dK',920);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (22,'Tiphany','Haffard','thaffardl@xrea.com','733 484 5777','2022-08-14','SXoCmwjx',921);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (23,'Pavel','Attow','pattowm@digg.com','248 651 7568','2022-08-06','0UkDPrLglL',922);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (24,'Quintina','Goodered','qgooderedn@ifeng.com','540 952 9123','2022-10-16','a5uL4DhtJu',923);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (25,'Stephanus','Mabbe','smabbeo@weather.com','634 292 3948','2022-11-15','1DJGjwYnhzNK',924);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (26,'Candice','McBride','cmcbridep@github.io','152 276 6651','2022-12-02','l9kYdj',925);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (27,'Kinny','Cursons','kcursonsq@squarespace.com','798 364 3763','2022-12-06','yWvXfDCo',926);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (28,'Agustin','Dunseith','adunseithr@hostgator.com','438 820 6095','2022-09-25','fcfltSZWFtCy',927);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (29,'Denys','Beecker','dbeeckers@ask.com','712 153 6357','2022-12-18','JCDVRPA',928);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (30,'Jamil','Faraker','jfarakert@clickbank.net','510 142 0619','2022-08-28','QvTxAGtc',929);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (31,'Abbe','Buckner','abuckneru@census.gov','985 462 7604','2022-07-05','GyMyo9o82F',930);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (32,'Bryna','Messenbird','bmessenbirdv@1688.com','412 229 4671','2022-09-02','HykktCPrGr',931);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (33,'Teressa','Crannell','tcrannellw@census.gov','626 785 3256','2022-08-01','6ALblQfyPQK',932);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (34,'Gaven','Kehri','gkehrix@vistaprint.com','197 419 2285','2022-12-24','i4KOEHNOW',933);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (35,'Veronika','Manhare','vmanharey@indiegogo.com','453 373 1216','2022-06-18','k7Cs6IiH4Pg',934);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (36,'Bernardo','Birdwistle','bbirdwistlez@lulu.com','238 215 8959','2022-02-10','eoWlqa0',935);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (37,'Kean','McKie','kmckie10@eventbrite.com','617 631 1767','2022-07-31','mFwfyNG',936);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (38,'Quintana','Leele','qleele11@de.vu','747 920 9631','2022-08-02','G4yKVwFn',937);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (39,'Kearney','Knivett','kknivett12@tripadvisor.com','341 978 4786','2022-08-08','hD9x07OL',938);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (40,'Oralie','Smithe','osmithe13@fotki.com','805 247 2295','2022-08-07','hMjqkBDTyix',939);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (41,'Christos','Arents','carents14@elegantthemes.com','892 889 9394','2023-01-18','D2vPuC6EZLP',940);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (42,'Cilka','Lebrun','clebrun15@artisteer.com','649 537 6684','2022-02-20','SiEcad6EB0uD',941);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (43,'Jacinda','Scamel','jscamel16@tmall.com','892 644 3260','2022-10-23','O6ZFtPrW',942);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (44,'Babs','Heintsch','bheintsch17@opensource.org','565 413 5445','2022-04-24','AiM2anUzsy',943);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (45,'Dale','Ferriby','dferriby18@illinois.edu','232 115 8390','2022-07-14','IbIN5u',944);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (46,'Arch','Sebyer','asebyer19@sbwire.com','832 745 3775','2022-09-23','VZVGQN1B',945);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (47,'Scotty','Feragh','sferagh1a@chicagotribune.com','819 137 5915','2022-02-25','mucJIW',946);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (48,'Ingelbert','Gueste','igueste1b@webs.com','507 222 7413','23-01-02','PbNkJV',947);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (49,'Mona','Filppetti','mfilppetti1c@bbc.co.uk','279 361 4366','2022-11-12','lWlDVyzT',948);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (50,'Malynda','Melmoth','mmelmoth1d@gnu.org','803 537 4107','2023-01-28','ujEjfp',949);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (51,'Bibbie','Andre','bandre1e@slate.com','205 636 6759','2022-04-26','C9PCWI',950);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (52,'Karlen','Mendus','kmendus1f@hexun.com','198 837 4692','2022-12-02','KkT0QXizr0',951);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (53,'Heriberto','Wollers','hwollers1g@nydailynews.com','746 779 9026','2022-11-26','Ryla73Ohn',952);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (54,'Vincent','Pellatt','vpellatt1h@furl.net','715 720 1993','2022-02-11','x5ZCD3',953);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (55,'Tyrone','McWhinnie','tmcwhinnie1i@dailymotion.com','379 963 0462','2022-09-20','j9GmvV8T7u',954);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (56,'Malvina','Sheeres','msheeres1j@nih.gov','928 318 6932','23-01-12','LusxekU',955);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (57,'Renate','Vater','rvater1k@macromedia.com','697 591 4062','2022-12-11','MqaeWpjj',956);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (58,'Moises','Hale','mhale1l@ft.com','234 246 4780','2022-10-20','8Tq7z6UX',957);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (59,'Dyanne','Ellsworthe','dellsworthe1m@ibm.com','139 818 4951','2022-07-11','xPT0Dim2UC',958);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (60,'Evered','Ralestone','eralestone1n@dion.ne.jp','411 910 0322','2022-06-01','jDPQLoX',959);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (61,'Kaila','Kydde','kkydde1o@angelfire.com','651 627 2408','2022-09-17','pspu2m85dPyJ',960);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (62,'Violet','Gravenall','vgravenall1p@symantec.com','401 504 3675','2022-10-10','lyBieFLXJOmj',961);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (63,'Farly','Woosnam','fwoosnam1q@spotify.com','804 885 2146','2022-10-12','kOZuUoyO',962);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (64,'Gennifer','Duckels','gduckels1r@umich.edu','290 909 9499','2022-08-01','phosv7',963);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (65,'Ynez','Slora','yslora1s@ed.gov','504 292 3196','2022-03-13','2rtd8i01',964);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (66,'Isacco','Babonau','ibabonau1t@newyorker.com','493 327 2779','2022-10-22','YfvEhAj7R2CY',965);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (67,'Mufinella','Callendar','mcallendar1u@hibu.com','763 234 6084','2022-06-20','MNW2QpN',966);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (68,'Kylen','Etter','ketter1v@amazon.co.uk','145 476 1107','2022-05-01','Za1iY8a0zp',967);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (69,'Cristen','Howlings','chowlings1w@amazon.co.uk','156 195 7351','2022-04-09','aR5WkHj8yp',968);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (70,'Tannie','Staveley','tstaveley1x@nydailynews.com','713 463 6620','2022-03-23','Dp8PIaoYh8',969);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (71,'Pooh','Wolfendell','pwolfendell1y@icio.us','134 446 1871','2022-08-06','stUv0U0fPH8',970);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (72,'Adriane','Penvarne','apenvarne1z@businesswire.com','419 239 5587','2022-02-13','7iS107EibK',971);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (73,'Glynda','Broyd','gbroyd20@clickbank.net','531 367 9106','2022-08-18','KSpBkgLX',972);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (74,'Ursulina','Baistow','ubaistow21@cnbc.com','650 676 9584','2022-12-21','jTmkQOj',973);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (75,'Arda','Somerscales','asomerscales22@biblegateway.com','406 697 7079','2022-05-04','XkkHyIPllgYL',974);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (76,'Emelyne','Joscelyn','ejoscelyn23@businessweek.com','421 249 2563','2022-03-22','AUngY510YPHN',975);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (77,'Julie','Simmell','jsimmell24@woothemes.com','989 541 5840','2022-06-27','PKlTqvd4qm',976);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (78,'Lezlie','Lowres','llowres25@liveinternet.ru','530 919 8828','2022-09-03','1LufrvY',977);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (79,'Nita','Moreton','nmoreton26@ca.gov','265 182 0449','2022-10-06','QKaWpjMN',978);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (80,'Dolorita','Reuben','dreuben27@who.int','952 455 2627','2022-03-31','PFv8kEBc',979);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (81,'Janifer','Crook','jcrook28@ucsd.edu','577 101 5090','2022-10-25','okhaqt',980);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (82,'Bealle','Du Plantier','bduplantier29@squarespace.com','915 878 8903','2022-07-16','seOj064v2',981);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (83,'Maxine','Kairns','mkairns2a@wikia.com','620 599 8746','2022-02-20','6U4E3vi',982);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (84,'Peirce','Loades','ploades2b@va.gov','826 981 1334','2022-04-23','t9ih9h0znmS',983);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (85,'Reggie','Barthelet','rbarthelet2c@technorati.com','408 333 0982','2022-06-09','yJ8m58',984);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (86,'Myrvyn','Yakebovitch','myakebovitch2d@bandcamp.com','163 204 4499','2022-09-25','QqaA7NEJxCl',985);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (87,'Kalina','Saich','ksaich2e@columbia.edu','360 831 2757','2022-06-18','mPSCV7',986);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (88,'Marius','Dennerley','mdennerley2f@nbcnews.com','376 628 9668','2022-08-20','rGHnr50P',987);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (89,'Romy','Lackney','rlackney2g@surveymonkey.com','615 178 2052','2022-11-27','T06JhgCI',988);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (90,'Sheff','Switsur','sswitsur2h@squidoo.com','919 656 3655','2022-02-15','ptl9FHyOArL',989);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (91,'Meghann','Bauckham','mbauckham2i@nymag.com','892 778 7508','2022-10-27','hgdTyGD1',990);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (92,'Gerik','Abramski','gabramski2j@odnoklassniki.ru','730 896 4102','2022-11-17','ReDtb68f0CV',991);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (93,'Jess','Benedtti','jbenedtti2k@themeforest.net','491 173 5215','23-02-04','NqA8fPwH',992);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (94,'Charlean','Bewshea','cbewshea2l@go.com','258 978 2535','2022-05-03','F3W7irpw3Tl',993);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (95,'Mead','Slorance','mslorance2m@goo.gl','725 449 0022','2022-05-06','3GeXkWJFo',994);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (96,'Reinaldo','Rolfini','rrolfini2n@wiley.com','710 131 4406','2022-02-10','61L8Ced',995);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (97,'Sig','Keyzor','skeyzor2o@rediff.com','868 525 3928','2022-04-13','FFp6GuMLy',996);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (98,'Maddi','Stollwerk','mstollwerk2p@friendfeed.com','514 334 1583','2022-08-02','sCT50a',997);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (99,'Ardith','Martinetto','amartinetto2q@businesswire.com','905 718 3932','23-01-12','jiiLtefnO9',998);
INSERT INTO Customer(customer_id,first_name,last_name,email_id,contact,date_of_birth,password,wallet_id) VALUES (100,'Sioux','Speares','sspeares2r@sciencedirect.com','341 914 4358','2023-01-15','hYAGtZqw',999);

/* ADDRESS */

INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (1,1910,'Mandi House','Delhi',110001);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (2,1920,'Barakhamba','Delhi',110002);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (3,1930,'Rajiv Chowk','Delhi',110003);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (4,1940,'RK Ashram Marg','Delhi',110004);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (5,1950,'Jhandewalan','Delhi',110005);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (6,1960,'Karol Bagh','Delhi',110006);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (7,1970,'Rajendra Place','Delhi',110007);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (8,1980,'Patel Nagar','Delhi',110008);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (9,1990,'Shadi Pur','Delhi',110009);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (10,2000,'Kirti Nagar','Delhi',110010);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (11,1190,'Moti Nagar','Delhi',110011);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (12,1200,'Chinchpokli','Mumbai',400001);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (13,1180,'Dahisar','Mumbai',400002);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (14,1170,'Goregaon','Mumbai',400003);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (15,1150,'Dadar','Mumbai',400004);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (16,1130,'Dombivili','Mumbai',400005);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (17,1110,'Ghatkopar','Mumbai',400006);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (18,1160,'Kalyan','Mumbai',400007);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (19,1140,'Andheri','Mumbai',400008);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (20,1120,'Bandra','Mumbai',400009);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (21,1500,'Borivali','Mumbai',400010);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (22,1520,'Churchgate','Mumbai',400011);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (23,1540,'Kavi Subhash','Kolkata',700001);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (24,1560,'Gitanjali','Kolkata',700002);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (25,1580,'Netaji','Kolkata',700003);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (26,1600,'Uttam Kumar','Kolkata',700004);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (27,1510,'Rabindra Sadan','Kolkata',700005);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (28,1530,'Kalighat','Kolkata',700006);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (29,1550,'Jatin Das','Kolkata',700007);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (30,1570,'Maidan','Kolkata',700008);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (31,1590,'Park Street','Kolkata',700009);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (32,1800,'Esplanade','Kolkata',700010);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (33,1830,'Girish Park','Kolkata',700011);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (34,1860,'Shobhabazar','Kolkata',700012);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (35,1890,'Ramesh Nagar','Delhi',110012);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (36,1820,'Rajouri Garden','Delhi',110013);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (37,1850,'Tagore Garden','Delhi',110014);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (38,1880,'Subash Nagar','Delhi',110015);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (39,1810,'Tilak Nagar','Delhi',110016);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (40,1840,'Janak Puri','Delhi',110017);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (41,1870,'Uttam Nagar','Delhi',110018);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (42,1900,'Kashmere Gate','Delhi',110019);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (43,1210,'Jama Masjid','Delhi',110020);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (44,1300,'Janpath','Delhi',110021);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (45,1220,'Central Secretariat','Delhi',110022);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (46,1290,'Khan Market','Delhi',110023);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (47,1230,'Jangpura','Delhi',110024);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (48,1280,'Dahisar','Mumbai',400012);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (49,1240,'Goregaon','Mumbai',400013);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (50,1270,'Jogeshwari','Mumbai',400014);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (51,1250,'Kandivali','Mumbai',400015);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (52,1260,'Khar Rd','Mumbai',400016);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (53,2120,'Lower Parel','Mumbai',400017);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (54,2140,'Malad','Mumbai',400018);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (55,2160,'Mahim','Mumbai',400019);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (56,2180,'Mumbai Central','Mumbai',400020);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (57,2200,'Naigaon','Mumbai',400021);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (58,2110,'Nalla Sopara','Mumbai',400022);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (59,2130,'Santa Cruz','Mumbai',400023);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (60,2150,'Vile Parle','Mumbai',400024);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (61,2170,'Virar','Mumbai',400025);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (62,2190,'Chembur','Mumbai',400026);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (63,2890,'Govandi','Mumbai',400027);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (64,2810,'Juinagar','Mumbai',400028);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (65,2880,'Khandeshwar','Mumbai',400029);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (66,2820,'Kurla','Mumbai',400030);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (67,2870,'Shyambazar','Kolkata',700013);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (68,2830,'Belgacchia','Kolkata',700014);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (69,2850,'Dum Dum','Kolkata',700015);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (70,2840,'Noapara','Kolkata',700016);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (71,2860,'Baranagar','Kolkata',700017);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (72,2410,'Salt Lake','Kolkata',700018);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (73,2420,'Behala','Kolkata',700019);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (74,2430,'Taratala','Kolkata',700020);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (75,2450,'Alipore','Kolkata',700021);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (76,2440,'Kasba','Kolkata',700022);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (77,2460,'Rajarhat','Kolkata',700023);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (78,2470,'Tollygunge','Kolkata',700024);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (79,2490,'Ballygunge','Kolkata',700025);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (80,2480,'Jadavpur','Kolkata',700026);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (81,2400,'Golf Green','Kolkata',700027);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (82,2500,'Lajpat Nagar','Delhi',110025);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (83,2790,'Moolchand','Delhi',110026);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (84,2770,'Kailash Colony','Delhi',110027);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (85,2750,'Nehru Place','Delhi',110028);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (86,2730,'Kalkaji Mandir','Delhi',110029);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (87,2710,'Govind Puri','Delhi',110030);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (88,2720,'Harkesh Nagar','Delhi',110031);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (89,2740,'Sarita Vihar','Delhi',110032);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (90,2760,'Hauz Khas','Delhi',110033);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (91,2780,'Malvia Nagar','Delhi',110034);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (92,3100,'Saket','Delhi',110035);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (93,3300,'Qutab Minar','Delhi',110036);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (94,3200,'Punjabi Bagh','Delhi',110037);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (95,3500,'Inderlok','Delhi',110038);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (96,3400,'Shivaji Park','Delhi',110039);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (97,3800,'Paschim Vihar','Delhi',110040);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (98,3600,'Nangloi','Delhi',110041);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (99,3700,'Mundka','Delhi',110042);
INSERT INTO customer_address(customer_id,house_no,locality,city,pincode) VALUES (100,3900,'Madipur','Delhi',110043);

/* Delivery Agents*/

INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (500,'Alain','Trevena','530 604 7647');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (501,'Clive','Dymoke','550 134 7115');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (502,'Brose','Lotze','226 578 3613');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (503,'Marge','Baythorp','301 650 7255');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (504,'Syd','Berends','739 916 0225');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (505,'Hettie','Riggert','396 605 1968');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (506,'Towny','Muehler','406 980 3429');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (507,'Naomi','Cahalin','896 171 6373');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (508,'Barbara','Brixey','350 514 6732');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (509,'Arly','Saffill','898 764 9389');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (510,'Donnajean','Skingley','862 436 0334');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (511,'Chere','Fairbourne','222 774 7574');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (512,'Rosy','Kington','434 185 3321');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (513,'Talyah','Learoid','781 943 5734');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (514,'Albina','Marmon','253 332 4092');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (515,'Nowell','Grahlmans','834 358 5316');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (516,'Lorettalorna','Rudd','744 976 4466');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (517,'Addison','Abby','685 969 1514');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (518,'Sawyere','Magister','398 232 7203');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (519,'Pammy','Ketchen','835 399 5651');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (520,'Lonnie','Cafferky','454 790 8063');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (521,'Franklyn','Gibbs','823 205 8665');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (522,'Orsa','Hammelberg','822 261 5892');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (523,'Garvey','Filipic','536 327 1118');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (524,'Samaria','Larrie','522 325 9823');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (525,'Robinet','Kesterton','135 923 5888');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (526,'Jolee','Dunbobbin','713 802 4042');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (527,'Jonell','Bisacre','822 942 2634');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (528,'Nadine','Blondel','975 466 7635');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (529,'Modestia','Caras','142 107 3794');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (530,'Bobinette','Senchenko','705 867 6221');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (531,'Mirella','Cadell','312 321 3650');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (532,'Rollie','Bowe','294 305 0815');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (533,'Libby','McQuaker','939 849 3891');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (534,'Nanon','Spenton','703 180 8850');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (535,'Rhody','Dell ''Orto','955 814 0759');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (536,'Laurella','Ladds','217 518 2455');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (537,'Anica','Aberdalgy','432 155 4739');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (538,'North','Rattenbury','511 667 7270');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (539,'Thornton','Chettoe','392 161 0580');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (540,'Lou','Paterno','192 784 5391');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (541,'Uriah','Lyne','356 509 2298');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (542,'Marius','Overil','243 369 8827');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (543,'Arabel','Kubecka','575 864 5070');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (544,'Lesly','Thomassin','545 976 6931');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (545,'Leora','Sabathe','604 789 7303');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (546,'Engracia','Goghin','461 332 7557');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (547,'Moyna','Eddleston','747 592 9372');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (548,'Mallory','Sarney','469 985 4509');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (549,'Maximilianus','Tremmil','812 267 5036');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (550,'Blondell','Noen','130 624 2645');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (551,'Nadya','Leed','849 586 2774');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (552,'Netty','Sweeny','135 778 1828');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (553,'Delbert','von Nassau','569 614 6728');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (554,'Janeczka','Iianon','907 648 3758');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (555,'Mei','Fahy','271 288 2620');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (556,'Vaughn','Croose','847 391 3674');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (557,'Viv','Ludl','662 130 3657');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (558,'Cort','Blandford','616 870 6054');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (559,'Hilliard','Eagleston','710 447 1852');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (560,'Zebulon','Cherry','375 767 6311');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (561,'Herbie','Toohey','106 264 3288');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (562,'Anthe','Brandon','458 793 7278');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (563,'Vlad','Lanphier','313 194 2895');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (564,'Lorrin','Alderton','617 573 8838');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (565,'Reilly','Brager','199 201 2183');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (566,'Dre','Fessby','276 662 4429');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (567,'Dirk','Craise','978 332 2427');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (568,'Kipp','Dorning','344 486 2138');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (569,'Dav','Le Galle','598 655 4666');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (570,'Nevins','Scarr','818 503 7907');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (571,'Leslie','Lafflina','757 767 9394');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (572,'Elfrida','Lay','553 978 3454');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (573,'Dame','Tregenna','588 633 2911');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (574,'Catlee','Samwyse','147 413 2500');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (575,'Bancroft','Longland','244 617 7589');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (576,'Gussy','Fishbourn','386 393 4813');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (577,'Abbey','Malacrida','640 418 8586');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (578,'Kerwin','Rawne','417 395 6807');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (579,'Caz','Blasiak','369 980 2002');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (580,'Hollis','Eglese','191 632 6916');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (581,'Wilma','Friend','242 270 6478');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (582,'Corbet','Gaffney','195 508 1521');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (583,'Yoko','Hinsche','890 250 0049');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (584,'Henry','Ohanessian','968 939 4500');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (585,'Javier','Gypson','850 352 9293');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (586,'Corbie','Cottel','720 391 8660');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (587,'Sidoney','Gallear','168 582 1842');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (588,'Vinny','Takle','559 226 3663');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (589,'Farra','Symcock','253 569 1972');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (590,'Gretchen','Stronghill','815 657 0027');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (591,'Jereme','Iglesias','495 657 5763');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (592,'Jemmy','McQuorkel','437 623 3845');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (593,'Tiena','Zecchii','370 518 2634');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (594,'Felic','Bradman','993 458 0300');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (595,'Tim','Coldtart','358 435 7767');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (596,'Lani','Aveling','291 678 2807');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (597,'Katy','Laxe','217 746 4069');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (598,'Fabiano','Di Napoli','547 406 4608');
INSERT INTO Delivery_Agent(id,first_name,last_name,contact) VALUES (599,'Patrizius','Asbury','475 598 8034');

/* Products */

INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (700,'Muffin - Mix - Creme Brule 15l',172,'http://dummyimage.com/192x100.png/dddddd/000000',1,336);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (701,'Butcher Twine 4r',340,'http://dummyimage.com/114x100.png/dddddd/000000',4,148);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (702,'Pork - Backs - Boneless',457,'http://dummyimage.com/249x100.png/ff4444/ffffff',1,338);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (703,'Rice Wine - Aji Mirin',172,'http://dummyimage.com/220x100.png/ff4444/ffffff',3,37);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (704,'Lentils - Green, Dry',480,'http://dummyimage.com/133x100.png/5fa2dd/ffffff',1,423);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (705,'Rabbit - Saddles',102,'http://dummyimage.com/157x100.png/ff4444/ffffff',3,33);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (706,'Longos - Burritos',132,'http://dummyimage.com/206x100.png/5fa2dd/ffffff',4,717);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (707,'Pickle - Dill',242,'http://dummyimage.com/229x100.png/5fa2dd/ffffff',3,71);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (708,'Muffin Batt - Blueberry Passion',306,'http://dummyimage.com/204x100.png/5fa2dd/ffffff',5,310);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (709,'Container - Foam Dixie 12 Oz',201,'http://dummyimage.com/214x100.png/dddddd/000000',1,936);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (710,'Nantucket Orange Juice',382,'http://dummyimage.com/197x100.png/5fa2dd/ffffff',1,322);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (711,'Bread - Kimel Stick Poly',109,'http://dummyimage.com/114x100.png/cc0000/ffffff',1,749);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (712,'Wine - Penfolds Koonuga Hill',160,'http://dummyimage.com/196x100.png/dddddd/000000',5,301);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (713,'Wine - Jaboulet Cotes Du Rhone',442,'http://dummyimage.com/225x100.png/ff4444/ffffff',4,365);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (714,'Cheese - Manchego, Spanish',237,'http://dummyimage.com/196x100.png/ff4444/ffffff',4,822);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (715,'Lamb - Ground',500,'http://dummyimage.com/114x100.png/5fa2dd/ffffff',4,930);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (716,'Juice - Apple, 500 Ml',231,'http://dummyimage.com/175x100.png/5fa2dd/ffffff',3,828);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (717,'Containter - 3oz Microwave Rect.',406,'http://dummyimage.com/153x100.png/ff4444/ffffff',5,37);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (718,'Soup - Boston Clam Chowder',401,'http://dummyimage.com/149x100.png/dddddd/000000',1,747);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (719,'Wine - Hardys Bankside Shiraz',325,'http://dummyimage.com/112x100.png/ff4444/ffffff',5,306);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (720,'Yogurt - Blueberry, 175 Gr',202,'http://dummyimage.com/161x100.png/ff4444/ffffff',2,210);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (721,'Juice - Orange, 341 Ml',317,'http://dummyimage.com/152x100.png/dddddd/000000',4,69);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (722,'Bread Base - Gold Formel',172,'http://dummyimage.com/140x100.png/cc0000/ffffff',4,947);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (723,'Lidsoupcont Rp12dn',333,'http://dummyimage.com/136x100.png/dddddd/000000',3,814);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (724,'Soup - Knorr, Ministrone',361,'http://dummyimage.com/222x100.png/dddddd/000000',5,453);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (725,'Lettuce - Frisee',401,'http://dummyimage.com/180x100.png/cc0000/ffffff',2,584);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (726,'Lobster - Tail, 3 - 4 Oz',199,'http://dummyimage.com/191x100.png/cc0000/ffffff',1,748);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (727,'Water, Tap',222,'http://dummyimage.com/145x100.png/5fa2dd/ffffff',4,432);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (728,'Container - Hngd Cll Blk 7x7x3',394,'http://dummyimage.com/113x100.png/dddddd/000000',5,218);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (729,'Pork - Smoked Back Bacon',310,'http://dummyimage.com/118x100.png/5fa2dd/ffffff',3,496);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (730,'Compound - Mocha',297,'http://dummyimage.com/201x100.png/5fa2dd/ffffff',5,840);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (731,'Butter - Salted',357,'http://dummyimage.com/217x100.png/cc0000/ffffff',4,95);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (732,'Pur Value',271,'http://dummyimage.com/250x100.png/dddddd/000000',2,452);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (733,'Soup - Knorr, Classic Can. Chili',400,'http://dummyimage.com/177x100.png/5fa2dd/ffffff',3,211);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (734,'Tomatoes - Vine Ripe, Red',431,'http://dummyimage.com/159x100.png/5fa2dd/ffffff',5,964);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (735,'Bread - Rolls, Rye',216,'http://dummyimage.com/123x100.png/cc0000/ffffff',2,419);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (736,'Venison - Striploin',142,'http://dummyimage.com/158x100.png/ff4444/ffffff',3,931);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (737,'Muffin Mix - Corn Harvest',117,'http://dummyimage.com/216x100.png/ff4444/ffffff',4,150);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (738,'Smirnoff Green Apple Twist',400,'http://dummyimage.com/159x100.png/dddddd/000000',3,442);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (739,'Pasta - Linguini, Dry',235,'http://dummyimage.com/106x100.png/dddddd/000000',4,823);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (740,'Wine - Sherry Dry Sack, William',290,'http://dummyimage.com/163x100.png/cc0000/ffffff',4,102);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (741,'Corn Shoots',482,'http://dummyimage.com/129x100.png/cc0000/ffffff',3,18);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (742,'Fudge - Cream Fudge',325,'http://dummyimage.com/176x100.png/ff4444/ffffff',4,374);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (743,'Wine - Ej Gallo Sonoma',250,'http://dummyimage.com/139x100.png/5fa2dd/ffffff',5,225);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (744,'Boogies',438,'http://dummyimage.com/146x100.png/cc0000/ffffff',1,646);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (745,'Beef - Roasted, Cooked',248,'http://dummyimage.com/168x100.png/5fa2dd/ffffff',4,24);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (746,'Tray - 12in Rnd Blk',411,'http://dummyimage.com/179x100.png/ff4444/ffffff',5,806);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (747,'Pastry - French Mini Assorted',204,'http://dummyimage.com/160x100.png/ff4444/ffffff',1,34);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (748,'Cinnamon Buns Sticky',346,'http://dummyimage.com/232x100.png/dddddd/000000',4,614);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (749,'Graham Cracker Mix',192,'http://dummyimage.com/230x100.png/cc0000/ffffff',5,649);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (750,'Cheese - Cheddar, Old White',344,'http://dummyimage.com/132x100.png/5fa2dd/ffffff',1,101);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (751,'Lettuce - Radicchio',420,'http://dummyimage.com/162x100.png/dddddd/000000',2,981);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (752,'Ecolab - Medallion',436,'http://dummyimage.com/229x100.png/5fa2dd/ffffff',2,655);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (753,'Fruit Mix - Light',487,'http://dummyimage.com/146x100.png/5fa2dd/ffffff',1,878);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (754,'Soup - Base Broth Beef',392,'http://dummyimage.com/246x100.png/5fa2dd/ffffff',4,511);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (755,'Worcestershire Sauce',354,'http://dummyimage.com/196x100.png/5fa2dd/ffffff',5,974);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (756,'Potatoes - Purple, Organic',310,'http://dummyimage.com/222x100.png/5fa2dd/ffffff',5,611);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (757,'Pasta - Fusili Tri - Coloured',499,'http://dummyimage.com/120x100.png/cc0000/ffffff',2,610);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (758,'Leeks - Baby, White',260,'http://dummyimage.com/228x100.png/ff4444/ffffff',5,859);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (759,'Ostrich - Prime Cut',306,'http://dummyimage.com/157x100.png/ff4444/ffffff',2,915);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (760,'Foie Gras',366,'http://dummyimage.com/208x100.png/cc0000/ffffff',2,403);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (761,'Wine - Redchard Merritt',433,'http://dummyimage.com/138x100.png/cc0000/ffffff',3,747);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (762,'Soup - Chicken And Wild Rice',423,'http://dummyimage.com/204x100.png/dddddd/000000',5,673);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (763,'Muffin - Banana Nut Individual',485,'http://dummyimage.com/174x100.png/dddddd/000000',4,360);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (764,'Bagel - Everything Presliced',210,'http://dummyimage.com/190x100.png/ff4444/ffffff',2,641);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (765,'V8 Pet',475,'http://dummyimage.com/236x100.png/cc0000/ffffff',1,922);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (766,'Sauce - Alfredo',335,'http://dummyimage.com/202x100.png/5fa2dd/ffffff',4,594);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (767,'Table Cloth 72x144 White',109,'http://dummyimage.com/130x100.png/dddddd/000000',1,591);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (768,'Goat - Whole Cut',157,'http://dummyimage.com/188x100.png/dddddd/000000',1,637);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (769,'Hot Choc Vending',355,'http://dummyimage.com/175x100.png/ff4444/ffffff',4,785);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (770,'Beer - Original Organic Lager',325,'http://dummyimage.com/107x100.png/cc0000/ffffff',4,119);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (771,'Bagel - Everything',313,'http://dummyimage.com/186x100.png/5fa2dd/ffffff',2,416);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (772,'Snapple Raspberry Tea',370,'http://dummyimage.com/168x100.png/5fa2dd/ffffff',5,705);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (773,'Soup - Cream Of Potato / Leek',395,'http://dummyimage.com/199x100.png/5fa2dd/ffffff',5,883);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (774,'Container - Foam Dixie 12 Oz',195,'http://dummyimage.com/107x100.png/ff4444/ffffff',3,891);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (775,'Oil - Hazelnut',379,'http://dummyimage.com/229x100.png/dddddd/000000',5,295);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (776,'Coffee - Colombian, Portioned',120,'http://dummyimage.com/136x100.png/dddddd/000000',1,855);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (777,'Chocolate - Compound Coating',264,'http://dummyimage.com/190x100.png/dddddd/000000',4,757);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (778,'Sobe - Lizard Fuel',455,'http://dummyimage.com/229x100.png/dddddd/000000',3,80);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (779,'Sprouts - Baby Pea Tendrils',258,'http://dummyimage.com/216x100.png/5fa2dd/ffffff',2,313);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (780,'Cheese - Cheddar, Mild',414,'http://dummyimage.com/111x100.png/dddddd/000000',4,507);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (781,'Chilli Paste, Ginger Garlic',192,'http://dummyimage.com/149x100.png/ff4444/ffffff',1,741);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (782,'Arizona - Plum Green Tea',477,'http://dummyimage.com/177x100.png/ff4444/ffffff',4,681);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (783,'Propel Sport Drink',442,'http://dummyimage.com/250x100.png/ff4444/ffffff',3,382);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (784,'Hot Choc Vending',462,'http://dummyimage.com/150x100.png/5fa2dd/ffffff',3,542);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (785,'Wine - Red, Concha Y Toro',425,'http://dummyimage.com/147x100.png/cc0000/ffffff',2,969);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (786,'Chips - Potato Jalapeno',495,'http://dummyimage.com/112x100.png/5fa2dd/ffffff',3,290);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (787,'Veal - Sweetbread',352,'http://dummyimage.com/222x100.png/cc0000/ffffff',5,269);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (788,'Pasta - Fettuccine, Egg, Fresh',223,'http://dummyimage.com/175x100.png/dddddd/000000',4,710);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (789,'The Pop Shoppe - Black Cherry',367,'http://dummyimage.com/219x100.png/5fa2dd/ffffff',1,743);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (790,'Longos - Grilled Chicken With',426,'http://dummyimage.com/233x100.png/cc0000/ffffff',2,325);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (791,'Wine - Mas Chicet Rose, Vintage',109,'http://dummyimage.com/204x100.png/cc0000/ffffff',1,815);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (792,'Veal Inside - Provimi',155,'http://dummyimage.com/216x100.png/ff4444/ffffff',1,442);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (793,'Shrimp - Black Tiger 16/20',247,'http://dummyimage.com/108x100.png/cc0000/ffffff',4,800);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (794,'Venison - Liver',485,'http://dummyimage.com/192x100.png/ff4444/ffffff',1,761);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (795,'Sesame Seed Black',123,'http://dummyimage.com/231x100.png/ff4444/ffffff',1,827);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (796,'Beef - Top Butt Aaa',384,'http://dummyimage.com/120x100.png/cc0000/ffffff',1,465);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (797,'Hipnotiq Liquor',498,'http://dummyimage.com/172x100.png/cc0000/ffffff',4,44);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (798,'Tea - Darjeeling, Azzura',334,'http://dummyimage.com/129x100.png/cc0000/ffffff',4,496);
INSERT INTO Products(id,name,price,image_url,rating,stock) VALUES (799,'Butter Balls Salted',177,'http://dummyimage.com/181x100.png/cc0000/ffffff',2,89);

/* Cart */

INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (1,703,5);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (2,778,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (3,745,4);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (4,775,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (5,793,4);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (6,719,1);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (7,740,1);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (8,716,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (9,768,1);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (10,775,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (11,723,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (12,761,1);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (13,781,5);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (14,788,2);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (15,723,4);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (16,767,4);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (17,783,1);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (18,759,2);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (19,700,5);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (20,702,1);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (21,798,2);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (22,780,5);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (23,768,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (24,784,5);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (25,754,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (26,750,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (27,738,2);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (28,796,4);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (29,718,5);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (30,714,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (31,730,1);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (32,709,5);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (33,788,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (34,760,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (35,704,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (36,775,2);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (37,763,2);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (38,730,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (39,763,4);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (40,788,1);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (41,766,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (42,720,1);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (43,731,2);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (44,794,1);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (45,768,5);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (46,783,1);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (47,716,5);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (48,728,2);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (49,799,4);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (50,775,2);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (51,784,4);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (52,792,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (53,725,1);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (54,792,4);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (55,742,5);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (56,743,2);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (57,723,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (58,744,5);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (59,700,4);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (60,757,4);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (61,770,1);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (62,755,1);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (63,789,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (64,738,4);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (65,711,5);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (66,748,5);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (67,781,5);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (68,784,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (69,709,1);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (70,758,2);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (71,770,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (72,727,5);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (73,781,5);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (74,761,1);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (75,749,5);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (76,702,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (77,785,5);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (78,730,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (79,734,5);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (80,792,4);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (81,758,4);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (82,741,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (83,786,1);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (84,713,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (85,732,4);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (86,724,2);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (87,771,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (88,704,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (89,716,1);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (90,733,5);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (91,730,5);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (92,781,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (93,775,1);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (94,724,2);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (95,732,2);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (96,792,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (97,779,3);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (98,767,5);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (99,790,4);
INSERT INTO Cart(customer_id,product_id,no_of_items) VALUES (100,735,4);

/* Transactions */

INSERT INTO Transactions(id,wallet_id,amount) VALUES (200,900,860);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (201,901,1365);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (202,902,992);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (203,903,1137);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (204,904,988);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (205,905,325);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (206,906,290);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (207,907,693);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (208,908,157);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (209,909,1137);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (210,910,999);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (211,911,433);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (212,912,960);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (213,913,446);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (214,914,1332);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (215,915,436);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (216,916,442);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (217,917,612);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (218,918,860);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (219,919,457);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (220,920,668);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (221,921,2070);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (222,922,471);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (223,923,2310);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (224,924,1176);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (225,925,1032);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (226,926,800);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (227,927,1536);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (228,928,2005);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (229,929,711);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (230,930,297);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (231,931,1005);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (232,932,669);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (233,933,1098);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (234,934,1440);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (235,935,758);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (236,936,970);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (237,937,891);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (238,938,1940);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (239,939,223);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (240,940,1005);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (241,941,202);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (242,942,714);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (243,943,485);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (244,944,785);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (245,945,442);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (246,946,1155);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (247,947,788);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (248,948,708);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (249,949,758);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (250,950,1848);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (251,951,465);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (252,952,401);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (253,953,620);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (254,954,1625);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (255,955,500);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (256,956,999);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (257,957,2190);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (258,958,688);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (259,959,1996);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (260,960,325);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (261,961,354);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (262,962,1101);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (263,963,1600);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (264,964,545);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (265,965,1730);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (266,966,960);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (267,967,1386);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (268,968,201);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (269,969,520);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (270,970,975);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (271,971,1110);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (272,972,960);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (273,973,433);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (274,974,960);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (275,975,1371);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (276,976,2125);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (277,977,891);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (278,978,2155);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (279,979,620);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (280,980,1040);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (281,981,1446);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (282,982,495);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (283,983,1326);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (284,984,1084);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (285,985,722);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (286,986,939);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (287,987,1440);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (288,988,231);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (289,989,2000);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (290,990,1485);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (291,991,576);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (292,992,379);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (293,993,722);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (294,994,542);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (295,995,465);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (296,996,774);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (297,997,545);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (298,998,1704);
INSERT INTO Transactions(id,wallet_id,amount) VALUES (299,999,864);

/* Order */

INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (301,517,1,200,'2023-01-24');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (302,590,2,201,'2022-07-20');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (303,554,3,202,'2022-09-27');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (304,533,4,203,'2022-05-15');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (305,589,5,204,'2022-05-11');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (306,590,6,205,'2022-09-18');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (307,548,7,206,'2022-07-23');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (308,591,8,207,'2022-10-08');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (309,559,9,208,'2022-06-19');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (310,599,10,209,'2022-08-11');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (311,562,11,210,'2023-02-06');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (312,557,12,211,'2022-10-21');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (313,586,13,212,'2022-12-20');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (314,574,14,213,'2022-06-11');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (315,529,15,214,'2022-12-03');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (316,502,16,215,'2022-03-04');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (317,552,17,216,'2022-03-11');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (318,503,18,217,'2022-07-23');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (319,508,19,218,'2022-08-07');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (320,530,20,219,'2023-01-21');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (321,505,21,220,'2022-07-24');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (322,523,22,221,'2022-11-19');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (323,572,23,222,'2022-06-13');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (324,566,24,223,'2022-05-02');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (325,593,25,224,'2022-02-25');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (326,574,26,225,'2022-09-25');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (327,599,27,226,'2022-06-12');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (328,562,28,227,'2022-12-10');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (329,513,29,228,'2022-03-03');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (330,534,30,229,'2022-12-18');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (331,567,31,230,'2022-09-10');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (332,534,32,231,'2022-11-23');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (333,570,33,232,'2022-06-09');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (334,532,34,233,'2022-03-14');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (335,531,35,234,'2022-04-11');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (336,558,36,235,'2023-01-14');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (337,505,37,236,'2022-09-09');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (338,524,38,237,'2022-04-20');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (339,579,39,238,'2022-09-17');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (340,573,40,239,'2022-02-25');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (341,593,41,240,'2022-04-25');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (342,591,42,241,'2022-11-18');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (343,597,43,242,'2022-12-05');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (344,555,44,243,'2022-09-02');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (345,548,45,244,'2022-08-09');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (346,514,46,245,'2023-02-07');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (347,524,47,246,'2022-10-24');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (348,596,48,247,'2022-09-23');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (349,512,49,248,'2022-12-15');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (350,538,50,249,'2022-12-10');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (351,531,51,250,'2022-08-02');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (352,566,52,251,'2022-09-22');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (353,526,53,252,'2022-07-03');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (354,503,54,253,'2022-12-16');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (355,545,55,254,'2022-12-28');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (356,527,56,255,'2023-01-07');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (357,575,57,256,'2022-07-06');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (358,551,58,257,'2022-12-09');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (359,542,59,258,'2022-09-05');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (360,564,60,259,'2022-05-08');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (361,526,61,260,'2022-07-02');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (362,509,62,261,'2022-05-19');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (363,502,63,262,'2022-06-09');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (364,594,64,263,'2022-03-11');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (365,554,65,264,'2022-06-17');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (366,585,66,265,'2022-10-04');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (367,526,67,266,'2022-06-13');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (368,568,68,267,'2022-05-16');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (369,532,69,268,'2022-02-14');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (370,572,70,269,'2022-02-23');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (371,534,71,270,'2022-06-03');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (372,586,72,271,'2023-01-04');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (373,555,73,272,'2022-12-04');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (374,595,74,273,'2022-08-06');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (375,575,75,274,'2022-12-02');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (376,537,76,275,'2022-08-22');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (377,510,77,276,'2022-06-23');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (378,537,78,277,'2022-03-21');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (379,568,79,278,'2023-01-07');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (380,525,80,279,'2023-02-02');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (381,568,81,280,'2022-02-19');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (382,563,82,281,'2022-12-25');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (383,502,83,282,'2023-02-04');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (384,556,84,283,'2022-09-05');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (385,524,85,284,'2022-07-13');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (386,561,86,285,'2022-06-18');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (387,559,87,286,'2022-12-14');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (388,520,88,287,'2022-03-11');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (389,546,89,288,'2022-04-20');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (390,560,90,289,'2022-02-18');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (391,560,91,290,'2022-08-04');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (392,590,92,291,'2022-09-09');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (393,505,93,292,'2022-02-23');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (394,523,94,293,'2022-05-19');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (395,506,95,294,'2022-08-11');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (396,518,96,295,'2022-02-13');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (397,510,97,296,'2022-03-14');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (398,549,98,297,'2022-11-24');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (399,537,99,298,'2022-04-04');
INSERT INTO O_rder(id,delivery_agent_id,customer_id,transaction_id,date) VALUES (400,537,100,299,'2022-02-12');


/* Sold Items */

INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (1,301,703,5);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (2,302,778,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (3,303,745,4);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (4,304,775,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (5,305,793,4);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (6,306,719,1);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (7,307,740,1);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (8,308,716,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (9,309,768,1);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (10,310,775,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (11,311,723,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (12,312,761,1);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (13,313,781,5);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (14,314,788,2);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (15,315,723,4);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (16,316,767,4);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (17,317,783,1);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (18,318,759,2);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (19,319,700,5);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (20,320,702,1);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (21,321,798,2);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (22,322,780,5);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (23,323,768,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (24,324,784,5);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (25,325,754,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (26,326,750,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (27,327,738,2);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (28,328,796,4);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (29,329,718,5);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (30,330,714,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (31,331,730,1);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (32,332,709,5);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (33,333,788,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (34,334,760,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (35,335,704,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (36,336,775,2);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (37,337,763,2);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (38,338,730,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (39,339,763,4);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (40,340,788,1);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (41,341,766,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (42,342,720,1);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (43,343,731,2);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (44,344,794,1);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (45,345,768,5);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (46,346,783,1);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (47,347,716,5);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (48,348,728,2);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (49,349,799,4);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (50,350,775,2);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (51,351,784,4);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (52,352,792,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (53,353,725,1);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (54,354,792,4);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (55,355,742,5);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (56,356,743,2);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (57,357,723,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (58,358,744,5);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (59,359,700,4);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (60,360,757,4);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (61,361,770,1);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (62,362,755,1);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (63,363,789,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (64,364,738,4);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (65,365,711,5);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (66,366,748,5);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (67,367,781,5);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (68,368,784,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (69,369,709,1);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (70,370,758,2);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (71,371,770,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (72,372,727,5);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (73,373,781,5);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (74,374,761,1);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (75,375,749,5);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (76,376,702,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (77,377,785,5);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (78,378,730,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (79,379,734,5);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (80,380,792,4);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (81,381,758,4);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (82,382,741,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (83,383,786,1);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (84,384,713,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (85,385,732,4);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (86,386,724,2);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (87,387,771,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (88,388,704,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (89,389,716,1);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (90,390,733,5);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (91,391,730,5);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (92,392,781,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (93,393,775,1);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (94,394,724,2);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (95,395,732,2);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (96,396,792,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (97,397,779,3);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (98,398,767,5);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (99,399,790,4);
INSERT INTO Sold_Items(customer_id,order_id,product_id,items) VALUES (100,400,735,4);

INSERT INTO Employee(employee_id,first_name,last_name,email_id,contact,date_of_birth,password) VALUES (1,'Bineet','Bhowmick','bineet815@gmail.com','815 222 4455','2001-11-19','b7iLo4YYUi8');
INSERT INTO Employee(employee_id,first_name,last_name,email_id,contact,date_of_birth,password) VALUES (2,'Tushar','Reddy','tushar931@gmail.com','931 222 5896','2001-03-04','b7kh67YY9');


CREATE TRIGGER balance_after_transaction
AFTER INSERT ON Transactions
FOR EACH ROW
UPDATE Wallet SET amount = amount - NEW.amount WHERE Wallet.id = NEW.wallet_id;

CREATE TRIGGER stock_after_transaction
AFTER INSERT ON Sold_Items
FOR EACH ROW
UPDATE Products SET stock = stock - NEW.items WHERE Products.id = NEW.product_id;












