with import <nixpkgs> {}; stdenv.mkDerivation {
  name = "musicPublish";

  buildinputs = [
    stdenv

    lua

    svrender
    libopenmpt

    flac
    ffmpeg

    kid3

    rsync
  ];
}
