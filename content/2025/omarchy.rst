======================================
 Trying Hyprland, by means of Omarchy
======================================

:slug: omarchy
:date: 2025-08-15
:summary: The good, the bad and the ugly.  My experience moving to Hyprland_,
          by means of Omarchy_.

I don't remember exactly the first time I heard about Hyprland_ [#hyperland]_.
Maybe it was Leiser_ who showed it to me first, but I don't keep a
recollection about it.  Regardless of how it was, I know that about two weeks
ago I started to read about it more and more.  I wanted it to try it.

In parallel, I read some posts__ by DHH_ about something called Omarchy_ and I
didn't pay too much attention to them, until Leiser told me he was using
Hyprland.  So I got curious, and went to find that Omarchy was Hyprland on top
of Arch, curated and ready to enjoy.  So I decided to try it immediately.

__ https://x.com/dhh/status/1954271139766698168

.. _hyprland: https://hypr.land/
.. _omarchy: https://omarchy.org/
.. _leiser: https://github.com/leiserfg
.. _DHH: https://x.com/dhh



The good, the bad and the ugly
==============================

The good
--------

As promised, it provides a comfortable enough environment for the modern
desktop of a programmer.

Not all DHH's choices are mine.  I use Emacs instead of Neovim.  I prefer
Telegram over WhatsApp or Signal.  I use Firefox and not Chromium (nor Chrome
except when I'm forced to use it).  I don't have HEY! nor Basecamp accounts.

But overall, I could tweak my preferences for those programs in a matter of
minutes just by editing ``~/.config/hypr/bindings.conf``, after having my
choices installed.

Omarchy is indeed a very good starting point for those who, like me, want to
try Hyprland but cannot devote too much time to the project.  Thanks, DHH!

His choices for other tools are really good alternatives.  I was considering
switching to Kitty, but Alacritty seems pretty decent.

I'm exploring the other programs DHH selected.  Many of them will likely be
subsumed by my trusted Emacs.  In Emacs I write (code or prose), navigate the
files, encrypt/decrypt with ``gpg``, and lot more.  Nevertheless, I will still
explore the other tools like Obsidian, Pinta, etc.

In terms of aesthetics I decided for the theme Ristretto.  All the dark themes
are very good, but I like this one better.

Overall, I'm learning a lot and enjoying the process.


the bad, and the ugly
---------------------

I'm still in this initial phase of adjustment to the new world.  I'm not
really claiming the following are bad or ugly [#bad]_.

I have forked__ Omarchy's repository because there are somethings in the
``bin/omarchy_menu`` which are not configurable:

__ https://github.com/mvaled/omarchy

.. code-block:: bash

   edit_in_nvim() {
     notify-send "Editing config file" "$1"
     alacritty -e nvim "$1"
   }

   open_web() {
      setsid chromium --new-window --app="$1" &
   }

These I have switched for

.. code-block:: bash

   edit_in_emacs() {
     notify-send "Editing config file" "$1"
     alacritty -e emacs -nw "$1"
   }

   open_web() {
     setsid firefox --new-tab "$1" &
   }


CapsLock as compose
~~~~~~~~~~~~~~~~~~~

I like using CapsLock to ``WRITE_ALL_CAPS_CONSTS`` in some languages.  I have
heard all the rationalization about a mechanical traits from the typewriters
era being transfered into the digital world along with many other arguments.
I simply find it comfortable to type ``const ASK_ABRACADABRA = 1`` with the
CapsLock on.

It's muscular memory for me, I don't think but instinctively reach for
CapsLock when I need to type all caps for more that a couple of letters.


That being said, I'm asking myself questions: Do I use CapsLock outside Emacs?
I could use an Emacs |caps-lock|_ minor mode for this in Emacs.  However, I
wonder if I will then get used to whatever keybind I could set to
activate/deactive caps in Emacs and try to transfer that to any other typing
scenario.  I do press ``Ctrl + n`` in other programs, only to find out I'm
opening lots of windows.

.. |caps-lock| replace:: ``caps-lock``
.. _caps-lock: https://github.com/emacs-straight/caps-lock/blob/master/caps-lock.el



Keyboard layouts
~~~~~~~~~~~~~~~~

I switch my keyboard layout to Spanish when I chat in languages other than
English.  In my previous setup the Spanish keyboard had the the key ``'``
automatically composes with vowels (deadkeys).

So instead of pressing ``Caps``\ ``'``\ ``<vowel>`` (as I'm doing since I
moved to Omarchy), I would like to just press ``'``\ ``<vowel>``.

.. note:: I'm kind of a purist and refuse to spell ``si`` (if, whether) when
          it should be ``sí`` (yes).

          I'm not completely deranged and I rarely use the ``¿`` (opening
          question mark) or ``¡`` (opening exclamation mark) anymore.  But I
          do type them from time to time in formal settings.

The ``ñ`` deserves its own key in a Spanish layout instead of ``Caps``\ ``~``
(which requires a ``Shift``) and ``n`` -- *she* is not dead [#evolution]_!

I have temporarily set my keyboard to ``kb_variant = intl``, but is not
satisfactory either.  It allows me to type ``ñ``, and accented vowels with
fewer key strokes, but then English with ``'s`` becomes painful to type (e.g
``'``\ ``SPACE``\ ``s``, or I risk getting ``ś``).

The solution to this seems to be ``fcitx5``, instead of using hyprland's
input.  I also want to use it's keyboard layout per window, so I will try
that.

The good, again
~~~~~~~~~~~~~~~

Omarchy is amazing.  It has fulfill its promise to me.  It's decent, elegant
and properly organized.  I don't share all DHH's choices and that's good.  I'm
still indebted to him.


Niceties and future projects
============================

I want to create my own Plymouth script to have my own loader.

.. figure:: /images/2025/mva-logo.png

   Potential Plymouth Logo and progress bar combined.



Footnotes
=========

.. [#hyperland] I still sometimes misspell it as Hyperland.


.. [#windows] I have many, many things to tweak to make my windows and
   workspace work comfortable for me.  I used to have 4 static workspaces in
   Gnome, and I can live the default 5 of Omarchy.

   I'm considering/reading the options about special workspaces, persistent
   workspaces, etc.  I don't really care about *active*.  All workspaces
   should be accesible and I should be able to put windows in them.

.. [#bad] `The good, the bad and the ugly`__.  That's a movie. D'you know?

   __ https://en.wikipedia.org/wiki/The_Good,_the_Bad_and_the_Ugly

.. [#evolution] I know languages evolve.  Even the ``ñ`` was a product of
   necessity__ to spare some space while write Old Spanish words.

   It's no longer surprising to be wished a "feliz ano nuevo" instead of a
   «¡Feliz año nuevo!»; if you look for their meaning you're up for dad joke.

   Maybe AI dictation will bring the ``ñ`` back to life for a few more decades
   or centuries.

   __ https://en.wikipedia.org/wiki/%C3%91#History
