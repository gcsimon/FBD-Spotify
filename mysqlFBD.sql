drop table if exists PlaylistMusica;
drop table if exists UsuarioMidia;
drop table if exists MusicaArtista;
drop table if exists AlbumMusica;
drop table if exists Musica;
drop table if exists Episodio;
drop table if exists Podcast;
drop table if exists Album;
drop table if exists Oferta;
drop table if exists UsuarioPlaylist;
drop table if exists Recibo;
drop table if exists Usuario;
drop table if exists Plano;
drop table if exists Playlist;
drop table if exists ArtistaApresentacao;
drop table if exists Apresentacao;
drop table if exists Artista;
drop table if exists Lugar;
drop table if exists Midia;
drop table if exists Categoria;


CREATE TABLE Plano (
	codPlano numeric not null,
    titulopla varchar(255) NOT NULL,
    valor numeric NOT NULL,
    compartilhavel boolean NOT NULL,
    unique(codPlano),
    primary key(titulopla)
);
insert into Plano values (1,'Familiar', 25,1);
insert into Plano values (2,'Free',0,0);
insert into Plano values (3,'Premium', 15,0);

CREATE TABLE Usuario (
codUsuario numeric NOT NULL,
nomeu varchar(255) NOT NULL,
login varchar(255) NOT NULL UNIQUE,
senha varchar(255) NOT NULL,
email varchar(255) NOT NULL UNIQUE,
endereco varchar(255) NOT NULL,
tituloPla varchar(255) NOT NULL,
FOREIGN KEY (tituloPla) references Plano(tituloPla),
bandeiraCartao varchar(255),
numeroCartao varchar(255),
primary key(codUsuario)
);
insert into Usuario values (1,'Giovani','giovani96', 'senha1', 'gio@gio.com', 'rua 1, 25', 'Free', NULL, NULL);
insert into Usuario values (2,'Giusepe','giosepe_lopes', 'senha2', 'giusepe@htomail.com', 'rua 2, 48', 'Premium', 'MASTERCARD', '5554765657353836' );
insert into Usuario values (3,'Carlos','carlinhos_brazil', 'senha3', 'carlinhos@gio.com', 'rua 3, 21', 'Free', NULL, NULL);
insert into Usuario values (4,'Maicon','maiquinho_br', 'senha4', 'carlito@hotmail.com', 'rua 4, 231', 'Free', NULL, NULL);
insert into Usuario values (5,'Lucas','lucca_god', 'senha5', 'clucca@gmail.com', 'rua 5, 600-A', 'Free', NULL, NULL);
insert into Usuario values (6,'Maria','maria_ana', 'senha6', 'mariazinha@htomail.com', 'rua 6, 148', 'Premium', 'VISA', '4756765023653836' );
insert into Usuario values (7,'Gabriela','gabeeh_vdl', 'senha7', 'gaby@hotmail.com', 'rua 7, 48', 'Premium', 'MASTERCARD', '939397464940473' );
insert into Usuario values (8,'Matheus','mateuzito', 'senha8', 'mathhh@htomail.com', 'rua 8, 948', 'Familiar', 'VISA', '5552525657353836' );
insert into Usuario values (9,'Leandro','leandrinhu', 'senha9', 'lele67@htomail.com', 'rua 9, 525', 'Familiar', 'MASTERCARD', '55547522253836' );
insert into Usuario values (10,'Bernardo','bernarduuu', 'senha10', 'bebeto@htomail.com', 'rua 99, 128', 'Familiar', 'VISA', '55552322353836' );

CREATE TABLE Recibo (
codRecibo numeric NOT NULL,
dataRecibo varchar(255) NOT NULL,
valorOriginal numeric NOT NULL,
iof numeric NOT NULL,
codUsuario numeric NOT NULL,
FOREIGN KEY (codUsuario) references Usuario(codUsuario),
primary key(codRecibo),
unique(codUsuario, dataRecibo)
);
insert into Recibo values(25,'25/12/2018',15,8,2);
insert into Recibo values(26,'25/11/2018',15,8,2);
insert into Recibo values(27,'25/10/2018',15,8,2);
insert into Recibo values(28,'25/01/2019',15,8,2);
insert into Recibo values(29,'25/02/2019',15,8,2);
insert into Recibo values(30,'12/02/2019',25,8,9);
insert into Recibo values(31,'12/03/2019',25,8,9);
insert into Recibo values(32,'12/04/2019',25,8,9);
insert into Recibo values(33,'12/05/2019',25,8,9);
insert into Recibo values(34,'12/06/2019',25,8,9);
insert into Recibo values(35,'12/07/2019',25,8,9);

CREATE TABLE Playlist (
codPlaylist numeric NOT NULL,
nomePlaylist varchar(255) NOT NULL,
descricaoPlaylist varchar(255) NOT NULL,
statusPlaylist varchar(255) NOT NULL,
dataCriacao varchar(255) NOT NULL,
duracaoTotalMinutos numeric NOT NULL,
primary key(codPlaylist)
);
insert into Playlist values (1,'Favoritos', 'Minhas musicas favoritas', 'Public', '28/11/2018' , 0);
insert into Playlist values (2,'Top 50 Brasil', 'Mais tocadas do brasil da semana', 'Public', '28/01/2018' , 0);
insert into Playlist values (3,'Rock', 'Musicas de Rock and Roll', 'Public', '15/11/2018' , 0);
insert into Playlist values (4,'Pop', 'Musicas pop', 'Public', '05/11/2018' , 0);
insert into Playlist values (5,'Musicas Aleatorias', 'Musicas de todos os tipos', 'Private', '09/11/2018' , 0);
insert into Playlist values (6,'Musicas para Alegrar seu dia', 'Musicas felizes', 'Public', '09/11/2016' , 0);
insert into Playlist values (7,'Musicas do Giovani', 'Musicas felizes', 'Public', '09/11/2016' , 0);
insert into Playlist values (8,'Pasteis de Belem', 'Playlist musical', 'Public', '19/01/2016' , 0);
insert into Playlist values (9,'Musicas para ouvir no carro', 'musicas para dirigir', 'Public', '09/11/2016' , 0);
insert into Playlist values (10,'Old Songs', 'Só as velhinhas', 'Public', '09/10/2016' , 0);

CREATE TABLE UsuarioPlaylist (
codUsuario numeric NOT NULL,
codPlaylist numeric NOT NULL,
foreign key (codUsuario) references Usuario(codUsuario),
foreign key (codPlaylist) references Playlist(codPlaylist),
primary key(codUsuario, codPlaylist)
);
insert into UsuarioPlaylist values (1, 1);
insert into UsuarioPlaylist values (2, 2);
insert into UsuarioPlaylist values (3, 3);
insert into UsuarioPlaylist values (4, 4);
insert into UsuarioPlaylist values (5, 5);
insert into UsuarioPlaylist values (6, 6);
insert into UsuarioPlaylist values (7, 7);
insert into UsuarioPlaylist values (8, 8);
insert into UsuarioPlaylist values (9, 9);
insert into UsuarioPlaylist values (10, 10);
insert into UsuarioPlaylist values (1, 5);
insert into UsuarioPlaylist values (3, 5);

CREATE TABLE Lugar (
codLugar numeric NOT NULL,
nomeLugar varchar(255) NOT NULL,
cidadeLugar varchar (255)NOT NULL,
estadoLugar varchar(255)NOT NULL,
paisLugar varcHar(255)NOT NULL,
primary key (codLugar)
);
insert into Lugar values (1,'Beira-Rio', 'Porto Alegre', 'RS', 'Brasil');
insert into Lugar values (2,'Arena Portoalegrense', 'Porto Alegre', 'RS', 'Brasil');
insert into Lugar values (3,'Maracana', 'Rio de Janeiro', 'RJ', 'Brasil');
insert into Lugar values (4,'Morumbi', 'Sao Paulo', 'SP', 'Brasil');
insert into Lugar values (5,'Magic Square Garden', 'New York', 'NY', 'USA');
insert into Lugar values (6,'Pepsi on stage', 'Porto Alegre', 'RS', 'Brasil');
insert into Lugar values (7,'Anfiteatro por do sol', 'Porto Alegre', 'RS', 'Brasil');
insert into Lugar values (8,'Estacionamento da FIERGS', 'Porto Alegre', 'RS', 'Brasil');
insert into Lugar values (9,'Zequinha', 'Porto Alegre', 'RS', 'Brasil');
insert into Lugar values (10,'Arena Corinthians', 'Sao Paulo', 'SP', 'Brasil');

CREATE TABLE Apresentacao (
codApresentacao numeric NOT NULL,
nomeApresentacao varchar (255) NOT NULL,
linkIngressos varchar (255) NOT NULL,
duracaoMinutosApresentacao numeric NOT NULL,
dataApresentacao varchar(255) NOT NULL,
codLugar numeric NOT NULL,
FOREIGN KEY (codLugar) references Lugar(codLugar),
PRIMARY KEY (codApresentacao),
UNIQUE(dataApresentacao,codLugar),
UNIQUE(nomeApresentacao)
);
insert into Apresentacao values (1,'World Tour', 'www.ingresso.com', 120,'25/12/2018',1);
insert into Apresentacao values (2,'Rock in Rio', 'www.ingresso.com', 110,'14/02/1998', 2);
insert into Apresentacao values (3,'Planeta Atlantida', 'www.ingresso.com', 400,'23/06/2015', 3);
insert into Apresentacao values (4,'Hail to the king tour', 'www.ingresso.com', 120,'01/01/2019', 4);
insert into Apresentacao values (5,'American Idiot', 'www.ingresso.com', 120, '29/02/2008',5);
insert into Apresentacao values (6,'Universo Alegria', 'www.ingresso.com', 120, '29/05/2011',6);
insert into Apresentacao values (7,'Show das poderosas', 'www.ingresso.com', 130, '25/02/2016',7);
insert into Apresentacao values (8,'Show de roque', 'www.ingresso.com', 95, '22/02/2006',8);
insert into Apresentacao values (9,'One more Light', 'www.ingresso.com', 121, '21/04/2006',9);
insert into Apresentacao values (10,'The hunting party Tour', 'www.ingresso.com', 114, '21/02/2006',10);
insert into Apresentacao values (11,'Revolution Radio', 'www.ingresso.com', 114, '21/09/2016',10);

CREATE TABLE Artista (
codArtista numeric NOT NULL,
nomeArtista varchar(255) NOT NULL,
descricaoArtista varchar(255),
ouvintesMensais numeric NOT NULL,
primary key (codArtista)
);
insert into Artista values (1,'Avenged Sevenfold', 'Rockzera', 45000);
insert into Artista values (2,'Green Day', 'Rockzera', 15000);
insert into Artista values (3,'Anitta', 'Popzera e Funkera', 12000);
insert into Artista values (4,'Armandinho', 'Reguera', 45000);
insert into Artista values (5,'Guns and Roses', 'Rockzera', 19000);
insert into Artista values (6,'Carlinhos Brown', 'MPBzera', 2000);
insert into Artista values (7,'Linkin Park', 'Rock alternativo', 25000);
insert into Artista values (8,'Alok', 'Musicas eletronicas', 1300);
insert into Artista values (9,'David Guetta', 'Maior DJ mundial', 2000);
insert into Artista values (10,'Gorillaz', 'Rock alternativo', 1300);

CREATE TABLE ArtistaApresentacao (
codArtista numeric NOT NULL,
codApresentacao numeric NOT NULL,
PRIMARY KEY(codArtista,codApresentacao),
FOREIGN KEY (codArtista) references Artista(codArtista),
FOREIGN KEY (codApresentacao) references Apresentacao(codApresentacao),
UNIQUE(codArtista,codApresentacao)
);
insert into ArtistaApresentacao values(1,4);
insert into ArtistaApresentacao values(1,2);
insert into ArtistaApresentacao values(2,5);
insert into ArtistaApresentacao values(2,10);
insert into ArtistaApresentacao values(3,7); 
insert into ArtistaApresentacao values(4,3);
insert into ArtistaApresentacao values(5,2); 
insert into ArtistaApresentacao values(6,2);
insert into ArtistaApresentacao values(7,9);
insert into ArtistaApresentacao values(7,10);
insert into ArtistaApresentacao values(8,3);
insert into ArtistaApresentacao values(9,2);
insert into ArtistaApresentacao values(10,2);

CREATE TABLE Oferta (
codOferta numeric not null,
nomeOferta varchar(255) not null,
descricaoOferta varchar(255),
linkOfertador varchar(255) not null,
primary key(codOferta),
codArtista numeric not null,
foreign key (codArtista) references Artista(codArtista)
);

insert into Oferta values(1,'American Idiot Album','Grande desconto', 'www.freemarket.com', 2);
insert into Oferta values(2,'Hail to the King Album','baita oferta', 'www.freemarket.com', 1);
insert into Oferta values(3,'Melhores do Carlinhos','De gratis', 'www.dowloadcd.com', 6);
insert into Oferta values(4,'Discografia do LP','Precinho camarada!', 'www.freemarket.com', 7);
insert into Oferta values(5,'Sertanejao em promocao','So as sofrencias!', 'www.freemarket.com', 6);
insert into Oferta values(6,'Melhores do Gorillaz','Só musicas boas!!!', 'www.dowloadcd.com', 10);
insert into Oferta values(7,'TOP eletronicas','Só as eletronicas', 'www.dowloadcd.com', 10);
insert into Oferta values(8,'Discografia do guetta','Só as eletronicas boas', 'www.dowloadcd.com', 9);
insert into Oferta values(9,'so roquezao','so musicas de qualidade', 'www.dowloadcd.com', 1);
insert into Oferta values(10,'todas da poderosa','so musicas de qualidade', 'www.dowloadcd.com', 3);
insert into Oferta values(11,'top 2018','so musicas de 2018', 'www.dowloadcd.com', 8);

CREATE TABLE Categoria (
codCategoria numeric not null,
nomeCategoria varchar(255) not null,
unique(nomeCategoria),
primary key(codCategoria)
);
insert into Categoria Values (1,'Rock');
insert into Categoria Values (2,'Blues');
insert into Categoria Values (3,'MPB');
insert into Categoria Values (4,'Reggae');
insert into Categoria Values (5,'Pop');
insert into Categoria Values (6,'Comedia');
insert into Categoria Values (7,'Infantil');
insert into Categoria Values (8,'Noticias');
insert into Categoria Values (9,'Games');
insert into Categoria Values (10,'Economia');

Create table Album (
codAlbum numeric not null,
tituloAlbum varchar(255)not null,
dataLancamento varchar(255) not null,
duracaoAlbumMinutos numeric not null,
codArtista numeric not null,
primary key(codAlbum),
foreign key(codArtista) references Artista(codArtista)
);

insert into Album values(1,'American Idiot','20/09/2004',57,2);
insert into Album Values(2,'CD do brown','28/11/2018',25,6);
insert into Album values(3,'Nightmare','11/09/2012',59,1);
insert into Album values(4,'One more light','11/09/2017',68,7);
insert into Album values(5,'Living things','11/09/2012',58,7);
insert into Album values(6,'Alok 2018.1','11/06/2018',58,8);
insert into Album values(7,'Bang','11/03/2015',58,3);
insert into Album values(8,'As melhores do brown','11/03/2015',58,6);
insert into Album values(9,'Chinese democracy','11/03/2011',58,5);
insert into Album values(10,'The now now','11/03/2018',58,5);

Create Table Midia (
codMidia numeric not null,
nomeMidia varchar(255) not null,
duracaoMinutosMidia varchar(255) not null,
ehMusica boolean not null,
codCategoria numeric not null,
foreign key(codCategoria) references Categoria(codCategoria),
primary key(codMidia)
);
insert into Midia values (1,'Wake me Up when September Ends',7,true,1);
insert into Midia values (2,'A namorada',5,true,3);
insert into Midia values (3,'Historias de carnaval',53,false,6);
insert into Midia values (4,'Podcast da doidera',60,false,6);
insert into Midia values (5,'Boulevard of broken dreams',6,true,1);
insert into Midia values (6,'Bang',5,true,5);
insert into Midia values (7,'Show das poderosas',5,true,5);
insert into Midia values (8,'So far away',5,true,1);
insert into Midia values (9,'Dear god',5,true,1);
insert into Midia values (10,'Hail to the king',5,true,1);
insert into Midia values (11,'Good Riddance',5,true,1);
insert into Midia values (12,'When I come around',3,true,1);
insert into Midia values (13,'Sweet Child o mine',4,true,1);
insert into Midia values (14,'Numb',5,true,1);
insert into Midia values (15,'In the end',4,true,1);
insert into Midia values (16,'Hear me now',6,true,5);
insert into Midia values (17,'Feel good inc',5,true,2);
insert into Midia values (18,'SUS e a saude publica',61,false,6);
insert into Midia values (19,'Historias do final de semana',54,false,6);
insert into Midia values (20,'Arquivo X',61,false,6);
insert into Midia values (21,'Realidade concentrada',63,false,6);
insert into Midia values (22,'Retrospectiva 2016',58,false,6);
insert into Midia values (23,'Perdidos e sem respostas',61,false,6);
insert into Midia values (24,'Uma camera na mao',65,false,6);
insert into Midia values (25,'Passado e futuro',59,false,6);
insert into Midia values (26,'Jogos de tabuleiro',59,false,6);

Create Table Musica (
codMidia numeric not null,
codArtista numeric not null,
totalReproducoes numeric not null,
nomeCompositor varchar (255),
foreign key(codArtista) references artista(codArtista),
foreign key(codMidia) references Midia(codMidia),
primary key(codMidia)
);
insert into Musica values (1,2,94000,'Green Day');
insert into Musica values (2,6,15000,'Michel Telo');
insert into Musica values (5,1,18000,'Green Day');
insert into Musica values (6,3,21000,'Anitta');
insert into Musica values (7,3,38000,'Anitta');
insert into Musica values (8,1,15000,'Avenged Sevenfold');
insert into Musica values (9,1,1000,'Avenged Sevenfold');
insert into Musica values (10,1,11000,'Avenged Sevenfold');
insert into Musica values (11,2,90000,'Green Day');
insert into Musica values (12,2,12000,'Green Day');
insert into Musica values (13,5,32000,'Gund and Roses');
insert into Musica values (14,7,42000,'Chester');
insert into Musica values (15,7,21000,'Chester');
insert into Musica values (16,8,35000,'Alok');
insert into Musica values (17,10,31000,'Gorillaz');

create table Podcast (
codPodcast numeric not null,
nomePodcast varchar(255) not null,
descricaoPodcast varchar(255) not null,
publicante varchar(255) not null,
primary key(codPodcast)
);
insert into Podcast values(1,'Nerdcast','Podcast engracadao','Young Nerd');
insert into Podcast values(2,'Matando robos gigantes','Podcast bem engracado','MRG');


create table Episodio (
codMidia numeric not null,
descricaoEpisodio varchar(255),
dataPublicacao varchar(255),
codPodcast numeric not null,
foreign key (codPodcast) references Podcast(codPodcast),
foreign key(codMidia) references Midia(codMidia),
primary key(codMidia)
);
insert into Episodio values (3,'contando historias de carnaval', '25/04/2007',1);
insert into Episodio values (4,'contando historias muito estranhas','28/09/2018',2);

create table AlbumMusica (
codAlbum numeric not null, 
codMidia numeric not null,
foreign key (codmidia) references Musica(codMidia),
foreign key (codAlbum) references Album(codAlbum),
primary key(codAlbum,codMidia)
);

insert into AlbumMusica values (1,1);
insert into AlbumMusica values (2,2); 
insert into AlbumMusica values (1,5);

create table UsuarioMidia (
id numeric not null,
codUsuario numeric not null,
codMidia numeric not null,
primary key(id),
foreign key(codUsuario) references Usuario(codUsuario),
foreign key(codMidia) references Midia(codMidia)
);

insert into UsuarioMidia values(1,1,1);
insert into UsuarioMidia values(2,1,2);
insert into UsuarioMidia values(3,1,1);
insert into UsuarioMidia values(4,2,3);
insert into UsuarioMidia values(5,2,4);
insert into UsuarioMidia values(6,2,4);

create table PlaylistMusica (
codMidia numeric not null,
codPlaylist numeric not null,
ordemFaixa integer not null,
foreign key(codMidia) references Musica(codMidia),
foreign key(codPlaylist) references Playlist(codPlaylist),
primary key(codMidia,codPlaylist,ordemFaixa),
unique (codPlaylist,ordemFaixa)
);

insert into PlaylistMusica values (1,2,1);   -- musica 1 na playlist 2 na ordem 1
insert into PlaylistMusica values (2,2,2);   -- musica 2 na playlist 2 na ordem 2
insert into PlaylistMusica values (2,2,3);   -- musica 2 na playlist 2 na ordem 3
-- insert into PlaylistMusica values (5,2,3);   -- musica 5 na playlisst 2 na ordem 3. eh pra dar erro mesmo


