{ nixpkgs, buildImage , system ? builtins.currentSystem }:

rec {
  bash = buildImage {
    name = "bash";
    tag = "latest";
    contents = nixpkgs.bashInteractive;
  };
}