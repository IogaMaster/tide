# Do not modify! This file is generated.

{
  description = "The real nix file";
  inputs = {
    blueprint = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/blueprint";
    };
    flakegen.url = "github:jorsn/flakegen";
    nixlib.url = "github:nix-community/nixpkgs.lib";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = inputs: inputs.flakegen ./flake.in.nix inputs;
}