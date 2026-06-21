#import "../template.typ": *
#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#import "@preview/cetz:0.3.4"

= Sheaves cheat-sheet

_Schemes Self-Study #sym.dot.c Reference._ The compressed essence of Lessons
#link("../lessons/0002-presheaves-and-the-sheaf-condition.html")[0002]--#link("../lessons/0004-sheaves-on-a-basis.html")[0004],
built to print on a page. Terms match the Glossary; tags resolve at
`stacks.math.columbia.edu/tag/XXXX`.

== The two definitions

#defbox(title: [Presheaf --- #tag("006E")])[
  $cal(F) : U |-> cal(F)(U)$ with restriction $rho^U_V : cal(F)(U) -> cal(F)(V)$
  for $V subset.eq U$; #h(0.6em) $rho^U_U = "id"$, #h(0.6em) $rho^V_W rho^U_V = rho^U_W$.
  A contravariant functor on opens. $s|_V := rho^U_V (s)$.
]

#defbox(title: [Sheaf --- #tag("006T")])[
  Presheaf $+$ for every cover $U = union.big U_i$ and compatible $s_i$
  ($s_i |_(U_i ∩ U_j) = s_j |_(U_i ∩ U_j)$), a *unique* $s$ with $s|_(U_i) = s_i$.
  Equivalently, exactness of the equalizer diagram

  #align(center)[
    #diagram(spacing: (3.4em, 2.2em), {
      node((0, 0), $cal(F)(U)$)
      node((1, 0), $product_i cal(F)(U_i)$)
      node((2, 0), $product_(i,j) cal(F)(U_i ∩ U_j).$)
      edge((0, 0), (1, 0), "->")
      edge((1, 0), (2, 0), "->", bend: 9deg)
      edge((1, 0), (2, 0), "->", bend: -9deg)
    })
  ]
]

#table(
  columns: (0.18fr, 0.46fr, 0.30fr),
  stroke: none,
  align: (left, left, left),
  inset: (x: 5pt, y: 5pt),
  table.hline(),
  table.header(
    geo[*Clause*], alg[*Meaning*], [*Fails for...*],
  ),
  table.hline(stroke: 0.5pt),
  geo[uniqueness], alg[separatedness / locality (inject into $product$ stalks, #tag("007A"))], [rarely; holds for any sub-presheaf of a sheaf],
  geo[existence], alg[gluing --- compatible local data patch], [bounded fns, extendable fns],
  table.hline(),
)

#warnbox(title: [Forced conventions --- #tag("006U")])[
  $cal(F)(nothing) = {*}$ (terminal); #h(0.6em) $cal(F)(U union.sq V) = cal(F)(U) times cal(F)(V)$.
]

== Is it a sheaf? --- reflexes

#table(
  columns: (0.42fr, auto, 0.40fr),
  stroke: none,
  align: (left, center + horizon, left),
  inset: (x: 5pt, y: 5pt),
  table.hline(),
  table.header([*Presheaf*], [*Sheaf?*], [*Reason*]),
  table.hline(stroke: 0.5pt),
  [continuous / holomorphic / smooth fns; $k$-forms], text(fill: good)[#sym.checkmark], [the condition is local],
  [sections of $p : E -> X$], text(fill: good)[#sym.checkmark], [the prototype],
  [locally constant fns $underline(A)$ #h(0.3em) #tag("006W")], text(fill: good)[#sym.checkmark], [$=$ constant _sheaf_],
  [bounded continuous fns], text(fill: bad)[$times$], [gluing: pieces glue to $f(x) = x$],
  [globally-extendable fns], text(fill: bad)[$times$], [gluing: $1 slash x$ is local but won't extend],
  [constant presheaf $A$, $|A| >= 2$], text(fill: bad)[$times$], [both: $nothing$ and disconnected opens],
  [$D(f) |-> R_f$ on $op("Spec") R$], text(fill: good)[#sym.checkmark #text(size: 0.85em)[(on basis)]], [localization exact sequence],
  table.hline(),
)

== Stalks & germs #h(0.3em) #tag("0078")

#defbox(title: [Stalk recipe])[
  $cal(F)_x = limits(op("colim"))_(x in U) cal(F)(U)$, filtered colimit over
  neighbourhoods (reverse inclusion). Germ $s_x$: $(U, s) ~ (U', s')$ iff
  $s|_(U'') = s'|_(U'')$ on some $U'' in.rev x$.
]

- *The identity to memorize:* #h(0.4em)
  $cal(O)_(op("Spec") R, frak(p)) = limits(op("colim"))_(f in.not frak(p)) R_f = R_(frak(p))$.
  Stalk $=$ localization (#tag("01HV")).
- All stalks local $=>$ _locally ringed space_; value at $x$ lives in
  $kappa(x) = R_(frak(p)) slash frak(p) R_(frak(p))$.
- Sheaf $=>$ $cal(F)(U) arrow.hook product_x cal(F)_x$ (section $=$ its germs).

== Sheaves on a basis #h(0.3em) #tag("009H")

- $D(f)$ form a basis closed under $∩$ ($D(f) ∩ D(g) = D(f g)$).
- Presheaf on $cal(B)$ #tag("009I") carries _less_ data than on all opens;
  sheaf-on-$cal(B)$ axiom #tag("009J").
- Quasi-compactness $=>$ check only *finite* covers (cofinal, #tag("009K")).
- *Extend-off-basis #tag("009N"):* a sheaf on $cal(B)$ extends to a unique
  sheaf on $X$; $op("Sh")(X) tilde.equiv op("Sh")(cal(B))$ (#tag("009O"));
  stalks unchanged.

== Assembling $cal(O)_(op("Spec") R)$ (4 steps) #h(0.3em) #tag("01HU")

#table(
  columns: (auto, 1fr),
  stroke: none,
  align: (center + horizon, left),
  inset: (x: 6pt, y: 5pt),
  table.hline(),
  table.header([*\#*], [*Step*]),
  table.hline(stroke: 0.5pt),
  [1], [define $cal(O)(D(f)) = R_f$ on the basis],
  [2], [$D(f) = union.big D(g_i) <=> (g_i)$ generate the unit ideal in $R_f$;
       gluing $=$ exactness of
       $0 -> R_f -> product R_(g_i) arrows.rr product R_(g_i g_j)$],
  [3], [stalk $cal(O)_(frak(p)) = R_(frak(p))$ (local)],
  [4], [extend-off-basis $=>$ unique $cal(O)_(op("Spec") R)$; the pair is an
       *affine scheme* #tag("01HW")],
  table.hline(),
)

The gluing step is precisely the exactness of the localization sequence:

#align(center)[
  #diagram(spacing: (3.0em, 2.2em), {
    node((0, 0), $0$)
    node((1, 0), $R_f$)
    node((2, 0), $product_i R_(g_i)$)
    node((3, 0), $product_(i,j) R_(g_i g_j).$)
    edge((0, 0), (1, 0), "->")
    edge((1, 0), (2, 0), "->")
    edge((2, 0), (3, 0), "->", bend: 9deg)
    edge((2, 0), (3, 0), "->", bend: -9deg)
  })
]
