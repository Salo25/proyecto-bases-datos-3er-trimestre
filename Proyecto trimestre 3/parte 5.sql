CREATE OR REPLACE FUNCTION producto_agotado(p_stock IN NUMBER, p_stock_total IN NUMBER) RETURN NUMBER 
AS
    var_suma NUMBER := 0;
BEGIN
    var_suma := p_stock_total + p_stock;
    RETURN var_suma;
END;


DECLARE
    CURSOR cur_stock IS
        SELECT  p.nombre AS "PRODUCTO", tp.disponibilidad, t.nombre AS "TIENDA"
            FROM productos p
            JOIN tienda_producto tp ON tp.productos_id = p.id
            JOIN tiendas t ON t.id = tp.tiendas_id;
    rec_producto cur_stock % ROWTYPE;
    var_stock_total NUMBER := 0;
    /*
    var_stock_mac NUMBER := 0;
    var_stock_avatar NUMBER := 0;
    var_stock_rumba NUMBER := 0;
    var_stock_ssd NUMBER := 0;
    */
BEGIN
    OPEN cur_stock;
    FETCH cur_stock INTO rec_producto;
    
    WHILE cur_stock % FOUND LOOP
        /*
        --DBMS_OUTPUT.PUT_LINE('PRODUCTO: ' || rec_producto.producto || ' STOCK: ' || rec_producto.disponibilidad || ' TIENDA: ' || rec_producto.tienda);
        IF UPPER(rec_producto.producto) = 'MAC' THEN
            var_stock_mac := producto_agotado(rec_producto.disponibilidad, var_stock_mac);
        ELSIF UPPER(rec_producto.producto) = 'AVATAR' THEN
            var_stock_avatar := producto_agotado(rec_producto.disponibilidad, var_stock_avatar);
        ELSIF UPPER(rec_producto.producto) = 'RUMBA' THEN
            var_stock_rumba := producto_agotado(rec_producto.disponibilidad, var_stock_rumba);
        ELSIF UPPER(rec_producto.producto) = 'SSD 500 GB' THEN
            var_stock_ssd := producto_agotado(rec_producto.disponibilidad, var_stock_ssd);
        END IF;
        */
        
        var_stock_total := producto_agotado(rec_producto.disponibilidad, var_stock_total);
        FETCH cur_stock INTO rec_producto;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('TOTAL STOCK: ' || var_stock_total);
END;