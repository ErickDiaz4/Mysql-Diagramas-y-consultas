4/*Listar los clientes que tengan una o más cajas de ahorro y que en la segunda
letra de su apellido contenga una "e".*/

SELECT * FROM cuenta;
SELECT * FROM cliente;
SELECT * FROM cliente_x_cuenta;
SELECT * FROM cuenta_tipo;


SELECT cliente.nombre, cliente.apellido, cliente_x_cuenta.cliente_id, cliente_x_cuenta.cuenta_numero, cuenta.cuenta_tipo_id
FROM cliente
INNER JOIN cliente_x_cuenta ON cliente.id = cliente_x_cuenta.cliente_id
INNER JOIN cuenta ON cliente_x_cuenta.cuenta_numero = cuenta.numero
WHERE cuenta.cuenta_tipo_id = 1 AND cliente.apellido LIKE '_e%';

8/*Determinar el importe restante que falta por pagar para el préstamo número 45.*/

SELECT prestamo.id, pago.importe AS TotalPagado, prestamo.importe AS TotalPrestado, prestamo.id, 
       CONCAT('$ ',(prestamo.importe - pago.importe)) AS Restante
FROM pago
INNER JOIN prestamo ON pago.prestamo_id = prestamo.id
WHERE prestamo.id = 45;

SELECT * FROM pago;
SELECT * FROM prestamo;

/*18Listar los clientes que no tienen préstamos. Mostrar el apellido, nombre y email
del cliente.*/

SELECT * FROM cliente;
SELECT * FROM cliente_x_prestamo;
SELECT * FROM prestamo;

SELECT cliente.nombre, cliente.apellido, cliente.email, prestamo.importe AS ValorPrestamo
FROM cliente
LEFT JOIN cliente_x_prestamo ON cliente.id = cliente_x_prestamo.cliente_id
LEFT JOIN prestamo ON cliente_x_prestamo.prestamo_id = prestamo.id
WHERE importe IS NULL;

/*Mostrar el nombre, apellido, número de cuenta de todos los clientes que poseen
una cuenta tipo "CAJA DE AHORRO", cuyo saldo es mayor que $ 15000*/

SELECT * FROM cuenta;
SELECT * FROM cliente;
SELECT * FROM cliente_x_cuenta;
SELECT * FROM cuenta_tipo;


SELECT cliente_x_cuenta.cliente_id, cliente.nombre, cliente.apellido, cliente_x_cuenta.cuenta_numero, 
       cuenta.cuenta_tipo_id AS CuentaTipoAhorro, cuenta.saldo
FROM cliente
INNER JOIN cliente_x_cuenta ON cliente.id = cliente_x_cuenta.cliente_id
INNER JOIN cuenta ON cliente_x_cuenta.cuenta_numero = cuenta.numero
WHERE cuenta.cuenta_tipo_id = 1 AND cuenta.saldo > 15000;

/*24Se desea conocer el último acceso de cada cliente al sistema. Mostrar el nombre,
apellido y última fecha de acceso.*/

SELECT * FROM historial_acceso;

SELECT cliente.id AS IdUsuario, cliente.nombre, cliente.apellido,
        MAX(historial_acceso.acceso) AS max_fecha_acceso
FROM historial_acceso
INNER JOIN cliente ON historial_acceso.cliente_id = cliente.id
GROUP BY cliente.id, cliente.nombre, cliente.apellido, cliente.id 
ORDER BY  cliente.id ASC;

SELECT * FROM cliente


