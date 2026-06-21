#import "../template.typ": *
#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#import "@preview/cetz:0.3.4"

= Presheaves and the sheaf condition

#text(style: "italic")[Win:] decide whether a rule "is a sheaf" by checking gluing on a cover.#h(1em)
#text(style: "italic")[Time:] \~15 min.#h(1em)
#text(style: "italic")[Needs:] Lesson 0001 ($D(f)$, opens).

Last lesson you turned a ring into a #emph[space]. A space alone is too coarse to do geometry on
(recall: it isn't even Hausdorff). The missing data --- "what are the functions on each open
set?" --- is packaged by a *sheaf*. This lesson installs the one axiom that separates a sheaf from a
mere bookkeeping table: #term[gluing]. It is the exact axiom the structure sheaf $cal(O)_(op("Spec") R)$
will have to satisfy.#scite("006A")[Stacks Project, ch. #emph[Sheaves on Spaces].]

== Presheaf = data + restriction

#defbox(title: "Definition --- presheaf")[
A *presheaf* $cal(F)$ on a space $X$ assigns to every open $U subset.eq X$ a set $cal(F)(U)$ (its
#emph[sections]), and to every inclusion $V subset.eq U$ a *restriction map*
$rho^U_V : cal(F)(U) -> cal(F)(V)$, such that $rho^U_U = "id"$ and
$rho^V_W compose rho^U_V = rho^U_W$ for $W subset.eq V subset.eq U$. Write
$s|_V := rho^U_V (s)$.#scite("006E")[Equivalently: a #emph[contravariant] functor from open sets (and
inclusions) to bold("Set") --- or to bold("Ab"), bold("Ring") if sections carry that structure.]
]

#intubox(title: "Keep this example forever")[
$cal(F)(U) = { "functions " U -> k }$ with honest restriction of functions. Every abstract axiom
below should be checked against this picture. The structure sheaf is just this idea with "function"
read algebraically --- $cal(F)(D(f)) = R_f$.
]

== The sheaf condition: glue + locality
A presheaf lets you #emph[restrict]. A sheaf also lets you #emph[build global from local].

#defbox(title: "Definition --- sheaf")[
A presheaf $cal(F)$ is a *sheaf* if for every open cover $U = union.big_i U_i$ and every family of
sections $s_i in cal(F)(U_i)$ that #emph[agree on overlaps],
$ s_i|_(U_i ∩ U_j) = s_j|_(U_i ∩ U_j) quad "for all " i, j, $
there is a *unique* $s in cal(F)(U)$ with $s|_(U_i) = s_i$ for all
$i$.#scite("006T")[The condition splits into two clauses, both required.]
]

Read the axiom as two independent demands:

#align(center, table(
  columns: (auto, 1fr, auto),
  align: (left, left, left),
  stroke: none,
  inset: (x: 9pt, y: 6pt),
  table.hline(stroke: 1pt),
  [#text(fill: accentB)[*Clause*]], [#text(fill: algc)[*What it guarantees*]], [*Name*],
  table.hline(stroke: 0.5pt),
  geo[at most one glue], alg[a section is determined by its restrictions to any cover],
    [separatedness / locality],
  geo[at least one glue], alg[compatible local data actually patch together], [gluing / existence],
  table.hline(stroke: 1pt),
))

#text(size: 0.85em)[Separatedness as injectivity into the product of stalks: #tag("007A")
(stalks: next lesson).]

#warnbox(title: "The forced empty-set convention")[
Apply the axiom to the empty cover of $U = nothing$: it forces $cal(F)(nothing)$ to be a
*single point* (the terminal object). And for a disjoint union $U union.sq V$ it forces
$cal(F)(U union.sq V) = cal(F)(U) times cal(F)(V)$.#scite("006U")[The "warning" remark; the fix ---
sheafifying $A$ to #emph[locally constant] functions --- is the constant sheaf $underline(A)$,
#tag("006W").] This is exactly why the #emph[constant presheaf] $U |-> A$ with $|A| >= 2$ is
*not* a sheaf: it sends $nothing$ to $A$, and two different constants on a disconnected open can't
be glued.
]

== Sheaf or not? The reflex to build
Gluing is a real condition, not a formality. The instructive failure to memorize:

#align(center, table(
  columns: (auto, auto, 1fr),
  align: (left, center, left),
  stroke: none,
  inset: (x: 9pt, y: 6pt),
  table.hline(stroke: 1pt),
  [Presheaf on $X$], [Sheaf?], [Why],
  table.hline(stroke: 0.5pt),
  [continuous functions $U -> RR$], [#text(fill: good)[$checkmark$ yes]],
    [continuity is local; compatible pieces glue uniquely],
  [holomorphic / smooth functions, $k$-forms], [#text(fill: good)[$checkmark$ yes]],
    [all checked locally / in charts],
  [sections of a map $p : E -> X$], [#text(fill: good)[$checkmark$ yes]],
    [the prototype --- "sheaf of sections"],
  [*bounded* continuous functions], [#text(fill: bad)[$times$ no]],
    [identity holds, but pieces bounded on $(n-1, n+1)$ glue to $f(x) = x$ --- unbounded;
     #emph[gluing fails]],
  [functions that *extend* to all of $X$], [#text(fill: bad)[$times$ no]],
    ["extendable" isn't local: $1 \/ x$ is locally a restriction near each point of
     $RR without {0}$ but doesn't extend; #emph[gluing fails]],
  [constant presheaf $U |-> A$, $|A| >= 2$], [#text(fill: bad)[$times$ no]],
    [fails at $nothing$ and on disconnected opens; #emph[both clauses]],
  table.hline(stroke: 1pt),
))

#intubox(title: "The bridge to the structure sheaf")[
When you build $cal(O)_(op("Spec") R)$, the cover will be a standard cover
$D(f) = union.big_i D(g_i)$, the overlaps will be $D(g_i) ∩ D(g_j) = D(g_i g_j)$ (from Lesson
0001!), and "agree on overlaps + glue uniquely" will become a single exact sequence of localizations
$ 0 -> R_f -> product_i R_(g_i) arrows.rr product_(i,j) R_(g_i g_j). $
Drilling existence-and-uniqueness now turns that future step into #emph[recognition], not new
learning.
]

== The gluing lab
Pick a presheaf, then attempt to glue the compatible local data over its cover. Watch which ones
patch into a global section and which break --- and on exactly which clause.

#figure(
  cetz.canvas({
    import cetz.draw: *
    let teal = accentB
    let vio = algc
    // ---------- TOP ROW: continuous = sheaf ----------
    content((-0.2, 4.0), anchor: "west",
      text(fill: accentB, weight: "bold", size: 8pt)[Continuous functions: pieces glue
        #text(fill: good)[uniquely]])
    // cover brackets
    line((0, 2.7), (3.0, 2.7), stroke: teal + 1.2pt)
    line((0, 2.6), (0, 2.8), stroke: teal + 1.2pt)
    line((3.0, 2.6), (3.0, 2.8), stroke: teal + 1.2pt)
    content((1.5, 2.45), text(fill: teal, size: 8pt)[$U_1$])
    line((2.2, 3.1), (5.2, 3.1), stroke: vio + 1.2pt)
    line((2.2, 3.0), (2.2, 3.2), stroke: vio + 1.2pt)
    line((5.2, 3.0), (5.2, 3.2), stroke: vio + 1.2pt)
    content((4.6, 3.35), text(fill: vio, size: 8pt)[$U_2$])
    // overlap shade
    rect((2.2, 2.6), (3.0, 3.2), fill: rulec.transparentize(55%), stroke: none)
    // sections
    bezier((0, 4.5), (3.0, 4.65), (1.0, 4.85), (2.0, 4.6), stroke: teal + 1pt)
    bezier((2.2, 4.66), (5.2, 4.45), (3.6, 4.7), (4.4, 4.85), stroke: vio + 1pt)
    content((0.8, 4.95), text(fill: teal, size: 8pt)[$s_1$])
    content((4.6, 5.0), text(fill: vio, size: 8pt)[$s_2$])
    // glued result
    line((6.0, 4.6), (6.9, 4.6), stroke: good + 0.8pt, mark: (end: ">"))
    bezier((7.1, 4.5), (10.6, 4.5), (8.3, 4.85), (9.4, 4.7), stroke: good + 1.3pt)
    content((8.85, 5.0), text(fill: good, size: 8pt)[$s in cal(F)(U)$])
    line((7.1, 4.0), (10.6, 4.0), stroke: good + 1.2pt)
    line((7.1, 3.9), (7.1, 4.1), stroke: good + 1.2pt)
    line((10.6, 3.9), (10.6, 4.1), stroke: good + 1.2pt)
    content((8.85, 3.75), text(fill: good, size: 8pt)[$U$])
    // ---------- BOTTOM ROW: bounded = not a sheaf ----------
    content((-0.2, 1.85), anchor: "west",
      text(fill: warnc, weight: "bold", size: 8pt)[Bounded functions: pieces glue to an
        #text(fill: bad)[unbounded] $f(x) = x$])
    line((0, 0.7), (5.2, 0.7), stroke: rulec + 0.6pt)
    line((0, 0.85), (1.7, 1.2), stroke: teal + 1pt)
    line((1.4, 1.13), (3.3, 1.55), stroke: vio + 1pt)
    line((3.0, 1.48), (4.7, 1.9), stroke: teal + 1pt)
    content((2.6, 0.45), text(fill: inksoft, size: 8pt)[each piece bounded on its interval])
    line((6.0, 1.25), (6.9, 1.25), stroke: good + 0.8pt, mark: (end: ">"))
    line((7.1, 0.7), (10.6, 2.05), stroke: bad + 1.1pt, mark: (start: ">", end: ">"))
    content((9.4, 0.85), text(fill: bad, size: 8pt)[unbounded --- not a section!])
  }),
  caption: [The gluing lab: continuous local data patches into a unique global section (top);
    bounded local pieces glue to the unbounded $f(x)=x$, which escapes the presheaf --- gluing fails
    (bottom).],
)

The same template explains the sheaf-condition arithmetic in general. Compatible local sections sit
in the equalizer of the two restriction maps to the overlaps:

#align(center, diagram(
  spacing: (10mm, 8mm),
  node((0, 0), $cal(F)(U)$),
  node((1, 0), $product_i cal(F)(U_i)$),
  node((2, 0), $product_(i,j) cal(F)(U_i ∩ U_j)$),
  edge((0, 0), (1, 0), $product rho$, "->"),
  edge((1, 0), (2, 0), $rho_(i j)$, "->", shift: 4pt),
  edge((1, 0), (2, 0), $rho_(j i)$, "->", shift: -4pt, label-side: right),
))

#line(length: 100%, stroke: 0.5pt + rulec)

== Retrieve it
Notes closed --- recall from memory. Feedback is instant.

#quizhead(title: "Presheaves & sheaves --- recall check")

#quizitem(1)[A presheaf attaches to each open set its sections plus #blank maps.][restriction][extension][inclusion][evaluation][A][$rho^U_V : cal(F)(U) -> cal(F)(V)$ for $V subset.eq U$, with $rho^U_U = "id"$ and composites agreeing. Restriction goes from bigger opens to smaller --- contravariant.]

#quizitem(2)[Categorically, a presheaf is a #blank functor on opens.][contravariant][covariant][bijective][continuous][A][Inclusions $V subset.eq U$ give maps $cal(F)(U) -> cal(F)(V)$ --- the arrow reverses, so the functor is contravariant.]

#quizitem(3)[Beyond existence of a glued section, the sheaf axiom demands it be #blank.][unique][bounded][nonzero][global][A][Two clauses: existence (gluing) and uniqueness (separatedness/locality). Uniqueness is what makes a section determined by its restrictions.]

#quizitem(4)[Continuous real-valued functions on a space form #blank.][a genuine sheaf][a mere presheaf][no valid presheaf][a constant sheaf][A][Continuity is a local condition, so compatible local functions glue uniquely to a continuous function --- the model sheaf.]

#quizitem(5)[Bounded continuous functions on $RR$ form a presheaf that fails #blank.][gluing][identity][linearity][restriction][A][Identity (separatedness) holds --- it's a sub-presheaf of a sheaf. But bounded pieces on $(n-1, n+1)$ glue to the unbounded $f(x) = x$, which leaves the presheaf: gluing fails.]

#quizitem(6)[For the empty cover, the sheaf axiom forces $cal(F)(nothing)$ to be #blank.][a single point][the empty set][any large set][two distinct points][A][$cal(F)(nothing)$ must be terminal (a one-element set). This is precisely why the constant presheaf with $|A| >= 2$ fails --- it sends $nothing$ to $A$.]

#quizitem(7)[The constant presheaf with a 2-element value on a disconnected open fails: distinct values agree on the #blank overlap.][empty][dense][whole][open][A][If $U = U_1 union.sq U_2$ the overlap is $nothing$, so distinct constants agree there vacuously, yet no single element of $A$ restricts to both --- no glue exists.]

#quizitem(8)[On $op("Spec") R$, the overlap of two standard opens $D(f)$ and $D(g)$ is #blank.][the open $D(f g)$][the closed $V(f g)$][the open $D(f+g)$][the whole space][A][$D(f) ∩ D(g) = D(f g)$: overlaps of standard opens are again standard. That closure-under-intersection is what lets us build $cal(O)_X$ on the basis of $D(f)$'s.]

#primary(title: "Read next (primary source)")[
Ravi Vakil, #link("https://math.stanford.edu/~vakil/216blog/FOAGaug2922public.pdf")[#emph[The
Rising Sea]], §2.2 (presheaves and sheaves). For the "make it feel inevitable" version, read
#link("https://agag-gathmann.math.rptu.de/class/alggeom-2021/alggeom-2021.pdf")[Gathmann's notes] on
the sheaf of regular functions. Ground truth: #tag("006T").
]

#text(weight: "bold")[Next:] 0003 · Stalks & germs --- local data as a colimit.
