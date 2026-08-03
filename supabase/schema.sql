-- Florería La Frontera — schema inicial de Supabase
-- Cómo usarlo: pegar este archivo completo en Supabase Dashboard > SQL Editor > New query > Run.
-- Es seguro correrlo una sola vez sobre un proyecto nuevo y vacío.

-- ============ Tablas ============

create table products (
  id bigint generated always as identity primary key,
  name text not null,
  description text not null default '',
  price numeric(10,2) not null,
  category text not null,
  tag text not null default '',
  keywords text not null default '',
  img_url text not null,
  presentation text not null default '',
  occasion text not null default '',
  created_at timestamptz not null default now()
);

-- "type" es la categoría del ítem tal como se muestra en el sitio (ej. "Flores", "Chocolates",
-- "Peluches", "Postres"...) — es texto libre, no una lista fija, para que el admin pueda crear
-- categorías nuevas sin tocar la base de datos.
create table pack_items (
  id text primary key,
  type text not null,
  name text not null,
  price numeric(10,2) not null,
  img_url text not null
);

-- max_qty = 999999 representa "sin tope" (equivalente al Infinity del JS original)
create table pack_tiers (
  id bigint generated always as identity primary key,
  pack_item_id text not null references pack_items(id) on delete cascade,
  max_qty integer not null,
  img_url text not null,
  label text not null
);

-- ============ Row Level Security ============
-- Lectura pública (el sitio del cliente no requiere login).
-- Escritura solo para usuarios autenticados (el admin logueado).

alter table products enable row level security;
alter table pack_items enable row level security;
alter table pack_tiers enable row level security;

create policy "Public read products" on products for select using (true);
create policy "Public read pack_items" on pack_items for select using (true);
create policy "Public read pack_tiers" on pack_tiers for select using (true);

create policy "Authenticated write products" on products for all
  using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');
create policy "Authenticated write pack_items" on pack_items for all
  using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');
create policy "Authenticated write pack_tiers" on pack_tiers for all
  using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');

-- ============ Storage (fotos que suba el admin) ============

insert into storage.buckets (id, name, public)
values ('product-images', 'product-images', true);

create policy "Public read product images" on storage.objects
  for select using (bucket_id = 'product-images');
create policy "Authenticated upload product images" on storage.objects
  for insert with check (bucket_id = 'product-images' and auth.role() = 'authenticated');
create policy "Authenticated update product images" on storage.objects
  for update using (bucket_id = 'product-images' and auth.role() = 'authenticated');
create policy "Authenticated delete product images" on storage.objects
  for delete using (bucket_id = 'product-images' and auth.role() = 'authenticated');

-- ============ Datos semilla (los mismos que hoy están hardcodeados en index.html) ============

insert into products (name, description, price, category, tag, keywords, img_url) values
  ('Ramo con Dedicatoria', 'Rosas y alstroemerias blancas + libro de regalo', 129.90, 'Románticos', 'Más vendido', 'rosas blancas libro romantico regalo', 'images/ramo-rosas-blancas-libro.jpg'),
  ('Girasoles de Autor', 'Girasoles envueltos en papel periódico vintage', 99.90, 'Cumpleaños', 'Entrega Hoy', 'cumpleaños girasoles vintage alegria', 'images/girasoles-envueltos-periodico.jpg'),
  ('Eterno Amor', 'Rosas rojas premium seleccionadas a mano', 189.90, 'Aniversarios', 'Más vendido', 'rosas rojas aniversario amor romantico', 'images/rosas-rojas-textura.jpg'),
  ('Sol de Girasoles', 'Trío de girasoles + flores de temporada', 89.90, 'Cumpleaños', '', 'girasoles cumpleaños alegria', 'images/ramo-girasoles-trio.jpg'),
  ('Flores Eternas', 'Bouquet de fieltro morado + mariposas decorativas', 149.90, 'Románticos', 'Entrega Hoy', 'flores eternas fieltro romantico enamorados', 'images/ramo-flores-fieltro-morado.jpg'),
  ('Bodas de Oro', 'Rosas azules premium en caja elegante "Caballero Azul"', 219.90, 'Aniversarios', '', 'aniversario boda premium elegante rosas azules caja', 'images/rosas-azules-caballero.jpg'),
  ('Golden Blue', 'Girasoles y rosas azules envueltos en papel periódico', 109.90, 'Cumpleaños', '', 'girasoles rosas azules cumpleaños original', 'images/ramo-golden-blue.jpg'),
  ('Elegancia Formal', 'Rosas azules envueltas en diseño de esmoquin', 139.90, 'Aniversarios', 'Más vendido', 'rosas azules elegante esmoquin aniversario formal', 'images/ramo-elegancia-paternal.jpg');

insert into pack_items (id, type, name, price, img_url) values
  ('rosa', 'Flores', 'Rosas', 3.5, 'https://images.unsplash.com/photo-1644248421159-e6e64a7f4ca3?q=80&w=200&auto=format&fit=crop'),
  ('girasol', 'Flores', 'Girasoles', 4.0, 'https://images.unsplash.com/photo-1676819076406-eb84287c818d?q=80&w=200&auto=format&fit=crop'),
  ('vizio', 'Chocolates', 'Chocolate Vizio', 8.0, 'https://images.unsplash.com/photo-1526081347589-7fa3cb41b4b2?q=80&w=200&auto=format&fit=crop'),
  ('donofrio', 'Chocolates', 'Chocolate D''onofrio', 9.0, 'https://images.unsplash.com/photo-1526081347589-7fa3cb41b4b2?q=80&w=200&auto=format&fit=crop'),
  ('peluche', 'Peluches', 'Peluche mediano', 25.0, 'https://images.unsplash.com/photo-1583478415880-b79447d73a84?q=80&w=200&auto=format&fit=crop');

insert into pack_tiers (pack_item_id, max_qty, img_url, label) values
  ('rosa', 5, 'images/ramo-rosas-blancas-libro.jpg', 'Rosas — ramo chico (referencial)'),
  ('rosa', 8, 'images/rosas-azules-caballero.jpg', 'Rosas — ramo mediano (referencial)'),
  ('rosa', 999999, 'images/rosas-rojas-textura.jpg', 'Rosas — ramo grande (referencial)'),
  ('girasol', 2, 'images/girasoles-envueltos-periodico.jpg', 'Girasoles — pocos (referencial)'),
  ('girasol', 999999, 'images/ramo-girasoles-trio.jpg', 'Girasoles — varios (referencial)');
