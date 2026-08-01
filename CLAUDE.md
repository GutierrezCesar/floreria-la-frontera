# Florería La Frontera — Notas del proyecto

Sitio web de la florería "Florería La Frontera" (Ayacucho, Perú). Landing page de una sola página, sin backend, sin pasarela de pago — todos los pedidos se cierran por WhatsApp.

## Enlaces clave

- **Sitio en vivo**: https://floreria-la-frontera.vercel.app/ (permanente mientras el proyecto siga en Vercel, sin fecha de expiración)
- **Repo GitHub**: https://github.com/GutierrezCesar/floreria-la-frontera (cuenta: GutierrezCesar)
- **Deploy**: automático — cada `git push` a `main` redespliega en Vercel (conectado por GitHub, no requiere pasos manuales)
- **WhatsApp**: `https://wa.me/message/2OMDBGCGOVGSI1` (enlace corto oficial del negocio, NO usar el número de teléfono directo `wa.me/51957219600`, ya se migró)
- **Instagram**: instagram.com/florerialafrontera
- **Facebook**: facebook.com/profile.php?id=61564404956914
- **TikTok**: tiktok.com/@florerialafrontera
- **Dirección**: Jr. José Olaya 681 - Emadi, Ayacucho, Perú 05001
- **Email**: gloriagutierrezrayme5@gmail.com
- **Teléfono**: 957 219 600

## Stack técnico

- **Un solo archivo**: `index.html` (HTML + Tailwind CDN + JS vanilla, todo inline, sin build step)
- **Imágenes**: carpeta `images/` — todas son fotos reales del negocio (de Instagram/Facebook), optimizadas a JPG con `sips` (macOS)
- `.gitignore` excluye `.claude/` (config local del asistente) y `.DS_Store`
- **Backend Supabase (agregado 2026-07-31, en paralelo por otra herramienta/sesión — ver `AGENTS.md`, el equivalente a este archivo para esa herramienta)**: `index.html` ahora carga `products`, `pack_items` y `pack_tiers` desde Supabase (`loadCatalogData()`, cerca de la línea 1370) — los arrays hardcodeados (`HARDCODED_PRODUCTS_FALLBACK`, `HARDCODED_PACK_CATALOG_FALLBACK`) solo se usan si falla el fetch. Hay un panel `admin.html` (login con Supabase Auth) para editar el catálogo sin tocar código. Esquema en `supabase/schema.sql`.
  - **Importante**: agregar/editar productos solo en el HTML ya NO se refleja en el sitio real una vez deployado, porque Supabase tiene prioridad. Los cambios de catálogo deben ir a Supabase.
  - Como el asistente no puede loguearse en `admin.html` (tiene prohibido usar contraseñas/credenciales), el flujo para agregar datos vía Supabase es: escribir un archivo `.sql` en `supabase/` (mismo patrón que `schema.sql`) y que el usuario lo pegue en el SQL Editor del dashboard de Supabase. También se actualiza el fallback hardcodeado del HTML en paralelo, para que no quede desincronizado si Supabase llegara a fallar.
  - `admin.html` ya está en producción: **https://floreria-la-frontera.vercel.app/admin.html**. No tiene usuario creado todavía — el dueño debe crearlo él mismo desde Supabase Dashboard → Authentication → Users (el asistente no puede hacerlo ni conoce ninguna contraseña).
  - Todos los `.sql` de `supabase/` (hasta 2026-07-31) ya fueron corridos por el usuario y confirmados en la base de datos real — no quedan migraciones pendientes de esa tanda.

## Criterios de diseño acordados (no cambiar sin confirmar con el usuario)

1. **Sin pasarela de pago todavía** — todo termina en un mensaje de WhatsApp pre-armado, nunca en checkout/cobro online.
2. **Solo fotos reales del negocio** — nunca usar fotos de otras cuentas/marcas (ej. se descartó contenido de "La Lola Postres" por ser colaboración de otra marca, y una foto marcada "Contenido de IA" en Facebook por no ser un producto real).
3. **Fondo predominantemente blanco**, el rosa (`#f06292` / `#e05285`) solo como acento (botones, tags, badges) — inspirado en cómo Rosatel.pe usa blanco+rojo. Se cambió de un diseño "todo rosa" a este esquema a pedido del usuario.
4. **Sin frameworks de chat/IA de pago** — el chatbot es un árbol de decisión propio en JS puro (sin costo, sin backend), no un widget de terceros.
5. Commits en español, formato: título corto + cuerpo si aplica + `Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>`. Autor de los commits: `Cesar Gutierrez <cesarjassongutierrezdiaz@gmail.com>` (se pasa vía `GIT_AUTHOR_NAME`/`GIT_AUTHOR_EMAIL` inline en el comando, **nunca** tocar `git config` global — está prohibido por las reglas del entorno).

## Features implementadas

- **Hero**: foto real (`images/rosas-rojas-textura.jpg` — primer plano de rosas rojas/rosadas con la tarjeta de presentación de la marca) + buscador rápido + badges flotantes. (Antes era `ramo-rosas-blancas-libro.jpg`; se cambió a pedido del usuario por verse más vibrante/editorial. Antes de eso se probó una ilustración de tulipán animada en SVG/CSS 3D — se descartó y volvió a foto real, para verse más "tienda profesional" y menos "proyecto de estudiante". El JSON-LD del `<head>` también apunta a la foto actual del hero.)
- **Catálogo**: 8 productos con filtros por categoría (Cumpleaños/Aniversarios/Románticos), todas con fotos reales de Instagram/Facebook.
- **Lightbox**: clic en cualquier foto del catálogo la amplía en un modal.
- **Arma tu Pack** (`#arma-tu-pack`): selector de rosas/girasoles/chocolates (Vizio, D'onofrio)/peluche con cantidades, presentación (ramo de mano o canasta +S/15), mensaje de dedicatoria, fecha/horario de entrega, total en vivo, y botón que arma el pedido por WhatsApp.
  - **Vista previa por foto real**: ya NO aparece automática — hay un botón "Ver fotos de cómo se vería mi pack" que el cliente debe presionar (se pidió así explícitamente: que no aparezca sola, para que cualquier persona sepa que existe esa opción). Al presionarlo, muestra las fotos agrupadas **por producto** (ej. "Girasoles · 1 und. · 7 opciones parecidas"), cada grupo con su propia grilla y separador. Las fotos son cuadradas (mismo tamaño siempre, `aspect-square`) y clicables para verlas en grande en el lightbox del sitio.
  - **Varias fotos reales por cantidad (no solo una)**: cada tramo de cantidad (`tiers: [{max, img, label}]` en `packCatalog`) puede tener MÚLTIPLES fotos con el mismo `max` — `matchingTierPhotos()` en el JS junta todas las que compartan el tramo más cercano a la cantidad elegida, en vez de mostrar solo "la mejor". Esto se pidió explícitamente: cada foto de Facebook que se va describiendo (ver `images/facebook-archive/product-notes.md`) se conecta a **todas** las flores/cantidades que contiene, sin importar qué más salga en la imagen (comida, globos, etc. — el aviso "no son fotos exactas" ya cubre eso). Ya tiene bastantes fotos reales cargadas para girasoles (1-2, 6 y 12) y rosas (1 a 10), sacadas de `images/facebook-archive/`.
  - **Se probó generación de imágenes con IA (Pollinations.ai, gratis) y se descartó** — los modelos no acertaban cantidades exactas (ej. pedían 1 rosa y salían 6). El usuario prefirió este sistema de fotos reales por ser más confiable y sin depender de servicios externos.
  - **Bug corregido**: el botón "Ramo de mano" tenía clases de Tailwind fijas en el HTML (`border-blossom-dark bg-blossom-light/20`) que nunca se quitaban al hacer clic en "Canasta", por lo que siempre se veía seleccionado sin importar cuál tocaras. Se corrigió dejando que solo la clase `.active-presentation` controle el estilo activo de ambos botones.
- **Chatbot**: burbuja flotante arriba del botón de WhatsApp, árbol de decisión con botones rápidos (ocasión → categoría/pack/WhatsApp), sin IA real, sin costo.
- **Redes sociales**: íconos con hover de color de marca (Instagram gradiente, Facebook azul, TikTok efecto glitch cian/rosa) en header, menú móvil, contacto y footer.
- **SEO local**: JSON-LD `Florist` en el `<head>` con dirección/teléfono/horario/redes, para ayudar a que aparezcan en búsquedas locales de Google.
- **Favicon**: emoji 🌷 vía SVG data URI.
- **Accesibilidad**: botones táctiles a 44×44px mínimo (qty +/- del Pack Builder, cerrar de modales/chat), contraste de texto funcional subido (`text-ink/40`→`/60`, `/50`→`/70`), `aria-expanded`/`aria-label` dinámico en el botón de menú móvil, soporte `prefers-reduced-motion`.
- **Animaciones/movimiento**: scroll-reveal con `IntersectionObserver` (clases `.reveal` / `.reveal-stagger`) en Catálogo, Arma tu Pack, Confianza/Valores y Contacto; sombra dinámica en el header sticky al hacer scroll; pulso suave rosa en la burbuja del chat (se apaga mientras está abierto, a juego con el pulso verde de WhatsApp que ya existía); `active:scale` en los CTAs principales para feedback de presión.
- **Header**: se quitó la barra superior negra ("Hoy es un buen día...") por pedido del usuario — se veía forzada/publicitaria. El header pasó de altura fija (`h-20`) a padding vertical (`py-5 sm:py-6`) porque el logo de dos líneas quedaba pegado a los bordes.
- **Scroll a anclas (`#inicio`, `#catalogo`, etc.)**: el header es `sticky`, así que se agregó `scroll-padding-top` dinámico (JS mide `siteHeader.offsetHeight` en load/resize) para que al hacer clic en el logo o el menú no se tape el contenido superior de la sección detrás del header.
- **Logo con tulipán animado**: al pasar el mouse/enfocar el logo aparece un 🌷 con rebote suave (`.logo-tulip`, clase CSS junto a `.nav-link`) — antes solo cambiaba de color, se sentía plano. Coherente con el favicon (también tulipán).

## Pendientes / ideas discutidas sin implementar aún

- [ ] Fila de íconos por ocasión en el homepage (estilo Rosatel: Amor, Cumpleaños, Aniversario, Graduación...) — el usuario la pidió pero no se llegó a construir.
- [ ] Descripciones de producto con "significado de la flor" (storytelling emocional, estilo Rosatel).
- [ ] Fotos reales de los componentes del Pack Builder (rosa individual, chocolate Vizio/D'onofrio, peluche) — actualmente son fotos de stock de Unsplash, temporal hasta que el usuario mande las reales.
- [ ] Fotos reales por cantidad exacta de rosas (1, 3, 6, 12) — no existen todavía ni en IG ni en FB (se revisó todo el contenido de ambas cuentas). Los "tiers" actuales son aproximados con lo que hay.
- [ ] Dominio propio (hoy usa el subdominio gratis `floreria-la-frontera.vercel.app`, es permanente y está bien para pruebas).
- [ ] Precios del Pack Builder (rosas S/3.50, girasoles S/4.00, chocolates S/8-9, peluche S/25, canasta +S/15) son **estimados** — falta que el usuario confirme los reales.
- [ ] Precio de "Doce Girasoles Sorpresa" (S/99.90, agregado 2026-07-31 desde `fb-025`) también es **estimado**, igual al de "Girasoles de Autor" — falta confirmar el real (ya está en Supabase, solo falta el precio correcto).
- [ ] **Catálogo por fecha especial (Día del Padre / Día de la Madre / San Valentín)**: en Facebook, el negocio publica que se puede "solicitar el catálogo" de la fecha y se lo envían por WhatsApp/DM (ver fotos `fb-009` a `fb-011`, `fb-015`, `fb-039`, `fb-040`, `fb-044`, `fb-045` en `images/facebook-archive/`). Falta llevar ese flujo al sitio — probablemente un CTA de temporada que abra WhatsApp con un mensaje pre-armado pidiendo el catálogo de la fecha. Sin definir todavía cómo se ve ni cuándo se activa/desactiva por fecha.
- [ ] **Revisión de fotos de `images/facebook-archive/` en curso**: 56 fotos totales, solo se revisaron fb-001 a fb-026 en detalle con el dueño (ver `images/facebook-archive/product-notes.md`). Quedan pendientes de describir: fb-027 en adelante, con candidatas fuertes ya identificadas visualmente (fb-034 a fb-038 ramos coloridos, fb-046 a fb-048 misma sesión del hero, fb-049 a fb-051 morado/lila, fb-052/053 tulipanes, fb-055/056 rosa/rojo con gerberas).
- [ ] **fb-012 sin resolver**: el dueño describió "2 cuchareables + 1 girasol + rosa blanca..." pero nunca confirmó si es la misma colaboración con "La Lola" postres (ya descartada) o un combo propio distinto. No se agregó a ningún tier hasta confirmar.
- [ ] **Chatbot**: el usuario quiere ampliarlo anticipando preguntas frecuentes de clientes reales, para responder más rápido — mencionado pero no se llegó a trabajar en esta sesión.

## Cómo continuar

Para retomar: leer este archivo primero, luego `images/facebook-archive/product-notes.md` si se sigue revisando fotos, luego revisar `git log --oneline` para ver el historial de cambios y `index.html` para el estado actual del código. El usuario suele pedir cambios de forma conversacional e iterativa — cada cambio importante se prueba en un servidor local (`python3 -m http.server 8934`) con el navegador antes de subir, y luego se hace commit + push (deploy automático).

**Estado al cierre de la sesión del 2026-07-31/08-01**: todo commiteado y pusheado a `main` (commit `0249ef7`), sitio y `admin.html` en vivo en Vercel, todos los `.sql` de Supabase de esta sesión ya corridos y confirmados. No quedan cambios sin subir.
