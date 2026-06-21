/* ============================================================
   sheaf-explorer.js — "gluing lab": pick a presheaf, attempt to glue
   compatible local data over a cover, watch it succeed or fail.
   Reusable: drop <div class="glue-lab"></div> in a lesson and load this.
   ============================================================ */
(function () {
  var TEAL = "#1f4e5f", VIO = "#5b3a86", BUR = "#7c1d28",
      GOOD = "#2f6b3a", BAD = "#9a2b2b", INK = "#1a1814", SOFT = "#4a4640", RULE = "#d8d2c4";
  var F = 'font-family="Palatino,Georgia,serif"';

  function frame(inner) {
    return '<svg viewBox="0 0 520 200" role="img" aria-label="gluing scenario">' + inner + '</svg>';
  }
  function poly(pts, color, w) {
    return '<polyline fill="none" stroke="' + color + '" stroke-width="' + (w || 3) +
      '" points="' + pts.map(function (p) { return p[0] + "," + p[1]; }).join(" ") + '"/>';
  }
  function bracket(x1, x2, y, label, color) {
    return '<line x1="' + x1 + '" y1="' + y + '" x2="' + x2 + '" y2="' + y + '" stroke="' + color +
      '" stroke-width="2"/>' +
      '<line x1="' + x1 + '" y1="' + (y - 5) + '" x2="' + x1 + '" y2="' + (y + 5) + '" stroke="' + color + '" stroke-width="2"/>' +
      '<line x1="' + x2 + '" y1="' + (y - 5) + '" x2="' + x2 + '" y2="' + (y + 5) + '" stroke="' + color + '" stroke-width="2"/>' +
      (label ? '<text x="' + ((x1 + x2) / 2) + '" y="' + (y + 18) + '" text-anchor="middle" ' + F +
        ' font-size="11" fill="' + color + '">' + label + '</text>' : "");
  }
  function txt(x, y, s, color, size, anchor) {
    return '<text x="' + x + '" y="' + y + '" text-anchor="' + (anchor || "middle") + '" ' + F +
      ' font-size="' + (size || 12) + '" fill="' + (color || SOFT) + '">' + s + '</text>';
  }

  var SPEC = [
    {
      key: "cont", label: "Continuous functions",
      verdict: "ok",
      vhtml: '<b class="ok">Sheaf ✓</b> — continuity is local, so compatible pieces glue to a unique continuous function.',
      before: function () {
        return frame(
          txt(260, 24, "U = U₁ ∪ U₂, sections agree on the overlap", SOFT, 12) +
          bracket(60, 300, 178, "U₁", TEAL) + bracket(220, 460, 192, "U₂", VIO) +
          '<rect x="220" y="40" width="80" height="130" fill="#d8d2c4" fill-opacity="0.35"/>' +
          txt(260, 54, "overlap", SOFT, 10) +
          poly([[60,150],[140,110],[220,130],[300,130]], TEAL) +
          poly([[220,130],[300,130],[380,110],[460,150]], VIO) +
          txt(120, 100, "s₁", TEAL, 13) + txt(400, 100, "s₂", VIO, 13)
        );
      },
      after: function () {
        return frame(
          txt(260, 24, "they patch into one global section", SOFT, 12) +
          poly([[60,150],[140,110],[220,130],[300,130],[380,110],[460,150]], GOOD, 3.5) +
          txt(260, 96, "s ∈ ℱ(U)", GOOD, 13) +
          bracket(60, 460, 186, "U", GOOD)
        );
      }
    },
    {
      key: "bdd", label: "Bounded functions",
      verdict: "no",
      vhtml: '<b class="no">Not a sheaf ✗</b> — identity holds, but bounded pieces of $f(x)=x$ over a cover of $\\mathbb R$ glue to an <em>unbounded</em> function: it leaves the presheaf. <b>Gluing (existence) fails.</b>',
      before: function () {
        return frame(
          txt(260, 24, "U = ℝ, covered by bounded intervals; sₙ = (x ↦ x)|", SOFT, 12) +
          '<line x1="20" y1="150" x2="500" y2="150" stroke="' + RULE + '" stroke-width="1"/>' +
          txt(14, 154, "−∞", SOFT, 11, "start") + txt(506, 154, "+∞", SOFT, 11, "end") +
          bracket(60, 180, 178, "U₁", TEAL) + bracket(160, 300, 192, "U₂", VIO) + bracket(280, 420, 178, "U₃", TEAL) +
          poly([[60,168],[180,138]], TEAL) + poly([[160,150],[300,115]], VIO) + poly([[280,123],[420,88]], TEAL) +
          txt(240, 70, "each piece is bounded (its interval is)", SOFT, 11)
        );
      },
      after: function () {
        return frame(
          txt(260, 24, "glued result = f(x) = x on all of ℝ", BAD, 12) +
          '<defs><marker id="ge1" markerWidth="9" markerHeight="9" refX="6" refY="3" orient="auto"><path d="M0,0 L6,3 L0,6 Z" fill="' + BAD + '"/></marker></defs>' +
          '<line x1="40" y1="195" x2="480" y2="20" stroke="' + BAD + '" stroke-width="3.5" marker-start="url(#ge1)" marker-end="url(#ge1)"/>' +
          txt(360, 150, "unbounded — not a section!", BAD, 12)
        );
      }
    },
    {
      key: "const", label: "Constant presheaf",
      verdict: "no",
      vhtml: '<b class="no">Not a sheaf ✗</b> — on a disconnected $U=U_1\\sqcup U_2$ the overlap is empty, so $s_1\\equiv1$ and $s_2\\equiv2$ are vacuously compatible, yet no single constant restricts to both. <b>Both clauses fail</b> (also $\\mathcal F(\\varnothing)=A\\neq\\{*\\}$).',
      before: function () {
        return frame(
          txt(260, 24, "U = U₁ ⊔ U₂ (disjoint) — overlap is empty", SOFT, 12) +
          bracket(60, 200, 178, "U₁", TEAL) + bracket(300, 440, 178, "U₂", VIO) +
          poly([[60,110],[200,110]], TEAL) + poly([[300,150],[440,150]], VIO) +
          txt(130, 100, "s₁ ≡ 1", TEAL, 13) + txt(370, 140, "s₂ ≡ 2", VIO, 13) +
          txt(250, 150, "gap", SOFT, 10)
        );
      },
      after: function () {
        return frame(
          txt(260, 24, "a single constant must equal both 1 and 2 — impossible", BAD, 12) +
          poly([[60,110],[200,110]], TEAL) + poly([[300,150],[440,150]], VIO) +
          txt(250, 110, "1?", BAD, 20) + txt(250, 160, "2?", BAD, 20) +
          txt(250, 195, "no glue exists", BAD, 12)
        );
      }
    },
    {
      key: "lc", label: "Locally constant (the fix)",
      verdict: "ok",
      vhtml: '<b class="ok">Sheaf ✓</b> — a <em>locally constant</em> function may take different values on different components, so it glues. This is the constant sheaf $\\underline A$ — the sheafification of the constant presheaf.',
      before: function () {
        return frame(
          txt(260, 24, "same disconnected U, but sections need not be globally constant", SOFT, 12) +
          bracket(60, 200, 178, "U₁", TEAL) + bracket(300, 440, 178, "U₂", VIO) +
          poly([[60,110],[200,110]], TEAL) + poly([[300,150],[440,150]], VIO) +
          txt(130, 100, "s₁ ≡ 1", TEAL, 13) + txt(370, 140, "s₂ ≡ 2", VIO, 13)
        );
      },
      after: function () {
        return frame(
          txt(260, 24, "the function '1 on U₁, 2 on U₂' is locally constant — it glues", GOOD, 12) +
          poly([[60,110],[200,110]], GOOD, 3.5) + poly([[300,150],[440,150]], GOOD, 3.5) +
          bracket(60, 440, 186, "s ∈ A̲(U)", GOOD) +
          txt(250, 110, "✓", GOOD, 18)
        );
      }
    }
  ];

  function build(lab) {
    var state = { i: 0, glued: false };
    var tabs = document.createElement("div"); tabs.className = "lab-tabs";
    var stage = document.createElement("div"); stage.className = "lab-stage";
    var controls = document.createElement("div"); controls.className = "lab-controls";
    var glueBtn = document.createElement("button"); glueBtn.className = "lab-btn"; glueBtn.textContent = "Attempt to glue";
    var resetBtn = document.createElement("button"); resetBtn.className = "lab-btn secondary"; resetBtn.textContent = "Reset";
    var verdict = document.createElement("div"); verdict.className = "lab-verdict";
    controls.appendChild(glueBtn); controls.appendChild(resetBtn);

    SPEC.forEach(function (s, idx) {
      var b = document.createElement("button"); b.className = "lab-tab"; b.textContent = s.label;
      b.addEventListener("click", function () { state.i = idx; state.glued = false; render(); });
      tabs.appendChild(b);
    });

    function render() {
      var s = SPEC[state.i];
      Array.prototype.forEach.call(tabs.children, function (c, idx) {
        c.classList.toggle("active", idx === state.i);
      });
      stage.innerHTML = state.glued ? s.after() : s.before();
      verdict.className = "lab-verdict";
      if (state.glued) {
        verdict.className = "lab-verdict show " + s.verdict;
        verdict.innerHTML = s.vhtml;
        if (window.MathJax && window.MathJax.typesetPromise) window.MathJax.typesetPromise([verdict]);
      }
      glueBtn.disabled = state.glued;
    }
    glueBtn.addEventListener("click", function () { state.glued = true; render(); });
    resetBtn.addEventListener("click", function () { state.glued = false; render(); });

    lab.appendChild(tabs); lab.appendChild(stage); lab.appendChild(controls); lab.appendChild(verdict);
    render();
  }

  function init() { Array.prototype.forEach.call(document.querySelectorAll(".glue-lab"), build); }
  if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", init); else init();
})();
