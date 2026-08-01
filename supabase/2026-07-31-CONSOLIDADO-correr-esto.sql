-- CONSOLIDADO: correr este archivo completo una sola vez en el SQL Editor de Supabase.
-- Junta 3 cambios pendientes: segunda foto de "seis girasoles", fotos de "1-2 girasoles",
-- y fotos de rosas. Selecciona TODO este archivo y pégalo en un snippet NUEVO y vacío.

-- 1) Segunda foto de "seis girasoles" (fb-024)
insert into pack_tiers (pack_item_id, max_qty, img_url, label) values
  ('girasol', 6, 'images/arreglo-masculino-girasoles.jpg', 'Girasoles — seis, estilo para él (referencial)');

-- 2) Fotos de "1-2 girasoles" (fb-001, 002, 003, 004, 007, 008)
insert into pack_tiers (pack_item_id, max_qty, img_url, label) values
  ('girasol', 2, 'images/caja-sorpresa-vizio-girasol.jpg', 'Girasoles — caja sorpresa con chocolate (referencial)'),
  ('girasol', 2, 'images/pack-fresa-globo-corazon-girasol.jpg', 'Girasoles — pack con globo y bebida (referencial)'),
  ('girasol', 2, 'images/pack-dia-papa-hamburguesa-cerveza-girasol.jpg', 'Girasoles — pack Día del Padre (referencial)'),
  ('girasol', 2, 'images/ramo-corbata-girasol-rosas-azules.jpg', 'Girasoles — ramo corbata Día del Padre (referencial)'),
  ('girasol', 2, 'images/pack-dia-papa-globo-azul-girasol.jpg', 'Girasoles — pack globo azul (referencial)'),
  ('girasol', 2, 'images/pack-dia-papa-caja-torta-girasol.jpg', 'Girasoles — pack caja con torta (referencial)');

-- 3) Fotos de rosas (fb-002, 004, 005, 006, 014)
insert into pack_tiers (pack_item_id, max_qty, img_url, label) values
  ('rosa', 5, 'images/pack-fresa-globo-corazon-girasol.jpg', 'Rosas — pack con globo y bebida, 1 rosa (referencial)'),
  ('rosa', 5, 'images/ramo-corbata-girasol-rosas-azules.jpg', 'Rosas — ramo corbata, 2 rosas azules (referencial)'),
  ('rosa', 5, 'images/arreglo-girasoles-rosas-azules.jpg', 'Rosas — 3 rosas azules + girasoles (referencial)'),
  ('rosa', 8, 'images/canasta-dia-madre-rosas-amarillas.jpg', 'Rosas — canasta 6 rosas amarillas (referencial)'),
  ('rosa', 999999, 'images/macetero-diez-rosas-azules.jpg', 'Rosas — macetero 10 rosas azules (referencial)');
