{ pkgs ? import <nixpkgs> {}, system ? builtins.currentSystem }:
# Minimum Bash image for Docker

with pkgs;
dockerTools.buildImage {
  name = "mshiroma/bash2";
  tag = "latest";
  contents = [ bashInteractive ];
}