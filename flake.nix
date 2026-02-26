{
  description = "Flake for CV in LaTeX";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs;[ texliveFull ];
        shellHook = ''
          alias gogogadget="latexmk -lualatex -outdir=Build"
        '';
      };
    };
}
