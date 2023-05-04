CREATE VIEW productosventaDin AS 
SELECT Ventas.idventas, producto.nombre, productos_venta.cantidad, cliente.nombre AS cliente, [user].nombre AS usuario
FROM Ventas INNER JOIN
     [user] ON Ventas.iduser = [user].iduser INNER JOIN
     cliente ON Ventas.idcliente = cliente.idcliente INNER JOIN
     productos_venta ON Ventas.idventas = productos_venta.idventas INNER JOIN
     producto ON productos_venta.idproducto = producto.idproducto
WHERE Ventas.idventas > 68