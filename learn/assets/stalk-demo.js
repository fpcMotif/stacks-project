/* ============================================================
   stalk-demo.js — "shrink to a point": the stalk of the structure
   sheaf at p=(x) on A^1 = Spec k[x], built as a directed colimit of
   localizations. Slide to shrink the neighborhood and watch the ring
   localize toward the local ring k[x]_(x).
   Reusable: drop <div class="stalk-demo"></div> and load this.
   ============================================================ */
(function () {
  var TEAL = "#1f4e5f", BUR = "#7c1d28", BAD = "#9a2b2b", SOFT = "#4a4640", RULE = "#d8d2c4";
  var F = 'font-family="Palatino,Georgia,serif"';
  var XMAX = 6;
  function xof(a) { return 70 + a * 60; }

  function svg(k) {
    var s = '<svg viewBox="0 0 520 130" role="img" aria-label="shrinking neighborhood of the point (x) on the affine line">';
    s += '<text x="260" y="22" text-anchor="middle" ' + F + ' font-size="12" fill="' + SOFT +
         '">𝔸¹ = Spec k[x]   —   neighborhood D(f' + (k ? 'ₖ' : '') + ') of 𝔭 = (x)</text>';
    s += '<line x1="40" y1="70" x2="500" y2="70" stroke="' + TEAL + '" stroke-width="3"/>';
    s += '<text x="506" y="74" ' + F + ' font-size="12" fill="' + SOFT + '">⋯</text>';
    for (var a = 0; a <= XMAX; a++) {
      var x = xof(a);
      if (a === 0) {
        s += '<circle cx="' + x + '" cy="70" r="6" fill="' + BUR + '"/>';
        s += '<text x="' + x + '" y="100" text-anchor="middle" ' + F + ' font-size="12" fill="' + BUR + '">𝔭=(x)</text>';
      } else if (a <= k) {
        s += '<circle cx="' + x + '" cy="70" r="6" fill="#fcfaf4" stroke="' + BAD + '" stroke-width="2"/>';
        s += '<line x1="' + (x - 4) + '" y1="66" x2="' + (x + 4) + '" y2="74" stroke="' + BAD + '" stroke-width="1.6"/>';
        s += '<line x1="' + (x - 4) + '" y1="74" x2="' + (x + 4) + '" y2="66" stroke="' + BAD + '" stroke-width="1.6"/>';
        s += '<text x="' + x + '" y="100" text-anchor="middle" ' + F + ' font-size="11" fill="' + BAD + '">' + a + '</text>';
      } else {
        s += '<circle cx="' + x + '" cy="70" r="3.5" fill="' + SOFT + '"/>';
        s += '<text x="' + x + '" y="100" text-anchor="middle" ' + F + ' font-size="11" fill="' + SOFT + '">' + a + '</text>';
      }
    }
    if (k > 0) s += '<text x="260" y="120" text-anchor="middle" ' + F + ' font-size="10.5" fill="' + BAD +
                    '" font-style="italic">✗ = point removed (its (x−a) inverted)</text>';
    return s + '</svg>';
  }

  function prod(k) {
    if (k === 0) return "1";
    var parts = [];
    for (var b = 1; b <= k; b++) parts.push("(x−" + b + ")");
    return parts.join("");
  }

  function readout(k) {
    var ring = k === 0 ? "k[x]" : "k[x]\\big[\\tfrac{1}{" + prod(k) + "}\\big]";
    var html = 'Neighborhood <span class="ring">D(f' + (k ? 'ₖ' : '') + ')</span> with ' +
      '\\(f' + (k ? '_{' + k + '}' : '') + ' = ' + prod(k) + '\\): functions regular except at ' +
      (k === 0 ? '\\(\\varnothing\\)' : '\\(\\{1,\\dots,' + k + '\\}\\)') + '.<br>' +
      'Section ring \\(\\mathcal F(D(f' + (k ? '_{' + k + '}' : '') + ')) = ' + ring + '\\) — every restriction map inverts one more factor.';
    var done = k >= XMAX
      ? '<br><span class="hi">Keep shrinking: in the colimit you invert <em>every</em> \\(g\\) with \\(g(0)\\neq0\\), giving the stalk \\(\\mathcal F_{(x)}=\\operatorname*{colim}_{f\\notin(x)}k[x]_f = k[x]_{(x)}\\)</span> — the local ring \\(\\{g/h : h(0)\\neq0\\}\\), maximal ideal \\((x)\\).'
      : '<br><span style="color:var(--ink-soft)">…push the slider further toward the stalk.</span>';
    return html + done;
  }

  function build(box) {
    var stage = document.createElement("div"); stage.className = "lab-stage";
    var ctrl = document.createElement("div"); ctrl.className = "lab-controls";
    var lab = document.createElement("span"); lab.style.fontSize = ".88rem"; lab.textContent = "shrink ↘";
    var range = document.createElement("input"); range.type = "range"; range.min = "0"; range.max = String(XMAX); range.value = "0";
    var out = document.createElement("div"); out.className = "stalk-readout";
    ctrl.appendChild(lab); ctrl.appendChild(range);

    function render() {
      var k = parseInt(range.value, 10);
      stage.innerHTML = svg(k);
      out.innerHTML = readout(k);
      if (window.MathJax && window.MathJax.typesetPromise) window.MathJax.typesetPromise([out]);
    }
    range.addEventListener("input", render);
    box.appendChild(stage); box.appendChild(ctrl); box.appendChild(out);
    render();
  }

  function init() { Array.prototype.forEach.call(document.querySelectorAll(".stalk-demo"), build); }
  if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", init); else init();
})();
