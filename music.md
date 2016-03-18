---
layout: page
title: Music
permalink: /music/
dl_url: https://dl.dropboxusercontent.com/u/27899289/music
---

This is a list of music I've made. My music program of choice is currently [SunVox](http://warmplace.ru/soft/sunvox/), although I used to use [OpenMPT](https://openmpt.org/) (and occasionally still do).

Project and audio files are currently "hosted" on Dropbox. I'm sure there's a better way, this was just the easiest thing to do (plus it's free!).

<br />

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
