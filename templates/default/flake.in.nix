{
  description = "The real nix file";

  # Your flake inputs can now be full nix code, not just pure data. So functions, thunks, etc are allowed!!!
  # We have a direnv hook that generates a static flake.nix from this file when you save it
  # To do this manually just run `nix run .#genflake flake.nix`. This is a package automatically included in your flake.
  inputs = let
    dep = url: {
      inherit url;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  in {
    nixlib.url = "github:nix-community/nixpkgs.lib";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = dep "github:nix-community/home-manager/master";

    # Needs to follow all other inputs
    tide = {
      url = "github:iogamaster/tide";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { self, ... }@inputs:
    inputs.tide.lib.mkFlake self inputs {
      # Outputs included in mkFlake:
      # - colmena deployment from each nixosConfiguration
      # - nixosConfiguration based on the `hosts/` dir
      # - lib from `lib/default.nix`
      # - modules from `modules/`
      # - checks from `checks/`

      # Your Additonal Flake outputs:
    };
}
