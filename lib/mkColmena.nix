inputs: self:
{
  # Generate nodes for colmena automatically from nixosConfigurations
  meta = {
    nixpkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    nodeNixpkgs =
      builtins.mapAttrs (name: value: value.pkgs) self.nixosConfigurations;
    nodeSpecialArgs = builtins.mapAttrs (name: value: value._module.specialArgs)
      self.nixosConfigurations;
  };
} // builtins.mapAttrs (name: value: { imports = value._module.args.modules; })
self.nixosConfigurations
