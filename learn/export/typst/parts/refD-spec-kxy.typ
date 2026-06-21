#import "../template.typ": *
#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#import "@preview/cetz:0.3.4"

= $op("Spec") k[x,y]$: the affine plane

The #geo[geometric] 2-dimensional spectrum --- the natural twin of the arithmetic
surface $op("Spec") ZZ[x]$. Take $k$ algebraically closed; then the picture is exactly
the classical plane, upgraded with generic points.

== The three kinds of point

$k[x,y]$ is a 2-dimensional UFD, so its primes come in three heights:

#figure(
  cetz.canvas(length: 1cm, {
    import cetz.draw: *
    set-style(stroke: 0.4pt)

    // generic-point caption
    content((0.4, 3.15), text(fill: accent, style: "italic", size: 8pt)[$(0)$: generic point --- dim 2, dense in the whole plane])

    // axes
    line((-3.6, -1.55), (4.0, -1.55), stroke: rulec + 0.8pt, mark: (end: ">"), name: "xax")
    content((4.25, -1.55), text(fill: inksoft, size: 9pt)[$x$])
    line((0, -2.3), (0, 2.55), stroke: rulec + 0.8pt, mark: (end: ">"))
    content((0.28, 2.75), text(fill: inksoft, size: 9pt)[$y$])

    // the line V(y-x)
    line((-2.2, -2.0), (2.55, 2.45), stroke: algc + 1.1pt)
    content((-2.55, 2.3), text(fill: algc, size: 9pt)[$V(y-x)$])

    // the parabola V(y-x^2)
    line(..range(-31, 32).map(i => {
      let t = i / 20
      (t, t * t - 1.55)
    }), stroke: accentB + 1.1pt)
    content((-3.0, 1.0), text(fill: accentB, size: 9pt)[$V(y-x^2)$])

    // the circle V(x^2+y^2-1)
    circle((0, -0.55), radius: 1.4, stroke: accent + 1.1pt)
    content((0, -2.6), text(fill: accent, size: 9pt)[$V(x^2+y^2-1)$])

    // closed points
    circle((0, -0.55), radius: 0.07, fill: ink, stroke: none)
    content((-0.55, -0.85), text(fill: ink, size: 8pt)[$(0,0)$])
    circle((1.0, 0.45), radius: 0.07, fill: ink, stroke: none)
    content((1.4, 0.7), text(fill: ink, size: 8pt)[$(1,1)$])
    circle((2.1, 0.95), radius: 0.07, fill: ink, stroke: none)
    content((2.35, 1.25), text(fill: ink, size: 8pt)[$(a,b)$])
    content((3.55, 0.85), text(fill: inksoft, style: "italic", size: 8pt)[$=(x-a, y-b)$])
  }),
  caption: [
    #text(fill: algc)[#box(baseline: -0.18em, line(length: 1.1em, stroke: algc + 1.5pt))] $V(y-x)$ a line #h(0.8em)
    #text(fill: accentB)[#box(baseline: -0.18em, line(length: 1.1em, stroke: accentB + 1.5pt))] $V(y-x^2)$ a parabola #h(0.8em)
    #text(fill: accent)[#box(baseline: -0.18em, line(length: 1.1em, stroke: accent + 1.5pt))] $V(x^2+y^2-1)$ a circle #h(0.8em)
    #text(fill: ink)[$bullet$] closed point $(a,b)$ \
    Each irreducible curve $V(f)$ is the closure of one height-1 prime $(f)$; each honest
    point $(a,b)$ is a maximal ideal $(x-a,y-b)$; and one generic point $(0)$ is dense over all of it.
  ],
)

#align(center)[
  #table(
    columns: 4,
    align: left + horizon,
    stroke: none,
    inset: (x: 7pt, y: 5pt),
    table.hline(stroke: 0.9pt),
    table.header(
      alg[Prime of $k[x,y]$], geo[Geometry], [height / dim], [$kappa(frak(p))$],
    ),
    table.hline(stroke: 0.5pt),
    alg[$(0)$], geo[the whole plane (its generic point)], [0 / dim 2], [$k(x,y)$],
    alg[$(f)$, $f$ irreducible], geo[an irreducible curve ${f=0}$], [1 / dim 1], [$op("Frac")(k[x,y] \/ (f))$],
    alg[$(x-a, y-b)$], geo[the point $(a,b)$], [2 / dim 0], [$k$],
    table.hline(stroke: 0.9pt),
  )
]

#warnbox(title: "Why k = k-bar matters")[
  The clean "maximal ideals $=$ points $(a,b)$" is exactly the Nullstellensatz, and it
  needs $k$ algebraically closed. Over $RR$, e.g., $(x^2+1)$ is also maximal --- extra closed
  points with residue field $CC$, just like the arithmetic case.
]

== Specialization: dimension drops along closures

The three heights are linked by #term[specialization] --- a point lies in the closure of a
more generic one, written $eta arrow.squiggly x$. Moving from generic to closed, dimension
falls $2 -> 1 -> 0$:

#figure(
  diagram(
    spacing: (3.2em, 1.0em),
    node-stroke: none,
    {
      node((0, 0), text(fill: accent, size: 1.1em)[$bullet$])
      node((0, -0.9), text(fill: accent)[$(0)$])
      node((0, 0.9), text(fill: inksoft, size: 0.82em)[plane #sym.dot dim 2])

      node((1, 0), text(fill: accentB, size: 1.1em)[$bullet$])
      node((1, -0.9), text(fill: accentB)[$(f)$])
      node((1, 0.9), text(fill: inksoft, size: 0.82em)[curve #sym.dot dim 1])

      node((2, 0), text(fill: ink, size: 1.1em)[$bullet$])
      node((2, -0.9), text(fill: ink)[$(x-a,y-b)$])
      node((2, 0.9), text(fill: inksoft, size: 0.82em)[point #sym.dot dim 0])

      edge((0, 0), (1, 0), "->", stroke: inksoft + 0.6pt, label: text(fill: inksoft, style: "italic", size: 0.8em)[specialize], label-side: center)
      edge((1, 0), (2, 0), "->", stroke: inksoft + 0.6pt, label: text(fill: inksoft, style: "italic", size: 0.8em)[specialize], label-side: center)
    },
  ),
  caption: [
    $(0) arrow.squiggly (f) arrow.squiggly (x-a,y-b)$ when the point $(a,b)$ lies on the
    curve ${f=0}$ --- a maximal chain of primes of length 2, certifying $dim k[x,y] = 2$.
  ],
)

== Two ways to be a surface

$op("Spec") k[x,y]$ and $op("Spec") ZZ[x]$ are both 2-dimensional, but they get there
differently — one geometric, one arithmetic:

#align(center)[
  #table(
    columns: 3,
    align: left + horizon,
    stroke: none,
    inset: (x: 8pt, y: 5pt),
    table.hline(stroke: 0.9pt),
    table.header(
      [], geo[$k[x,y]$ --- geometric], alg[$ZZ[x]$ --- arithmetic],
    ),
    table.hline(stroke: 0.5pt),
    [base direction], [$AA^1_k = op("Spec") k[x]$], [$op("Spec") ZZ$ (the primes)],
    [closed points], [$(a,b)$, residue field $k$], [$(p,f)$, residue field $FF_(p^d)$],
    ["vertical" curves], [lines $x=a$], [fibers $V(p) = AA^1_(FF_p)$],
    [generic point], [$kappa = k(x,y)$], [$kappa = QQ(x)$],
    table.hline(stroke: 0.9pt),
  )
]

This analogy --- number fields behaving like function fields of curves --- is one of the deep
organizing ideas of modern arithmetic geometry.

#intubox(title: "Want to go further?")[
  Ask me: "what's the local ring at $(0,0)$ here?", "draw a non-reduced scheme like $V(y^2)$,"
  or "how does the structure sheaf assign $k[x,y]_f$ to $D(f)$?"
]
