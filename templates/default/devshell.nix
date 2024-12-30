{ pkgs }:
pkgs.mkShell {
  packages = [
    # Add build dependencies
  ];

  env = {
    # Add environment variables
  };

  shellHook = ''
    # Load custom bash code
  '';
}
