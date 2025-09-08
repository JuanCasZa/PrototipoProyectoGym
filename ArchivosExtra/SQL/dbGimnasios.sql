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
	[Valor] decimal not null
);

create table [Suplementos]
(
	[Id] int primary key identity(1,1),
	[NombreSuplemento] nvarchar(20) not null,
	[TipoSuplemento] nvarchar(10) not null,
	[Valor] decimal not null,
	[Cantidad] decimal not null
);

	/*Tablas de relaciones muchos a muchos con Clientes*/
/*Clientes-Membresias*/
create table [ClientesMembresias]
(
	[IdClientes] int references [Clientes]([Id]) not null,
	[IdMembresias] int references [Membresias]([Id]) not null,
	[FechaInicio] smalldatetime default getdate(),
	[FechaFin] smalldatetime default getdate(),
	[Id] int primary key (IdClientes, IdMembresias)
);

/*Clientes-Suplementos*/
create table [ClientesSuplementos]
(
	[IdClientes] int references [Clientes]([Id]) not null,
	[IdSuplementos] int references [Suplementos]([Id]) not null,
	[CantidadCompraSuplementos] int not null,
	[ValorTotalCompra] decimal not null,
	[Id] int primary key (IdClientes, IdSuplementos)
);




