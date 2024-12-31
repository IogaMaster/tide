{ flake, inputs, ... }: {
  mkFlake = (import ./mkFlake.nix { inherit inputs; });
}
