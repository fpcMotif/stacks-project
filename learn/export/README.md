# Schemes course — LaTeX & Typst export

Both formats render the same self-study course (`learn/lessons/` + `learn/reference/`)
as a typeset book, with every interactive HTML diagram rebuilt natively
(TikZ / tikz-cd for LaTeX, CeTZ + Fletcher for Typst).

## Output
- `pdf/schemes-course-latex.pdf` — 35 pp, XeLaTeX via tectonic
- `pdf/schemes-course-typst.pdf` — 26 pp, Typst

## Rebuild
```bash
# LaTeX (tectonic auto-fetches packages)
cd learn/export/latex && ~/.local/bin/tectonic -X compile course.tex --outdir ../pdf
mv ../pdf/course.pdf ../pdf/schemes-course-latex.pdf

# Typst
cd learn/export/typst && ~/.local/bin/typst compile course.typ ../pdf/schemes-course-typst.pdf
```

## Layout
- `latex/preamble.tex`, `typst/template.typ` — shared style (palette, callout
  boxes, quiz, Stacks-tag citation helpers). Edit once, both books update.
- `latex/course.tex`, `typst/course.typ` — assemble title page, TOC, two parts.
- `*/parts/<name>.{tex,typ}` — one fragment per source document:
  ch01–ch04 (lessons), refA glossary, refB sheaves cheat-sheet,
  refC Spec ℤ[x] visual, refD Spec k[x,y].

Toolchain: `tectonic` 0.16.9 and `typst` 0.15.0 in `~/.local/bin`
(installed from official prebuilt binaries — Homebrew can't bottle on macOS 27).
