# Sheaf detour: learner asked to explore sheaves before the structure sheaf

After Lesson 0001 (Spec as a space), the learner asked to "explore more about
sheaves" before the structure-sheaf lesson — confirming the open question flagged
in [[NOTES.md]] (sheaf comfort). Built a three-lesson sheaf sub-sequence, grounded
in the local `sheaves.tex`/`schemes.tex` source with tags verified against
`tags/tags`, and adversarially correctness-checked.

## What was built
- Lesson 0002 — presheaves & the sheaf condition (gluing).
- Lesson 0003 — stalks & germs as directed colimits ($\mathcal O_{X,\mathfrak p}=R_{\mathfrak p}$).
- Lesson 0004 — sheaves on a basis & extend-off-basis (the bridge).
- Reference: `reference/sheaves.html` cheat-sheet; glossary extended with sheaf terms.

## Implications
- The structure sheaf / affine scheme lesson is now **Lesson 0005** and is
  deliberately "pure assembly": define $\mathcal O(D(f))=R_f$, cite the stalk
  computation, check the basis axiom via the localization exact sequence, invoke
  extend-off-basis. No new sheaf theory should appear there.
- Sequence designed for spacing/interleaving: 0003's quiz re-touches 0002; 0004's
  quiz re-touches 0001–0003. Confirm retention (especially stalk = localization)
  before starting 0005.
- Verify before 0005: comfort with the algebra fact that $D(f)=\bigcup D(g_i)$
  iff the $g_i$ generate the unit ideal in $R_f$ (used in step 2 of the build).

## Correctness note
A curated "compactly-supported functions" example was dropped from the lesson:
the adversarial pass showed its naive presheaf/gluing framing is wrong (it is a
cosheaf via extension-by-zero, not a sheaf). Kept it out of the quiz.
