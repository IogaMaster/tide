{ inputs }:
self: user-inputs: flake:
{
  colmena = (import ./mkColmena.nix inputs self);
} // (inputs.blueprint { inputs = user-inputs; }) // flake

