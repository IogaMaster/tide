# Do not modify! This file is generated.

{
  description = "The real nix file";
  inputs = {
    flakegen.url = "github:jorsn/flakegen";
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager/master";
    };
    nixlib.url = "github:nix-community/nixpkgs.lib";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    tide = {
      inputs = {
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:iogamaster/tide";
    };
  };
  outputs = inputs: inputs.flakegen ./flake.in.nix inputs;
}
