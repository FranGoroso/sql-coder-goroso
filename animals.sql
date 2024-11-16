DROP DATABASE IF EXISTS animals;
CREATE DATABASE animals;

USE animals;

CREATE TABLE animals.personal (
    id_personal INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150),
    dni VARCHAR(20) UNIQUE, 
    email VARCHAR(20) UNIQUE
);

CREATE TABLE animals.cliente(
    id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) DEFAULT 'cliente-x@email.com',
    tipo_pago ENUM('EFECTIVO','DEBITO','CREDITO')
);

CREATE TABLE animals.productos(
    id_productos INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150),
    fecha_vencimiento DATE, 
    stock INT DEFAULT 100,
    unidad_medida VARCHAR(200), 
    precio DECIMAL(10, 2) DEFAULT 100.00
);

CREATE TABLE animals.proveedor(
    id_proveedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150),
    cuit VARCHAR(20) UNIQUE,
    encargado VARCHAR(150)
);

CREATE TABLE animals.venta(
    id_venta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_personal INT,
    id_cliente INT,
    precio_bruto DECIMAL(10, 2),
    valor_igi DECIMAL(3, 2),
    tiempo_venta DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE animals.citas_medicas(
    id_citas_medicas INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE animals.inventario (
    id_inventario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_producto INT
);

CREATE TABLE animals.pacientes(
    id_pacientes INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

ALTER TABLE 

animals

CREATE TABLE animals.detalle_venta(
    id_detalle_venta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_venta INT,
    id_producto INT,
    cantidad INT
);

CREATE TABLE animals.producto_proveedor(
    id_producto_proveedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_proveedores INT,
    id_productos INT,
    fechas_entregas DATE
);
