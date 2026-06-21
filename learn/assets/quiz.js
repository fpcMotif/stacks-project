/* ============================================================
   quiz.js — reusable retrieval-practice quiz widget.
   Usage: a container <div class="quiz" data-title="..."> with a
   <script type="application/json" class="quiz-data"> holding:
     [{ "stem": "...", "options": ["a","b","c","d"],
        "answer": 1, "why": "explanation shown after answering" }, ...]
   Immediate feedback, locks each question after first attempt, tallies score.
   Length-match the options so formatting leaks no answer.
   ============================================================ */
(function () {
  function build(quiz) {
    var dataEl = quiz.querySelector("script.quiz-data");
    if (!dataEl) return;
    var qs;
    try { qs = JSON.parse(dataEl.textContent); } catch (e) { return; }

    var title = quiz.getAttribute("data-title") || "Check yourself";
    var answered = 0, correct = 0, total = qs.length;

    var head = document.createElement("div");
    head.className = "quiz-head";
    var h = document.createElement("strong"); h.textContent = title;
    var score = document.createElement("span");
    score.className = "quiz-score";
    head.appendChild(h); head.appendChild(score);
    quiz.appendChild(head);

    function renderScore() {
      score.innerHTML = "Score <b>" + correct + " / " + total + "</b>" +
        (answered === total ? " &nbsp;✓ done" : "  (" + answered + " answered)");
    }
    renderScore();

    qs.forEach(function (q, i) {
      var card = document.createElement("div"); card.className = "q";
      var stem = document.createElement("div"); stem.className = "stem";
      stem.innerHTML = '<span class="qn">' + (i + 1) + ".</span>" + q.stem;
      card.appendChild(stem);

      var opts = document.createElement("div"); opts.className = "opts";
      var fb = document.createElement("div"); fb.className = "fb";
      var locked = false;

      q.options.forEach(function (text, j) {
        var b = document.createElement("button");
        b.className = "opt"; b.type = "button"; b.textContent = text;
        b.addEventListener("click", function () {
          if (locked) return;
          locked = true;
          answered++;
          var right = j === q.answer;
          if (right) correct++;
          Array.prototype.forEach.call(opts.children, function (el, k) {
            el.disabled = true;
            if (k === q.answer) el.classList.add("correct");
            else if (k === j) el.classList.add("wrong");
          });
          fb.className = "fb show " + (right ? "ok" : "no");
          fb.innerHTML = (right ? "✓ Correct." : "✗ Not quite.") +
            '<span class="why">' + (q.why || "") + "</span>";
          renderScore();
          if (typeof window.MathJax !== "undefined" && window.MathJax.typesetPromise)
            window.MathJax.typesetPromise([fb]);
        });
        opts.appendChild(b);
      });

      card.appendChild(opts);
      card.appendChild(fb);
      quiz.appendChild(card);
    });
  }

  function init() {
    Array.prototype.forEach.call(document.querySelectorAll(".quiz"), build);
    // Quizzes are built dynamically; typeset them if MathJax already loaded.
    // If MathJax loads later (async), its own startup pass covers this DOM.
    if (window.MathJax && window.MathJax.typesetPromise) window.MathJax.typesetPromise();
  }
  if (document.readyState === "loading")
    document.addEventListener("DOMContentLoaded", init);
  else init();
})();
