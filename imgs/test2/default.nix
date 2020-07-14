{ pkgs ? import <nixpkgs> {}, system ? builtins.currentSystem }:
# Minimum Bash image for Docker

with pkgs;
dockerTools.buildImage {
  name = "mshiroma/test2";
  tag = "latest";
  contents = [ bashInteractive ];
}