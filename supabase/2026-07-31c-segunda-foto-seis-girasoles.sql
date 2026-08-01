-- Agrega una segunda foto real al tier de "seis girasoles" (fb-024, variante
-- masculina). Ahora la vista previa del Pack Builder muestra TODAS las fotos
-- que compartan el mismo max_qty, no solo una.
insert into pack_tiers (pack_item_id, max_qty, img_url, label) values
  ('girasol', 6, 'images/arreglo-masculino-girasoles.jpg', 'Girasoles — seis, estilo para él (referencial)');
