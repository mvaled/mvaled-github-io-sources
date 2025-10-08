==============================
 The Marble Age of Wax Coding
==============================

:slug: claude-codex
:date: 2025-10-08
:category: Tools, AI
:summary: The marble age is over -- but are we truly melting wax, or just
          sensing relief from tedium?

          AI coding agents feel like time-savers, but the sensation may be
          illusory.  I share practical usage patterns and reflect on when to
          trust AI-generated code and when errors cost too much.

Yesterday, while I was in the middle of a major refactor, I found myself
asking Claude Code to complete a small function.  It took nearly a minute
[#meta-clauding]_ to produce this result:

.. code-block:: reason

   let _toKaikoModules: t => array<KaikoModules.t> = modules => {
     [
       modules.structural ? Some(#hull_and_equipment) : None,
       modules.safety ? Some(#safety) : None,
       modules.checklist ? Some(#checklist) : None,
       modules.sire ? Some(#sire2_0) : None,
       modules.risqEnabled ? Some(#risq) : None,
       modules.shoreReportsEnabled ? Some(#shore_reports) : None,
       modules.companyForms ? Some(#company_forms) : None,
       modules.pscEnabled ? Some(#pre_psc) : None,
     ]->Array.filterMap(x => x)
   }

Did I actually save time in this task by using Claude Code?  Likely, yes.

It's in this kind of small function, in which the repetitive pattern of its
implementation is more *tedious* than challenging, where AI has a clear edge.
At the same time, this kind of function also exposes one big trick AI tools
play with our psyche; they *feed* the (unscientific) extrapolation that we're
saving time, always [#meta-codexing]_.  Other tools like keyboard macros, or
multi-cursors, which also aim at making repetition less tedious, are
themselves still somewhat tedious and require some degree of effort.  The
required skill to make an AI tool perform this kind of task, you have mastered
since 1st grade: writing.

When I'm using AI tools (mostly Claude Code) [#frustration-excluded]_, it
*feels like* I'm saving time; but in reality, what I'm sensing is not
time-saving.  Humans are bad at judging elapsed time, especially when our
attention is focused on something else, and even when we would like to be keeping
time [#attention]_.

I suppose that what I sense is some kind of relief of being able to delegate
the *boring* parts of my task to a tool that doesn't get bored.  I know how to
write that function, I just don't want to perform the act of typing it.  It
*feels* faster because I'm not engaged doing repetitive stuff, but I'm
fluently shaping the code in many ways while not writing it.  I cannot be
sure that I'm saving time, always.  In fact, a *tiny* study [#ai-slow]_ in the
arXiv found that while participants estimated about 20% time-saving, they were
actually 19% slower when completing tasks with AI assistance.

There are, indeed, moments where I *feel* exactly the opposite.  Some sessions
were definitely a time-hog; and when I realized it, I had already spent hours
on a task that I could have completed faster -- and I know that only by
comparison with similar tasks. These are the sessions where the tool resists
my prompts about the desired approach for a solution, and it *'insists'* on a
path that can only lead to disappointment [#codex-stubborn]_.


The marble age is over
======================

.. epigraph::

   The marble age is over. Melt the wax, or be left behind.

   -- Erik Meijer, https://x.com/headinthebox/status/1950031783581667686


If I trust (which I do) my own commits, I'm still learning how to use AI
coding agents effectively:

.. figure:: /images/2025/ai-commits-analysis.png
   :alt: Chart analyzing AI-assisted commits vs others.
   :width: 90%

   AI-assisted commits vs others.

The number of commits alone doesn't tell the whole story.  My manual commits
are usually more scoped, and smaller than those where AI is involved. `More
code is not a synonym of better code
</2025/07/25/adding-code-is-easy.html>`__; not now, nor it was before.  But
many of those commits do add justified amounts of code.  I don't commit
**everything** that the AI produces.  In some cases, I reject all the code
produced but still credit the AI tool, because it revealed problems in my initial
thinking or gave some insight I was missing; this is specially important for
topics I'm not deeply familiar with.

Nowadays I turn to AI coding almost daily.

When I need a new bash script, or when I want to update an existing one, AI
coding agents are now my first choice.  I'm terrible at remembering all the
nuances of bash syntax; and also bash scripting requires knowledge of a vast
universe of other small tools (``ss``, ``iwctl``, ...), many of which I barely
know.  When I needed a python script to measure and plot the WiFi signal
strength in several locations at home, I did it with AI.  When I needed to
improve my ``rsync`` based backup script, I improved it with AI; and **tested it
in a sandbox to avoid ruining my backups**. And so on.

In my day to day job, I'm more cautious.  No AI code is committed without
careful review, except for scripts that don't mess with data and executed to
perform analysis or so; and even so, if the analysis result is used for
decision making, I do scrutinize the script.

In conclusion, while I agree with Meijer's claims__ in general, I do believe
some *errors* are not that cheap.  *Committed errors*, whether in your code or
in some data-based analysis, can have long-lasting and dramatic effects.

__ https://x.com/headinthebox/status/1950031783581667686

Important things deserve *our* time [#ai-credit]_.


Footnotes
=========

.. [#meta-clauding] I even used Claude Code itself to search for the prompt
   inside ``~/.claude`` and find how long it took:

   .. compound::

      Previous task completion time:

      - User request: 2025-10-07T14:25:30.306Z
      - Task completed: 2025-10-07T14:26:22.546Z
      - Total duration: ~52 seconds

      The breakdown:

      - Read file: ~5 seconds
      - Analysis/thinking: ~21 seconds
      - Edit implementation: ~26 seconds

   I reckon a big chunk of the 'Edit implementation' can be attributed to my
   own review and approval.  But I will still count this time as part of
   completing this minute task with AI.

.. [#meta-codexing] I did a small experiment with Codex, and feed it the exact
   same prompt.  It took 1.5 minutes to propose a bulkier version of the
   function, that used ``list{...}`` to later apply ``List.filter``,
   ``List.map`` and finally ``Array.fromList``; and it didn't even compile.

.. [#frustration-excluded] ... and when the task at hand doesn't lead to
   frustration.

.. [#attention] Brown, S.W. *Time perception and attention: The effects of
   prospective versus retrospective paradigms and task demands on perceived
   duration.* Perception & Psychophysics 38, 115–124
   (1985). https://doi.org/10.3758/BF03198848,
   https://link.springer.com/article/10.3758/BF03198848


.. [#codex-stubborn] Codex is really *stubborn*.  It insists on trying to run
   commands I explicitly rejected and instructed it to do otherwise.

   Codex is also slow, and confusing.  It makes changes to a file and
   immediately runs the test of *another, unrelated file*.  It is the
   antithesis of the time-saving sensation.

.. [#ai-slow] Becker, Joel; Rush, Nate; Barnes, Elizabeth; and Rein,
   David. *Measuring the Impact of Early-2025 AI on Experienced Open-Source
   Developer Productivity* (2025). https://arxiv.org/abs/2507.09089

.. [#ai-credit] This post was proof-read using Claude.
