# Lesson 0000: an intuitive, Arnold/Shafarevich-voiced front door to sheaves

The learner added Daniel Rosiak's *Sheaf Theory Through Examples* (arXiv:2012.08669)
to the repo and asked for a *plain-English, genius-high-schooler* on-ramp to sheaves —
intuitive and inspiring, but connected to the live Stacks Project codebase — and
explicitly asked for **more rigor sooner**, in the register of **Soviet-school
mathematics (Shafarevich's motivated algebra + V. Arnold's geometry-first, anti-formalist
voice)**. Built `lessons/0000-what-is-a-sheaf-really.html` as the new course front door.

## What was built
- **Lesson 0000** — a layered piece: opens with no math (the local→global principle via
  multivalued \(\sqrt z\) / monodromy), states the precise definitions early
  (presheaf as a functor on \(\mathrm{Op}(X)^{op}\); sheaf = equalizer), then a gallery of
  real-world examples, then a rigorous \(H^1\) spine, then the bridge to \(\operatorname{Spec}R\).
- **Examples (after Rosiak):** weather (sheaf / intensive field) vs. wealth (NOT a sheaf —
  total = covariant measure = cosheaf); stockpile-over-time; graph 3-colorings & route
  reachability; laws across jurisdictions; the literal/agricultural sheaf, espace étalé,
  glacier mosaic; vector bundles (Möbius vs cylinder) as the geometry⇄algebra hinge.
- **Max-visual:** 10 Rosiak figures copied to `assets/img/` (with attribution) + 2 bespoke
  SVGs (a \(K_3\) 3-coloring; a Möbius/cylinder "every section hits zero" panel).
- Reuses the `.glue-lab` and `.quiz` widgets verbatim; added a `figure.fig` block to
  `assets/course.css`. Rendered & functionally verified in-browser (images, MathJax, both
  widgets, 0 console errors).

## Correctness fixes from the adversarial pass (important — keep these straight)
- **Stockpile product C is NOT a gluing-axiom failure.** \([\mathrm{Jan,Apr}]\cup[\mathrm{May,Jun}]\)
  does **not cover** the year, so the sheaf axiom is silent. The honest lesson: C is *a local
  section that no global section restricts to* — the restriction map (global→local) is not
  onto. That gap is a **baby \(H^1\)**. Do not call it a broken cover. (Genuine gluing failures
  live in the `.glue-lab`: bounded→unbounded, constant-presheaf-on-disconnected.)
- **Wealth = cosheaf/measure**, the covariant dual of a sheaf (corestriction, additive on
  disjoint pieces; its axiom is the dual coequalizer, not naive additivity). Framed as
  intensive (sheaf) vs extensive (cosheaf).
- **Serre–Swan** names the bundle ↔ f.g.-projective-**module** equivalence (compact/paracompact
  base); "vector bundle := finite locally free **sheaf**" is the algebraic-geometry *definition*
  (no compactness). Stated as two distinct facts.
- `projective = flat = locally free` needs **finite presentation** (automatic over Noetherian).

## Verified tags (against local source; reuse these)
presheaf [006E] · sheaf condition [006T] · separated [007A] · sheaves on a basis / extend-off-basis
[009N] · \(\mathcal O(D(f))=R_f\) [01HU] · stalk \(=R_{\mathfrak p}\) [01HV] · \(D(f)=\bigcup D(g_i)\)
⇔ unit ideal in \(R_f\) [01HS] · finite locally free [01C6] · quasi-coherent \(\widetilde M\) [01BE].

## Implications
- 0000 is the **inspiration/intuition** layer; 0002–0004 remain the rigorous build. 0000's
  bridge table (region↔\(D(f)\), field↔\(R_f\), restrict↔localize, cover↔[01HS], stalk↔\(R_{\mathfrak p}\))
  previews exactly their content and links forward to each.
- The **\(H^1\) spine** (logarithm via the exponential sequence + winding number; Möbius \(w_1\);
  the stockpile gap; Mittag-Leffler/Cousin) is a ready-made seed for a future *sheaf cohomology*
  lesson — out of current scope but deliberately set up.
- New convention: lesson figures use `figure.fig` / `.fig-row` (see [[NOTES.md]]); Rosiak images
  are attributed via `figcaption .src`. Source PNGs stay in the untracked
  `arXiv-2012.08669v1-sheaf-examples/` for future lessons (e.g. GermsPic for 0003, FiberThingy).
