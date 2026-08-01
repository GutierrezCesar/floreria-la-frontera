-- Agrega más fotos reales al tier de "1-2 girasoles" (fb-001, 002, 003, 004, 007, 008),
-- todas descritas por el dueño como packs/arreglos que incluyen 1 girasol.
-- Se muestran junto a la foto que ya existía ahí (girasoles-envueltos-periodico.jpg).
insert into pack_tiers (pack_item_id, max_qty, img_url, label) values
  ('girasol', 2, 'images/caja-sorpresa-vizio-girasol.jpg', 'Girasoles — caja sorpresa con chocolate (referencial)'),
  ('girasol', 2, 'images/pack-fresa-globo-corazon-girasol.jpg', 'Girasoles — pack con globo y bebida (referencial)'),
  ('girasol', 2, 'images/pack-dia-papa-hamburguesa-cerveza-girasol.jpg', 'Girasoles — pack Día del Padre (referencial)'),
  ('girasol', 2, 'images/ramo-corbata-girasol-rosas-azules.jpg', 'Girasoles — ramo corbata Día del Padre (referencial)'),
  ('girasol', 2, 'images/pack-dia-papa-globo-azul-girasol.jpg', 'Girasoles — pack globo azul (referencial)'),
  ('girasol', 2, 'images/pack-dia-papa-caja-torta-girasol.jpg', 'Girasoles — pack caja con torta (referencial)');
