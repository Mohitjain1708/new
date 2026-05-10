# MOA Sales Deck — Workflow & Design Rationale

## Project Workflow

### Phase 1: Brief Analysis
Read the full brief and identified three non-negotiables:
1. **Non-linear navigation** — not a slideshow
2. **Video-first storytelling** — not decoration
3. **Luxury brand polish** — Apple/Hermès/Tesla reference tier

Chose **Mall of America** as the subject: most name recognition, richest publicly available data, strongest entertainment differentiation story.

---

### Phase 2: Architecture Decision

Evaluated three approaches:

| Approach | Pros | Cons | Decision |
|----------|------|------|----------|
| React SPA | Component reuse, state management | Bundle size, hydration delay | ❌ Overkill |
| Next.js | SSR, routing built-in | Too much infrastructure | ❌ Too heavy |
| **Vanilla HTML/CSS/JS** | Zero deps, instant load, no build | Manual wiring | ✅ **Chosen** |

**Reasoning:** A sales deck gets shared as a link. The prospect's first impression starts at time zero. A 200kb framework bundle before a single pixel renders is a conversion killer.

---

### Phase 3: Design System

**Color logic:**
- Deep black (`#060608`) — creates a cinematic, premium feel. Forces content to pop.
- Gold (`#c9a84c`) — luxury signal. Used sparingly as accent, never as fill.
- Off-white (`#e8e8ee`) — warmer than pure white, less harsh on dark bg.

**Typography logic:**
- Cormorant Garamond (display): associates with luxury editorial. Used by Saint Laurent, Vogue. Bridges fashion and finance.
- Syne (sans): geometric, designed for display. More character than Helvetica, more modern than Futura.
- DM Mono: technical credibility for stats and labels. Feels like Bloomberg terminal precision.

**Motion philosophy:**
- Everything reveals on scroll/section-enter. No auto-playing animations.
- Numbers count up once. Creates a "reveal" moment that feels live.
- Section transitions are quick (700ms) — confidence, not drama.

---

### Phase 4: Content Strategy

Each section was mapped to a business outcome:

| Section | Visitor Emotion | Business Action |
|---------|----------------|-----------------|
| Hero | "Wow, this is big" | Stay engaged |
| Why MOA | "The numbers make sense" | Request info |
| Retail | "I want to be here" | Leasing inquiry |
| Luxury | "My brand fits" | Luxury leasing |
| Dining | "High dwell = high spend" | F&B inquiry |
| Entertainment | "Nothing else like this" | Commitment |
| Events | "I want this platform" | Book / sponsor |
| Contact | "Let's talk" | Form submit |

---

### Phase 5: Phase 2 Module Design

Built the events section as a fully working expandable module (tabs). The pattern is:

```html
<div class="events-tabs">
  <div class="event-tab-nav">
    <button class="etab" data-etab="concerts">...</button>
  </div>
  <div class="event-tab-content" id="etab-concerts">...</div>
</div>
```

This same pattern can be replicated for leasing sub-categories, venue specs, or sponsorship packages without touching the navigation or layout system.

---

## Key Technical Decisions

### Non-Linear Navigation
Used `display: none / flex` toggling with CSS transitions rather than scroll. Why:
- Avoids scroll-jacking accessibility issues
- Each section is truly independent
- Deep-linking via URL hash works natively
- Works on all screen sizes without scroll position management

### IntersectionObserver for Reveals
Every section re-triggers reveals when navigated to. The observer watches for `.section.active` class changes and re-runs observation. This means every section feels fresh on every visit.

### YouTube Background Video
The hero video is a YouTube iframe set to autoplay + mute + loop + controls=0. This avoids hosting costs and CDN bandwidth while giving cinematic impact. Fallback is a CSS gradient that still looks premium.

### CSS Custom Properties
All design decisions live in `css/variables.css`. Changing the brand color requires editing one line. Changing fonts requires editing two lines. The entire visual system is token-driven.

---

## What I'd Add With More Time

1. **Real video content** — Download official MOA tour videos, host on Cloudflare Stream
2. **Lottie animations** — Replace CSS keyframe animations with Lottie for richer motion
3. **CMS integration** — Connect contact form to Airtable or HubSpot via API
4. **Analytics** — Google Analytics + heatmaps to track which sections convert
5. **Interactive map** — Leaflet.js floor map of MOA with clickable tenant zones
6. **Video testimonials** — Tenant quote videos in the retail section
7. **Leasing availability data** — Pull from CRM to show live open spaces
8. **A/B testing** — Test hero headline variants with Optimizely
