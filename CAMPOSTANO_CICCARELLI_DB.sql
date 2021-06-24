GO
USE MASTER
GO
CREATE DATABASE CAMPOSTANO_CICCARELLI_DB
GO
USE CAMPOSTANO_CICCARELLI_DB

GO
CREATE TABLE TipoUsuario(
IdTipoUsuario INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(40) NOT NULL,
)

GO
CREATE TABLE Usuario (
IdUsuario INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(40) NOT NULL,
Apellido VARCHAR(100) NOT NULL,
Telefono VARCHAR(20) NULL,
Email VARCHAR(80) NOT NULL UNIQUE,
Contraseña VARCHAR(50) NOT NULL,
Dni VARCHAR(8) NOT NULL UNIQUE,
TipoUsuario int not null FOREIGN KEY REFERENCES TipoUsuario(IdTipoUsuario)

)

GO
CREATE TABLE Cliente (
IdCliente INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Estado BIT NOT NULL DEFAULT (1),
Dni VARCHAR(8) NOT NULL UNIQUE,
Domicilio VARCHAR(80) NOT NULL,
CuitCliente VARCHAR(12) NOT NULL UNIQUE,
RazonSocial VARCHAR(80) NOT NULL UNIQUE

)

GO
CREATE TABLE Proveedor (
IdProveedor INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Estado BIT NOT NULL DEFAULT (1),
RazonSocialProveedor VARCHAR(80) NOT NULL,
CuitProveedor VARCHAR(12) NOT NULL UNIQUE,
Domicilio VARCHAR(80) NOT NULL,
Email VARCHAR(80) NULL,
Telefono VARCHAR(20) NULL

)

GO
CREATE TABLE Marca (
IdMarca INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(40) NOT NULL,
)

GO
CREATE TABLE Tipo (
IdTipo INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(40) NOT NULL,
)

GO
CREATE TABLE Producto (
IdProducto INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Codigo VARCHAR (8) NOT NULL,
IdMarca INT NOT NULL FOREIGN KEY REFERENCES Marca(IdMarca),
IdTipo INT NOT NULL FOREIGN KEY REFERENCES Tipo(IdTipo),
PrecioCompra MONEY NOT NULL CHECK (PrecioCompra > 0),
Stock INT NOT NULL DEFAULT (0) CHECK (Stock >=0),
Ganancia tinyint NOT NULL CHECK (Ganancia >= 0 AND Ganancia<=100),
PrecioVenta MONEY NOT NULL CHECK (PrecioVenta > 0),
Descripcion VARCHAR(400) NULL,
IdProveedor INT NOT NULL FOREIGN KEY REFERENCES Proveedor(IdProveedor), 
ImagenUrl VARCHAR (400) NULL 

)

GO
CREATE TABLE MetodoPago(
IdMetodoPago INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(40) NOT NULL

)

GO 
CREATE TABLE TipoFactura(
IdTipoFactura INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(40) NOT NULL,

)

GO
CREATE TABLE ListaProductos (
IdListaProductos INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
IdProducto INT NOT NULL FOREIGN KEY REFERENCES Producto(IdProducto),
Cantidad INT NOT NULL CHECK (Cantidad > 0),
Subtotal MONEY NOT NULL CHECK (Subtotal >= 0),
Transaccion BIT NOT NULL,  --0 seria compra, 1 venta
IdProveedor int not null foreign key references Proveedor(IdProveedor)

)

GO
CREATE TABLE Compra (
IdCompra INT NOT NULL PRIMARY KEY IDENTITY(1,1),
IdProveedor INT NOT NULL FOREIGN KEY REFERENCES Proveedor(IdProveedor), 
Importe MONEY NOT NULL CHECK (Importe > 0),
MetodoPago INT NOT NULL FOREIGN KEY REFERENCES MetodoPago(IdMetodoPago), 
Fecha date null ,
IdListaProductos INT NOT NULL FOREIGN KEY REFERENCES ListaProductos(IdListaProductos) 
)

GO
CREATE TABLE Venta (
IdVenta INT NOT NULL PRIMARY KEY IDENTITY(1,1),
IdCliente INT NOT NULL FOREIGN KEY REFERENCES Cliente(IdCliente),
TipoFactura INT NOT NULL FOREIGN KEY REFERENCES TipoFactura(IdTipoFactura), 
IdListaProductos INT NOT NULL FOREIGN KEY REFERENCES ListaProductos(IdListaProductos), 
Fecha date not null,
Importe MONEY NOT NULL CHECK (Importe > 0),
MetodoPago INT NOT NULL FOREIGN KEY REFERENCES MetodoPago(IdMetodoPago), 
IdUsuario INT NOT NULL FOREIGN KEY REFERENCES Usuario(IdUsuario)

)

INSERT INTO TipoUsuario (Nombre) VALUES('Vendedor')
INSERT INTO TipoUsuario (Nombre) VALUES('Administrador')

INSERT INTO Usuario (Nombre, Apellido, Telefono, Email, Contraseña, Dni, TipoUsuario) VALUES('Juan', 'Lopez', '1158585445','juancarlosvendedor@hotmail.com', 'juanlo', '11322422', 1)
INSERT INTO Usuario (Nombre, Apellido, Telefono, Email, Contraseña, Dni, TipoUsuario) VALUES('Pedro', 'Martinez', '1120205445','pedromartinez@hotmail.com', 'pedro1', '23252421', 1)
INSERT INTO Usuario (Nombre, Apellido, Telefono, Email, Contraseña, Dni, TipoUsuario) VALUES('Andres', 'Pedruno', '1158585858','andresp@hotmail.com', 'andre2', '24252623', 1)
INSERT INTO Usuario (Nombre, Apellido, Telefono, Email, Contraseña, Dni, TipoUsuario) VALUES('Camila', 'Lopez', '1131323334','camilalopez@hotmail.com', 'camilalo', '48454745', 1)
INSERT INTO Usuario (Nombre, Apellido, Telefono, Email, Contraseña, Dni, TipoUsuario) VALUES('Juana', 'Perez', '1121222225','juanaperez@hotmail.com', 'juanape', '20232125', 1)
INSERT INTO Usuario (Nombre, Apellido, Telefono, Email, Contraseña, Dni, TipoUsuario) VALUES('Pablo', 'Pederezca', '1165566556','pabloprz@hotmail.com', 'pablope', '90525253', 1)
INSERT INTO Usuario (Nombre, Apellido, Telefono, Email, Contraseña, Dni, TipoUsuario) VALUES('Jorge', 'Buendia', '1145484749','jorgeadmin@hotmail.com', 'buendia', '34353636', 2)
INSERT INTO Usuario (Nombre, Apellido, Telefono, Email, Contraseña, Dni, TipoUsuario) VALUES('Maria', 'Angeles', '1157899874','mariaangeles@hotmail.com', 'mariangeles', '30303031', 2)

INSERT INTO Cliente (Dni, Domicilio, CuitCliente, RazonSocial) VALUES('20212324','yrigoyen 123', '20202123241', 'decoracion sa')
INSERT INTO Cliente (Dni, Domicilio, CuitCliente, RazonSocial) VALUES('54565656','san martin 12343', '20545656568', 'Maria Estela')
INSERT INTO Cliente (Dni, Domicilio, CuitCliente, RazonSocial) VALUES('55556556','calle alta 12223', '20555565564', 'Artic sh')
INSERT INTO Cliente (Dni, Domicilio, CuitCliente, RazonSocial) VALUES('10141516','las heras 10', '27101415163', 'Julieta Perez')
INSERT INTO Cliente (Dni, Domicilio, CuitCliente, RazonSocial) VALUES('11141516','belgrano 5', '27111415164', 'Maria Estela')
INSERT INTO Cliente (Dni, Domicilio, CuitCliente, RazonSocial) VALUES('12114455','el valle 2020', '27121144555', 'ferre srl')

INSERT INTO Proveedor (RazonSocialProveedor, CuitProveedor, Domicilio, Email, Telefono ) VALUES('ElectroArt', '27202526283', 'pedrozo 2003', NULL, NULL)
INSERT INTO Proveedor (RazonSocialProveedor, CuitProveedor, Domicilio, Email, Telefono ) VALUES('Electronica Arg', '27202554523', 'San marcos 203', NULL, '1154547878')
INSERT INTO Proveedor (RazonSocialProveedor, CuitProveedor, Domicilio, Email, Telefono ) VALUES('ElectroEnvios', '27232323233', 'Solis 6585', 'ElectroEnvios@gmail.com', NULL)
INSERT INTO Proveedor (RazonSocialProveedor, CuitProveedor, Domicilio, Email, Telefono ) VALUES('La Casa Electronica', '27252929283', 'Suecia 101', NULL, NULL)
INSERT INTO Proveedor (RazonSocialProveedor, CuitProveedor, Domicilio, Email, Telefono ) VALUES('Comercio del electrodomestico', '20252424263', 'Portugal 12233', 'ventaselectro@gmail.com', NULL)
INSERT INTO Proveedor (RazonSocialProveedor, CuitProveedor, Domicilio, Email, Telefono ) VALUES('decogar', '30252525256', 'pedrozo 12365', NULL, NULL)
INSERT INTO Proveedor (RazonSocialProveedor, CuitProveedor, Domicilio, Email, Telefono ) VALUES('decorando hogares SA', '30323536347', 'Carlos salvador 20222', NULL, '1145653623')
INSERT INTO Proveedor (RazonSocialProveedor, CuitProveedor, Domicilio, Email, Telefono ) VALUES('Electronic Arg', '20262524298', 'La rivera 5078', NULL, '1120304050')

INSERT INTO Marca (Nombre) VALUES('Samsung')
INSERT INTO Marca (Nombre) VALUES('Hyundai')
INSERT INTO Marca (Nombre) VALUES('Sanyo')
INSERT INTO Marca (Nombre) VALUES('Electra')
INSERT INTO Marca (Nombre) VALUES('Noblex')
INSERT INTO Marca (Nombre) VALUES('Iqual')
INSERT INTO Marca (Nombre) VALUES('Xiaomi')

INSERT INTO Tipo (Nombre) VALUES('Televisor')
INSERT INTO Tipo (Nombre) VALUES('Consolas')
INSERT INTO Tipo (Nombre) VALUES('Celulares')
INSERT INTO Tipo (Nombre) VALUES('Aire Acondicionado')
INSERT INTO Tipo (Nombre) VALUES('Lavarropa')
INSERT INTO Tipo (Nombre) VALUES('Heladera')
INSERT INTO Tipo (Nombre) VALUES('Cocina')

INSERT INTO Producto (Codigo, IdMarca, IdTipo, PrecioCompra, Stock, Ganancia, PrecioVenta, Descripcion, IdProveedor, ImagenUrl) VALUES('CGH600', 1, 1, '20000', '20', '50', '40000', 'Televisor de 42 Pulgadas Full HD HDMI, Reconocida Marca, Gran definicion', 1, 'https://images.samsung.com/is/image/samsung/latin_UN37C5000QFXZA_001_Front?$LazyLoad_Home_IMG$')
INSERT INTO Producto (Codigo, IdMarca, IdTipo, PrecioCompra, Stock, Ganancia, PrecioVenta, Descripcion, IdProveedor, ImagenUrl) VALUES('HGJ1212', 1, 1, '7500', '20', '50', '15000', 'Excelente Televisor 24 Pulgadas', 1, 'https://images.samsung.com/is/image/samsung/latin-uhd-tu8000-un50tu8000pxpa-frontblack-229165727?$720_576_PNG$')
INSERT INTO Producto (Codigo, IdMarca, IdTipo, PrecioCompra, Stock, Ganancia, PrecioVenta, Descripcion, IdProveedor, ImagenUrl) VALUES('WWE2020', 2, 2, '17500', '20', '50', '35000', 'Consola video juegos', 2, 'https://icdn.dtcn.com/image/digitaltrends_es/playstation-5-side-view-416x278.jpg')
INSERT INTO Producto (Codigo, IdMarca, IdTipo, PrecioCompra, Stock, Ganancia, PrecioVenta, Descripcion, IdProveedor, ImagenUrl) VALUES('565898', 2, 2, '20000', '20', '50', '40000', 'Consola con juegos incluidos', 2, 'https://i.blogs.es/ad8440/ps4xbox/1366_2000.jpg')
INSERT INTO Producto (Codigo, IdMarca, IdTipo, PrecioCompra, Stock, Ganancia, PrecioVenta, Descripcion, IdProveedor, ImagenUrl) VALUES('C32HJ', 3, 3, '20000', '20', '50', '40000', 'Celular libre', 3, 'https://celularpark.com.ar/wp-content/uploads/2020/04/hydroglass-celular-1.jpg')
INSERT INTO Producto (Codigo, IdMarca, IdTipo, PrecioCompra, Stock, Ganancia, PrecioVenta, Descripcion, IdProveedor, ImagenUrl) VALUES('KUJ234', 3, 3, '22500', '20', '50', '45000', 'celular gran cantidad de memoria interna', 3, 'https://www.eltiempo.com/files/article_content/files/crop/uploads/2020/02/03/5e38409f1bcb0.r_1580745285279.168-0-1128-720.jpeg')
INSERT INTO Producto (Codigo, IdMarca, IdTipo, PrecioCompra, Stock, Ganancia, PrecioVenta, Descripcion, IdProveedor, ImagenUrl) VALUES('RAR22', 4, 4, '22500', '20', '50', '45000', 'Aire acondicionado spli 2800 frigorias', 4, 'https://saturnohogar.com.ar/2690-large_default/aire-acondicionado-alaska-split-fr%C3%ADocalor-2322-frigor%C3%ADas-blanco-220v-als26wccr.jpg')
INSERT INTO Producto (Codigo, IdMarca, IdTipo, PrecioCompra, Stock, Ganancia, PrecioVenta, Descripcion, IdProveedor, ImagenUrl) VALUES('KL1234', 4, 4, '5000', '20', '50', '10000', 'Aire portatil', 4, 'https://www.megatone.net/Images/Articulos/zoom2x/247/AIR3528TCL.jpg')
INSERT INTO Producto (Codigo, IdMarca, IdTipo, PrecioCompra, Stock, Ganancia, PrecioVenta, Descripcion, IdProveedor, ImagenUrl) VALUES('JUY890', 5, 5, '20000', '20', '50', '40000', 'Lavarropas con centrifugado veloz', 5, 'https://d34zlyc2cp9zm7.cloudfront.net/products/70e6d0dc191f1cb3c2dc6589eb4ffd99fd795bee94b53a46090592d13aa4db31.jpg_500')
INSERT INTO Producto (Codigo, IdMarca, IdTipo, PrecioCompra, Stock, Ganancia, PrecioVenta, Descripcion, IdProveedor, ImagenUrl) VALUES('J3000', 6, 6, '20000', '20', '50', '40000', 'Heladera bajo consumo electrico', 5, 'https://http2.mlstatic.com/D_NQ_NP_945764-MLA31351725173_072019-O.jpg')
INSERT INTO Producto (Codigo, IdMarca, IdTipo, PrecioCompra, Stock, Ganancia, PrecioVenta, Descripcion, IdProveedor, ImagenUrl) VALUES('F7000', 6, 6, '30000', '20', '50', '60000', 'Heladera con freezer amplio', 6, 'https://http2.mlstatic.com/D_NQ_NP_814422-MLA32122412017_092019-O.jpg')

INSERT INTO MetodoPago (Nombre) VALUES('Tarjeta Credito')
INSERT INTO MetodoPago (Nombre) VALUES('Tarjeta Debito')
INSERT INTO MetodoPago (Nombre) VALUES('Tarjeta Prepaga')
INSERT INTO MetodoPago (Nombre) VALUES('Transferencia Bancaria')
INSERT INTO MetodoPago (Nombre) VALUES('Mercado Pago')

INSERT INTO TipoFactura (Nombre) VALUES('Factura A')
INSERT INTO TipoFactura (Nombre) VALUES('Factura B')
INSERT INTO TipoFactura (Nombre) VALUES('Factura C')
INSERT INTO TipoFactura (Nombre) VALUES('Consumidor Final')

INSERT INTO ListaProductos (IdProducto, Cantidad, Subtotal, Transaccion, IdProveedor) VALUES(1, '20', '100000', '0', 1)
INSERT INTO ListaProductos (IdProducto, Cantidad, Subtotal, Transaccion, IdProveedor) VALUES(2, '20', '200000', '0', 2)
INSERT INTO ListaProductos (IdProducto, Cantidad, Subtotal, Transaccion, IdProveedor) VALUES(3, '20', '300000', '0', 3)

INSERT INTO Compra (IdProveedor, Importe, MetodoPago, Fecha, IdListaProductos) VALUES(1, '50000', 4,'2021/03/20', 1)
INSERT INTO Compra (IdProveedor, Importe, MetodoPago, Fecha, IdListaProductos) VALUES(3, '70000', 5,'2021/05/28', 1)
INSERT INTO Compra (IdProveedor, Importe, MetodoPago, Fecha, IdListaProductos) VALUES(4, '40000', 1,'2021/07/11', 3)


INSERT INTO Venta (IdCliente, TipoFactura, IdListaProductos, Fecha, Importe, MetodoPago, IdUsuario) VALUES (1, 1, 1, '2021/05/11', '70000',1, 1)
INSERT INTO Venta (IdCliente, TipoFactura, IdListaProductos, Fecha, Importe, MetodoPago, IdUsuario) VALUES (3, 2, 2, '2021/04/15', '40000',2, 1)
INSERT INTO Venta (IdCliente, TipoFactura, IdListaProductos, Fecha, Importe, MetodoPago, IdUsuario) VALUES (4, 3, 3, '2021/03/20', '36000',3, 2)
INSERT INTO Venta (IdCliente, TipoFactura, IdListaProductos, Fecha, Importe, MetodoPago, IdUsuario) VALUES (6, 4, 3, '2021/01/22', '50000',4, 3)


--IDEAS QUE FUERON SURGIENDO Y ANTIGUOS PLANTEOS

/*
original
GO
CREATE TABLE Factura (
IdFactura INT NOT NULL PRIMARY KEY IDENTITY(1,1),
IdCliente INT NOT NULL FOREIGN KEY REFERENCES Cliente(IdCliente),--ACA VA FOREN
TipoFactura INT NOT NULL FOREIGN KEY REFERENCES TipoFactura(IdTipoFactura), --ACA VA FOREN
IdListaProductos INT NOT NULL FOREIGN KEY REFERENCES ListaProductos(IdListaProductos), --ACA VA FOREN
Fecha date not null,
Importe MONEY NOT NULL CHECK (Importe > 0),
MetodoPago INT NOT NULL FOREIGN KEY REFERENCES MetodoPago(IdMetodoPago), --ACA VA FOREN
IdVenta INT NOT NULL FOREIGN KEY REFERENCES Venta(IdVenta)

)
*/
-- o sino guardar en base unicamente, quien lo vendio, num factura unidades? importe total?

---problema de si son varios productos
-- esto si o si se deberia guardar en la base
-- se podria guarda cantidad total y importe total en la base

--VER QUE ONDA XQ NOSE COMO GUARDARA VARIOS PRODUCTOS DE LA LISTA DE COMPRA
--deberia ser carrito mismo de la app y no guardar el carrito en la base

/* sino para guardar la lista podria ser
VER LO DEL PROBLEMA QUE HABRIA QUE ID LISTA PRODUCTO
SEA IDENTITY. OSEA DEBERIA SER LA MISMA ID LISTA
PERO QUE BUSQUE CON VARIOS PRODUCTOS DE LA ID VENTA
DEBERIA TENER UNA COLUMNA PARA INGRESAR NUMERO VENTA? Y ASI IR GUARDANDO
LOS REGISTROS? DE LOS ITEMs?
Y SI SE GUARDA CON UN WHILE? Y UN FOR? MEDIO A LA FUERZA?
ONDA QUE GUARDE ID LISTA PRODUCTO EN EL WHILE Y ESCRIBA SIEMPRE EL MISMO
EN LA FILA HASTA QUE NO SE TERMINE X COSA DE LA CONDICION
Y EN EL FOR HAGA EL UPDATE A LA BASE PRODUCTO Y CARACTERISTICA FILA POR FILA
Y LUEGO PARA LA FACTURA BUSCAMOS LA IDLISTAPRODUCTOS Y TENEMOS TODAS LAS HILERAS*/

/*

create table ListaProductos(
IdListaProductos INT NOT NULL PRIMARY KEY INDENTITY(1,1),
IdProducto INT NOT NULL, -- ACA VA FOREN
Cantidad INT NOT NULL CHECK (Cantidad > 0),
---Precio unitario ?
Subtotal MONEY NOT NULL CHECK (Subtotal >= 0),
IdVenta INT NOT NULL , --ACA VA FOREN

)*/

-- CODIGO DE PRODUCTO SOLO ENTERO? LE AGREGO CODIGO? NO LO TIENE
-- SERIA UN VARCHAR?
/*
GO
CREATE TABLE Venta (
IdVenta INT NOT NULL PRIMARY KEY IDENTITY(1,1),
IdVendedor INT NOT NULL FOREIGN KEY REFERENCES Usuario(IdUsuario), --ACA VA FOREN  -- aca seria id de usuario que sea vendedor calculo o todos
IdFactura --ACA VA FOREN
IdCliente
    
)*/


--TipoUsuario podria ir? para ver cual de ambos son, si admin o vendedor
--en vez de una administrador y una vendedor, hacer una tabla tipo usuario
-- y ahi diferenciarlos?
-- o sera bit? y 0 es vende y 1 admin
-- hay que agregar estado?
/*
GO
CREATE TABLE Administrador (
IdAdministrador INT NOT NULL PRIMARY KEY IDENTITY(1,1), --ACA VA FOREN
Estado BIT NOT NULL DEFAULT (1)
)

GO
CREATE TABLE Vendedor (
IdVendedor INT NOT NULL PRIMARY KEY IDENTITY(1,1),--ACA VA FOREN
Estado BIT NOT NULL DEFAULT (1)
)*/
