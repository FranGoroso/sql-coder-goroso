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
    id_citas_medicas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_pacientes INT,
    id_personal INT
);

CREATE TABLE animals.inventario (
    id_inventario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_producto INT
);

CREATE TABLE animals.pacientes(
    id_pacientes INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE animals.detalle_venta(
    id_detalle_venta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_venta INT,
    id_producto INT,
    cantidad INT
);

CREATE TABLE animals.producto_proveedor(
    id_producto_proveedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT,
    id_productos INT,
    fechas_entregas DATE
);

-- Relación en la tabla venta
ALTER TABLE animals.venta
ADD CONSTRAINT fk_venta_personal
FOREIGN KEY (id_personal) REFERENCES animals.personal(id_personal);

ALTER TABLE animals.venta
ADD CONSTRAINT fk_venta_cliente
FOREIGN KEY (id_cliente) REFERENCES animals.cliente(id_cliente);

-- Relación en la tabla detalle_venta
ALTER TABLE animals.detalle_venta
ADD CONSTRAINT fk_detalle_cliente
FOREIGN KEY (id_cliente) REFERENCES animals.cliente(id_cliente);

ALTER TABLE animals.detalle_venta
ADD CONSTRAINT fk_detalle_venta
FOREIGN KEY (id_venta) REFERENCES animals.venta(id_venta);

ALTER TABLE animals.detalle_venta
ADD CONSTRAINT fk_detalle_producto
FOREIGN KEY (id_producto) REFERENCES animals.productos(id_productos);

-- Relación en la tabla producto_proveedor
ALTER TABLE animals.producto_proveedor
ADD CONSTRAINT fk_producto_proveedor_proveedor
FOREIGN KEY (id_proveedor) REFERENCES animals.proveedor(id_proveedor);

ALTER TABLE animals.producto_proveedor
ADD CONSTRAINT fk_producto_proveedor_producto
FOREIGN KEY (id_productos) REFERENCES animals.productos(id_productos);

-- Relación en la tabla inventario
ALTER TABLE animals.inventario
ADD CONSTRAINT fk_inventario_producto
FOREIGN KEY (id_producto) REFERENCES animals.productos(id_productos);

-- Relaciones en la tabla citas_medicas
ALTER TABLE animals.citas_medicas
ADD CONSTRAINT fk_citas_pacientes
FOREIGN KEY (id_pacientes) REFERENCES animals.pacientes(id_pacientes);

ALTER TABLE animals.citas_medicas
ADD CONSTRAINT fk_citas_personal
FOREIGN KEY (id_personal) REFERENCES animals.personal(id_personal);
