CREATE database Almacen; 
USE Almacen;

/* Table Entrada */

CREATE  TABLE Entrada (
  idEntrada INT NOT NULL IDENTITY,
  FechaEntrada DATE NOT NULL ,
  PRIMARY KEY (idEntrada) )

/* Table Salida*/


CREATE  TABLE Salida (

  idSalida INT NOT NULL IDENTITY ,

  PRIMARY KEY (idSalida) )

/*Table venta*/

CREATE  TABLE  venta (

  idVenta INT NOT NULL IDENTITY ,

  PRIMARY KEY (idVenta) )

/*Table Productos*/

CREATE  TABLE  Productos (

  idProductos INT NOT NULL IDENTITY ,

  PRIMARY KEY (idProductos) )

/* Table Compras*/

CREATE  TABLE  Compras (

  idCompras INT NOT NULL IDENTITY ,

  PRIMARY KEY (idCompras) )

/* Table De_Venta*/

CREATE  TABLE  De_Venta (
  Productos_idProductos INT NOT NULL ,
  venta_idVenta INT NOT NULL ,
  PRIMARY KEY (Productos_idProductos, venta_idVenta) ,
  CONSTRAINT fk_Productos_has_venta_Productos1    FOREIGN KEY (Productos_idProductos )    REFERENCES Productos (idProductos )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Productos_has_venta_venta1    FOREIGN KEY (venta_idVenta )    REFERENCES venta (idVenta )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

/* Table De_Compra*/

CREATE  TABLE  De_Compra (
  Productos_idProductos INT NOT NULL ,
  Compras_idCompras INT NOT NULL ,
  PRIMARY KEY (Productos_idProductos, Compras_idCompras) ,
  CONSTRAINT fk_Productos_has_Compras_Productos1    FOREIGN KEY (Productos_idProductos )    REFERENCES Productos (idProductos )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Productos_has_Compras_Compras1    FOREIGN KEY (Compras_idCompras )    REFERENCES Compras (idCompras )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    
/* Table DetalleSalida*/

CREATE  TABLE  DetalleSalida (
  Salida_idSalida INT NOT NULL ,
  venta_idVenta INT NOT NULL ,
  PRIMARY KEY (Salida_idSalida, venta_idVenta) ,
  CONSTRAINT fk_Salida_has_venta_Salida1    FOREIGN KEY (Salida_idSalida )    REFERENCES Salida (idSalida )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Salida_has_venta_venta1
    FOREIGN KEY (venta_idVenta )
    REFERENCES venta (idVenta )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

/* Table DetalleEntrada*/

CREATE  TABLE  DetalleEntrada (
  Entradas_idEntrada INT NOT NULL ,
  De_Compra_Productos_idProductos INT NOT NULL ,
  De_Compra_Compras_idCompras INT NOT NULL ,
  Cantidad FLOAT NOT NULL ,
  PRIMARY KEY (Entradas_idEntrada, De_Compra_Productos_idProductos, De_Compra_Compras_idCompras) ,
  CONSTRAINT fk_Entradas_has_De_Compra_Entradas1    FOREIGN KEY (Entradas_idEntrada )    REFERENCES Entrada (idEntrada )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Entradas_has_De_Compra_De_Compra1    FOREIGN KEY (De_Compra_Productos_idProductos , De_Compra_Compras_idCompras )    REFERENCES De_Compra (Productos_idProductos , Compras_idCompras )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)