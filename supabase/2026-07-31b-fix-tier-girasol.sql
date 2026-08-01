-- Corrección: la base ya tenía un tier de girasol en max_qty=3 (no 999999 como
-- asumía schema.sql), así que el UPDATE anterior no encontró fila para editar.
-- Esto deja el tier redundante de "3" y agrega el de "sin tope" (12 girasoles).

-- 1) Elimina el tier redundante (max_qty=3, foto vieja del trío) que se solapa
--    con el nuevo tier de "seis" (max_qty=6).
delete from pack_tiers where pack_item_id = 'girasol' and max_qty = 3;

-- 2) Agrega el tier "sin tope" que faltaba, con la foto real de 12 girasoles.
insert into pack_tiers (pack_item_id, max_qty, img_url, label) values
  ('girasol', 999999, 'images/doce-girasoles-caja-sorpresa.jpg', 'Girasoles — doce (referencial)');
