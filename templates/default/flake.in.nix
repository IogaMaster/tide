{
  description = "The real nix file";

  inputs = let
    dep = url: {
      inherit url;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  in {
    nixlib.url = "github:nix-community/nixpkgs.lib";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
    tide = dep "github:iogamaster/tide";
    blueprint = dep "github:numtide/blueprint";
  };

  outputs = (inputs: inputs.blueprint { inherit inputs; });
}
