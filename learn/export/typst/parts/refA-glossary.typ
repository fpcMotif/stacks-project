#import "../template.typ": *
#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#import "@preview/cetz:0.3.4"

= Glossary and the algebra--geometry dictionary

The canonical vocabulary for this course. Terms here are used consistently across all
lessons. Every entry links to the #link("https://stacks.math.columbia.edu/")[Stacks Project]
tag that pins it down precisely. Built to print on one or two pages for quick reference.

== Core terms

#defbox(title: [Spectrum --- $op("Spec")(R)$])[
  The set of all *prime ideals* of a (commutative, unital) ring $R$, equipped with the
  Zariski topology. The fundamental object: it turns a ring into a space.
  #term[A point of $op("Spec")(R)$ is a prime ideal $frak(p)$.] #h(1fr) #tag("00DZ")
]

#defbox(title: [$V(I)$ --- vanishing / closed set])[
  For an ideal (or subset) $I subset.eq R$, $V(I) = {frak(p) in op("Spec")(R) mid(|) I subset.eq frak(p)}$.
  These are exactly the *closed sets* of the Zariski topology. Think "points where every
  function in $I$ vanishes." #h(1fr) #tag("00E0")
]

#defbox(title: [$D(f)$ --- distinguished / standard open])[
  $D(f) = {frak(p) mid(|) f in.not frak(p)} = op("Spec")(R) without V(f)$: the locus where
  $f$ is "nonzero." The $D(f)$ form a *basis* for the topology, and $D(f) tilde.equiv op("Spec")(R_f)$.
  #h(1fr) #tag("00E4")
]

#defbox(title: [Zariski topology])[
  The topology on $op("Spec")(R)$ whose closed sets are the $V(I)$. It is generally
  *not Hausdorff*; it is always quasi-compact. #h(1fr) #tag("00E0")
]

#defbox(title: [Generic point])[
  A point whose closure is a whole irreducible closed set. For an integral domain, the prime
  $(0)$ is a generic point dense in all of $op("Spec")(R)$. Irreducible closed subsets
  $arrow.l.r$ their unique generic points. #h(1fr) #tag("00ES")
]

#defbox(title: [Closed point])[
  A point ${frak(p)}$ that is closed, i.e. $frak(p)$ is a *maximal ideal*. In $op("Spec")(R)$,
  $overline({frak(p)}) = V(frak(p))$. #h(1fr) #tag("00E5")
]

#defbox(title: [Quasi-compact])[
  Every open cover has a finite subcover (the term "compact" is reserved for quasi-compact $+$
  Hausdorff in this field). $op("Spec")(R)$ is always quasi-compact. #h(1fr) #tag("00E8")
]

#defbox(title: [Structure sheaf $cal(O)_X$ (#emph[preview, lesson 0002])])[
  The sheaf of rings on $X = op("Spec")(R)$ with $cal(O)_X (D(f)) = R_f$; its stalk at
  $frak(p)$ is the local ring $R_(frak(p))$. Makes $X$ a *locally ringed space*. #h(1fr) #tag("01HR")
]

#defbox(title: [Affine scheme (#emph[preview, lesson 0002])])[
  A locally ringed space isomorphic to $(op("Spec")(R), cal(O)_(op("Spec")(R)))$.
  A *scheme* is a space locally isomorphic to affine schemes. #h(1fr) #tag("01HW")
]

== Sheaf terms

#defbox(title: [Presheaf])[
  An assignment $U |-> cal(F)(U)$ (sections) on opens, with restriction maps
  $rho^U_V : cal(F)(U) -> cal(F)(V)$ for $V subset.eq U$ satisfying $rho^U_U = "id"$ and
  $rho^V_W rho^U_V = rho^U_W$ --- a contravariant functor on opens. $s|_V := rho^U_V (s)$.
  #h(1fr) #tag("006E")
]

#defbox(title: [Sheaf])[
  A presheaf in which compatible local sections glue *uniquely*: for any cover
  $U = union.big U_i$ and $s_i$ agreeing on overlaps, a unique $s in cal(F)(U)$ restricts to
  each $s_i$. Two clauses: #emph[gluing] (existence) and #emph[separatedness/locality]
  (uniqueness). #h(1fr) #tag("006T")
]

#defbox(title: [Separated presheaf])[
  The uniqueness half alone: $cal(F)(U) -> product_(x in U) cal(F)_x$ is injective --- a
  section is determined by its germs. #h(1fr) #tag("007A")
]

#defbox(title: [Stalk $cal(F)_x$ & germ $s_x$])[
  $cal(F)_x = op("colim", limits: #true)_(x in U) cal(F)(U)$, the filtered colimit over
  neighborhoods of $x$ (reverse inclusion). A *germ* $s_x$ is a section seen arbitrarily
  near $x$: $(U, s) tilde (U', s')$ iff they agree on some smaller $U'' in.rev x$. For the
  structure sheaf, $cal(O)_(X, frak(p)) = R_(frak(p))$. #h(1fr) #tag("0078")
]

#defbox(title: [Sheafification $cal(F)^\#$])[
  The best sheaf approximating a presheaf $cal(F)$ (left adjoint to the inclusion of sheaves),
  built from compatible germs; $cal(F)^\#_x = cal(F)_x$. E.g. the constant #emph[sheaf]
  $underline(A)$ is the sheafification of the constant presheaf. #h(1fr) #tag("007X")
]

#defbox(title: [(Pre)sheaf on a basis])[
  A (pre)sheaf defined only on a basis $cal(B)$ of opens (e.g. the $D(f)$). A sheaf on
  $cal(B)$ *extends to a unique sheaf* on $X$, with $op("Sh")(X) tilde.eq op("Sh")(cal(B))$
  and unchanged stalks --- the mechanism that builds $cal(O)_(op("Spec") R)$.
  #h(1fr) #tag("009H"), extend-off-basis #tag("009N")
]

#defbox(title: [Locally ringed space])[
  A space with a sheaf of rings $cal(O)_X$ #emph[all of whose stalks are local rings]. The
  "locally" is exactly the stalks $R_(frak(p))$ being local. Affine schemes, and hence
  schemes, are locally ringed spaces. #h(1fr) #tag("01HB")
]

== The algebra $arrow.l.r$ geometry dictionary

The engine of scheme theory: every algebraic notion has a geometric shadow, and vice versa.

#table(
  columns: (1fr, 1fr, 1fr),
  align: (left, left, left),
  stroke: none,
  inset: (x: 6pt, y: 5pt),
  table.hline(stroke: 0.9pt),
  table.header(
    [#text(weight: "bold", fill: algc)[Algebra (ring $R$)]],
    [#text(weight: "bold", fill: accentB)[Geometry ($op("Spec") R$)]],
    [#text(weight: "bold")[Note]],
  ),
  table.hline(stroke: 0.5pt),
  alg[prime ideal $frak(p)$], geo[a point], [the defining correspondence],
  alg[maximal ideal $frak(m)$], geo[a closed point], [closure is just itself],
  alg[minimal prime], geo[generic point of a component], [dense in a component],
  alg[radical ideal $I = sqrt(I)$], geo[closed set $V(I)$], [order-reversing bijection],
  alg[$I subset.eq J$], geo[$V(I) supset.eq V(J)$], [inclusion reverses],
  alg[nilradical $sqrt((0))$], geo[whole space $V(0)$], [nilpotents "vanish everywhere"],
  alg[$R$ is a domain], geo[$op("Spec") R$ irreducible], [has a generic point $(0)$],
  alg[$R$ reduced (no nilpotents)], geo[reduced scheme], [functions determined by values],
  alg[localization $R_f$], geo[restriction to $D(f)$], [opens $arrow.l.r$ localizations],
  alg[localization $R_(frak(p))$], geo[germ / stalk at $frak(p)$], [local behavior near a point],
  alg[ring map $R -> S$], geo[map $op("Spec") S -> op("Spec") R$], [contravariant; $frak(q) |-> phi^(-1)(frak(q))$ #tag("00E2")],
  alg[residue field $kappa(frak(p)) = op("Frac")(R\/frak(p))$], geo["value field" at the point], [where $f$ takes its value $f(frak(p))$],
  table.hline(stroke: 0.9pt),
)

== Worked Spec examples (memorize these shapes)

#table(
  columns: (0.8fr, 1.6fr, 1fr),
  align: (left, left, left),
  stroke: none,
  inset: (x: 6pt, y: 5pt),
  table.hline(stroke: 0.9pt),
  table.header(
    [#text(weight: "bold")[Ring $R$]],
    [#text(weight: "bold")[$op("Spec")(R)$ --- its points]],
    [#text(weight: "bold")[Picture]],
  ),
  table.hline(stroke: 0.5pt),
  [a field $k$], [one point: $(0)$], [a single dot],
  [$k[x]\/(x^2)$], [one point: $(x)$ (with nilpotents)], [a "fat" double point],
  [$ZZ$], [generic $(0)$ + closed $(p)$ for each prime $p$], [a line of primes + 1 generic],
  [$k[x]$, $k = overline(k)$], [generic $(0)$ + closed $(x - a)$, $a in k$], [the affine line $AA^1_k$],
  [$RR[x]$], [$(0)$, $(x - a)$, and $(x^2 + b x + c)$ irreducible], [line + "conjugate-pair" points],
  [$k[x, y]$, $k = overline(k)$], [$(0)$; height-1 primes $(f)$; maximal $(x - a, y - b)$], [the plane $AA^2_k$: 2D],
  table.hline(stroke: 0.9pt),
)

#figure(
  caption: [The shapes of $op("Spec")$ in the worked examples: a point, a fat double point, a
    line of primes with a generic point, the affine line, and the affine plane with a
    height-$1$ curve.],
  cetz.canvas(length: 1cm, {
    import cetz.draw: *
    set-style(stroke: (thickness: 0.8pt))

    // ---- row 1 ----
    // a field k : a single point
    content((0.4, 1.25), text(fill: accent, weight: "bold", size: 8pt)[$op("Spec") k$])
    circle((0.4, 0.4), radius: 0.07, fill: accentB, stroke: none)
    content((0.4, 0.0), text(size: 7pt)[$(0)$])

    // k[x]/(x^2) : a fat double point
    content((2.7, 1.25), text(fill: accent, weight: "bold", size: 8pt)[$op("Spec") k[x]\/(x^2)$])
    circle((2.7, 0.4), radius: 0.16, fill: accentB.lighten(75%), stroke: none)
    circle((2.7, 0.4), radius: 0.07, fill: accentB, stroke: none)
    content((2.7, -0.05), text(size: 7pt)[$(x)$])

    // Z : line of closed primes + generic
    content((7.0, 1.25), text(fill: accent, weight: "bold", size: 8pt)[$op("Spec") ZZ$])
    line((5.5, 0.4), (8.6, 0.4), stroke: (paint: rulec, thickness: 1.2pt))
    let zs = ((5.9, "2"), (6.5, "3"), (7.1, "5"), (7.7, "7"), (8.3, $dots.c$))
    for (x, lab) in zs {
      circle((x, 0.4), radius: 0.06, fill: accentB, stroke: none)
      content((x, 0.08), text(size: 6.5pt)[$(#lab)$])
    }
    content((7.0, 0.95), text(fill: algc, size: 6.5pt)[generic $(0)$])
    line((7.0, 0.82), (7.0, 0.5), mark: (end: ">"), stroke: (paint: algc, thickness: 0.6pt))

    // ---- row 2 ----
    let dy = -2.6
    // affine line A^1_k
    content((1.6, 1.4 + dy), text(fill: accent, weight: "bold", size: 8pt)[$AA^1_k = op("Spec") k[x]$])
    line((0.1, 0.4 + dy), (3.4, 0.4 + dy), mark: (end: ">"), stroke: (paint: rulec, thickness: 1.2pt))
    for x in (0.6, 1.2, 1.8, 2.4, 3.0) {
      circle((x, 0.4 + dy), radius: 0.055, fill: accentB, stroke: none)
    }
    content((1.2, 0.08 + dy), text(size: 6.5pt)[$(x - a)$])
    content((2.7, 0.9 + dy), text(fill: algc, size: 6.5pt)[generic $(0)$])
    line((2.7, 0.78 + dy), (2.4, 0.48 + dy), mark: (end: ">"), stroke: (paint: algc, thickness: 0.6pt))

    // affine plane A^2_k
    let ox = 5.4
    content((ox + 1.5, 2.0 + dy), text(fill: accent, weight: "bold", size: 8pt)[$AA^2_k = op("Spec") k[x, y]$])
    rect((ox - 0.1, -0.1 + dy), (ox + 3.0, 1.5 + dy), fill: accentB.lighten(92%), stroke: (paint: rulec, thickness: 1.2pt))
    // a height-1 curve V(f)
    line(
      (ox + 0.1, 0.2 + dy), (ox + 0.9, 1.0 + dy), (ox + 1.8, 0.65 + dy), (ox + 2.85, 1.35 + dy),
      stroke: (paint: accent, thickness: 1.1pt),
    )
    content((ox + 2.6, 0.75 + dy), text(fill: accent, size: 6.5pt)[$(f)$])
    // maximal (closed) points
    circle((ox + 1.0, 0.45 + dy), radius: 0.055, fill: accentB, stroke: none)
    content((ox + 1.0, 0.12 + dy), text(size: 6.5pt)[$(x - a, y - b)$])
    circle((ox + 2.2, 1.15 + dy), radius: 0.055, fill: accentB, stroke: none)
    content((ox + 0.7, 1.7 + dy), text(fill: algc, size: 6.5pt)[generic $(0)$])
  }),
)

#v(0.6em)
#text(size: 0.9em, style: "italic")[
  Reference for the Schemes self-study course. Tags resolve at
  #link("https://stacks.math.columbia.edu/")[`stacks.math.columbia.edu/tag/XXXX`].
  Ask your teacher (the agent) to expand any entry.
]
