go
use dbGimnasio;
go

create table [Instalaciones]
(
	[Id] int primary key identity(1,1),
)

create table [Personas] 
(
	[Id] int primary key identity(1,1),
	[Nombre] nvarchar(50) not null,
	[Identificacion] nvarchar(20) not null,
	[Edad] int,
	[CorreoElectronico] nvarchar(100),
	[Telefono] nvarchar(20) not null,
);

create table [Clientes]
(
	[Id] int primary key identity(1,1),
	[Estatura] decimal(4,2) not null,
	[Peso] decimal(5,2) not null,
	[IdPersona] int references [Personas]([Id]) not null
);

create table [Membresias]
(
	[Id] int primary key identity(1,1),
	[]
);

create table [Adquieren]
(
	[Id] int primary key identity(1,1),
	[]

);
