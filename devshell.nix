{ pkgs }:
pkgs.mkShell {
  packages = with pkgs;
    [
      # Add build dependencies
      nixd
    ];

  env = {
    # Add environment variables
  };

  shellHook = ''
    # Load custom bash code
  '';
}
