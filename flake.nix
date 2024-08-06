{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs }:
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in
    {
        packages.${system}.default = 
            pkgs.writeShellApplication {
                name = "print-path";
                runtimeInputs = [];
                text = builtins.readFile ./printPath.sh;
            };


        devShell.x86_64-linux =
            pkgs.mkShell {
                buildInputs = with pkgs;[
                    nil
                    bash-language-server
                ];
            };
    };
}



