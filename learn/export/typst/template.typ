// ============================================================
// template.typ — shared style for the Schemes self-study reader
// Mirrors learn/export/latex/preamble.tex. Default font = New Computer Modern.
// ============================================================
#let ink     = rgb("#1a1814")
#let inksoft = rgb("#4a4640")
#let accent  = rgb("#7c1d28")   // burgundy
#let accentB = rgb("#1f4e5f")   // teal
#let algc    = rgb("#5b3a86")   // violet
#let good    = rgb("#2f6b3a")
#let bad     = rgb("#9a2b2b")
#let warnc   = rgb("#b5651d")
#let paper2  = rgb("#f5f1e8")
#let rulec   = rgb("#d8d2c4")

// Stacks Project tag link + footnote citation
#let tag(id) = link("https://stacks.math.columbia.edu/tag/" + id, raw(id))
#let scite(id, txt) = footnote[#txt (Stacks #tag(id)).]

// colored inline helpers
#let alg(x) = text(fill: algc, x)
#let geo(x) = text(fill: accentB, x)
#let term(x) = text(fill: accent, style: "italic", x)

// callout boxes
#let callout(title, body, color: accent, bg: paper2) = block(
  width: 100%, inset: (x: 11pt, y: 9pt), radius: 3pt, fill: bg,
  stroke: (left: 3pt + color), above: 1.2em, below: 1.2em,
)[#text(weight: "bold", fill: color)[#smallcaps(title)] #linebreak() #body]

#let defbox(body, title: "Definition")  = callout(title, body, color: accent,  bg: paper2)
#let intubox(body, title: "Intuition")  = callout(title, body, color: accentB, bg: rgb("#eef4f4"))
#let warnbox(body, title: "Warning")    = callout(title, body, color: warnc,   bg: rgb("#fbf2ec"))
#let primary(body, title: "Read next (primary source)") = callout(title, body, color: accentB, bg: paper2)

// retrieval-practice quiz item (n = question number)
#let quizitem(n, stem, a, b, c, d, ans, why) = block(below: 0.9em)[
  *#n.* #stem \
  *(A)* #a #h(1.3em) *(B)* #b #h(1.3em) *(C)* #c #h(1.3em) *(D)* #d \
  #text(size: 0.9em, fill: good)[*Answer: #ans.* #why]
]
#let quizhead(title: "Retrieval check") = text(weight: "bold", fill: accentB)[#smallcaps(title)]

// a fill-in blank for quiz stems (avoid bare ___ which Typst reads as emphasis)
#let blank = box(width: 1.8em, stroke: (bottom: 0.6pt + inksoft))[ ]

// document-wide configuration (wrap the whole doc: #show: conf)
#let conf(doc) = {
  set page(paper: "a4", margin: (x: 2.6cm, top: 2.6cm, bottom: 2.8cm))
  set text(size: 11pt, fill: ink, font: "New Computer Modern")
  set par(justify: true, leading: 0.68em)
  set heading(numbering: "1.1")
  show link: set text(fill: accent)
  show heading: set text(fill: ink)
  show heading.where(level: 1): set text(fill: accentB)
  doc
}
