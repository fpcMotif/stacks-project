#import "../template.typ": *
#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#import "@preview/cetz:0.3.4"

= $op("Spec")(R)$: from a ring to a space

#text(fill: inksoft)[
  *Win:* turn any ring into a topological space and read off its points.
  #h(1em) *Time:* ~15 min. #h(1em) *Needs:* prime ideals, radicals, localization.
]

You already know the algebra of a commutative ring $R$ --- primes, radicals,
localization. This lesson installs the one idea that converts _all_ of that
knowledge into geometry: the #term[spectrum] $op("Spec")(R)$. Everything in
scheme theory is built on top of this single move, so it's the right first
brick.#scite("00DZ")[Primary reference: Stacks Project, _Algebra_, "The spectrum of a ring."]

== The points are the primes

#defbox(title: "Definition --- the spectrum")[
  $op("Spec")(R)$ is the *set of prime ideals* of $R$. Each prime $frak(p)$ is
  a #term[point] of the space.#scite("00DZ")[Recall a prime $frak(p) eq.not R$ satisfies $a b in frak(p) arrow.r.double a in frak(p)$ or $b in frak(p)$.]
]

Why primes and not, say, maximal ideals? Because we want the construction to be
*functorial*: a ring map $phi : R arrow S$ should give a map of spaces. It does
--- $frak(q) arrow.r.bar phi^(-1)(frak(q))$ --- precisely because the preimage
of a prime is always prime. (Preimages of maximal ideals need not be
maximal.)#scite("00E2")[Functoriality of $op("Spec")$.] Note the arrow
_reverses_: $op("Spec")$ is contravariant.

#align(center)[
  #diagram(
    spacing: (3.2em, 1.8em),
    node((0, 0), $R$),
    node((1, 0), $S$),
    node((0, 1), $op("Spec")(R)$),
    node((1, 1), $op("Spec")(S)$),
    edge((0, 0), (1, 0), $phi$, "->"),
    edge((1, 1), (0, 1), $phi^(-1)$, "->", label-side: center),
  )
]

#intubox(title: "Intuition --- a \"point\" is a way of evaluating")[
  Think of elements of $R$ as _functions_ on the space. At a point $frak(p)$,
  the value of $f$ lives in the residue field $kappa(frak(p)) = op("Frac")(R\/frak(p))$,
  and "$f(frak(p)) = 0$" means exactly $f in frak(p)$. A prime ideal is the set
  of functions vanishing at that point --- that's why primes deserve to be
  called points.
]

== The closed sets are $V(I)$

#defbox(title: "Definition --- vanishing sets")[
  For an ideal $I subset.eq R$, $space V(I) = {frak(p) in op("Spec")(R) mid(|) I subset.eq frak(p)}$
  --- the points where "every function in $I$ vanishes." The *Zariski topology*
  declares the sets $V(I)$ to be exactly the closed
  sets.#scite("00E0")[These really form a topology: arbitrary ∩, finite ∪, $emptyset$ and the whole space.]
]

Two facts make this a faithful dictionary back to algebra:
- *Only the radical matters:* $V(I) = V(sqrt(I))$, since
  $frak(p) supset.eq I arrow.l.r.double frak(p) supset.eq sqrt(I)$. So radical
  ideals $arrow.l.r$ closed sets, order-_reversingly_.#scite("00E5")[$V(I)=V(sqrt(I))$ and the closed-set calculus.]
- *Inclusion reverses:* $I subset.eq J arrow.r.double V(I) supset.eq V(J)$.
  More constraints $=$ fewer points.

#defbox(title: "Definition --- distinguished opens")[
  $D(f) = {frak(p) mid(|) f in.not frak(p)} = op("Spec")(R) backslash V(f)$, the
  locus where $f$ is "nonzero." These form a *basis* for the topology, and
  crucially $D(f) tilde.equiv op("Spec")(R_f)$: _localizing the ring $=$
  restricting to an open._#scite("00E4")[$D(f)$ a basis and $D(f) tilde.equiv op("Spec")(R_f)$; also $op("Spec")(R)$ is always quasi-compact, Stacks #tag("00E8").]
]

== Two kinds of point: closed vs. generic

The Zariski topology is *not Hausdorff* --- points need not be closed, and
that's a feature.

#align(center)[
  #table(
    columns: (auto, 1fr, 1fr),
    align: left,
    stroke: none,
    inset: (x: 9pt, y: 6pt),
    table.hline(stroke: 0.9pt),
    table.header(
      geo[*Point type*], alg[*Which prime*],
      [*Closure $overline({frak(p)}) = V(frak(p))$*],
    ),
    table.hline(stroke: 0.5pt),
    geo[closed point], alg[maximal ideal $frak(m)$], [just itself],
    geo[generic point], alg[minimal prime (e.g. $(0)$ in a domain)],
    [a whole irreducible component],
    table.hline(stroke: 0.9pt),
  )
]

For a domain, $(0)$ is prime and its closure is the entire space: a single
#term[generic point] whose "smear" is everywhere.#scite("00ES")[Irreducible closed sets $arrow.l.r$ their unique generic points.]
Irreducible closed sets correspond bijectively to their unique generic points
--- geometry and algebra locked together.

== See it: four spectra

#align(center)[
  #table(
    columns: (auto, 1fr, auto),
    align: left,
    stroke: none,
    inset: (x: 9pt, y: 6pt),
    table.hline(stroke: 0.9pt),
    table.header([$R$], [$op("Spec")(R)$], [*Shape*]),
    table.hline(stroke: 0.5pt),
    [a field $k$], [one point $(0)$], [a dot],
    [$ZZ$], [generic $(0)$ $+$ one closed point $(p)$ per prime $p$],
    ["arithmetic line"],
    [$CC[x]$], [generic $(0)$ $+$ closed $(x - a)$ for each $a in CC$],
    [the affine line $AA^1$],
    [$k[x]\/(x^2)$], [one point $(x)$ --- but with nilpotents], [a "fat" point],
    table.hline(stroke: 0.9pt),
  )
]

The "arithmetic line" $op("Spec")(ZZ)$ and the affine line $op("Spec")(CC[x])$
share the same shape: a row of closed points, plus one generic point whose
closure is everything.

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // base line
    line((-0.3, 0), (10.3, 0), stroke: rulec + 1.4pt)
    // closed points
    let pts = ((0.6, $(2)$), (1.8, $(3)$), (3.0, $(5)$), (4.2, $(7)$),
               (5.4, $(11)$), (6.6, $(13)$))
    for (x, lbl) in pts {
      circle((x, 0), radius: 0.07, fill: accent, stroke: accent)
      content((x, -0.42), text(fill: accent, size: 8pt, lbl))
    }
    content((7.6, -0.42), text(fill: inksoft, size: 8pt, $dots.c$))
    // closed-points label
    content((3.4, 0.62), text(fill: accent, size: 8pt, style: "italic",
      [closed points: the primes $(p)$]))
    // generic point: a smeared mark dense everywhere
    content((9.4, 0.7), text(fill: accentB, size: 8pt, [generic point $(0)$]))
    bezier((8.6, 0.0), (9.4, 0.18), (9.0, 0.42), (9.2, 0.0),
      stroke: accentB + 1.2pt)
    circle((9.4, 0.18), radius: 0.05, fill: accentB, stroke: accentB)
    content((5.0, -0.95), text(fill: inksoft, size: 8pt,
      [$op("Spec")(ZZ)$: closed points $(2), (3), (5), dots$ and a dense generic point $(0)$]))
  })
]

The last row is the payoff of using _all_ primes and remembering the ring:
$k[x]\/(x^2)$ and $k$ have the same single point but are different schemes ---
the nilpotent $x$ records an infinitesimal "thickening" invisible to the set of
points alone. Hold onto that; it's where schemes beat classical varieties.

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // plain point: Spec k
    circle((0, 0), radius: 0.08, fill: ink, stroke: ink)
    content((0, -0.55), text(size: 8pt, [$op("Spec")(k)$: a dot]))
    // fat point: Spec k[x]/(x^2)
    circle((5, 0), radius: 0.42, fill: algc.lighten(60%), stroke: algc + 1.2pt)
    circle((5, 0), radius: 0.08, fill: algc, stroke: algc)
    content((5, -0.85), text(size: 8pt, [$op("Spec")(k[x]\/(x^2))$: a "fat" point]))
  })
]

== Retrieve it

Close your notes first --- recall, don't reread. Each answer gives feedback
instantly.

#quizhead(title: [$op("Spec")(R)$ --- recall check])

#quizitem(1)[The points of $op("Spec")(R)$ are the #blank of $R$.][prime ideals][maximal ideals][radical ideals][principal ideals][A][By definition a point is a prime ideal. Maximal ideals give only the closed points; $(0)$ in a domain is a point but not maximal.]

#quizitem(2)[A closed set $V(I)$ depends on the ideal $I$ only through its #blank.][radical][nilradical][generators][dimension][A][$V(I) = V(sqrt(I))$, because $frak(p) supset.eq I arrow.l.r.double frak(p) supset.eq sqrt(I)$. Radical ideals biject with closed sets.]

#quizitem(3)[$op("Spec")$ of a field has exactly #blank.][one point][two points][no points][many points][A][A field's only prime ideal is $(0)$, so its spectrum is a single point.]

#quizitem(4)[The distinguished opens $D(f)$ form a #blank for the topology.][basis][subbasis][filter][cover][A][Every open is a union of $D(f)$'s, so they are a basis --- and $D(f) tilde.equiv op("Spec")(R_f)$.]

#quizitem(5)[If $I subset.eq J$, then $V(I)$ #blank $V(J)$.][contains][equals][misses][splits][A][More functions forced to vanish means fewer points: the correspondence reverses inclusions, so $V(I) supset.eq V(J)$.]

#quizitem(6)[For a domain $R$, the generic point of $op("Spec")(R)$ is #blank.][the zero ideal][a maximal ideal][the unit ideal][every closed point][A][In a domain $(0)$ is prime and its closure is the whole space, so $(0)$ is the dense generic point.]

#quizitem(7)[The closed points of $op("Spec")(ZZ)$ correspond to #blank.][the prime numbers][all the integers][the zero ideal][the unit ideals][A][Maximal ideals of $ZZ$ are $(p)$ for $p$ prime; $(0)$ is the (non-closed) generic point.]

#quizitem(8)[$op("Spec")(k[x]\/(x^2))$ has exactly #blank.][one point][two points][no points][four points][A][The only prime is $(x)$ --- one point --- but the nilpotent $x$ makes it a "fat" point, a different scheme from $op("Spec")(k)$.]

#primary[
  Ravi Vakil, _The Rising Sea_, the chapter *"The spectrum of a ring"*
  (§3.2--3.5). Do at least the exercises on computing $op("Spec")$ for small
  rings --- that's where the picture sticks. Ground truth in the Stacks Project,
  #tag("00DZ").
]
