========================
 Starch of the new year
========================

:date: 2025-12-27
:slug: starch-of-the-2026
:category: Linux
:summary: I have some personal projects going onto the next year.  After a few months of Omarchy, I
          have decided to create my own arch *starting kit* (starch).  It's a starch, not a distro.
          I have also decided to revamp my `Emacs <https://github.com/mvaled/emacs.lite.d>`_ init.
          This is an account of both decisions and their status.

Intro
=====

In the latest weeks of the year, I have made up my mind about two major projects that I want to
undertake.

After a few months of Omarchy, I have decided to create my own Arch_ *starting kit*.  Omarchy was
`always a means to an end </2025/08/15/omarchy.html>`_: to try Hyprland.  But it did more than that
and rekindled my curiosity to explore the vast universe of Linux desktop.  At the same time, I feel
like Omarchy is heading a way I won't enjoy; so it's time for me to *starch* anew.

I have also decided to revamp my `Emacs <https://github.com/mvaled/emacs.lite.d>`_ init.  This is
easier to explain so instead of a summary, let's dive in directly.

.. _arch: https://archlinux.org/

New Emacs init
==============

I started using Emacs in 2008.  I found ReST_ to be the best text format I could use for all my
academic writings [#caveat-emptor]_, and Emacs had (and still has) the best support for editing
ReST.  It was really easy to add lists, headers, and most of the ReST features I regularly used.
With ``emacsclient`` I managed to insert citations directly from external tools.

.. _ReST: https://docutils.sourceforge.io/rst.html

In 2010 I did the switch completely and started using Emacs as my programming environment.  I was
primarily using Ruby and Rails.  I started with basic Ruby major mode and step by step I started to
use more of Emacs features to make my way around the code base.  I started using ``dired``,
``rgrep`` and lots of others.  I learnt to use TAGS, but never managed to integrate them with Ruby.

In 2011 I left my academic job and (re)started to program in Python.  I started collaborating with a
`former teacher <https://github.com/med-merchise>`_ of mine, who was also using Emacs.  Together
(mostly him rather than me) we built an Emacs setup (``xorns``) which is the one I have been using
since.  This setup has accumulated a lot of stuff over the years; it is already 8000+ lines of
elisp.

Recently, I started to wonder how much of it do I still need.  Emacs has changed a lot in the past
releases, and ``xorns`` has taken advantage of most of them.

.. |emacs.lite.d| replace:: ``.emacs.lite.d``
.. _emacs.lite.d: https://github.com/mvaled/emacs.lite.d

That is why I created my |emacs.lite.d|_ and started working on it.  So far, I have already reached
344 lines of elisp.  I guess it will keep growing as I use this new configuration.

However, the guiding principle is that I want to keep my ``.emacs.lite.d`` as small as possible.
Most should come from Emacs itself or a 3rd party.  What I don't find in a 3rd party and cannot
possibly contribute, I will add.  Otherwise, I'll stick to the basics so long as they don't hinder
my productivity.

The biggest change so far is moving from ``lsp-mode`` to ``eglot``.  There's nothing wrong with
``lsp-mode``, in fact I miss some of its features.  But since ``eglot`` was included in Emacs I
wanted to give it a try.  This is it.

.. note:: I'm of course writing this post in ReST using this new Emacs setup.


From Omarchy to Starch
======================

It's a *starch* not a distro.

Building your own Linux desktop is a time-consuming effort.  Building and maintaining a Linux
distribution is beyond what I can afford now.  Therefore, leaving Omarchy was not an easy decision.
Nevertheless, in the latest updates Omarchy has made some choices that have worsened my personal
satisfaction of it.

The following list is not meant to be complete, or even demonstrative of the issues.  These are
simply the latest annoyances:

- They removed the screen capture without audio.  That is the only kind of screen record that I do.
  I don't stream; I don't record and edit videos for educational purposes or other.  I don't even
  have a mic besides the integrated one in my laptop.  I only need to record my screen to either
  show something is broken, or fixed.

  After I record my screen I also had to use ``ffmpeg`` to remove the audio stream.

- They removed the Suspend menu option `because it didn't work reliably
  <https://github.com/basecamp/omarchy/commit/fc04525f032656ceb81f10045ae702e00356e8c5>`_.

  It worked for me, and at least three other users felt the need to report it.

  My solution this time was to copy ``omarchy-menu`` in my ``~/.local/bin/``; modify to add this
  back, and also fix the screen capture issue.

- I use Emacs; not nvim.  When installing Emacs in Omarchy, they cleverly make it a user unit in
  ``systemd``.  But then ``omarchy-launch-editor`` doesn't connect to the already running Emacs
  instance.  I `submitted the fix a month ago <https://github.com/basecamp/omarchy/pull/3481>`_.
  Since they haven't merged it yet I have now my own ``~/.local/bin/omarchy-launch-editor``.

- ...

It feels like I'm slowly cloning every Omarchy script into my home [#more-than-that]_.  If that is
the case, I will have to manually patch those scripts after updating Omarchy; and the update itself
can become risky if my changes to some scripts are incompatible with theirs.

I'd rather not wait till my system becomes inoperative and start developing my own set of scripts
without the illusion of a Linux distro.


Starch
------

Unlike with my Emacs project, I'm still using Omarchy.  I understand that it will take me a few
iterations to produce a decent start kit to replace Omarchy.  Of course, I'm standing on the
shoulders of Omarchy, and I will keep many things:

- Themes, Fonts, Styling
- TUI selection
- the basic Hyprland configuration

I will be able to remove many things I don't use, and which very likely I won't use: Windows VM,
Obsidian, Dropbox, etc...

I will be able to avoid using LUKS and btrfs in an old laptop which I use mostly to watch videos
using Jellyfin.  With Omarchy, I have had to regularly remove the btrfs snapshots because the disk
reached 100% usage, mostly on ``@home/.snapshots``.

The plan [#hopefully]_:

- I have forked Omarchy and Omarchy-ISO and created a mono-repo out of them.
- I'm now curating the list of scripts, software, etc.
- New year's pause
- Have a ready to install ISO and test it thoroughly in my old laptop.
- Keep working...

I did find the name and a fittingly imperfect logo [#vibed-logo]_:

.. figure:: /images/2025/starch.png
   :alt: Starch logo in dark and light themes
   :width: 90%


Why not NixOS already?
----------------------

TL;DR: I'm not ready yet.

I have been thinking about moving completely to NixOS.  I have read the Nix language and understand
its basic syntax.  The only thing that stops me is that it feels like I could end up isolating my
working setup from that of my coworkers.

I've seen many ``.nix`` in other's github accounts to manage the different versions of Python, etc;
while my team uses ``uv``.  Of course, I know I could still use ``uv``, ``mise`` and other managers
used in company.  But at the same time I'm part of keeping our shared ``Makefile`` that should work
in all our devs machines.  Adding NixOS to the mix might increase a bit my workload.  So before I
made the jump I want to first be sure about the features I want to have in the desktop.


Footnotes
=========

.. [#caveat-emptor] ReST didn't have all the features I needed, but with a simple script I could
   transform it to LaTeX + BibTeX.

.. [#more-than-that] I have copied or replaced more scripts than the two mentioned.  They are still
   just a few compared to the 142 scripts shipped with Omarchy; but they represent a trend.

.. [#hopefully] This is rather a list of wishes than a real plan.  But it is enough for this side
   project.

.. [#vibed-logo] This logo was mostly AI generated.  I can credit myself for the shape of the A.
   Despite my repeated instructions to *hint* the shape of the Arch logo ChatGPT 5.2 could not
   manage to produce something decent.  So I took the best one it gave and dusted off GIMP_ to shape
   the A.  Then I asked ChatGPT to produce a SVG, and it did the best it could; the edges of the
   letters had dents and imperfections; but *I liked* this for my rough and imperfect project.  So I
   only improved the shape of the A to have a smoother (yet off center) arch, and overall less
   defects than the other letters.

.. _GIMP: https://www.gimp.org
