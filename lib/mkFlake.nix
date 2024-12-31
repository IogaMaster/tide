{ inputs }:
self: user-inputs: flake:
{
  colmena = (import ./mkColmena.nix inputs self) // {
    defaults = {
      deployment = {
        tags = [ "all" ];
        allowLocalDeployment = true;
      };
    };
  };
} // (inputs.blueprint { inputs = user-inputs; }) // flake

