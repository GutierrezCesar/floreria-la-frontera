-- Florería La Frontera — actualización de girasoles con fotos reales
-- Origen: revisión de images/facebook-archive/ (fb-023, fb-024, fb-025), ver product-notes.md.
-- Cómo usarlo: pegar en Supabase Dashboard > SQL Editor > New query > Run.
-- Seguro de correr una sola vez; si se corre dos veces duplicará el producto e insertará
-- otra fila de tier (revisar antes de repetir).

-- 1) Nuevo producto de catálogo: 12 girasoles + caja sorpresa (fb-025)
--    Precio estimado (99.90), igual que "Girasoles de Autor" — falta confirmar precio real.
insert into products (name, description, price, category, tag, keywords, img_url) values
  ('Doce Girasoles Sorpresa', '12 girasoles en arreglo floral + caja pequeña sorpresa', 99.90, 'Cumpleaños', '', 'girasoles doce caja sorpresa cumpleaños alegria', 'images/doce-girasoles-caja-sorpresa.jpg');

-- 2) Nuevo tier de Pack Builder para "seis girasoles" (fb-023)
insert into pack_tiers (pack_item_id, max_qty, img_url, label) values
  ('girasol', 6, 'images/arreglo-seis-girasoles.jpg', 'Girasoles — seis (referencial)');

-- 3) Reemplaza la foto del tier "sin tope" (antes ramo-girasoles-trio.jpg, que solo mostraba 3)
--    por la foto real de 12 girasoles (fb-025), más representativa del tier grande.
update pack_tiers
  set img_url = 'images/doce-girasoles-caja-sorpresa.jpg', label = 'Girasoles — doce (referencial)'
  where pack_item_id = 'girasol' and max_qty = 999999;
