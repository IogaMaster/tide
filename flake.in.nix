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
    blueprint = dep "github:numtide/blueprint";

    # Proper Dependencies
    home-manager = dep "github:nix-community/home-manager/master";
  };

  outputs = (inputs: inputs.blueprint { inherit inputs; });
}
