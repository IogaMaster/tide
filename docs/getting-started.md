# Getting started
Use the template located at: https://github.com/iogamaster/tide-template
```shell
mkdir myconfig && cd myconfig
nix flake init -t github:iogamaster/tide-template
```

# flake.in.nix?
Flake inputs cannot be evaluated nix code. They must be pure data.
`flake.in.nix` is the way we allow inputs to use nix functions, for example auto following nixpkgs:
```nix
{
  inputs = let
    dep = url: {
      inherit url;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  in {
    nixlib.url = "github:nix-community/nixpkgs.lib";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = dep "github:nix-community/home-manager/master";
    tide = dep "github:iogamaster/tide";
  };

  outputs = { self, ... }@inputs:
    inputs.tide.lib.mkFlake self inputs {};
}
```
When we run `nix run .#genflake flake.nix`, our `flake.nix` is generated from the `flake.in.nix`.
In this case it looks like so:
```nix
# Do not modify! This file is generated.
{
  inputs = {
    flakegen.url = "github:jorsn/flakegen";
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager/master";
    };
    nixlib.url = "github:nix-community/nixpkgs.lib";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    tide = {
      url = "github:iogamaster/tide";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs: inputs.flakegen ./flake.in.nix inputs;
}
```
As you can see we have a valid `flake.nix`.
There is a special flakegen input and function in the outputs, this gives us the `.#flakegen` package.
Then just uses the `flake.in.nix` outputs, because flake outputs are full nix code.
