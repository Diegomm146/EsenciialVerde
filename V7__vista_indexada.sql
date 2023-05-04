CREATE VIEW dbo.ProductosVenta WITH schemabinding AS 
SELECT productos_venta.idventas, producto.nombre AS producto, productos_venta.cantidad, cliente.nombre AS cliente, [user].nombre AS usuario
FROM dbo.Ventas INNER JOIN
     dbo.[user] ON Ventas.iduser = [user].iduser INNER JOIN
     dbo.cliente ON Ventas.idcliente = cliente.idcliente INNER JOIN
     dbo.productos_venta ON Ventas.idventas = productos_venta.idventas INNER JOIN
     dbo.producto ON productos_venta.idproducto = producto.idproducto
WHERE Ventas.idventas > 68

CREATE UNIQUE CLUSTERED INDEX IDX_Vista_ProductosVenta -- Agregamos esta l?ea
ON dbo.ProductosVenta (idventas, cantidad)