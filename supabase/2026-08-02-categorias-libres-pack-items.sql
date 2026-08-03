-- Permite crear categorías nuevas en "Arma tu Pack" (ej. Postres, Bebidas) desde admin.html,
-- sin estar limitado a los 3 tipos originales (flor/chocolate/peluche).
-- Cómo usarlo: pegar este archivo completo en Supabase Dashboard > SQL Editor > New query > Run.

-- Quita la restricción que solo permitía 'flor', 'chocolate' o 'peluche' en pack_items.type.
alter table pack_items drop constraint if exists pack_items_type_check;

-- Renombra las categorías existentes a las etiquetas legibles que ya se mostraban en el sitio
-- (antes eran códigos técnicos en minúscula; ahora "type" se usa tal cual como título de sección).
update pack_items set type = 'Flores' where type = 'flor';
update pack_items set type = 'Chocolates' where type = 'chocolate';
update pack_items set type = 'Peluches' where type = 'peluche';
