{
  description = "Elixir Envoy Dataplane Protobuf";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self
    , nixpkgs
    ,
    }:
    let
      forAllSystems = generate: nixpkgs.lib.genAttrs [
        "x86_64-linux"

      ]
        (system: generate ({
          pkgs = import nixpkgs { inherit system; };
        }));
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
      devShells = forAllSystems ({ pkgs, ... }: {
        default = pkgs.callPackage ./nix/local.nix { };
        ci = pkgs.callPackage ./nix/ci.nix { };
      });

    };
}
