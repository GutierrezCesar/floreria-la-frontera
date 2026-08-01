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
- `.gitignore` excluye `.Codex/` (config local del asistente) y `.DS_Store`

## Criterios de diseño acordados (no cambiar sin confirmar con el usuario)

1. **Sin pasarela de pago todavía** — todo termina en un mensaje de WhatsApp pre-armado, nunca en checkout/cobro online.
2. **Solo fotos reales del negocio** — nunca usar fotos de otras cuentas/marcas (ej. se descartó contenido de "La Lola Postres" por ser colaboración de otra marca, y una foto marcada "Contenido de IA" en Facebook por no ser un producto real).
3. **Fondo predominantemente blanco**, el rosa (`#f06292` / `#e05285`) solo como acento (botones, tags, badges) — inspirado en cómo Rosatel.pe usa blanco+rojo. Se cambió de un diseño "todo rosa" a este esquema a pedido del usuario.
4. **Sin frameworks de chat/IA de pago** — el chatbot es un árbol de decisión propio en JS puro (sin costo, sin backend), no un widget de terceros.
5. Commits en español, formato: título corto + cuerpo si aplica + `Co-Authored-By: Codex Sonnet 5 <noreply@anthropic.com>`. Autor de los commits: `Cesar Gutierrez <cesarjassongutierrezdiaz@gmail.com>` (se pasa vía `GIT_AUTHOR_NAME`/`GIT_AUTHOR_EMAIL` inline en el comando, **nunca** tocar `git config` global — está prohibido por las reglas del entorno).

## Features implementadas

- **Hero**: foto real (`images/ramo-rosas-blancas-libro.jpg`) + buscador rápido + badges flotantes. (Se probó una ilustración de tulipán animada en SVG/CSS 3D — se descartó y volvió a foto real por pedido del usuario, para verse más "tienda profesional" y menos "proyecto de estudiante".)
- **Catálogo**: 8 productos con filtros por categoría (Cumpleaños/Aniversarios/Románticos), todas con fotos reales de Instagram/Facebook.
- **Lightbox**: clic en cualquier foto del catálogo la amplía en un modal.
- **Arma tu Pack** (`#arma-tu-pack`): selector de rosas/girasoles/chocolates (Vizio, D'onofrio)/peluche con cantidades, presentación (ramo de mano o canasta +S/15), mensaje de dedicatoria, fecha/horario de entrega, total en vivo, y botón que arma el pedido por WhatsApp.
  - **Vista previa por foto real**: al elegir cantidades, muestra automáticamente la foto real más parecida por "tier" de tamaño (ver `packCatalog` en el JS, objetos con `tiers: [{max, img, label}]`). **Se probó generación de imágenes con IA (Pollinations.ai, gratis) y se descartó** — los modelos no acertaban cantidades exactas (ej. pedían 1 rosa y salían 6). El usuario prefirió este sistema de fotos reales por ser más confiable y sin depender de servicios externos.
- **Chatbot**: burbuja flotante arriba del botón de WhatsApp, árbol de decisión con botones rápidos (ocasión → categoría/pack/WhatsApp), sin IA real, sin costo.
- **Redes sociales**: íconos con hover de color de marca (Instagram gradiente, Facebook azul, TikTok efecto glitch cian/rosa) en header, menú móvil, contacto y footer.
- **SEO local**: JSON-LD `Florist` en el `<head>` con dirección/teléfono/horario/redes, para ayudar a que aparezcan en búsquedas locales de Google.
- **Favicon**: emoji 🌷 vía SVG data URI.

## Pendientes / ideas discutidas sin implementar aún

- [ ] Fila de íconos por ocasión en el homepage (estilo Rosatel: Amor, Cumpleaños, Aniversario, Graduación...) — el usuario la pidió pero no se llegó a construir.
- [ ] Descripciones de producto con "significado de la flor" (storytelling emocional, estilo Rosatel).
- [ ] Fotos reales de los componentes del Pack Builder (rosa individual, chocolate Vizio/D'onofrio, peluche) — actualmente son fotos de stock de Unsplash, temporal hasta que el usuario mande las reales.
- [ ] Fotos reales por cantidad exacta de rosas (1, 3, 6, 12) — no existen todavía ni en IG ni en FB (se revisó todo el contenido de ambas cuentas). Los "tiers" actuales son aproximados con lo que hay.
- [ ] Dominio propio (hoy usa el subdominio gratis `floreria-la-frontera.vercel.app`, es permanente y está bien para pruebas).
- [ ] Precios del Pack Builder (rosas S/3.50, girasoles S/4.00, chocolates S/8-9, peluche S/25, canasta +S/15) son **estimados** — falta que el usuario confirme los reales.

## Cómo continuar

Para retomar: leer este archivo primero, luego revisar `git log --oneline` para ver el historial de cambios y `index.html` para el estado actual del código. El usuario suele pedir cambios de forma conversacional e iterativa — cada cambio importante se prueba en un servidor local (`python3 -m http.server 8934`) con el navegador antes de subir, y luego se hace commit + push (deploy automático).
