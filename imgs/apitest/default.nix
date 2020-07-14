{ pkgs ? import <nixpkgs> {}, system ? builtins.currentSystem }:
# Minimum Bash image for Docker

with pkgs;
dockerTools.buildImage {
  name = "mshiroma/apitest";
  tag = "latest";
  contents = [ bashInteractive curl ];
}