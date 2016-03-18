with import <nixpkgs> {}; {
  musicPublishEnv = stdenv.mkDerivation {
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

    shellHook = "source $stdenv/setup";
  };
}
