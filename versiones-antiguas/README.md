# DATABASE MODEL FOR LA RECETTE SOCIAL

## Introducción

Somos una start-up de nueva creación que quiere construir la primera red social de recetas. La idea de negocio es que los usuarios registrados pueden dar de alta recetas en modo público o privado y consultar recetas de otros usuarios. Los ingredientes de las recetas se pueden guardar en una lista de la compra. Con el tiempo se quiere ofrecer la posibilidad de comprar los ingredientes directamente desde la misma aplicación.

PASTEL: harina 100 gr, huevos 4

- TABLE: RECETA

id

name: ‘pastel’

ingredientes: ‘harina 100g, huevos 4’

- TABLE: INGREDIENTE

id: 1 name: harina measure_unit_id:1

id: 2 name: huevo measure_unit_id:2

- RECETA_INGREDIENTE

id_receta: 1 id_ingrediente: 1, quantity: 100

id_receta:1 id_ingrediente: 2, quantity: 4

MEASURE_UNIT

id: 1 name: ‘gramos’

id: 2 name: ‘units’

## Requerimientos

1. Cuando se seleccione alguna **receta** se pueden enviar alguno o todos los **ingredientes** necesarios a una **lista de la compra**.
2. La lista se podrá descargar para ser impresa o directamente desde el móvil se puede mostrar.
3. Si seleccionan distintas recetas con los mismos productos, en la lista de la compra deberán sumarse las cantidades.
4. Los ingredientes se tienen que seleccionar de una lista predefinida de ingredientes.
5. Los usuarios tienen que registrarse para poder dar de alta una receta pero no es necesario que se registren para consultar las recetas.
6. Las recetas se pueden valorar, añadir a listas de favoritos y compartir con otros usuarios o colgarlas en redes sociales
7. Se podrán buscar recetas por: valoraciones, ingredientes, tipo de receta, tiempo de cocina, etc.
8. Las recetas cuando se clican para consultarlas quedan marcadas como vistas y también podrán ser consultadas las recetas más vistas.
9. Los usuarios más activos podrán recibir insignias. Las insignias pueden tener regalos o beneficiarse de promociones, descuentos, etc.
10. Los usuarios pueden formar parte de grupos e intercambiar las recetas dentro del grupo.
11. El grupo será administrado por el usuario que lo cree.
12. Un usuario puede pertenecer a más de un grupo.
13. Los grupos pueden marcar los filtros que quieren aplicar a las recetas del grupo.
14. Los usuarios recibirán notificaciones de nuevas recetas, comentarios, etc. de un grupo.
15. Todos los usuarios recibirán notificaciones de las actividades generales de la página.
16. Se podrá definir la semana de algún ingrediente, país, etc. y esa semana en la página principal de la app aparecerán esas recetas.
17. Se podrán realizar menús semanales eligiendo varias recetas.
18. Los menús podrán tener un nombre y también pueden ser compartidos, valorados y comentados.
19. Los usuarios podrán acceder a su perfil y modificar sus datos.
20. Los usuarios tendrán un apartado donde verán sus recetas (públicas y privadas)
21. Los usuarios podrán ver las recetas que han marcado como favoritas y desmarcarlas
22. Los usuarios podrán ver los menús que han hecho, modificarlos o eliminarlos

# Requisitos técnicos

- Se utilizará un SGBD MySQL o MongoDB para la implementación.

# Entregables

- Modelo lógico de la base de datos.
- Fichero de dump de la base de datos.
- Fichero con los modelos de consultas que habría que implementar en la API.
- Presentación, debe incluir alguna consulta a la base de datos

# Modalidad

- Trabajo individual o en grupo
- Tiempo máximo 1 semana - Entrega 16/01/2023