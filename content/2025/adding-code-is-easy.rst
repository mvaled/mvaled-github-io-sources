=====================
 Adding code is easy
=====================

:date: 2025-07-25
:slug: adding-code-is-easy
:category: Programming, Technical Debt
:summary: Adding more core to solve issues is deemed as simple.  The reality
          in many cases is that it's just *easier (aka lazier)*, in many cases
          the resultant code is more complicated and complex.  The industry
          seems to reward this kind of quick fix.

I have been staring at a single line of code for half an hour.  It's actually
not even a line of code, it's a TODO comment:

.. code-block:: python

   # TODO: Remove in favor of modules.
   class ActiveTab(TextChoices):
       STRUCTURAL = "structural", "Structural"
       SAFETY = "safety", "Safety"
       CHECKLIST = "checklist", "Checklists"
       OVERVIEW = "overview", "Overview"
       ANALYTICS = "analytics", "Analytics"
       COMPANY_FORMS = "company-forms", "Company Forms"
       NOTIFICATIONS = "notifications", "Notifications"
       SETTINGS = "settings", "Settings"
       SIRE = "sire2.0", "SIRE 2.0"
       VHL = "vhl", "Hull & Equipment"
       PSC = "psc", "Port Checklists"
       RISQ = "risq", "RISQ"
       SHORE = "shore", "Shore reports"

I wrote it in 2021, and when I wrote it the class looked like this:

.. code-block:: python

   # TODO: Remove in favor of modules.
   class ActiveTab(TextChoices):
       STRUCTURAL = "structural", "Structural"
       SAFETY = "safety", "Safety"
       CHECKLIST = "checklist", "Checklists"
       OVERVIEW = "overview", "Overview"
       ANALYTICS = "analytics", "Analytics"


The value of this class is, as of now, mostly noise.  There are just a couple
of pages that actually need *something else* instead.  Namely the only three
modules that share a common view class that will use just three of those
options to perform the right queries to the DB.  All other modules are there
wasting bytes.

How did we manage to double the size of this class instead of removing it?

The Heap
========

.. epigraph::

   If the file room minus one file is still the file room, and you keep
   subtracting one at a time, you could end up with zero files.

   -- Key and Peele in Fargo, discovering `The Heap Paradox`__.

__ https://en.wikipedia.org/wiki/Sorites_paradox

When does adding one new option to the class, transforms it to a heap of
noisy, and mostly useless code?

While the above is rather philosophical there are some practical implications.
I have found that the most immediate effect is that of making the on-boarding
to the code somewhat harder.

Developers seasoned in the code base have built a mental blockade around this
and won't be bothered by it anymore.  For them adding code is *simpler*
[#simple-easy]_.  However, other, albeit seasoned, developers who haven't look
at that code (and its metastasized sprawls) for a long time, get confused by
this profusion of useless variants.  Junior developers have it the hardest,
until they learn to ignore it.

The risk of removing it and replacing it with a what it is actually needed, is
higher.  But the cost was not higher two years ago than it is today.  We have
added more cost by adding one variant at a time.

.. compound::

   The merge request to remove this today touches 12 files::

     12 files changed, 29 insertions(+), 99 deletions(-)

   and it is not yet ready.

This is of course a trade-off game.  Each time we were faced with the option
to just add one more choice to this class versus removing it, there were
time-constraints and other non-technical factors that tipped the balance
towards the safer, less risky path.

There is actually no valid technical criteria to keep this class around, and
we have better test coverage, better testers.  We__ are today a bigger
company, and we deserve a better code.

__ https://www.kaikosystems.com/


I will remove it. Soon.


Epilogue
========

I planned to write about the impact of AI coding tools like aider_, codex_,
and `Claude Code`_ on this 'adding code' game.  But let's not make a heap out
of this post.

.. _codex: https://openai.com/index/openai-codex/
.. _aider: https://aider.chat/
.. _claude code: https://docs.anthropic.com/en/docs/claude-code/overview


Footnotes
=========

.. [#simple-easy] I often say it's just *easier*, and emphasize simplicity
   (complexity) as a feature of the code you end up having after you do your
   job.
