# Notas de revisión — fotos de facebook-archive

Mapeo conversacional foto por foto (dueño del negocio describe, se decide uso). Fuente de verdad mientras se decide qué entra al sitio (catálogo, Arma tu Pack, packs temáticos). No confundir con `sources.json` (metadata automática de Facebook).

Estado por foto: ✅ va / ❌ no va (descartada) / ❓ pendiente de descripción.

## Revisadas

| Archivo | Contenido descrito por el dueño | Uso propuesto | Estado |
|---|---|---|---|
| fb-001 | Caja con torta pequeña + chocolate Vizio + 1 girasol + un detalle + mensaje de tarjeta | Pack temático (caja sorpresa) | ✅ va |
| fb-002 | Arreglo floral + jugo/milkshake de fresa + globo de corazón + 1 girasol + 1 rosa rosada + 2 astromelias (lirios de los incas) + estatice/limonium + flor de nube (gypsophila) | Pack temático (regalo con bebida) | ✅ va |
| fb-003 | "Feliz Día Papá" — hamburguesa + 1 lata de cerveza + caja de chocolate Vizio + 1 girasol | Pack temático Día del Padre | ✅ va |
| fb-004 | "Feliz Día Papá" — arreglo en forma de corbata + flor de nube (gypsophila). Dos fotos de la misma sesión (frontal y de lado): 1 girasol + 2 rosas azules + gypsophila | Pack temático Día del Padre / catálogo | ✅ va — **confirmar si es la misma sesión que `ramo-elegancia-paternal.jpg`** (ya usada en catálogo, diseño esmoquin/corbata parecido) |
| fb-005 | Arreglo floral: 3 girasoles + 3 rosas azules | Catálogo / pack temático | ✅ va |
| fb-006 | Macetero con 10 rosas azules + una carta + una dedicatoria | Catálogo (regalo premium) | ✅ va |
| fb-007 | "Feliz Día Papá" — globo azul de corazón + 1 girasol + gypsophila + jugo/milkshake de fresa + 3 astromelias (lirios de los incas) | Pack temático Día del Padre | ✅ va |
| fb-008 | "Feliz Día Papá" — caja con torta pequeña + 1 trago pequeño + 1 girasol + mensaje de tarjeta | Pack temático Día del Padre | ✅ va |
| fb-012 | 2 cuchareables + 1 girasol + rosa blanca + gypsophila + astromelias (lirios de los incas) | Pack temático / combo con postre | ❓ **revisar** — el triage visual inicial identificó fb-012/fb-013 como la colaboración con "La Lola" postres, ya descartada en `CLAUDE.md` por ser de otra marca. El dueño no la marcó como descartada acá. Confirmar si es la misma colaboración (no usar) o un combo propio distinto (sí usar) antes de agregarla al sitio. |
| fb-014 | "Feliz Día Mamá" — canasta con 6 rosas amarillas + 1 regalo sorpresa + 1 clavel rosa + 9 claveles rosa + flores de complemento + follaje verde | Pack temático Día de la Madre | ✅ va |
| fb-017 | Imagen genérica para repostear (no es foto de producto propio) | — | ❌ no va |
| fb-019 | Imagen genérica para repostear (no es foto de producto propio) | — | ❌ no va |
| fb-023 | Arreglo floral de 6 girasoles | Catálogo + tier Pack Builder (girasol, max 6) | ✅ va |
| fb-024 | Arreglo masculino (6 girasoles + complemento) | Catálogo (variante "para él") | ✅ va |
| fb-025 | 12 girasoles en arreglo floral + 1 caja pequeña sorpresa | Catálogo nuevo + tier Pack Builder (girasol, sin tope) | ✅ va |
| fb-026 | "Ramos buchones" — es nombre de categoría/estilo (ramos voluminosos), no un producto específico con conteo | Posible tag/categoría futura, no un ítem individual | ℹ️ nota, no es foto de producto |

## Conectadas al Pack Builder

**Regla general (a partir de 2026-07-31):** cada foto descrita se conecta a **todas** las flores/cantidades que contiene, no solo a una. Ej: fb-002 tiene 1 girasol Y 1 rosa → aparece en el tier de girasoles (1-2) Y en el tier de rosas (1-5). Así se aprovechan todos los detalles que se van describiendo, sin importar qué más salga en la foto (comida, globos, etc. — el aviso de "no es foto exacta" ya cubre eso).

- **Girasoles (tier 1-2):** fb-001, fb-002, fb-003, fb-004, fb-007, fb-008 (`index.html` + `supabase/2026-07-31d-mas-fotos-un-girasol.sql`)
- **Girasoles (tier 6):** fb-024, además de fb-023 (`supabase/2026-07-31c-segunda-foto-seis-girasoles.sql`)
- **Rosas (tier 1-5):** fb-002 (1 rosa), fb-004 (2 rosas), fb-005 (3 rosas)
- **Rosas (tier 6-8):** fb-014 (6 rosas amarillas)
- **Rosas (tier sin tope):** fb-006 (10 rosas azules)
- SQL de rosas: `supabase/2026-07-31e-mas-fotos-rosas.sql`

## Pendientes de describir (candidatas fuertes según triage visual)

fb-022, fb-023, fb-024, fb-025, fb-027 (girasoles), fb-034, fb-035, fb-036, fb-037, fb-038 (ramos coloridos, chicas al aire libre), fb-046, fb-047, fb-048 (misma sesión del ramo con libro del hero — revisar si hay mejor ángulo), fb-049, fb-050, fb-051 (morado/lila silvestre), fb-052, fb-053 (tulipanes rosados), fb-055, fb-056 (rosa/rojo con gerberas).

## Descartadas

- fb-012, fb-013 — colaboración "La Lola" postres, otra marca (regla ya existente en `CLAUDE.md`).

## Duplicadas / ya usadas en el sitio (a confirmar)

- Triage visual inicial asumió que fb-005/fb-006 eran las mismas fotos que `ramo-golden-blue.jpg` / `rosas-azules-caballero.jpg` — **descartado**: el dueño las describió con contenido distinto (fb-005 = 3 girasoles + 3 rosas azules; fb-006 = macetero con 10 rosas azules). Son productos nuevos, no duplicados. Pendiente comparar visualmente contra las fotos ya usadas para confirmar que no se solapan en el catálogo.
