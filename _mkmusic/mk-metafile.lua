#!/usr/bin/env lua

--- Require ---
local lfs = require("lfs")
local shell = require("shell")
--- ==== ---


--- Constants ---
local METAFILE_EXT = ".meta"

local TAGLIST = {
	"Artist",
	"Title",
	"Date"
}
--- ==== ---


--- Main ---
assert(arg[1], "No files given")

---

local function write_tags_file(tagfile, tags)
	local f, err = io.open(tagfile, "w")
	if err then
		io.stdout:write(err, "\n")
		return
	end

	---

	print(("Writing '%s'"):format(tagfile))

	f:write("return {\n")
	f:write("\ttags = {")

	for tag, val in pairs(tags) do
		f:write("\t\t", tag, " = '", tostring(val), "';\n")
	end

	f:write("\t}\n")
	f:write("}\n")

	---

	f:close()
end

for _, file in ipairs(arg) do
	local tagfile = file .. METAFILE_EXT

	if file:find("%" .. METAFILE_EXT .. "$") then
		goto continue
	end

	if lfs.attributes(tagfile) then
		print(tagfile .. " exists, skipping")
	else
		print("--------")
		print("File: " .. file)

		local tags = {}

		for _, tag in ipairs(TAGLIST) do
			io.stdout:write(tag, ": ")
			local input = io.stdin:read()

			if #input == 0 then input = nil end

			tags[tag] = input
		end

		if not tags.artist then
			tags.artist = "Mirrexagon"
		end

		write_tags_file(tagfile, tags)
	end

	::continue::
end
--- ==== ---
