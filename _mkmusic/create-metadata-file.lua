#!/usr/bin/env lua


--- Require ---
local yaml = require("yaml")
local shell = require("shell")
--- ==== ---


--- Constants ---
--- ==== ---


--- Main ---
shell.assert(#arg >= 2, ("Usage: %s <out file> <metafile> [metafile] [...]"):format(arg[0]:match("/([^/]+)$")))

---

local outfile = arg[1]

local metafiles = {}
for i = 2, #arg do
	metafiles[#metafiles + 1] = arg[i]
end

---

local data = {}

for _, metafile in ipairs(metafiles) do
	local metadata, err = dofile(metafile)
	if not metadata then
		io.stderr:write(err, "\n")
		goto continue
	end

	---

	metadata.filename = metafile:match("([^/]+)%.[^%.]+$")
	metadata.ext = metadata.filename:match(".+%.([^%.]+)$")

	data[#data + 1] = metadata

	---

	::continue::
end

---

-- Sort by date descending at the top, then sort ones with no date
-- alphabetically ascending and put them at the bottom.
table.sort(data, function(a, b)
	if a.tags.Date and b.tags.Date then
		return a.tags.Date > b.tags.Date
	elseif a.tags.Date then
		return true
	elseif b.tags.Date then
		return false
	else
		return a.tags.Title < b.tags.Title
	end
end)

---

local outfile_f = shell.assert(io.open(outfile, "w"))
outfile_f:write(yaml.dump(data))
outfile_f:close()
--- ==== ---
