{ pkgs ? import <nixpkgs> {}, system ? builtins.currentSystem }:
# Minimum Bash image for Docker

with pkgs;
dockerTools.buildImage {
  name = "mshiroma/bash";
  tag = "latest";
  contents = [ bashInteractive git jq ];
}