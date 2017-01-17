with import <nixpkgs> {}; stdenv.mkDerivation {
  name = "musicPublish";

  buildinputs = [
    stdenv

    svrender
    libopenmpt

    flac
    ffmpeg

    kid3

    rsync
  ] ++ (with luaPackages; [
    lua
    luafilesystem
    yaml
  ]);
}
