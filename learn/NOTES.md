# Teaching Notes & Preferences

## Learner profile
- Strong commutative algebra; new to / shaky on schemes.
- Goal is deep, durable understanding (storage strength), self-paced.
- Has the Stacks Project source locally (this repo) — citations should use
  real Stacks **tags** (verified against `tags/tags`), linkable as
  `https://stacks.math.columbia.edu/tag/XXXX`.

## How to teach this learner
- **Anchor every new scheme concept to the algebra they already know.**
  e.g. introduce the Zariski topology via radical ideals they understand.
- Keep each lesson to ONE tangible win, completable in ~15 min.
- Use retrieval-practice quizzes with immediate feedback (storage strength).
- Space and interleave: re-test earlier ideas inside later lessons.
- Quiz options kept length-matched so formatting leaks no answer.

## Conventions
- Lessons: `lessons/NNNN-slug.html`, link the shared `assets/course.css`.
- Reusable widgets live in `assets/` — reuse, don't inline. Available:
  - `quiz.js` — retrieval-practice MCQ with instant feedback (`.quiz` + JSON).
  - `sheaf-explorer.js` — "gluing lab" (`.glue-lab`): pick a presheaf, attempt to glue.
  - `stalk-demo.js` — "shrink to a point" colimit slider (`.stalk-demo`).
- Visual deep-dives (companions to lessons) live in `reference/`:
  `spec-zx-three-questions.html`, `spec-kxy-affine-plane.html`.
- Math via MathJax CDN. Reference docs in `reference/` are the durable,
  printable distillations; the glossary is canonical — adhere to its terms.

## Lesson map
- 0001 Spec(R) as a space ✓
- 0002 presheaves & sheaf condition ✓ · 0003 stalks & germs ✓ · 0004 sheaves on a basis ✓
- 0005 (next) structure sheaf & affine scheme — pure assembly, no new sheaf theory.

## Open questions to revisit
- Community engagement preference (post on MO/MSE?) — not yet asked.
- Sheaf comfort: being built directly in 0002–0004 (learner requested). Check
  retention of "stalk = localization" before 0005.
