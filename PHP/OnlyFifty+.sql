CREATE database OnlyFifty;
USE OnlyFifty;


CREATE table tbl_Usuarios(
id_Usuario varchar(15) primary key,
Nombre varchar(30),
Apellido varchar(30),
Edad varchar(2),
Celular varchar(15),
pin int);  

create table Tbl_Recordatorios(
    Codigo_R varchar(20) primary key,
     Nombre_R varchar(30),
     Tipo_R Bool,
     Descripcion_R varchar(50),
     Fecha_R date,
     Hora_R time,
     idUsuario_Recordatorio varchar(15));
     
create table Tbl_Contactos(
    Ncelular_Contacto varchar(20) primary key,
    Nombre_Contacto varchar(30),
    Favorito_Contacto Bool,
    idUsuario_Contactos varchar(15));

create table Tbl_Juegos(
    Codigo_Juegos varchar(20) primary key,
    Categoria_Juegos varchar(30),
    Nombre_Juegos varchar(30),
    idUsuario_Juegos varchar(15));

create table Tbl_Musica(
    Codigo_Cancion varchar(20) primary key,
    Nombre_Cancion varchar(30),
    Nombre_Artistas varchar(30),
    Genero varchar(20),
    idUsuario_Musica varchar(15));

alter table Tbl_Recordatorios add foreign key (idUsuario_Recordatorio) references Tbl_Usuarios(id_Usuario);
alter table Tbl_Musica add foreign key (idUsuario_Musica) references Tbl_Usuarios(id_Usuario);
alter table Tbl_Juegos add foreign key (idUsuario_Juegos) references Tbl_Usuarios(id_Usuario);
alter table Tbl_Contactos add foreign key (idUsuario_Contactos) references Tbl_Usuarios(id_Usuario);

CREATE VIEW vista_Usuarios
AS
SELECT  Documento, Nombre, Apellido,Edad, Celular FROM
tbl_Usuarios;

CREATE VIEW vista_Contactos
AS
SELECT  Ncelular_Contacto, Nombre_Contacto, Favorito_Contacto FROM
Tbl_Contactos;

CREATE VIEW vista_Juegos
AS
SELECT  Codigo_Juegos, Categoria_Juegos, Nombre_Juegos FROM
Tbl_Juegos;

CREATE VIEW vista_Musica
AS
SELECT  Codigo_Cancion, Nombre_Cancion, Nombre_Artistas, Genero FROM
Tbl_Musica;


CREATE VIEW Recordatorios_Usuarios
AS
SELECT Codigo_R, Nombre_R, Tipo_R, Descripcion_R,  Fecha_R, Hora_R, idUsuario_Recordatorio, Nombre, Apellido 
FROM Tbl_Recordatorios JOIN  tbl_Usuarios 
ON idUsuario_Recordatorio = tbl_Usuarios.id_Usuario;

