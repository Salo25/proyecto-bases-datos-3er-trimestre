--Punto 1
SELECT c.nombre, t.numero_socios
    FROM clientes c, tarjeta_socio t
    WHERE c.id = t.clientes_id;

SELECT c.nombre, t.telefono
    FROM telefonos t, clientes c
    WHERE t.clientes_id= c.id;

SELECT t.nombre, e.nombre, v.caja_registradora
    FROM tiendas t, empleados e, vendedor v
    WHERE t.id = e.tiendas_id AND e.id = v.id;
    
SELECT c.nombre, p.clientes_id, p.importe, p.fecha
    FROM clientes c, pedidos p
    WHERE p.clientes_id =c.id;

SELECT c.nombre, p.nombre
    FROM categorias c, productos p
    WHERE c.id= p.categorias_id;
    
--Punto 2

SELECT c.nombre, p.clientes_id, p.importe, p.fecha, pr.nombre
    FROM clientes c, pedidos p, linea_pedido lp, productos pr
    WHERE p.clientes_id =c.id AND p.id = lp.productos_id AND lp.productos_id = pr.id;
    
    