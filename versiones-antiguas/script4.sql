SELECT * FROM usuario;
SELECT * FROM receta WHERE usuario_id_usuario=1;
SELECT * FROM receta_ingrediente WHERE receta_id_receta=2;

-- Filtro para unir 3 tablas. Encontramos todas las recetas, con sus ingredientes y cantidades
SELECT receta_ingrediente.receta_id_receta, receta.nombre_receta, receta_ingrediente.ingrediente_id_ingrediente, ingrediente.nombre_ingrediente, receta_ingrediente.cantidad_ingrediente, ingrediente.unidades_cantidad 
FROM receta_ingrediente 
JOIN receta ON receta_ingrediente.receta_id_receta=receta.id_receta 
JOIN ingrediente ON ingrediente_id_ingrediente=id_ingrediente;

-- Filtro para encontrar los ingredientes y cantidades de la receta "pan"
SELECT id_receta, nombre_receta, ingrediente_id_ingrediente, nombre_ingrediente, cantidad_ingrediente, unidades_cantidad 
FROM receta 
JOIN receta_ingrediente ON id_receta=receta_id_receta 
JOIN ingrediente ON ingrediente_id_ingrediente=id_ingrediente
WHERE nombre_receta="pan";

-- Para encontrar los ingredientes de la receta pan y añadirlos a la lista de la compra
INSERT INTO lista_compra (nombre_ingrediente, cantidad_ingrediente, unidades_cantidad)
SELECT nombre_ingrediente, cantidad_ingrediente, unidades_cantidad 
FROM receta 
JOIN receta_ingrediente ON id_receta=receta_id_receta 
JOIN ingrediente ON ingrediente_id_ingrediente=id_ingrediente
WHERE nombre_receta="pan";
