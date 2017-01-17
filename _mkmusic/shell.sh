#!/usr/bin/env bash

nix-shell -p stdenv \
	svrender libopenmpt \
	flac ffmpeg \
	kid3 \
	rsync awscli \
	luaPackages.lua \
	luaPackages.lub \
	luaPackages.luafilesystem luaPackages.yaml