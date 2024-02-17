INSERT INTO socios (idSocios,dni, direccion, nombre, apellido)
values (1, 1003838084,'tvr 6 No 3A sur suetana T4 apto 301','Erick Santiago', 'Diaz Saavedra')

UPDATE socios SET direccion = 'Tvr 6 No 3A Sur Suetana Torre4 Apto 301' WHERE idsocios = 1 

SELECT * FROM socios
where idSocios = 1

ALTER TABLE `esquema_bases`.`socios` 
CHANGE COLUMN `idSocios` `idSocios` INT NOT NULL AUTO_INCREMENT ;

DELETE FROM socios where idSocios = 1
