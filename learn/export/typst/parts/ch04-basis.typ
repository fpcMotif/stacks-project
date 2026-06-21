#import "../template.typ": *
#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#import "@preview/cetz:0.3.4"

= Sheaves on a basis

#text(style: "italic")[Schemes Self-Study #sym.dot.c Lesson 0004 #sym.dot.c Sheaves III]

#primary(title: "Win")[
  *Win:* build a sheaf on $op("Spec") R$ by defining it only on the $D(f)$'s.#h(1em)
  *Time:* ~15 min.#h(1em)
  *Needs:* Lessons 0002--0003.#h(1em)
  *Ref:* Sheaves cheat-sheet.
]

Here is the practical problem. To define $cal(O)_(op("Spec") R)$ we know what we want on standard
opens --- $cal(O)(D(f)) = R_f$ --- but specifying sections on _every_ weird open set directly would be
a nightmare. The fix is a theorem with real teeth: *a sheaf is determined by its values on a basis.*
Define it on the $D(f)$'s, check the axiom on those, and a unique genuine sheaf on all of
$op("Spec") R$ comes for free.#scite("009H")[Stacks Project, _Bases and sheaves_ (section).]

== A presheaf on a basis carries _less_ data

Recall a #term[basis] $cal(B)$ of opens: every open is a union of basis elements. For $op("Spec") R$
the standard opens $D(f)$ are a basis, and they are *closed under intersection* since
$D(f) ∩ D(g) = D(f g)$ (Lesson 0001) --- a major convenience.

#defbox(title: "Definition --- (pre)sheaf on a basis")[
  A #term[presheaf on $cal(B)$] assigns sections and restriction maps only to basis elements (with
  identity and transitivity).#scite("009I")[*Warning:* a presheaf on $cal(B)$ holds genuinely _less_
  information than a presheaf on all opens --- the two notions differ.] It is a #term[sheaf on
  $cal(B)$] if it satisfies the gluing axiom for covers of basis elements by basis elements ---
  re-covering each overlap $U_i ∩ U_j$ by basis pieces.#scite("009J")[The sheaf-on-a-basis condition.]
]

#warnbox(title: "You only ever check finite covers")[
  It suffices to verify the axiom on a _cofinal_ system of covers.#scite("009K")[Cofinal systems of
  coverings.] Each $D(f) tilde.eq op("Spec")(R_f)$ is *quasi-compact* (Lesson 0001), so finite
  standard covers $D(f) = union.big_(i=1)^n D(g_i)$ are cofinal. You never have to wrestle an infinite
  cover.
]

The sheaf axiom on the basis is an equalizer condition: a section of $cal(F)$ over $D(f)$ is exactly a
compatible family of sections over a finite cover by standard opens.

#figure(
  diagram(
    spacing: (3.2em, 2em),
    node((0, 0), $cal(F)(D(f))$),
    node((1, 0), $product_i cal(F)(D(g_i))$),
    node((2, 0), $product_(i,j) cal(F)(D(g_i) ∩ D(g_j))$),
    edge((0, 0), (1, 0), "->"),
    edge((1, 0), (2, 0), "->", shift: 4pt),
    edge((1, 0), (2, 0), "->", shift: -4pt),
  ),
  caption: [The sheaf-on-a-basis condition as an equalizer: $cal(F)(D(f))$ is the equalizer of the two
    restriction maps into the overlaps, for a finite standard cover $D(f) = union.big_i D(g_i)$.],
)

== The bridge theorem: extend off the basis

#defbox(title: "Theorem --- extend off the basis")[
  A sheaf $cal(F)$ on a basis $cal(B)$ extends to a *unique* sheaf $cal(F)^("ext")$ on $X$ with
  $cal(F)^("ext")(U) = cal(F)(U)$ for $U in cal(B)$, compatibly with restriction. In fact
  restriction-to-$cal(B)$ is an *equivalence of categories* $op("Sh")(X) attach(-->, t: tilde.op)
  op("Sh")(cal(B))$, and stalks are unchanged: $cal(F)^("ext")_x = cal(F)_x$.#scite("009N")[Extend-off-basis:
  #tag("009N"); the equivalence $op("Sh")(X) tilde.eq op("Sh")(cal(B))$: #tag("009O").]
]

Mechanically, $cal(F)^("ext")(U)$ is reconstructed as the sections that are _locally given by basis
data_ --- compatible germs from $cal(B)$ --- exactly the construction that uniqueness forces. The
content of the theorem is that this works and is unique.

== Assemble the structure sheaf

Everything now snaps together. To build $cal(O)_(op("Spec") R)$:

#figure(
  table(
    columns: (auto, 1fr, auto),
    align: (left, left, left),
    stroke: none,
    table.hline(stroke: 0.9pt),
    table.header(
      text(fill: accentB, weight: "bold")[Step],
      text(fill: accentB, weight: "bold")[What you do],
      text(fill: accentB, weight: "bold")[From],
    ),
    table.hline(stroke: 0.5pt),
    [1. define on basis],
    [$cal(O)(D(f)) = R_f$, restriction $R_f -> R_g$ for $D(g) subset.eq D(f)$],
    [0002 + 0001],
    [2. check axiom],
    [finite cover $D(f) = union.big D(g_i)$ $arrow.l.r.double$ the $g_i$ generate the unit ideal in
      $R_f$; gluing $=$ exactness of $0 -> R_f -> product R_(g_i) arrows.rr product R_(g_i g_j)$],
    [0002 (basis form)],
    [3. read stalks],
    [$cal(O)_(frak(p)) = op("colim")_(f in.not frak(p)) R_f = R_(frak(p))$, a local ring],
    [0003],
    [4. extend],
    [unique sheaf $cal(O)_(op("Spec") R)$ on all opens],
    [this lesson],
    table.hline(stroke: 0.9pt),
  ),
  caption: [The four-step recipe for the structure sheaf of $op("Spec") R$.],
)

The verification in step 2 is the exactness of a single sequence of localizations --- pure commutative
algebra:

#figure(
  diagram(
    spacing: (3.2em, 2em),
    node((0, 0), $0$),
    node((1, 0), $R_f$),
    node((2, 0), $product_i R_(g_i)$),
    node((3, 0), $product_(i,j) R_(g_i g_j)$),
    edge((0, 0), (1, 0), "->"),
    edge((1, 0), (2, 0), "->"),
    edge((2, 0), (3, 0), "->", shift: 4pt),
    edge((2, 0), (3, 0), "->", shift: -4pt),
  ),
  caption: [Gluing for $cal(O)_(op("Spec") R)$ is the exactness of this sequence, when the $g_i$
    generate the unit ideal of $R_f$.],
)

#intubox(title: "You have arrived")[
  Steps 1--4 _are_ the definition of the structure sheaf,#scite("01HU")[Structure sheaf definition:
  #tag("01HU"); it is a sheaf: #tag("01HV").] and an #term[affine scheme] is the pair
  $(op("Spec") R, space cal(O)_(op("Spec") R))$ --- a locally ringed space.#scite("01HW")[Affine
  scheme.] Notice everything genuinely _new_ in step 2 is commutative algebra you already own:
  unit-ideal generation and an exact sequence of localizations. The sheaf theory was all front-loaded
  into Lessons 0002--0004. The next lesson is pure assembly.
]

== Retrieve it

Recall first. This quiz interleaves Lessons 0001--0003 --- that mixing is what builds retention.

#quizhead(title: "Sheaves on a basis --- recall check")

#quizitem(1)[The standard opens $D(f)$ of $op("Spec") R$ form a #blank closed under
  intersection.][basis][cover][filter][chain][A][They are a basis for the Zariski topology, and
  $D(f) ∩ D(g) = D(f g)$ keeps intersections in the family.]

#quizitem(2)[Compared with a presheaf on all opens, a presheaf on a basis carries #blank
  data.][less][more][equal][no][A][A basis presheaf only knows basis elements --- strictly less
  information. (The #smallcaps[sheaf] notions, however, end up equivalent.)]

#quizitem(3)[Because $D(f)$ is quasi-compact, it suffices to check the sheaf axiom on #blank
  covers.][finite][infinite][closed][dense][A][Finite standard covers are cofinal, so verifying the
  basis axiom on finite covers $D(f) = union.big_(i=1)^n D(g_i)$ is enough.]

#quizitem(4)[Extend-off-basis produces, from a sheaf on $cal(B)$, a #blank sheaf on
  $X$.][unique][larger][trivial][constant][A][The extension exists and is unique;
  restriction-back-to-the-basis is an equivalence $op("Sh")(X) tilde.eq op("Sh")(cal(B))$.]

#quizitem(5)[Restriction to the basis gives an #blank between $op("Sh")(X)$ and
  $op("Sh")(cal(B))$.][equivalence][inclusion][inequality][embedding][A][It is an equivalence of
  categories --- basis data and full sheaf data are interchangeable.]

#quizitem(6)[To build $cal(O)$ on $op("Spec") R$ you specify sections only on the #blank.][standard
  opens][closed points][generic points][whole space][A][Define $cal(O)(D(f)) = R_f$ on standard
  opens, check the basis axiom, then extend uniquely.]

#quizitem(7)[Extending off the basis leaves the #blank at every point
  unchanged.][stalk][section][value][cover][A][The extension has $cal(F)^("ext")_x = cal(F)_x$ --- so
  $cal(O)_(frak(p)) = R_(frak(p))$ survives the extension (Lesson 0003).]

#quizitem(8)[$cal(O)_(op("Spec") R)$ is the basis presheaf $D(f) |-> R_f$ made into a sheaf via
  #blank.][the basis theorem][the snake lemma][the Zorn lemma][the Yoneda lemma][A][The
  extend-off-basis theorem turns the verified basis sheaf into the unique structure sheaf on all
  opens.]

#primary[
  Stacks Project, _Bases and sheaves_, #tag("009H") --- the cleanest fully-proved statement of
  extend-off-basis. For the structure-sheaf construction done live, Vakil
  #link("https://math.stanford.edu/~vakil/216blog/FOAGaug2922public.pdf")[_Rising Sea_] §4.1, or
  Borcherds' video walk-through.
]

*Up next:* 0005 #sym.dot.c The structure sheaf & the affine scheme (#tag("01HW")) --- pure assembly.
