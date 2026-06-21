#import "../template.typ": *
#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#import "@preview/cetz:0.3.4"

= Three questions about Spec, visually

#emph[The three questions that make $op("Spec")$ click --- drawn, then fully
explained. Each builds directly on Lesson 0001 (points $=$ primes, $V(I)$, $D(f)$,
generic/closed points, residue fields).]

== Draw me $op("Spec") ZZ[x]$

This is Mumford's #term[arithmetic surface] --- the friendliest 2-dimensional
spectrum. Because $ZZ[x]$ is a UFD, its height-1 primes are exactly the principal
primes $(g)$ with $g$ irreducible, and there are only *two kinds* of irreducible
element --- so only two kinds of "curve."

#figure(
  cetz.canvas(length: 1pt, {
    import cetz.draw: *
    set-style(stroke: (thickness: 1pt))
    // frame
    rect((90, -340), (650, -40), fill: paper2, stroke: rulec)
    // generic-point label
    content((370, -26), text(fill: accent, style: "italic", size: 8pt)[$(0)$: generic point --- dim 2, dense in all of $op("Spec") ZZ[x]$])
    // vertical fibers V(p)
    for x in (170, 270, 370, 470) { line((x, -332), (x, -48), stroke: (paint: accentB, thickness: 1.6pt)) }
    line((590, -332), (590, -48), stroke: (paint: gray, thickness: 1.2pt, dash: "dashed"))
    content((530, -200), text(fill: inksoft)[$dots.c$])
    content((590, -60), text(fill: inksoft, style: "italic", size: 7pt)[$AA^1_QQ$])
    // horizontal curves V(f)
    line((96, -110), (644, -110), stroke: (paint: algc, thickness: 1.6pt))
    merge-path(stroke: (paint: algc, thickness: 1.6pt), {
      bezier((96, -252), (270, -254), (150, -227), (210, -277))
      bezier((270, -254), (470, -252), (330, -232), (410, -277))
      bezier((470, -252), (644, -252), (530, -232), (600, -274))
    })
    content((126, -100), text(fill: algc, size: 8pt)[$V(x)$])
    content((150, -240), text(fill: algc, size: 8pt)[$V(x^2+1)$])
    content((600, -296), text(fill: inksoft, style: "italic", size: 7pt)[a 2-to-1 cover $arrow.b$])
    // closed points on V(x)
    for x in (170, 270, 370, 470) { circle((x, -110), radius: 3.6, fill: accent, stroke: none) }
    content((170, -124), text(fill: accent, size: 7pt)[$(2,x)$])
    content((470, -124), text(fill: accent, size: 7pt)[$(7,x)$])
    // projection arrows
    for x in (170, 270, 370, 470, 590) {
      line((x, -340), (x, -368), stroke: (paint: gray, dash: "dashed"), mark: (end: "stealth"))
    }
    content((612, -358), text(fill: inksoft, style: "italic", size: 8pt)[$pi$])
    // base Spec Z
    line((90, -375), (660, -375), stroke: (paint: inksoft, thickness: 1pt), mark: (end: "stealth"))
    content((116, -367), text(fill: inksoft, size: 7pt)[$op("Spec") ZZ$])
    for x in (170, 270, 370, 470) { circle((x, -375), radius: 3, fill: inksoft, stroke: none) }
    circle((590, -375), radius: 3, fill: none, stroke: (paint: inksoft, thickness: 1pt))
    content((170, -388), text(fill: inksoft, size: 7pt)[$(2)$])
    content((270, -388), text(fill: inksoft, size: 7pt)[$(3)$])
    content((370, -388), text(fill: inksoft, size: 7pt)[$(5)$])
    content((470, -388), text(fill: inksoft, size: 7pt)[$(7)$])
    content((590, -388), text(fill: inksoft, size: 7pt)[$(0)$])
  }),
  caption: [$op("Spec") ZZ[x]$ fibers over $op("Spec") ZZ$ via $pi$. The fiber over
    $(p)$ is the vertical line $V(p) = AA^1_(FF_p)$; the fiber over the generic point
    $(0)$ is $AA^1_QQ$.],
)

#align(center, text(size: 8pt, fill: inksoft)[
  #box(baseline: -2pt, line(length: 1.4em, stroke: 1.5pt + accentB)) vertical $V(p)$ (prime $p$, dim 1) #h(1em)
  #box(baseline: -2pt, line(length: 1.4em, stroke: 1.5pt + algc)) horizontal $V(f)$ (irreducible $f$, dim 1) #h(1em)
  #text(fill: accent)[#sym.bullet] closed point $(p,f)$ (maximal, dim 0)
])

The points sort cleanly by dimension:

#align(center, table(
  columns: (auto, auto, auto, auto),
  align: (left, left, center, left),
  stroke: none,
  table.hline(stroke: 1pt),
  table.header(
    [#text(fill: algc)[Prime of $ZZ[x]$]], [#text(fill: accentB)[Geometry]],
    [*dim*], [*residue field*],
  ),
  table.hline(stroke: 0.6pt),
  [#alg[$(0)$]], [#geo[the one generic point, dense everywhere]], [2], [$QQ(x)$],
  [#alg[$(p)$]], [#geo[vertical line $V(p)=AA^1_(FF_p)$]], [1], [$FF_p (x)$],
  [#alg[$(f)$, $f$ irred. primitive]], [#geo[horizontal curve]], [1], [a number field],
  [#alg[$(p,f)$, $overline(f)$ irred. mod $p$]], [#geo[closed point (curve ∩ line)]], [0], [finite $FF_(p^(deg overline(f)))$],
  table.hline(stroke: 1pt),
))

#intubox(title: "The arithmetic hiding in the picture")[
  How a horizontal curve $V(f)$ meets a vertical line $V(p)$ is governed by how $f$
  factors mod $p$. The curve $V(x^2+1)$ is literally $op("Spec") ZZ[i]$, a 2-to-1
  cover of $op("Spec") ZZ$ --- and its fiber over each prime is the splitting of
  that prime in the Gaussian integers:
]

#figure(
  cetz.canvas(length: 1pt, {
    import cetz.draw: *
    content((380, -22), text(fill: inksoft, style: "italic", size: 8pt)[fibers of $V(x^2+1) = op("Spec") ZZ[i]$ over $op("Spec") ZZ$])
    // connectors
    let conn = (paint: gray.lighten(30%), dash: "dashed")
    line((160, -195), (160, -100), stroke: conn)
    line((280, -195), (280, -100), stroke: conn)
    line((400, -195), (400, -80), stroke: conn)
    line((400, -195), (400, -120), stroke: conn)
    line((520, -195), (520, -100), stroke: conn)
    line((630, -195), (630, -100), stroke: conn)
    // fiber points
    circle((160, -100), radius: 4.4, fill: none, stroke: (paint: accent, thickness: 1.6pt))
    circle((160, -100), radius: 1.8, fill: accent, stroke: none)
    circle((280, -100), radius: 4, fill: accentB, stroke: none)
    circle((400, -80), radius: 4, fill: good, stroke: none)
    circle((400, -120), radius: 4, fill: good, stroke: none)
    circle((520, -100), radius: 4, fill: accentB, stroke: none)
    circle((630, -100), radius: 4, fill: accentB, stroke: none)
    content((160, -76), text(fill: accent, size: 7pt)[ramified])
    content((280, -80), text(fill: accentB, size: 7pt)[inert $dot.c FF_9$])
    content((400, -60), text(fill: good, size: 7pt)[split $dot.c FF_5 times 2$])
    content((520, -80), text(fill: accentB, size: 7pt)[inert $dot.c FF_49$])
    content((630, -80), text(fill: accentB, size: 7pt)[inert $dot.c FF_121$])
    content((430, -138), text(fill: good, style: "italic", size: 7pt)[$5=(2+i)(2-i)$])
    // base
    line((80, -195), (690, -195), stroke: (paint: inksoft, thickness: 1pt), mark: (end: "stealth"))
    content((106, -187), text(fill: inksoft, size: 7pt)[$op("Spec") ZZ$])
    for x in (160, 280, 400, 520, 630) { circle((x, -195), radius: 3, fill: inksoft, stroke: none) }
    content((160, -208), text(fill: inksoft, size: 7pt)[$(2)$])
    content((280, -208), text(fill: inksoft, size: 7pt)[$(3)$])
    content((400, -208), text(fill: inksoft, size: 7pt)[$(5)$])
    content((520, -208), text(fill: inksoft, size: 7pt)[$(7)$])
    content((630, -208), text(fill: inksoft, size: 7pt)[$(11)$])
  }),
  caption: [One irreducible curve, but a degree-2 cover: $p$ splits ($equiv 1$), is
    inert ($equiv 3$), or ramifies ($=2$) --- the same data as factoring $x^2+1$ mod
    $p$, i.e. primes in $ZZ[i]$.],
)

#align(center, text(size: 8pt, fill: inksoft)[
  #text(fill: good)[#sym.bullet] split: $p equiv 1 (4)$, two points #h(1em)
  #text(fill: accentB)[#sym.bullet] inert: $p equiv 3 (4)$, one point $FF_(p^2)$ #h(1em)
  #text(fill: accent)[#sym.circle.stroked] ramified: $p=2$
])

So the closed points #emph[are] the maximal ideals $(p,f)$, with
$ZZ[x] \/ (p,f) = FF_p [x] \/ (overline(f))$ a finite field --- and one wiggling
curve quietly encodes a chapter of number theory.

== Why isn't $op("Spec")(R)$ Hausdorff?

Hausdorff means any two distinct points sit in #emph[disjoint] open neighborhoods.
The Zariski topology has far too few opens for that --- for two reasons, both
visible already in $op("Spec") ZZ$.

#figure(
  cetz.canvas(length: 1pt, {
    import cetz.draw: *
    // ---- left: R is Hausdorff ----
    content((180, -24), text(fill: good, size: 8pt)[$RR$ --- Hausdorff #sym.checkmark])
    line((30, -140), (330, -140), stroke: (paint: gray, thickness: 1pt))
    circle((115, -140), radius: (48, 30), fill: accentB.lighten(88%), stroke: accentB)
    circle((245, -140), radius: (48, 30), fill: accentB.lighten(88%), stroke: accentB)
    circle((115, -140), radius: 3.2, fill: ink, stroke: none)
    circle((245, -140), radius: 3.2, fill: ink, stroke: none)
    content((115, -150), text(fill: ink, size: 8pt)[$a$])
    content((245, -150), text(fill: ink, size: 8pt)[$b$])
    content((180, -200), text(fill: inksoft, style: "italic", size: 7pt)[disjoint open intervals --- gap between])
    content((180, -224), text(fill: good, weight: "bold", size: 8pt)[can separate any two points])
    // ---- right: Spec Z not Hausdorff ----
    let dx = 380
    content((dx + 180, -24), text(fill: bad, size: 8pt)[$op("Spec") ZZ$ --- not Hausdorff #sym.times])
    // generic-point smear
    circle((dx + 190, -140), radius: (165, 16), fill: accent.lighten(92%), stroke: (paint: accent.lighten(40%), dash: "dashed"))
    line((dx + 30, -140), (dx + 330, -140), stroke: (paint: gray, thickness: 1pt))
    circle((dx + 135, -140), radius: (80, 34), fill: bad.lighten(88%), stroke: bad)
    circle((dx + 225, -140), radius: (80, 34), fill: bad.lighten(88%), stroke: bad)
    circle((dx + 120, -140), radius: 3.2, fill: accent, stroke: none)
    circle((dx + 225, -140), radius: 3.2, fill: accent, stroke: none)
    circle((dx + 300, -140), radius: 2.5, fill: inksoft, stroke: none)
    content((dx + 120, -126), text(fill: accent, size: 8pt)[$(2)$])
    content((dx + 225, -126), text(fill: accent, size: 8pt)[$(3)$])
    content((dx + 46, -166), text(fill: accent, style: "italic", size: 7pt)[$(0)$])
    content((dx + 180, -200), text(fill: inksoft, style: "italic", size: 7pt)[opens are cofinite --- they always overlap])
    content((dx + 180, -216), text(fill: accent, style: "italic", size: 7pt)[…and the generic point $(0)$ is inside every open])
    content((dx + 180, -236), text(fill: bad, weight: "bold", size: 8pt)[any two nonempty opens overlap])
  }),
  caption: [On $RR$ any two points are separated by disjoint opens; on $op("Spec") ZZ$
    every nonempty open is cofinite, so any two of them overlap --- and the generic
    point lives in all of them.],
)

Pinning down the two reasons:
- *Points need not be closed.* Hausdorff $arrow.r.double$ $T_1$ (every point
  closed). But the generic point $(0)$ of a domain has closure the #emph[whole space]
  --- and $(0) in D(f)$ for every $f != 0$, so it sits inside #emph[every] nonempty
  open. You can never wall it off.
- *Nonempty opens always meet.* For an irreducible $op("Spec")(R)$ (e.g. $R$ a
  domain), $D(f) ∩ D(g) = D(f g) != nothing$ whenever $f, g != 0$. In
  $op("Spec") ZZ$ the only proper closed sets are #emph[finite] sets of primes, so
  every nonempty open is cofinite, and two cofinite sets always intersect.

#primary(title: "The dividing line")[
  #align(center)[$op("Spec")(R)$ is Hausdorff $arrow.l.r.double$ it is $T_1$
  $arrow.l.r.double$ every prime is maximal $arrow.l.r.double$ $dim R = 0$.]
]

So the only Hausdorff spectra are the dimension-0 ones: a field gives a single
point; an Artinian ring gives a finite discrete set; a Boolean ring gives a
Cantor-like Stone space. Everything with actual geometric dimension is #emph[not]
Hausdorff --- and that's by design. The Zariski topology is deliberately coarse;
the geometric richness is moved into the structure sheaf $cal(O)_X$ instead. Generic
points aren't a bug --- they let you speak of "the behavior at the generic point,"
i.e. the function field.

== What's the residue field at $(p)$?

An element $f in R$ behaves like a #emph[function] on $op("Spec")(R)$. Its value at a
point $frak(p)$ lives in the *residue field*

#primary(title: "Residue field")[
  #align(center)[$kappa(frak(p)) = op("Frac")(R \/ frak(p)) = R_(frak(p)) \/ frak(p) R_(frak(p)),
  quad "and" quad f(frak(p)) := [f] in kappa(frak(p)).$]
]

#figure(
  cetz.canvas(length: 1pt, {
    import cetz.draw: *
    content((380, -24), text(fill: inksoft, size: 8pt)["evaluate the function $n$ at the point $(p)$" $=$ "reduce $n$ mod $p$"])
    // source box
    rect((60, -150), (240, -70), fill: paper2, stroke: (paint: algc, thickness: 1pt), radius: 6)
    content((150, -96), text(fill: algc, size: 11pt)[$n in ZZ$])
    content((150, -124), text(fill: inksoft, style: "italic", size: 7pt)[a function on $op("Spec") ZZ$])
    // arrow
    line((250, -110), (378, -110), stroke: (paint: accentB, thickness: 1.1pt), mark: (end: "stealth"))
    content((315, -100), text(fill: accentB, size: 7pt)[at $(p)$: $n arrow.r.bar n mod p$])
    // target circle
    circle((470, -110), radius: 52, fill: accentB.lighten(90%), stroke: (paint: accentB, thickness: 1pt))
    content((470, -104), text(fill: accentB, size: 11pt)[$FF_p$])
    content((470, -128), text(fill: inksoft, style: "italic", size: 7pt)[$= kappa((p))$])
    // example box
    rect((556, -146), (726, -74), fill: paper2, stroke: (paint: good, thickness: 1pt), radius: 6)
    content((641, -100), text(fill: good, size: 8pt)[$100$ at $(7)$])
    content((641, -124), text(fill: ink, size: 8pt)[$= 2 quad (100 = 14 dot.c 7 + 2)$])
    // footnote
    content((470, -196), text(fill: inksoft, style: "italic", size: 7pt)[since $ZZ \/ (p)$ is already a field, $kappa((p)) = FF_p$; at the generic point $kappa((0)) = QQ$])
  }),
  caption: [The residue field at $(p) in op("Spec") ZZ$ is $FF_p$ --- so "reducing $n$
    mod $p$" is #emph[literally] evaluating the function $n$ at the point $(p)$.],
)

#intubox(title: "Try it")[
  Evaluate the integer $n$ at the point $(p)$. For example, $100 = 14 dot.c 7 + 2$,
  so the function $100$ evaluates to $2$ at the point $(7)$; the value lives in the
  residue field $kappa((7)) = FF_7$. The point $(N)$ is a genuine point with residue
  field $FF_N$ only when $N$ is prime --- for composite $N$, $ZZ \/ (N)$ is not a
  field.
]

The pattern generalizes: *closed points carry small (finite) residue fields;
generic points carry big transcendental ones.* The local ring $R_(frak(p))$ reveals
the dimension through its residue field. Reading it off the arithmetic surface from
Q1:

#align(center, table(
  columns: (auto, auto, auto),
  align: (left, left, left),
  stroke: none,
  table.hline(stroke: 1pt),
  table.header([*Point*], [$kappa(frak(p))$], [*flavor*]),
  table.hline(stroke: 0.6pt),
  [$(0)$ --- generic, dim 2], [$QQ(x)$], [function field, transcendental],
  [$(p)$ --- vertical line], [$FF_p (x)$], [function field over $FF_p$],
  [$(f)$ --- horizontal curve], [$op("Frac")(ZZ[x] \/ (f))$], [a number field],
  [$(p,f)$ --- closed point], [$FF_(p^(deg overline(f)))$], [a finite field],
  table.hline(stroke: 1pt),
))

And here Q1 and Q3 fuse: at the closed point $(p, x^2+1)$ over an #emph[inert] prime
the residue field is $FF_(p^2)$, while over a #emph[split] prime the two points each
have residue field $FF_p$ --- the residue field #emph[is] the splitting type.

#intubox(title: "Want to go further?")[
  Ask me: "draw $op("Spec") k[x,y]$," "what does the local ring $R_((p))$ look like
  for $ZZ$?", or "show the structure sheaf's value on a $D(f)$ here." I'm your
  teacher between lessons.
]
