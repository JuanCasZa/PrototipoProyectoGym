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
	[Id] int primary key references [Personas]([Id]), /*Heredando la misma clave primaria de Personas*/
	[Estatura] decimal(4,2) not null,
	[Peso] decimal(5,2) not null
	
);

create table [Empleados]
(
	[Id] int primary key references [Personas]([Id]), /*Heredando la misma clave primaria de Personas*/
	[AnhosExperiencia] int not null,
	[Salario] decimal not null
);

create table [Entrenadores]
(
	[Id] int primary key references [Empleados]([Id]), /*Heredando la misma clave primaria de PersonasEmpleados*/
	[Especialidad] nvarchar(50) not null
);

create table [OtrosEmpleados]
(
	[id] int primary key references [Empleados]([Id]), /*Heredando la misma clave primaria de PersonasEmpleados*/
	[Oficio] nvarchar(30) not null,
	[Turno] nvarchar(6) not null
);

create table [Proveedores]
(
	[Id] int primary key identity(1,1),
	[NombreEntidad] nvarchar(20) not null,
	[ValorTotalVenta] decimal not null
);

create table [Instrumentos]
(
	[Id] int primary key identity(1,1),
	[NombreInstrumento] nvarchar(20) not null,
	[DescripcionGeneral] nvarchar(100),
	[Estado] bit not null,
	[Proveedor] int references [Proveedores]([Id]) 
);

create table [Equipamientos]
(
	[Id] int primary key references [Instrumentos]([Id]), /*Heredando la misma clave primaria de Instrumentos*/
	[CantidadEquipamientos] int not null,
	[Peso] decimal not null
);

create table [Maquinarias]
(
	[Id] int primary key references [Instrumentos]([Id]), /*Heredando la misma clave primaria de Instrumentos*/
	[PesoMax] decimal not null,
	[PesoMin] decimal not null,
	[Piezas] int not null
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
	[Cantidad] decimal not null,
	[Proveedor] int references [Proveedores]([Id])
);

create table [ClasesGrupales]
(
	[Id] int primary key identity(1,1),
	[Duracion] decimal
);

	/*Tablas de relaciones muchos a muchos con Clientes*/
/*Clientes-Membresias*/
create table [ClientesMembresias]
(
	[IdClientes] int references [Clientes]([Id]) not null,
	[IdMembresias] int references [Membresias]([Id]) not null,
	[FechaInicio] smalldatetime default getdate(),
	[FechaFin] smalldatetime default getdate(),
	[Id] int primary key ([IdClientes], [IdMembresias])
);

/*Clientes-Suplementos*/
create table [ClientesSuplementos]
(
	[IdClientes] int references [Clientes]([Id]) not null,
	[IdSuplementos] int references [Suplementos]([Id]) not null,
	[CantidadCompraSuplementos] int not null,
	[ValorTotalCompra] decimal not null,
	[Id] int primary key ([IdClientes], [IdSuplementos])
);

/*Clientes-ClasesGrupales*/
create table [ClientesClasesGrupales]
(
	[IdClientes] int references [Clientes]([Id]) not null,
	[IdClasesGrupales] int references [ClasesGrupales]([Id]) not null,
	[Asistencias] int,
	[Id] int primary key ([Idclientes], [IdClasesGrupales])
);

	/*Tabla de relación muchos a muchos con Entrenadores*/
/*Entrenadores-ClasesGrupales*/
create table [EntrenadoresClasesGrupales]
(
	[IdEntrenadores] int references [Entrenadores]([Id]) not null,
	[IdClasesGrupales] int references [ClasesGrupales]([Id]) not null,
	[Id] int primary key (IdEntrenadores, IdClasesGrupales)
);

