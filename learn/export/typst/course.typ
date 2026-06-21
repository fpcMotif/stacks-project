#import "template.typ": *
#show: conf

// ---- title page ----
#page(numbering: none)[
  #v(4cm)
  #align(center)[
    #smallcaps(text(size: 1.2em)[A self-study reader])
    #v(1cm)
    #text(size: 3em, weight: "bold")[Schemes]
    #v(0.4cm)
    #text(size: 1.5em, fill: accentB)[Sheaves, spectra, and the structure sheaf]
    #v(2cm)
    #text(size: 1.1em)[from a commutative-algebra background, scheme-first]
    #v(1.2cm)
    #text(fill: inksoft)[Generated from the interactive course in #raw("learn/"). \
      Citations resolve at #raw("stacks.math.columbia.edu/tag/XXXX").]
  ]
  #align(center + bottom)[#text(fill: inksoft, size: 0.9em)[
    Typeset with Typst · diagrams in CeTZ / Fletcher]]
]

#outline(title: "Contents", depth: 2)
#pagebreak()

// ---- Part I: Lessons ----
#align(center)[#v(3cm) #text(size: 2em, weight: "bold", fill: accentB)[Part I · Lessons]]
#pagebreak()
#include "parts/ch01-spec.typ"
#include "parts/ch02-presheaves.typ"
#include "parts/ch03-stalks.typ"
#include "parts/ch04-basis.typ"

// ---- Part II: Deep-dives & reference ----
#pagebreak()
#align(center)[#v(3cm) #text(size: 2em, weight: "bold", fill: accentB)[Part II · Visual deep-dives & reference]]
#pagebreak()
#include "parts/refC-spec-zx.typ"
#include "parts/refD-spec-kxy.typ"
#include "parts/refB-sheaves.typ"
#include "parts/refA-glossary.typ"
