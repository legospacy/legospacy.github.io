#!/usr/bin/env bash

nix-shell -p stdenv \
	svrender libopenmpt \
	flac ffmpeg \
	kid3 \
	rsync awscli \
	nix-luarocks.luaPackages.lua \
	nix-luarocks.luaPackages.lub \
	nix-luarocks.luaPackages.luafilesystem \
	nix-luarocks.luaPackages.yaml