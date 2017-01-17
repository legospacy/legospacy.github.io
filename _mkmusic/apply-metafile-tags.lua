#!/usr/bin/env lua


--- Require ---
local shell = require("shell")
shell.PRINT = true
--- ==== ---


--- Main ---
shell.assert(#arg == 2, ("Usage: %s <music file> <metafile>"):format(arg[0]:match("/([^/]+)$")))

---

local file = arg[1]
local metafile = arg[2]

---

local metadata = dofile(metafile)

shell.assert(metadata.tags, "Metafile has no tags!")

---

for tag, val in pairs(metadata.tags) do
	if tag == "Date" then
		-- Set integer-only tag then overwrite it.
		-- Yay workarounds.

		shell.exec(("kid3-cli -c 'set %s \"%s\"' -c $'set %s \"%s\"' \"%s\""):format(
			tag, "3000",
			tag, val:gsub("'", "\\'"),
			file))
	else
		shell.exec(("kid3-cli -c $'set %s \"%s\"' \"%s\""):format(
			tag, val:gsub("'", "\\'"), file))
	end
end
--- ==== ---
