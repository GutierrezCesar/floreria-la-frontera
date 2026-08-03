-- Agrega "Presentación" (arreglo floral / canasta / caja sorpresa / macetero) y
-- "Ocasión especial" (Día del Padre / Día de la Madre / San Valentín) a los productos del catálogo.
-- Cómo usarlo: pegar este archivo completo en Supabase Dashboard > SQL Editor > New query > Run.

alter table products add column if not exists presentation text not null default '';
alter table products add column if not exists occasion text not null default '';
