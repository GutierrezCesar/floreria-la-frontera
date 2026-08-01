-- Mismo principio que se aplicó a girasoles: agrega TODAS las fotos reales
-- descritas por el dueño que contienen rosas, agrupadas por el tier de
-- cantidad más cercano (fb-002=1 rosa, fb-004=2, fb-005=3, fb-014=6, fb-006=10).
insert into pack_tiers (pack_item_id, max_qty, img_url, label) values
  ('rosa', 5, 'images/pack-fresa-globo-corazon-girasol.jpg', 'Rosas — pack con globo y bebida, 1 rosa (referencial)'),
  ('rosa', 5, 'images/ramo-corbata-girasol-rosas-azules.jpg', 'Rosas — ramo corbata, 2 rosas azules (referencial)'),
  ('rosa', 5, 'images/arreglo-girasoles-rosas-azules.jpg', 'Rosas — 3 rosas azules + girasoles (referencial)'),
  ('rosa', 8, 'images/canasta-dia-madre-rosas-amarillas.jpg', 'Rosas — canasta 6 rosas amarillas (referencial)'),
  ('rosa', 999999, 'images/macetero-diez-rosas-azules.jpg', 'Rosas — macetero 10 rosas azules (referencial)');
