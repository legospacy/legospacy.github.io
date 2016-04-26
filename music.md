---
layout: page
title: Music
permalink: /music/
dl_url: https://dl.dropboxusercontent.com/u/27899289/music
---

This is a list of music I've made. My music program of choice is currently [SunVox](http://warmplace.ru/soft/sunvox/), although I used to use [OpenMPT](https://openmpt.org/) (and occasionally still do).

Project and audio files are currently "hosted" on Dropbox. I'm sure there's a better way, this was just the easiest thing to do (plus it's free!).

All the music on this page, unless stated otherwise, is released into the public domain via [Creative Commons Zero](https://creativecommons.org/publicdomain/zero/1.0/). That means you're allowed do pretty much anything you want with it *without* needing to get my permission or credit me. Credit is nice, but totally not required.

This is an experiment in releasing works into the public domain, and I trust that you won't do nasty things. Please don't betray that trust.

That being said, enjoy!

---
{% for song in site.data.music %}
---

**{{ song.tags.Artist }} - {{ song.tags.Title }}** <br />
*Finished: {{ song.tags.Date | default: "before early 2015" }}*

{{ song.comment | newline_to_br }}


*Made with {{ song.program }} <br />
[Project file]({{ page.dl_url }}/{{ song.filename }}) <br />
[FLAC]({{ page.dl_url }}/{{ song.filename }}.flac) <br />
[Ogg Vorbis]({{ page.dl_url }}/{{ song.filename }}.ogg) <br />*
{% endfor %}
