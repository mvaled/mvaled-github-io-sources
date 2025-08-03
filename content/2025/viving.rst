=============================
A tale about vibe-coding
=============================

:date: 2025-08-03
:slug: vibecoding-tale
:category: AI, Programming
:summary: This is my son's story with AI assisted programming.  He didn't know
          what to do this summer, so my wife and I gave him a task to create a
          `telegram bot`_ to organize our family trips.

This is my son's story with AI assisted programming.  He didn't know what to
do this summer, so my wife and I gave him a task to create a `telegram bot`_
to organize our family trips.

This was a fun project.  Neither I or him had any expericience with telegram's
API__, which is huge, by the way.  So, at the initial stage of the project I
could not be any more helpful than any AI tool.

__ https://core.telegram.org/api

I just guided him to make the first two or three prompts, and then left him to
keep working on that.


The PoC
-------

We started with free ChatGPT 4o account and had the first version of it
running under 2 hours.

.. compound::

   The prompts were basic *requests*:

   - Create a command that allows to register a trip with a name, destination,
     and date

   - Let's make that command interactive, so that the bot asks for the name, then
     the destination, then the dates, etc.

   - Create a command to list the stored trips.

   - Create a Menu with the list of commands.

   etc.

My son doesn't have yet the knowledge to drive the AI into the more technical
concerns.  For instance, the AI decided to store the list of trips in a JSON
file, and load it and save it for every command.  My son could not judge this
as foundational bad design with future implications.

I did notice that but I didn't care either. This is toy bot after all, and *my
aim* is not get a shipable product, but to teach him.  I have put a lot on his
plate already -- from setting up the IDE, github.com account, doing commits,
managing a python project with |uv|_, etc.

.. |uv| replace:: ``uv``
.. _uv: https://docs.astral.sh/uv/


The MVP
-------

For next few days I could not keep up.  My wife took over and acted as a
*product manager*.  She would ask my son for features, perform tests of the
bot, and debating about what to do next.

She was also the moral keeper when things would not go as smoothly as in the
beginning.

They managed to get the bot up and running at home, create travels, attach
files (plane tickets, hotel reservations, etc.) to each of the travels.

.. figure:: /images/2025/telegram-bot-poc.png
   :alt: The menu of the Telegram Bot, showing the list of commands
   :width: 90%

   The first screenshot of the MVP


The first obstacle
------------------

The command ``/startnotifications``, as cooked by the GPT never worked.  We
wanted the Bot to send automated reminders about planned trips the day before
they start, and send us back all the important files (tickets, bookings, etc.)
so that we had them at hand.

My son could not make it work.  He provided the GPT with the full traceback of
errors, and the GPT would double down and give him back code that didn't work.
It insisted on get a ``context.application.job_queue`` which is clearly
``None``::

    Traceback (most recent call last):
      File ".venv/lib/python3.13/site-packages/telegram/ext/_application.py", line 1311, in process_update
        await coroutine
      File ".venv/lib/python3.13/site-packages/telegram/ext/_handlers/basehandler.py", line 158, in handle_update
        return await self.callback(update, context)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      File "main.py", line 64, in wrapped
        return await func(update, context, *args, **kwargs)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      File ".venv/lib/python3.13/site-packages/logfire/_internal/instrument.py", line 93, in wrapper
        result = await func(*func_args, **func_kwargs)
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      File "main.py", line 182, in start_notifications
        current_jobs = job_queue.get_jobs_by_name(str(chat_id))
                       ^^^^^^^^^^^^^^^^^^^^^^^^^^
    AttributeError: 'NoneType' object has no attribute 'get_jobs_by_name'

Since at the time I didn't have the time at the moment, we all decided we
could fix that later, and the moved on to other features.

.. note:: The solution is just to install a new dependency
          ``python-telegram-bot[job-queue]``.

          Did the GPT tell my son to install this and he didn't read it?  I'll
          never know.


The second obstacle
-------------------

The next obstacle was the hardest.  The bot would not fail with an error, but
it would not work as expected.

At this point the single file ``main.py`` had become a huge melange of
vibe-coded ``ConversationHandler``\ s, ``MessageHandler``\ s, several
intermingled state machines, and the familiar (and mostly useless) comments
that all GPTs generate.

This was the breaking point.  Where my son met its own limitations and we
could no longer keep feeding the GPT with that 1000 lines of code and expect
it to figure out the right approach for this stuck state machine.

There is the argument that the free GPT is not powerful enough and a more
powerful one would be able to debug this.  There is also the cost/benefit
perspective.  This is a non-profit project and my son cannot throw his
allowance into an expensive tool he cannot use profitably.


The way out
-----------

I'm now taking a more active role in the project again.


.. compound::

   I started to read the code and noticed that there were states with the same
   identifier:

   .. code-block:: python

      ASK_NAME, ASK_DESTINATION, ASK_START_DATE, ASK_END_DATE, ASK_DOCUMENTS = range(5)
      ASK_TRIP_ID_TO_EDIT, ASK_FIELD_TO_EDIT, ASK_NEW_VALUE = range(100, 103)
      ASK_CONTINUE_EDIT = 103
      ASK_AFTER_EDIT_OPTION = 104
      INFO_NAME, INFO_LASTNAME, INFO_BIRTHDATE, INFO_CERTIFICATES = range(4)

   all the last symbols can be confused with the ones in the first line.

Being me, however, I also started to refactor this and the first thing to do
was to use an ``enum.StrEnum``.

This didn't actually solved the bug and therefore I'm taking a look at the
Telegram's API and concepts.


The learning
------------

The important take-away for him is that he needs to use the AI as tool, but he
also must gain more understanding about what the AI is doing.  Taking myself a
role model, I could spot some issues (like the repeated state identifiers) in
a single glance, and he could not see that mistake.

There is still (and I think there will always be) value in learning the basic
skills needed for programming.


.. _telegram bot: https://core.telegram.org/bots
