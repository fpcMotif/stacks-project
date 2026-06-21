#import "../template.typ": *
#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#import "@preview/cetz:0.3.4"

#let colim = math.op(math.limits(math.upright("colim")))

= Stalks and germs as directed colimits

#emph[Win:] compute a stalk as a colimit and recognize it as a localization $R_frak(p)$.#h(1em)
#emph[Time:] ~15 min.#h(1em)
#emph[Needs:] Lesson 0002; localization.

#v(0.6em)

A sheaf records data on every open set. To study behavior #emph[at a point] $x$, we zoom in: shrink the
open set around $x$ and keep only what survives arbitrarily close to $x$. The result is the
#term[stalk] $cal(F)_x$. This is the lesson where your commutative algebra pays a dividend: the stalk of
the structure presheaf is exactly the localization $R_frak(p)$ --- no new object, just an old friend
wearing a geometric hat.#scite("0078")[Stalks.]

== The stalk is a colimit over neighborhoods

#defbox(title: "Definition --- stalk")[
The #term[stalk] of a presheaf $cal(F)$ at $x in X$ is
$
  cal(F)_x = colim_(x in U) cal(F)(U),
$
the colimit over all open neighborhoods $U in.rev x$, ordered by *reverse inclusion*
($U >= U'$ iff $U subset.eq U'$), with transition maps the restriction maps of $cal(F)$.#scite("0078")[Defined in the running text of the #emph[Stalks] section.]
]

#defbox(title: "Concrete model --- germs")[
$cal(F)_x = {(U,s) : x in U, s in cal(F)(U)} \/ tilde$, where $(U,s) tilde (U',s')$ iff there is an
open $U'' subset.eq U ∩ U'$ with $x in U''$ and $s|_(U'') = s'|_(U'')$. The class $s_x$ is the
#term[germ] of $s$ at $x$: it remembers $s$ only arbitrarily near $x$.
]

#intubox(title: [Why "directed" (filtered) is the whole game])[
Any two neighborhoods $U, U'$ of $x$ contain a smaller common one ($U ∩ U'$). So any two germs can be
represented on a #emph[single] common $U''$ and then added/multiplied there. That is precisely the
directedness that makes localization $S^(-1) R$ work --- the stalk colimit and the localization colimit
are the same kind of limit-of-shrinking.
]

== The payoff: stalk $=$ localization

Take the structure presheaf on $op("Spec") R$: $cal(F)(D(f)) = R_f$, with restriction $R_f -> R_g$ when
$D(g) subset.eq D(f)$. Fix a prime $frak(p)$.

#defbox(title: "The computation to own")[
The neighborhoods $D(f)$ of $frak(p)$ are exactly those with $f in.not frak(p)$, and
$D(f) ∩ D(g) = D(f g)$ keeps the system directed. Hence
$
  cal(F)_frak(p) = colim_(f in.not frak(p)) R_f = R_frak(p),
$
the localization at $frak(p)$. Identically for a module: $tilde(M)_frak(p) = M_frak(p)$.#scite("01HV")[This is the load-bearing step of the affine-scheme definition: $cal(O)_(op("Spec") R, frak(p)) = R_frak(p)$.]
]

#figure(
  caption: [Smaller neighborhoods $arrow.r.double$ more localized rings; the colimit is $R_frak(p)$.],
  cetz.canvas({
    import cetz.draw: *
    // base line of Spec
    line((-0.5, 0), (8.5, 0), stroke: rulec.darken(20%) + 1pt)
    // nested neighborhoods shrinking toward p
    set-style(stroke: accentB + 1pt)
    circle((1.7, 0), radius: (1.7, 0.9))
    circle((2.7, 0), radius: (1.05, 0.6))
    circle((3.3, 0), radius: (0.5, 0.33))
    // prime point
    circle((3.6, 0), radius: 0.07, fill: accent, stroke: accent)
    content((3.6, 0.42), text(fill: accent, style: "italic")[$frak(p)$])
    content((1.1, 0), text(fill: accentB, size: 9pt)[$D(f)$])
    content((2.3, 0), text(fill: accentB, size: 8pt)[$D(g)$])
    // shrink arrow
    content((5.7, 0.5), text(fill: inksoft, style: "italic", size: 8pt)[shrink $U arrow.br frak(p)$])
    line((4.3, 0), (5.3, 0), stroke: inksoft + 0.8pt, mark: (end: ">"))
    // rings mapping to the stalk
    content((1.7, -1.55), text(fill: algc, size: 9pt)[$R_f$])
    content((3.3, -1.55), text(fill: algc, size: 9pt)[$-> dots.c ->$])
    content((6.0, -1.55), text(fill: accent, size: 9pt)[$colim = R_frak(p)$])
  })
)

=== Play: shrink to the point

Slide to localize step by step at $frak(p) = (x)$ on the affine line $AA^1 = op("Spec") k[x]$. Each notch
removes a point and inverts one more $(x - a)$; the directed colimit is the local ring $k[x]_((x))$.

#figure(
  caption: [Each notch inverts one more $(x-a)$; the directed colimit over shrinking neighborhoods of
  $(x)$ is the local ring $k[x]_((x))$.],
  cetz.canvas({
    import cetz.draw: *
    // affine line A^1
    line((-0.3, 0), (8.6, 0), stroke: rulec.darken(20%) + 1pt)
    // shrinking neighborhoods of (x)
    set-style(stroke: accentB + 1pt)
    circle((3.0, 0), radius: (2.0, 0.7))
    circle((3.7, 0), radius: (1.05, 0.45))
    // the kept point (x) at center
    circle((4.2, 0), radius: 0.08, fill: accent, stroke: accent)
    content((4.2, -0.4), text(fill: accent, style: "italic", size: 9pt)[$(x)$])
    // removed points with crosses
    let pts = ((0.9, "(x+3)"), (2.3, "(x+1)"), (6.0, "(x-1)"), (7.4, "(x-3)"))
    for (px, lab) in pts {
      line((px - 0.13, -0.13), (px + 0.13, 0.13), stroke: bad + 0.9pt)
      line((px - 0.13, 0.13), (px + 0.13, -0.13), stroke: bad + 0.9pt)
      content((px, 0.4), text(fill: inksoft, size: 7pt)[#lab])
    }
    content((4.2, -1.5), text(fill: algc, size: 9pt)[$k[x] arrow.squiggly k[x]_(x-a) arrow.squiggly dots.c arrow.squiggly k[x]_((x))$])
  })
)

== Stalks see the local ring --- and locality of sections

- *Every stalk is a local ring.* $R_frak(p)$ has the unique maximal ideal $frak(p) R_frak(p)$. That is
  the literal reason $op("Spec") R$ is a #term[locally ringed space] --- the adjective "locally" refers
  to the stalks being local rings.#footnote[The value of a function $s$ at $x$ lives in the residue field
  $kappa(x) = R_frak(p) \/ frak(p) R_frak(p)$ --- the same residue field from Lesson 0001. The stalk
  refines that "value" to a whole germ.]

- *A section is determined by its germs.* For a #emph[sheaf], the map
  $cal(F)(U) -> product_(x in U) cal(F)_x$ is injective --- this is exactly the separatedness clause from
  Lesson 0002. So two sections agreeing as germs everywhere are equal.#scite("007A")[Separatedness via stalks.]

== Retrieve it

Recall first. This quiz also re-touches Lesson 0002 (the sheaf condition) --- spacing on purpose.

#quizhead(title: "Stalks & germs --- recall check")

#quizitem(1)[The stalk $cal(F)_x$ is the #blank of $cal(F)(U)$ over neighborhoods of $x$.][colimit][limit][product][kernel][A][$cal(F)_x = colim_(x in U) cal(F)(U)$ --- a colimit (direct/filtered), not a limit. Limits glue, colimits localize.]

#quizitem(2)[Neighborhoods of $x$ index the colimit ordered by #blank inclusion.][reverse][forward][strict][total][A][Smaller neighborhoods are "later" in the system ($U >= U' arrow.l.r.double U subset.eq U'$), so transition maps are restrictions toward $x$.]

#quizitem(3)[Two sections have the same germ at $x$ exactly when they agree on #blank.][a small neighborhood][the entire space][a single point][every closed set][A][$(U,s) tilde (U',s')$ iff $s|_(U'') = s'|_(U'')$ on some open $U'' in.rev x$. A germ is a section seen arbitrarily near $x$.]

#quizitem(4)[For the structure presheaf $D(f) arrow.bar R_f$, the stalk at $frak(p)$ equals #blank.][the localization $R_frak(p)$][the quotient $R\/frak(p)$][the fraction $op("Frac")(R)$][the completion $hat(R)$][A][$colim_(f in.not frak(p)) R_f = R_frak(p)$. Stalk $=$ localization at the prime --- the same colimit you know from algebra.]

#quizitem(5)[$op("Spec") R$ is a #smallcaps[locally] ringed space because every stalk $R_frak(p)$ is #blank.][a local ring][a global ring][a quotient field][a polynomial ring][A][$R_frak(p)$ has the unique maximal ideal $frak(p) R_frak(p)$ --- that's what "locally" in "locally ringed space" means.]

#quizitem(6)[In a sheaf, a section over $U$ is completely determined by its #blank.][germs][values][zeros][covers][A][Separatedness: $cal(F)(U) -> product_(x in U) cal(F)_x$ is injective. Germs at all points pin down the section.]

#quizitem(7)[The stalk colimit is filtered because any two neighborhoods share a #blank one.][smaller][larger][disjoint][closed][A][$U ∩ U'$ is a smaller common neighborhood, so any two germs live on a common open --- the directedness localization needs.]

#quizitem(8)[The neighborhoods $D(f)$ of a prime $frak(p)$ are exactly those with #blank.][$f in.not frak(p)$][$f in frak(p)$][$f = 0$][$frak(p) subset.eq (f)$][A][$frak(p) in D(f) arrow.l.r.double f in.not frak(p)$ (from Lesson 0001). These are the $f$ inverted in $R_frak(p)$.]

#primary[
Ravi Vakil, #link("https://math.stanford.edu/~vakil/216blog/FOAGaug2922public.pdf")[#emph[The Rising Sea]],
§2.4 (stalks and germs). For the structure-sheaf computation $cal(O)_(X, frak(p)) = R_frak(p)$ spelled
out, see #tag("01HV").
]
