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

--A partir de aqui lo hice yo Salo
    
SELECT p.nombre, c.nombre, sub.nombre
    FROM categorias c, productos p, subcategorias sub
        WHERE c.id = p.categorias_id AND p.subcategorias_id = sub.id;

--Punto 3
SELECT c.nombre, t.numero_socios
    FROM clientes c
    JOIN tarjeta_socio t ON c.id = t.clientes_id
        WHERE UPPER(c.nombre) LIKE 'A%';

SELECT c.nombre, t.telefono
    FROM telefonos t
    JOIN clientes c ON t.clientes_id= c.id
        WHERE TO_CHAR(t.telefono) LIKE '6%';

SELECT t.nombre AS "TIENDA", e.nombre, v.caja_registradora
    FROM tiendas t 
    JOIN empleados e ON t.id = e.tiendas_id
    JOIN vendedor v ON e.id = v.id
        WHERE t.nombre = 'la_plaza';

SELECT p.codigo_pedido, c.nombre, p.importe, p.fecha
    FROM clientes c
    JOIN pedidos p ON p.clientes_id =c.id
        WHERE p.importe >= 100;

SELECT p.nombre, c.nombre AS "CATEGORIA"
    FROM categorias c
    JOIN productos p ON c.id= p.categorias_id
        WHERE UPPER(c.nombre) = 'INFORMATICA';

SELECT p.codigo_pedido, c.nombre, p.importe, p.fecha, pr.nombre
    FROM clientes c
    JOIN pedidos p ON p.clientes_id = c.id
    JOIN linea_pedido lp ON p.id = lp.pedidos_id
    JOIN productos pr ON lp.productos_id = pr.id
        WHERE p.fecha BETWEEN
                            TO_DATE('01/03/2022', 'DD/MM/YYYY')
                            AND
                            TO_DATE('30/03/2022', 'DD/MM/YYYY');

SELECT p.nombre, c.nombre AS "CATEGORIA", sub.nombre AS "SUBCATEGORIA"
    FROM categorias c
    JOIN productos p ON c.id = p.categorias_id
    JOIN subcategorias sub ON p.subcategorias_id = sub.id
        WHERE UPPER(c.nombre) = 'ELECTRONICA' AND UPPER(sub.nombre) = 'ROBOTS ASPIRADORAS';

--Punto 4
SELECT e1.nombre, e2.nombre AS "DIRECTIVO"
    FROM empleados e1
    LEFT JOIN empleados e2 ON e1.empleados_id = e2.id;

--Punto 5
SELECT c.nombre, t.numero_socios
    FROM tarjeta_socio t
    RIGHT JOIN clientes c ON c.id = t.clientes_id;

--Punto 6
SELECT c.nombre, t.telefono, e.nombre AS "EMPLEADO"
    FROM clientes c
    FULL JOIN telefonos t ON t.clientes_id = c.id
    FULL JOIN empleados e ON e.id = t.empleados_id;
