# Schemes / Algebraic Geometry — Resources

Knowledge for lessons is drawn from here, not from parametric guesses.
Primary source for each lesson is chosen from this list.

## Local library (downloaded)

Verified PDF notes live at `~/devv/browser-harness/ag-notes/` (see its
`README.md` for the index): Vakil *Rising Sea* (Oct 2025), Milne *AG* + *Primer
of Commutative Algebra*, Gathmann *AG* + *Commutative Algebra*, Murfet scheme
notes. Open `.tex` source: the **Stacks Project on disk** at
`~/devv/stacks-project/` (`sheaves.tex`, `algebra.tex`, `schemes.tex`, …).

## Knowledge

- [The Stacks Project](https://stacks.math.columbia.edu/) — de Jong et al.
  The canonical, fully-rigorous, hyperlinked reference. **This repo is its
  source.** Cite by tag, e.g. [Tag 00DZ](https://stacks.math.columbia.edu/tag/00DZ).
  Use for: airtight definitions and proofs, the ground truth for everything.
  Entry points: *Algebra* chapter (commutative algebra), *Schemes* chapter
  ([Tag 01H8](https://stacks.math.columbia.edu/tag/01H8)).

- [The Rising Sea: Foundations of Algebraic Geometry — Ravi Vakil](https://math.stanford.edu/~vakil/216blog/)
  The best modern *scheme-first* textbook for self-study: motivated,
  conversational, exercise-driven, yet rigorous. **Primary text for this
  mission.** Use for: building intuition and a teaching narrative for almost
  every topic; the exercises are the point.

- [Algebraic Geometry I: Schemes — Görtz & Wedhorn](https://link.springer.com/book/10.1007/978-3-658-30733-2)
  Careful, complete, very readable scheme theory with full proofs. Use for:
  a second rigorous account when Vakil is too terse or the Stacks Project too
  spare; excellent on morphism properties.

- [Algebraic Geometry — Robin Hartshorne](https://link.springer.com/book/10.1007/978-1-4757-3849-0)
  The classic. Ch. II (Schemes) and Ch. III (Cohomology) are standard.
  Use for: the canonical problem sets and the standard ordering of results;
  pair with Vakil/Görtz–Wedhorn for motivation it sometimes omits.

- [The Red Book of Varieties and Schemes — David Mumford](https://link.springer.com/book/10.1007/b62130)
  Unmatched geometric intuition for what `Spec` and schemes *look like*.
  Use for: pictures and intuition (the famous Spec Z[x] drawing), the "feel"
  of points and generic points.

- [Commutative Algebra with a View Toward AG — Eisenbud](https://link.springer.com/book/10.1007/978-1-4612-5350-1)
  Bridges your CA background to geometry. Use for: shoring up any commutative
  algebra a scheme lesson leans on (flatness, dimension, regular sequences).

### Sheaves (for Lessons 0002–0004)

- [Vakil, *Rising Sea*, Ch. 2 — Sheaves (free PDF)](https://math.stanford.edu/~vakil/216blog/FOAGaug2922public.pdf)
  **Primary source** for the sheaf lessons: presheaf/sheaf, gluing, stalks,
  sheafification — built from scratch for a strong-algebra reader. §2.2 (sheaves),
  §2.4 (stalks); §4.1 builds the structure sheaf.
- [Stacks Project, Ch. 6 — Sheaves on Spaces (Tag 006A)](https://stacks.math.columbia.edu/tag/006A)
  Ground truth, permalinked by tag. Primary for **sheaves-on-a-basis**
  ([Tag 009H](https://stacks.math.columbia.edu/tag/009H)) and gluing — the
  cleanest fully-proved statements. Verified locally against `sheaves.tex`.
- [Gathmann, *Algebraic Geometry* class notes (free PDF)](https://agag-gathmann.math.rptu.de/class/alggeom-2021/alggeom-2021.pdf)
  Best free expository "second explanation." Makes the gluing axiom feel
  inevitable via regular functions. Use when a definition feels opaque.
- [Görtz–Wedhorn, *Algebraic Geometry I*, sheaves chapter](https://link.springer.com/book/10.1007/978-3-8348-9722-0)
  Primary for the **categorical/adjoint framing** (sheafification as left adjoint,
  $f^*\dashv f_*$). Maintained errata at algebraic-geometry.de.
- [Hartshorne II.1 — worked solutions (Utah PDF)](https://www.math.utah.edu/~zwick/Classes/Hartshorne/Section2_1.pdf)
  The standard II.1 exercise drills (stalks, sheafification, espace étalé).
  Pair with Vakil for motivation.
- [nLab — sheaf](https://ncatlab.org/nlab/show/sheaf)
  High-altitude view: descent, the equalizer/limit form of the axiom,
  sheafification as a reflector. Use *after* the concrete picture.
- [Borcherds — Algebraic Geometry II (video lectures)](https://www.youtube.com/playlist?list=PL8yHsr3EFj50Un2NpfPySgXctRQK7CLG-)
  Spoken motivation + a live walk-through of the structure sheaf on Spec.

## Wisdom (Communities)

- [MathOverflow](https://mathoverflow.net/) — research-level Q&A.
  Use for: precise questions once you've done the work; read the AG tag for
  how experts actually reason. Search before asking.
- [Mathematics Stack Exchange — algebraic-geometry tag](https://math.stackexchange.com/questions/tagged/algebraic-geometry)
  Use for: learner-level conceptual questions and worked examples.
- [r/math](https://www.reddit.com/r/math/) and [Stacks Project Slack/community](https://stacks.math.columbia.edu/)
  Use for: orientation, roadmap sanity-checks, finding study partners.

> Community preference not yet stated — ask before pushing the user to post.

## Gaps
- No single short "visual atlas of Spec examples" found; the lesson reference
  docs in `./reference/` are being built to fill this.
