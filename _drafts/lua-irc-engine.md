---
layout: post
title: "Lua IRC Engine"
---

I maintain a Lua module named Lua IRC Engine, also known as `irc-engine`, or IRCe for short. I describe it as "A Lua IRC module that tries to be minimal and extensible." ([GitHub repo](https://github.com/mirrexagon/lua-irc-engine), [Luarocks](https://luarocks.org/modules/legospacy/irc-engine))

It's my first ever versioned piece of software, and the first that is actually used by more than three people. In this post, I'll go over its history, some of the things I did badly, and things I've learnt from it.

I'll refer to it as IRCe from now on.


# History
Years ago, when I was still new to programming, I wanted to try writing an IRC bot from scratch in Lua, the language I was most comfortable in.

`TODO: Finish.`


# Issues and lessons learnt
The most obvious thing you might notice once you go to use the module, is the version number. As of writing, it is `5.0.0-pre5`. Seems a bit high, doesn't it?

I tried to follow [Semantic Versioning](http://semver.org/) with this project. The problem was, I released `v1.0.0` far too early. I though I was happy with the API; the method names and what they did was good. However, I later found that I was not happy with some details of the behaviour of the module, one in particular.

To explain it, I have to explain a bit about how `irc-engine` works, specifically how it processes messages it receives.

---

After `irc-engine` parses a raw IRC message, it looks for a function to process it. There are two kinds of these:

- **Handlers**, which are internal;
- **Callbacks** which are defined by the user of the module.

**Handlers** take in the raw parts of an IRC message, and do some processing. A **handler** can do some processing and *maybe* return some data, which is passed to the corresponding **callback**.

The problem is this: when do you call the callback, and when don't you? Should you always call the callback, even when there is no handler, or when the handler doesn't return anything?

`TODO: Examples?`

The main thing I learnt from this is that there's a major version zero (`0.x.y`) for a reason - to get everything how you want it.

---

`TODO: What other lessons?`


# Conclusion
The final issue is that I don't actually use IRC Engine myself right now, and I haven't for most of its existence. I don't maintain any bots anymore, and I've kinda lost interest (for now, at least).

I wish I could start again with what I've learned, especially making good use of major version zero to really make sure I'm happy with everything (and not break SemVer, as I've done a few times).

I do think I finally have the basic idea of the library down pretty solid though. Now I just have to add more IRC commands (like `CAP` for IRCv3 tags), improve the documentation, and write some tests!

I might get around to it someday...
