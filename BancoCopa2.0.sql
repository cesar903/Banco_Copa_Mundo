--Cria o banco de dados copa_mundo
create database copa_mundo;

--Usa o banco de dados copa_mundo
use copa_mundo;

--Cria as tabelas que serão usadas na atividade, abaixo estão os tipos de dados que irão forma-la
create table grupo(
id_grupo varchar(1) primary key ,
Nome_grupo varchar(8) not null
);


create table pais(
idpais int primary key not null,
selecao varchar(45) not null,
continente varchar(30),
tecnico varchar(45),
pontos int,
vitorias int,
empates int,
derrotas int,
gols_pro int, 
gols_contra int,
grupo_idgrupo varchar(8)
);



create table jogador(
idjogador int primary key not null,
nome varchar(45) not null,
camisa int not null,
posicao varchar(45),
pais_idpais int,
situacao varchar(1) not null
);


create table estadio(
id_estadio int primary key not null,
descricao varchar(45) not null,
localizacao varchar(45),
capacidade varchar(45)
);


create table jogos(
idrodada int primary key ,
data_jogo varchar(45),
estadio_idestadio int,
pais_idpais_1 int,
pais_idpais_2 int,
gols_idpais_1 int,
gols_idpais_2 int,
publico INT
);


create table gols(
jogos_idrodada INT,
jogador_idjogador INT,
tempo varchar(45)
);

create table substituicao(
jogos_idrodada int,
jogador_idjogador_entra INT,
jogador_idjogador_sai INT,
tempo varchar(45)
);

create table cartao(
jogos_idrodada int,
jogador_idjogador int,
amarelo TINYINT, 
vermelho TINYINT,
tempo varchar(45)
);

--Criando as chaves estrangeira

--O fk_ é o nome dedicado a chave que vai fazer a ligação
ALTER TABLE pais ADD CONSTRAINT fk_pais2 FOREIGN KEY 
( grupo_idgrupo ) REFERENCES grupo(id_grupo);

ALTER TABLE jogos ADD CONSTRAINT fk_jogos2
FOREIGN KEY (estadio_idestadio) REFERENCES estadio(id_estadio);

ALTER TABLE jogos ADD CONSTRAINT fk_jogos3
FOREIGN KEY (pais_idpais_1) REFERENCES pais(idpais);


ALTER TABLE jogos ADD CONSTRAINT fk_jogos4
FOREIGN KEY (pais_idpais_2) REFERENCES pais(idpais);


ALTER TABLE gols ADD CONSTRAINT fk_gols2
FOREIGN KEY (jogos_idrodada) REFERENCES jogos(idrodada);


ALTER TABLE gols ADD CONSTRAINT fk_gols3
FOREIGN KEY (jogador_idjogador) REFERENCES jogador(idjogador);


ALTER TABLE cartao ADD CONSTRAINT fk_cartao2
FOREIGN KEY (jogos_idrodada) REFERENCES jogos(idrodada);

ALTER TABLE cartao ADD CONSTRAINT fk_cartao3
FOREIGN KEY (jogador_idjogador) REFERENCES jogador(idjogador);

ALTER TABLE substituicao ADD CONSTRAINT fk_sub2
FOREIGN KEY (jogador_idjogador_sai) REFERENCES jogador(idjogador);


ALTER TABLE substituicao ADD CONSTRAINT fk_sub3
FOREIGN KEY (jogador_idjogador_entra) REFERENCES jogador(idjogador);

ALTER TABLE substituicao ADD CONSTRAINT fk_sub4
FOREIGN KEY (jogos_idrodada) REFERENCES jogos(idrodada);

use copa_mundo;

ALTER TABLE jogador ADD CONSTRAINT fk_jogador
FOREIGN KEY (pais_idpais) REFERENCES pais(idpais);


--Adicionando população

-- tabela grupo 
insert into grupo values('A', 'Grupo A');
insert into grupo values('B', 'Grupo B');
insert into grupo values('C', 'Grupo C');
insert into grupo values('D', 'Grupo D');

-- tabela pais - grupo A 
insert into pais values(1100,'Uruguai','América','Óscar Tabárez',0,0,0,0,0,0,'A');
insert into pais values(1110,'Rússia','Europa','Valeri Karpin',0,0,0,0,0,0,'A');
insert into pais values(1120,'Catar','Ásia','José Ricardo',0,0,0,0,0,0,'A');
insert into pais values(1130,'Egito','África','Carlos Queiroz',0,0,0,0,0,0,'A');
-- tabela pais - grupo B 
insert into pais values(1140,'França','Europa','Didier Deschamps',0,0,0,0,0,0,'B');
insert into pais values(1150,'Dinamarca','Europa','Kasper Hjulmand',0,0,0,0,0,0,'B');
insert into pais values(1160,'Peru','América','Ricardo Gareca',0,0,0,0,0,0,'B');
insert into pais values(1170,'Austrália','Oceania','Graham Arnold',0,0,0,0,0,0,'B');
-- tabela pais - grupo C 
insert into pais values(1180,'Croácia','Europa','Zlatko Dalić',0,0,0,0,0,0,'C');
insert into pais values(1190,'Argentina','América','Lionel Scaloni',0,0,0,0,0,0,'C');
insert into pais values(1200,'Nigéria','África','Gernot Rohr',0,0,0,0,0,0,'C');
insert into pais values(1210,'Islândia','Europa','Arnar Viðarsson',0,0,0,0,0,0,'C');
-- tabela pais - grupo D 
insert into pais values(1220,'Brasil','América','Tite',0,0,0,0,0,0,'D');
insert into pais values(1230,'Suiça','Europa','Murat Yakın',0,0,0,0,0,0,'D');
insert into pais values(1240,'Sérvia','Europa','Dragan Stojković',0,0,0,0,0,0,'D');
insert into pais values(1250,'Costa Rica','América','Luis Fernando Suárez',0,0,0,0,0,0,'D');

-- tabela jogador - Uruguai 
insert into jogador values(2200,'Fernando Muslera',1,'Goleiro',1100,'T');
insert into jogador values(2205,'Maxi Pereira',2,'Lateral Direito',1100,'T');
insert into jogador values(2210,'Diego Godín',3,'Central',1100,'T');
insert into jogador values(2215,'Sebastián Coates',4,'Central',1100,'T');
insert into jogador values(2220,'Gastón Silva',6,'Lateral Esquerdo',1100,'T');
insert into jogador values(2225,'Cristian Rodríguez',5,'Meio Campo',1100,'T');
insert into jogador values(2230,'Carlos Sánchez',8,'Meio Campo',1100,'T');
insert into jogador values(2235,'Giorgian De Arrascaeta',10,'Meio Campo',1100,'T');
insert into jogador values(2240,'Edinson Cavani',11,'Atacante',1100,'T');
insert into jogador values(2245,'Luis Suárez',9,'Atacante',1100,'T');
insert into jogador values(2250,'Maxi Gómez',7,'Atacante',1100,'T');
insert into jogador values(2255,'Martín Silva',12,'Goleiro',1100,'R');
insert into jogador values(2260,'Guillermo Varela',13,'Central',1100,'R');
insert into jogador values(2265,'Lucas Torreira',14,'Meio Campo',1100,'R');
insert into jogador values(2270,'Cristhian Stuani',15,'Atacante',1100,'R');
-- tabela jogador - Rússia 
insert into jogador values(2300,'Yuri Dyupin',1,'Goleiro',1110,'T');
insert into jogador values(2305,'Dmitriy Chistyakov',2,'Lateral Direito',1110,'T');
insert into jogador values(2310,'Igor Diveev',3,'Central',1110,'T');
insert into jogador values(2315,'Georgi Dzhikiya',4,'Central',1110,'T');
insert into jogador values(2320,'Vyacheslav Karavaev',6,'Lateral Esquerdo',1110,'T');
insert into jogador values(2325,'Aleksandr Erokhin',5,'Meio Campo',1110,'T');
insert into jogador values(2330,'Aleksei Ionov',8,'Meio Campo',1110,'T');
insert into jogador values(2335,'Dmitri Barinov',10,'Meio Campo',1110,'T');
insert into jogador values(2340,'Fedor Smolov',11,'Atacante',1110,'T');
insert into jogador values(2345,'Konstantin Tyukavin',9,'Atacante',1110,'T');
insert into jogador values(2350,'Anton Zabolotny',7,'Atacante',1110,'T');
insert into jogador values(2355,'Andrey Lunev',12,'Goleiro',1110,'R');
insert into jogador values(2360,'Ilya Samoshnikov',13,'Central',1110,'R');
insert into jogador values(2365,'Roman Zobnin',14,'Meio Campo',1110,'R');
insert into jogador values(2370,'Rifat Zhemaletdinov',15,'Atacante',1110,'R');
-- tabela jogador - Catar 
insert into jogador values(2400,'Saad Al Sheeb',1,'Goleiro',1120,'T');
insert into jogador values(2405,'Ró-Ró',2,'Lateral Direito',1120,'T');
insert into jogador values(2410,'Tarek Salman',3,'Central',1120,'T');
insert into jogador values(2415,'Ahmed Suhail',4,'Central',1120,'T');
insert into jogador values(2420,'Musaab Khidir',6,'Lateral Esquerdo',1120,'T');
insert into jogador values(2425,'Mohammed Waad',5,'Meio Campo',1120,'T');
insert into jogador values(2430,'Abdelaziz Hatim',8,'Meio Campo',1120,'T');
insert into jogador values(2435,'Yusuf Abdurisag',10,'Meio Campo',1120,'T');
insert into jogador values(2440,'Ahmed Alaa',11,'Atacante',1120,'T');
insert into jogador values(2445,'Mohammed Muntari',9,'Atacante',1120,'T');
insert into jogador values(2450,'Hasan Al Haydos',7,'Atacante',1120,'T');
insert into jogador values(2455,'Yousof Hassan',12,'Goleiro',1120,'R');
insert into jogador values(2460,'Bassam Al Rawi',13,'Central',1120,'R');
insert into jogador values(2465,'Assim Madabo',14,'Meio Campo',1120,'R');
insert into jogador values(2470,'Almoez Ali',15,'Atacante',1120,'R');
-- tabela jogador - Egito 
insert into jogador values(2500,'Mohamed El Shenawy',1,'Goleiro',1130,'T');
insert into jogador values(2505,'Ahmed Tawfik',2,'Lateral Direito',1130,'T');
insert into jogador values(2510,'Ahmed Hegazy',3,'Central',1130,'T');
insert into jogador values(2515,'Mahmoud Hamdi',4,'Central',1130,'T');
insert into jogador values(2520,'Ahmed Fatouh',6,'Lateral Esquerdo',1130,'T');
insert into jogador values(2525,'Omar Gaber',5,'Meio Campo',1130,'T');
insert into jogador values(2530,'Afsha',8,'Meio Campo',1130,'T');
insert into jogador values(2535,'Abdallah Said',10,'Meio Campo',1130,'T');
insert into jogador values(2540,'Mohamed Salah',11,'Atacante',1130,'T');
insert into jogador values(2545,'Mostafa Mohamed',9,'Atacante',1130,'T');
insert into jogador values(2550,'Hussein El Shahat',7,'Atacante',1130,'T');
insert into jogador values(2555,'El-Hani Soliman',12,'Goleiro',1130,'R');
insert into jogador values(2560,'Ali Gabr',13,'Central',1130,'R');
insert into jogador values(2565,'Tarek Hamed',14,'Meio Campo',1130,'R');
insert into jogador values(2570,'Ahmed Hassan',15,'Atacante',1130,'R');
-- tabela jogador - França 
insert into jogador values(2600,'Hugo Lloris',1,'Goleiro',1140,'T');
insert into jogador values(2605,'Lucas Digne',2,'Lateral Direito',1140,'T');
insert into jogador values(2610,'Clemént Lenglet',3,'Central',1140,'T');
insert into jogador values(2615,'Presnel Kimpembe',4,'Central',1140,'T');
insert into jogador values(2620,'Léo Dubois',6,'Lateral Esquerdo',1140,'T');
insert into jogador values(2625,'Paul Pogba',5,'Meio Campo',1140,'T');
insert into jogador values(2630,'NGolo Kanté',8,'Meio Campo',1140,'T');
insert into jogador values(2635,'Adrien Rabiot',10,'Meio Campo',1140,'T');
insert into jogador values(2640,'Karim Benzema',11,'Atacante',1140,'T');
insert into jogador values(2645,'Kylian Mbappé',9,'Atacante',1140,'T');
insert into jogador values(2650,'Antoine Griezmann',7,'Atacante',1140,'T');
insert into jogador values(2655,'Mike Maignam',12,'Goleiro',1140,'R');
insert into jogador values(2660,'Raphael Varane',13,'Central',1140,'R');
insert into jogador values(2665,'Moussa Sissoko',14,'Meio Campo',1140,'R');
insert into jogador values(2670,'Olivier Giroud',15,'Atacante',1140,'R');
-- tabela jogador - Dinamarca 
insert into jogador values(2700,'Jesper Hansen',1,'Goleiro',1150,'T');
insert into jogador values(2705,'Joachim Andersen',2,'Lateral Direito',1150,'T');
insert into jogador values(2710,'Nicolai Boilesen',3,'Central',1150,'T');
insert into jogador values(2715,'Andreas Christensen',4,'Central',1150,'T');
insert into jogador values(2720,'Simon Kjaer',6,'Lateral Esquerdo',1150,'T');
insert into jogador values(2725,'Anders Christiansen',5,'Meio Campo',1150,'T');
insert into jogador values(2730,'Mikkel Damsgaard',8,'Meio Campo',1150,'T');
insert into jogador values(2735,'Thomas Delaney',10,'Meio Campo',1150,'T');
insert into jogador values(2740,'Martin Braithwaite',11,'Atacante',1150,'T');
insert into jogador values(2745,'Jacob Bruun Larsen',9,'Atacante',1150,'T');
insert into jogador values(2750,'Andreas Cornelius',7,'Atacante',1150,'T');
insert into jogador values(2755,'Jonas Lössl',12,'Goleiro',1150,'R');
insert into jogador values(2760,'Victor Nelsson',13,'Central',1150,'R');
insert into jogador values(2765,'Jesper Lindstrom',14,'Meio Campo',1150,'R');
insert into jogador values(2770,'Kasper Dolberg',15,'Atacante',1150,'R');
-- tabela jogador - Peru 
insert into jogador values(2800,'Carlos Cáceda',1,'Goleiro',1160,'T');
insert into jogador values(2805,'Luis Abram',2,'Lateral Direito',1160,'T');
insert into jogador values(2810,'Luis Advíncula',3,'Central',1160,'T');
insert into jogador values(2815,'Alexander Callens',4,'Central',1160,'T');
insert into jogador values(2820,'Aldo Corzo',6,'Lateral Esquerdo',1160,'T');
insert into jogador values(2825,'Christian Cueva',5,'Meio Campo',1160,'T');
insert into jogador values(2830,'Edison Flores',8,'Meio Campo',1160,'T');
insert into jogador values(2835,'Raziel García',10,'Meio Campo',1160,'T');
insert into jogador values(2840,'Gianluca Lapadula',11,'Atacante',1160,'T');
insert into jogador values(2845,'Paolo Guerrero',9,'Atacante',1160,'T');
insert into jogador values(2850,'Raúl Ruidíaz',7,'Atacante',1160,'T');
insert into jogador values(2855,'José Carvallo',12,'Goleiro',1160,'R');
insert into jogador values(2860,'Christian Ramos',13,'Central',1160,'R');
insert into jogador values(2865,'Renato Tapia',14,'Meio Campo',1160,'R');
insert into jogador values(2870,'André Carrillo',15,'Atacante',1160,'R');
-- tabela jogador - Austrália 
insert into jogador values(2900,'Mathew Ryan',1,'Goleiro',1170,'T');
insert into jogador values(2905,'Miloš Degenek',2,'Lateral Direito',1170,'T');
insert into jogador values(2910,'Brad Smith',3,'Central',1170,'T');
insert into jogador values(2915,'Rhyan Grant',4,'Central',1170,'T');
insert into jogador values(2920,'Callum Elder',6,'Lateral Esquerdo',1170,'T');
insert into jogador values(2925,'Ryan McGowan',5,'Meio Campo',1170,'T');
insert into jogador values(2930,'Bailey Wright',8,'Meio Campo',1170,'T');
insert into jogador values(2935,'Ajdin Hrustic',10,'Meio Campo',1170,'T');
insert into jogador values(2940,'Awer Mabil',11,'Atacante',1170,'T');
insert into jogador values(2945,'Adam Taggart',9,'Atacante',1170,'T');
insert into jogador values(2950,'Martin Boyle',7,'Atacante',1170,'T');
insert into jogador values(2955,'Lawrence Thomas',12,'Goleiro',1170,'R');
insert into jogador values(2960,'Harry Souttar',13,'Central',1170,'R');
insert into jogador values(2965,'Aaron Mooy',14,'Meio Campo',1170,'R');
insert into jogador values(2970,'Mitchell Duke',15,'Atacante',1170,'R');
-- tabela jogador - Croácia
insert into jogador values(3000,'Ivica Ivusic',1,'Goleiro',1180,'T');
insert into jogador values(3005,'Borna Barisic',2,'Lateral Direito',1180,'T');
insert into jogador values(3010,'Duje Caleta-Car',3,'Central',1180,'T');
insert into jogador values(3015,'Josko Gvardiol',4,'Central',1180,'T');
insert into jogador values(3020,'Josip Juranovic',6,'Lateral Esquerdo',1180,'T');
insert into jogador values(3025,'Marcelo Brozovic',5,'Meio Campo',1180,'T');
insert into jogador values(3030,'Luka Ivanusec',8,'Meio Campo',1180,'T');
insert into jogador values(3035,'Luka Modric',10,'Meio Campo',1180,'T');
insert into jogador values(3040,'Antonio-Mirko Colak',11,'Atacante',1180,'T');
insert into jogador values(3045,'Andrej Kramaric',9,'Atacante',1180,'T');
insert into jogador values(3050,'Marko Livaja',7,'Atacante',1180,'T');
insert into jogador values(3055,'Dominik Livakovic',12,'Goleiro',1180,'R');
insert into jogador values(3060,'Mile Skoric',13,'Central',1180,'R');
insert into jogador values(3065,'Ivan Perisic',14,'Meio Campo',1180,'R');
insert into jogador values(3070,'Mislav Orsic',15,'Atacante',1180,'R');
-- tabela jogador - Argentina 
insert into jogador values(3100,'Franco Armani',1,'Goleiro',1190,'T');
insert into jogador values(3105,'Juan Foyth',2,'Lateral Direito',1190,'T');
insert into jogador values(3110,'Lisandro Martínez',3,'Central',1190,'T');
insert into jogador values(3115,'Lucas Martínez Quarta',4,'Central',1190,'T');
insert into jogador values(3120,'Nahuel Molina',6,'Lateral Esquerdo',1190,'T');
insert into jogador values(3125,'Leandro Paredes',5,'Meio Campo',1190,'T');
insert into jogador values(3130,'Exequiel Palacios',8,'Meio Campo',1190,'T');
insert into jogador values(3135,'Lionel Messi',10,'Meio Campo',1190,'T');
insert into jogador values(3140,'Ángel Di María',11,'Atacante',1190,'T');
insert into jogador values(3145,'Sergio Agüero',9,'Atacante',1190,'T');
insert into jogador values(3150,'Julián Álvarez',7,'Atacante',1190,'T');
insert into jogador values(3155,'Emiliano Martínez',12,'Goleiro',1190,'R');
insert into jogador values(3160,'Cristian Romero',13,'Central',1190,'R');
insert into jogador values(3165,'Guido Rodríguez',14,'Meio Campo',1190,'R');
insert into jogador values(3170,'Paulo Dybala',15,'Atacante',1190,'R');
-- tabela jogador - Nigéria 
insert into jogador values(3200,'Stanley Nwabili',1,'Goleiro',1200,'T');
insert into jogador values(3205,'Olisa Ndah',2,'Lateral Direito',1200,'T');
insert into jogador values(3210,'Adeleke Adekunle',3,'Central',1200,'T');
insert into jogador values(3215,'Imo Obot',4,'Central',1200,'T');
insert into jogador values(3220,'Temitope Olusesi',6,'Lateral Esquerdo',1200,'T');
insert into jogador values(3225,'Anayo Iwuala',5,'Meio Campo',1200,'T');
insert into jogador values(3230,'Anthony Shimaga',8,'Meio Campo',1200,'T');
insert into jogador values(3235,'Seth Mayi',10,'Meio Campo',1200,'T');
insert into jogador values(3240,'Sunusi Ibrahim',11,'Atacante',1200,'T');
insert into jogador values(3245,'Sunday Adetunji',9,'Atacante',1200,'T');
insert into jogador values(3250,'Charles Atshimene',7,'Atacante',1200,'T');
insert into jogador values(3255,'John Noble',12,'Goleiro',1200,'R');
insert into jogador values(3260,'Oriyomi Murtala',13,'Central',1200,'R');
insert into jogador values(3265,'Uche Onwuansanya',14,'Meio Campo',1200,'R');
insert into jogador values(3270,'Chinonso Eziekwe',15,'Atacante',1200,'R');
-- tabela jogador - Islândia 
insert into jogador values(3300,'Patrik Gunnarsson',1,'Goleiro',1210,'T');
insert into jogador values(3305,'Kári Árnason',2,'Lateral Direito',1210,'T');
insert into jogador values(3310,'Jón Gudni Fjóluson',3,'Central',1210,'T');
insert into jogador values(3315,'Thorir Johann Helgason',4,'Central',1210,'T');
insert into jogador values(3320,'Hjörtur Hermannsson',6,'Lateral Esquerdo',1210,'T');
insert into jogador values(3325,'Mikkel Anderson',5,'Meio Campo',1210,'T');
insert into jogador values(3330,'Andri Fannar Baldursson',8,'Meio Campo',1210,'T');
insert into jogador values(3335,'Birkir Bjarnason',10,'Meio Campo',1210,'T');
insert into jogador values(3340,'Andri Lucas Gudjohnsen',11,'Atacante',1210,'T');
insert into jogador values(3345,'Albert Gudmundsson',9,'Atacante',1210,'T');
insert into jogador values(3350,'Vidar Örn Kjartansson',7,'Atacante',1210,'T');
insert into jogador values(3355,'Hannes Halldórsson',12,'Goleiro',1210,'R');
insert into jogador values(3360,'Ari Skúlason',13,'Central',1210,'R');
insert into jogador values(3365,'Victor Palsson',14,'Meio Campo',1210,'R');
insert into jogador values(3370,'Jon Dagur Thorsteinsson',15,'Atacante',1210,'R');
-- tabela jogador - Brasil
insert into jogador values(3400,'Ederson',1,'Goleiro',1220,'T');
insert into jogador values(3405,'Danilo',2,'Lateral Direito',1220,'T');
insert into jogador values(3410,'Thiago Silva',3,'Central',1220,'T');
insert into jogador values(3415,'Marquinhos',4,'Central',1220,'T');
insert into jogador values(3420,'Daniel Alves',6,'Lateral Esquerdo',1220,'T');
insert into jogador values(3425,'Casemiro',5,'Meio Campo',1220,'T');
insert into jogador values(3430,'Lucas Paquetá',8,'Meio Campo',1220,'T');
insert into jogador values(3435,'Neymar',10,'Meio Campo',1220,'T');
insert into jogador values(3440,'Gabriel Jesus',11,'Atacante',1220,'T');
insert into jogador values(3445,'Firmino',9,'Atacante',1220,'T');
insert into jogador values(3450,'Richarlison',7,'Atacante',1220,'T');
insert into jogador values(3455,'Weverton',12,'Goleiro',1220,'R');
insert into jogador values(3460,'Militão',13,'Central',1220,'R');
insert into jogador values(3465,'Everton Ribeiro',14,'Meio Campo',1220,'R');
insert into jogador values(3470,'Gabriel Barbosa',15,'Atacante',1220,'R');
-- tabela jogador - Suiça 
insert into jogador values(3500,'Gregor Kobel',1,'Goleiro',1230,'T');
insert into jogador values(3505,'Nico Elvedi',2,'Lateral Direito',1230,'T');
insert into jogador values(3510,'Jordan Lotomba',3,'Central',1230,'T');
insert into jogador values(3515,'Fabian Schär',4,'Central',1230,'T');
insert into jogador values(3520,'Silvan Widmer',6,'Lateral Esquerdo',1230,'T');
insert into jogador values(3525,'Michel Aebischer',5,'Meio Campo',1230,'T');
insert into jogador values(3530,'Christian Fassnacht',8,'Meio Campo',1230,'T');
insert into jogador values(3535,'Fabian Frei',10,'Meio Campo',1230,'T');
insert into jogador values(3540,'Dan Ndoye',11,'Atacante',1230,'T');
insert into jogador values(3545,'Haris Seferovic',9,'Atacante',1230,'T');
insert into jogador values(3550,'Andi Zeqiri',7,'Atacante',1230,'T');
insert into jogador values(3555,'Yvon Mvogo',12,'Goleiro',1230,'R');
insert into jogador values(3560,'Cedric Zesiger',13,'Central',1230,'R');
insert into jogador values(3565,'Steven Zuber',14,'Meio Campo',1230,'R');
insert into jogador values(3570,'Denis Zakaria',15,'Atacante',1230,'R');
-- tabela jogador - Sérvia 
insert into jogador values(3600,'Marko Dmitrovic',1,'Goleiro',1240,'T');
insert into jogador values(3605,'Nikola Milenkovic',2,'Lateral Direito',1240,'T');
insert into jogador values(3610,'Stefan Mitrovic',3,'Central',1240,'T');
insert into jogador values(3615,'Filip Mladenovic',4,'Central',1240,'T');
insert into jogador values(3620,'Matija Nastasic',6,'Lateral Esquerdo',1240,'T');
insert into jogador values(3625,'Veljko Birmancevic',5,'Meio Campo',1240,'T');
insert into jogador values(3630,'Filip Djuricic',8,'Meio Campo',1240,'T');
insert into jogador values(3635,'Ivan Ilić',10,'Meio Campo',1240,'T');
insert into jogador values(3640,'Aleksandar Mitrovic',11,'Atacante',1240,'T');
insert into jogador values(3645,'Luka Jovic',9,'Atacante',1240,'T');
insert into jogador values(3650,'Dusan Vlahovic',7,'Atacante',1240,'T');
insert into jogador values(3655,'Marko Ilic',12,'Goleiro',1240,'R');
insert into jogador values(3660,'Milos Veljkovic',13,'Central',1240,'R');
insert into jogador values(3665,'Mihailo Ristic',14,'Meio Campo',1240,'R');
insert into jogador values(3670,'Dusan Tadic',15,'Atacante',1240,'R');
-- tabela jogador - Costa Rica 
insert into jogador values(3700,'Aaron Cruz',1,'Goleiro',1250,'T');
insert into jogador values(3705,'Francisco Calvo',2,'Lateral Direito',1250,'T');
insert into jogador values(3710,'Óscar Duarte',3,'Central',1250,'T');
insert into jogador values(3715,'Fernán Faerrón',4,'Central',1250,'T');
insert into jogador values(3720,'Giancarlo González',6,'Lateral Esquerdo',1250,'T');
insert into jogador values(3725,'Ricardo Blanco Mora',5,'Meio Campo',1250,'T');
insert into jogador values(3730,'Celso Borges',8,'Meio Campo',1250,'T');
insert into jogador values(3735,'David Guzmán',10,'Meio Campo',1250,'T');
insert into jogador values(3740,'Bryan Ruiz',11,'Atacante',1250,'T');
insert into jogador values(3745,'Joel Campbell',9,'Atacante',1250,'T');
insert into jogador values(3750,'Ariel Lassiter',7,'Atacante',1250,'T');
insert into jogador values(3755,'Leonel Moreira',12,'Goleiro',1250,'R');
insert into jogador values(3760,'Juan Vargas',13,'Central',1250,'R');
insert into jogador values(3765,'Gerson Torres',14,'Meio Campo',1250,'R');
insert into jogador values(3770,'Kenneth Vargas',15,'Atacante',1250,'R');

-- tabela estadio 
insert into estadio values(5000,'Lusaiu Stadium','Lusaiu',80000);
insert into estadio values(5100,'Khalifa International','Doha',50000);
insert into estadio values(5200,'Al Thumama Stadium','Al Thumama',40000);
insert into estadio values(5300,'Al Janoub Stadium','Al-Wakrah',40000);


---Atualiza planilhas pelo resultado---
-- inserção de dados 

use copa_mundo;

-- show triggers;

drop trigger if exists Atualiza_Pais;

-- trigger (gatilho) de atualização da tabela 'pais' quando da inclusão
-- de dados na tabela 'jogos'
delimiter //
create trigger Atualiza_Pais 
	after insert
    on jogos for each row
    begin
		-- vitória da seleção 1
		if new.gols_idpais_1 > new.gols_idpais_2 then
				update pais set 
                pais.pontos = pais.pontos + 3, 
                pais.vitorias = pais.vitorias + 1,
                pais.gols_pro = pais.gols_pro + new.gols_idpais_1,
                pais.gols_contra = pais.gols_contra + new.gols_idpais_2
                where pais.idpais = new.pais_idpais_1;
		end if;
		
        -- vitória da seleção 2
        if new.gols_idpais_1 < new.gols_idpais_2 then
				update pais set 
                pais.pontos = pais.pontos + 3, 
                pais.vitorias = pais.vitorias + 1,
                pais.gols_pro = pais.gols_pro + new.gols_idpais_2,
                pais.gols_contra = pais.gols_contra + new.gols_idpais_1
                where pais.idpais = new.pais_idpais_2;
		end if;
		
        -- empate
        if new.gols_idpais_1 = new.gols_idpais_2 then
				update pais set 
                pais.pontos = pais.pontos + 1, 
                pais.empates = pais.empates + 1,
                pais.gols_pro = pais.gols_pro + new.gols_idpais_1,
                pais.gols_contra = pais.gols_contra + new.gols_idpais_2
                where pais.idpais = new.pais_idpais_1 or
                pais.idpais = new.pais_idpais_2;
		end if;
        
        -- derrota da seleção 1
		if new.gols_idpais_1 < new.gols_idpais_2 then
				update pais set
                pais.derrotas = pais.derrotas + 1,
                pais.gols_pro = pais.gols_pro + new.gols_idpais_1,
                pais.gols_contra = pais.gols_contra + new.gols_idpais_2
                where pais.idpais = new.pais_idpais_1;
		end if;
        
        -- derrota da seleção 2
        if new.gols_idpais_1 > new.gols_idpais_2 then
				update pais set
                pais.derrotas = pais.derrotas + 1,
                pais.gols_pro = pais.gols_pro + new.gols_idpais_2,
                pais.gols_contra = pais.gols_contra + new.gols_idpais_1
                where pais.idpais = new.pais_idpais_2;
		end if;
	end; //


--Populando com jogos, ao realizar esta inserção, o triggers percebe, e atualiza conforme sua programação

-- rodada 1 
insert into jogos values(1,'2020/11/21 20:00',5000,1100,1120,2,1,73258);
insert into jogos values(2,'2020/11/22 17:00',5200,1110,1130,1,1,33456);
insert into jogos values(3,'2020/11/22 17:00',5300,1140,1160,0,0,31827);
insert into jogos values(4,'2020/11/22 20:00',5100,1150,1170,2,0,30623);
insert into jogos values(5,'2020/11/23 17:00',5300,1190,1200,1,1,35392);
insert into jogos values(6,'2020/11/23 20:00',5200,1180,1210,2,0,32721);
insert into jogos values(7,'2020/11/24 17:00',5000,1220,1230,1,0,65880);
insert into jogos values(8,'2020/11/24 20:00',5200,1240,1250,0,0,30268);
-- rodada 2 
insert into jogos values(9,'2020/11/25 17:00',5000,1110,1120,1,0,71525);
insert into jogos values(10,'2020/11/25 20:00',5300,1100,1130,2,2,38741);
insert into jogos values(11,'2020/11/26 17:00',5100,1140,1150,3,1,42183);
insert into jogos values(12,'2020/11/26 20:00',5200,1160,1170,2,1,33420);
insert into jogos values(13,'2020/11/27 17:00',5000,1180,1190,2,1,68704);
insert into jogos values(14,'2020/11/27 20:00',5300,1200,1210,2,1,29732);
insert into jogos values(15,'2020/11/28 17:00',5100,1220,1240,3,1,48359);
insert into jogos values(16,'2020/11/28 20:00',5300,1230,1250,1,1,30681);
-- rodada 3 
insert into jogos values(17,'2020/11/29 17:00',5000,1120,1130,0,2,73086);
insert into jogos values(18,'2020/11/29 20:00',5100,1100,1110,3,2,44592);
insert into jogos values(19,'2020/11/30 17:00',5300,1140,1170,3,0,32473);
insert into jogos values(20,'2020/11/30 20:00',5200,1150,1160,2,1,29686);
insert into jogos values(21,'2020/12/01 17:00',5100,1180,1200,2,0,39325);
insert into jogos values(22,'2020/12/01 20:00',5200,1190,1210,3,0,37854);
insert into jogos values(23,'2020/12/02 17:00',5300,1230,1240,1,0,30542);
insert into jogos values(24,'2020/12/02 20:00',5000,1220,1250,2,0,66729);

-- tabela gols 
insert into gols values(1,2240,'22:15');
insert into gols values(1,2245,'51:44');
insert into gols values(1,2445,'62:11');
insert into gols values(2,2340,'39:25');
insert into gols values(2,2540,'50:19');
insert into gols values(4,2745,'23:55');
insert into gols values(4,2750,'71:37');
insert into gols values(5,3145,'58:24');
insert into gols values(5,3245,'82:05');
insert into gols values(6,3045,'16:42');
insert into gols values(6,3035,'42:11');
insert into gols values(7,3445,'76:19');
insert into gols values(9,2345,'62:32');
insert into gols values(10,2235,'33:15');
insert into gols values(10,2535,'41:17');
insert into gols values(10,2240,'63:13');
insert into gols values(10,2540,'74:04');
insert into gols values(11,2640,'13:15');
insert into gols values(11,2645,'39:45');
insert into gols values(11,2745,'51:20');
insert into gols values(11,2650,'78:37');
insert into gols values(12,2845,'12:15');
insert into gols values(12,2940,'43:39');
insert into gols values(12,2850,'65:51');
insert into gols values(13,3030,'27:18');
insert into gols values(13,3035,'44:34');
insert into gols values(13,3135,'56:10');
insert into gols values(13,3135,'60:26');
insert into gols values(14,3245,'10:37');
insert into gols values(14,3240,'27:12');
insert into gols values(14,3245,'58:51');
insert into gols values(14,3345,'77:39');
insert into gols values(15,3435,'18:45');
insert into gols values(15,3645,'24:11');
insert into gols values(15,3440,'44:23');
insert into gols values(15,3440,'66:20');
insert into gols values(16,3540,'37:46');
insert into gols values(16,3750,'73:31');
insert into gols values(17,2540,'62:32');
insert into gols values(17,2550,'68:49');
insert into gols values(18,2240,'27:35');
insert into gols values(18,2335,'38:12');
insert into gols values(18,2245,'44:49');
insert into gols values(18,2350,'71:08');
insert into gols values(18,2250,'80:53');
insert into gols values(19,2630,'09:33');
insert into gols values(19,2635,'30:57');
insert into gols values(19,2640,'74:05');
insert into gols values(20,2850,'29:12');
insert into gols values(20,2735,'40:36');
insert into gols values(20,2745,'58:37');
insert into gols values(21,3040,'28:15');
insert into gols values(21,3245,'67:06');
insert into gols values(21,3045,'79:34');
insert into gols values(22,3130,'08:10');
insert into gols values(22,3135,'27:56');
insert into gols values(22,3140,'55:22');
insert into gols values(23,3535,'77:13');
insert into gols values(24,3435,'41:57');
insert into gols values(24,3435,'66:29');

-- tabela cartao
insert into cartao values(1,2210,1,0,'32:55');
insert into cartao values(1,2420,1,0,'42:11');
insert into cartao values(1,2440,1,0,'71:44');
insert into cartao values(1,2420,0,1,'75:38');
insert into cartao values(2,2310,1,0,'33:27');
insert into cartao values(2,2520,0,1,'61:42');
insert into cartao values(3,2825,1,0,'74:21');
insert into cartao values(4,2910,1,0,'42:10');
insert into cartao values(5,3210,1,0,'19:43');
insert into cartao values(5,3125,1,0,'37:35');
insert into cartao values(5,3220,1,0,'44:09');
insert into cartao values(5,3210,0,1,'57:29');
insert into cartao values(6,3050,1,0,'73:41');
insert into cartao values(7,3505,1,0,'66:31');
insert into cartao values(7,3420,1,0,'78:07');
insert into cartao values(8,3725,1,0,'22:37');
insert into cartao values(8,3705,1,0,'71:38');
insert into cartao values(9,2425,1,0,'09:25');
insert into cartao values(9,2325,1,0,'22:33');
insert into cartao values(9,2410,1,0,'67:32');
insert into cartao values(10,2520,1,0,'73:10');
insert into cartao values(13,3125,1,0,'70:35');
insert into cartao values(16,3710,1,0,'39:18');
insert into cartao values(17,2505,1,0,'27:32');
insert into cartao values(17,2425,0,1,'73:15');
insert into cartao values(18,2225,1,0,'11:40');
insert into cartao values(18,2305,1,0,'21:05');
insert into cartao values(18,2215,1,0,'51:06');
insert into cartao values(18,2320,0,1,'72:36');
insert into cartao values(21,3225,1,0,'62:33');
insert into cartao values(24,3710,1,0,'13:25');
insert into cartao values(24,3425,1,0,'29:19');
insert into cartao values(24,3720,0,1,'65:32');

-- tabela substituicao
insert into substituicao values(1,2250,2270,'55:20');
insert into substituicao values(1,2430,2465,'61:05');
insert into substituicao values(2,2350,2370,'62:28');
insert into substituicao values(2,2550,2570,'70:49');
insert into substituicao values(3,2650,2670,'55:05');
insert into substituicao values(3,2850,2870,'70:10');
insert into substituicao values(8,3635,3665,'61:36');
insert into substituicao values(8,3715,3760,'70:08');
insert into substituicao values(8,3735,3770,'73:06');
insert into substituicao values(14,3250,3270,'45:05');
insert into substituicao values(14,3335,3365,'78:30');
insert into substituicao values(16,3735,3765,'54:28');
insert into substituicao values(17,2430,2465,'64:39');
insert into substituicao values(24,3445,3470,'68:11');
insert into substituicao values(24,3735,3765,'75:39');


--- mostrando os resultados do nome do jogador e sua seleção.

SELECT pais.selecao,jogador.nome 
FROM  pais JOIN jogador
ON jogador.pais_idpais = pais.idpais
ORDER BY pais.selecao,jogador.nome 

--O que acontece é que é selecionado o nome da tabela jogador, e a seleção da tabela pais, e o o join faz a junção das duas tabelas,
--o ON indica que pais_idpais da tabela jogador, é a chave estrangeira de idpais da tabela pais. Sempre que utilizar o JOIN é obrigatoriamente usar o ON, o order by
--organiza em ordem alfabetica no caso, primeiro pela selecao e depois pelos jogadores.
 



--Mostrando os resultador de nome, seleção e o numero de substituições.

SELECT pais.selecao,jogador.nome, COUNT(substituicao.jogador_idjogador_sai) as substituição
FROM  pais JOIN jogador
ON jogador.pais_idpais = pais.idpais
JOIN substituicao
on substituicao.jogador_idjogador_sai = jogador.idjogador

GROUP BY substituicao.jogador_idjogador_sai
ORDER BY substituicao.jogador_idjogador_sai

--O que acontece é que é selecionado o nome da tabela jogador, e a seleção da tabela pais, e o o join faz a junção das duas tabelas,
--o ON indica que pais_idpais da tabela jogador, é a chave estrangeira de idpais da tabela pais, o mesmo se repete novamente, ja que uma tabela se integra a mais no grupo.
--Sempre que utilizar o JOIN é obrigatoriamente usar o ON. O AS muda o nome do count para substituição na tabela, o group by transforma cada substituição igual em um grupo
--e o COUNT(substituicao.jogador_idjogador_sai) conta quantos registros tem igual dentro de cada grupo, mostrando apenas o total de ids repetidos.




---Selecionando selecao e cartões aplicados a elas.

SELECT pais.selecao, SUM(cartao.amarelo) as amarelo, SUM(cartao.vermelho) as vermelho
FROM cartao JOIN jogador on cartao.jogador_idjogador = jogador.idjogador
JOIN pais on jogador.pais_idpais = pais.idpais
GROUP BY cartao.amarelo, cartao.vermelho, pais.selecao
ORDER BY pais.selecao

--O que acontece é que é seleciona a selecao vindo de pais, a SUM faz a soma dos cartões amarelos, e vermelhos, o join avisa que vai ser uma
--junção das tabelas, e jogador.pais_idpais é a chave estrangeira de pais.idpais, são agrupados os cartões vermelho, amarelo, de cada seleção



--selecionando dados de seleção, numero de vitorias, derrotas e empates, e gols prós.

SELECT grupo.id_grupo ,pais.selecao, pais.pontos, pais.vitorias, pais.empates, 
pais.derrotas, (pais.gols_pro - SUM(pais.gols_contra)) as saldo_gols 
FROM grupo JOIN pais ON grupo.id_grupo = pais.grupo_idgrupo 
GROUP BY pais.selecao
ORDER BY grupo.id_grupo;

--O que acontece é que  a função SUM() esta fazendo a subtração 
--entra gols pros e gols contras de cada seleção, e o join faz a junção como na pesquisa anterior.


--criando a Nova tabela sensores


CREATE TABLE sensores (
cv_idjogador int,
distancia int,
saltos int,
giros int,
impacto int
)

ALTER TABLE sensores ADD CONSTRAINT fk_sensores2
FOREIGN KEY (cv_idJogador) REFERENCES jogador(idjogador);


--Adicionando os dados 

INSERT INTO sensores(cv_idJogador, distancia, saltos, giros, impacto)
VALUES (2240, 23472, 17, 11,5),
(2245, 27639, 22, 7,3),
(2335, 26384, 25, 15,7),
(2345, 29581, 15, 5,9),
(2540, 23891, 10, 12,11),
(2625, 18632, 16, 18,2),
(2640, 25864, 31, 15,7),
(2645, 30640, 21, 21,3),
(2725, 28751, 13, 17,8),
(2845, 31472, 7, 4,10),
(3140, 24785, 18, 11,6),
(3225, 28378, 5, 12,4),
(3230, 30219, 33, 20,2),
(3435, 15875, 19, 3,5),
(3450, 25851, 8, 9,8)

--Mostrando as visualizações da seleção, nome do jogador, e o que os sensores captaram;

SELECT pais.selecao, jogador.nome, sensores.distancia,
sensores.saltos, sensores.giros, sensores.impacto
FROM pais join jogador ON jogador.pais_idpais = pais.idpais 
JOIN sensores ON sensores.cv_idjogador = jogador.idjogador
ORDER BY pais.selecao ASC , sensores.distancia DESC;

