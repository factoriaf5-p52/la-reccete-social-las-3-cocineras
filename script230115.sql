-- Filtro para unir 3 tablas. Encontramos todas las recetas, con sus ingredientes y cantidades
SELECT receta_ingrediente.receta_id_receta, receta.nombre_receta, receta_ingrediente.ingrediente_id_ingrediente, ingrediente.nombre_ingrediente, receta_ingrediente.cantidad_ingrediente, ingrediente.unidades_cantidad
FROM receta_ingrediente
JOIN receta ON receta_ingrediente.receta_id_receta=receta.id_receta
JOIN ingrediente ON ingrediente_id_ingrediente=id_ingrediente;

-- Filtro para encontrar los ingredientes y cantidades de la receta “pan”
SELECT id_receta, nombre_receta, ingrediente_id_ingrediente, nombre_ingrediente, cantidad_ingrediente, unidades_cantidad
FROM receta
JOIN receta_ingrediente ON id_receta=receta_id_receta
JOIN ingrediente ON ingrediente_id_ingrediente=id_ingrediente
WHERE nombre_receta=“pan”;

-- Para encontrar los ingredientes de la receta pan y añadirlos a la lista de la compra
INSERT INTO lista_compra (nombre_ingrediente, cantidad_ingrediente, unidades_cantidad)
SELECT nombre_ingrediente, cantidad_ingrediente, unidades_cantidad
FROM receta
JOIN receta_ingrediente ON id_receta=receta_id_receta
JOIN ingrediente ON ingrediente_id_ingrediente=id_ingrediente
WHERE nombre_receta=“pan”;

-- Para buscar recetas por valoración orden descendiente
SELECT id_receta, nombre_receta, valoracion
FROM receta ORDER BY valoracion DESC;

-- Para buscar recetas por tiempo de cocina
SELECT id_receta, nombre_receta, tiempo_cocina
FROM receta ORDER BY tiempo_cocina;

-- Para buscar recetas por orden de visitas en orden descendiente
SELECT id_receta, nombre_receta, num_visitas
FROM receta ORDER BY num_visitas DESC;

-- Para buscar administradoras de los grupos
SELECT * FROM grupo
JOIN usuario ON usuario_id_administrador=id_usuario;

-- Para buscar recetas por país
SELECT id_receta, nombre_receta, país FROM receta;

-- Para buscar recetas favoritas de un usuario
SELECT id_favorito, favorito.usuario_id_usuario, favorito.id_receta, nombre_receta FROM favorito
JOIN receta ON favorito.id_receta=receta.id_receta;

-- Para buscar recetas favoritas de sablina
SELECT id_favorito, favorito.usuario_id_usuario, nombre_usuario, favorito.id_receta, nombre_receta FROM favorito
JOIN receta ON favorito.id_receta=receta.id_receta
JOIN usuario ON favorito.usuario_id_usuario=id_usuario
WHERE nombre_usuario=“sablina”;

-- Para buscar menus del usuario sablina en la semana 2
SELECT id_menu, semana, nombre_menu, menu.id_receta, nombre_receta, menu.usuario_id_usuario, nombre_usuario FROM menu
JOIN receta ON menu.id_receta=receta.id_receta
JOIN usuario ON menu.usuario_id_usuario=id_usuario
WHERE nombre_usuario=“sablina” AND semana=2;