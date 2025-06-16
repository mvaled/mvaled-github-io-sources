=============
 Adding code
=============

:status: draft
:slug: adding-code

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

How did we manage to double the size of this class before finally it removing
it?

Adding bits of code is easy
===========================

Risk management, or risk aversion
=================================
