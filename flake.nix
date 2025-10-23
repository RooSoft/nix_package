{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    npmlock2nix = {
      url = "github:nix-community/npmlock2nix";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    flake-utils,
    npmlock2nix,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        base_pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        pkgs = base_pkgs.extend fixnpm2nix;

        # Elixir and related tools
        erl = pkgs.beam.interpreters.erlang_28;
        erlangPackages = pkgs.beam.packagesWith erl;
        elixir = erlangPackages.elixir;

        fixnpm2nix = final: prev: {
          nodejs-16_x = prev.nodePackages.nodejs;
        };
        
        npm2nix = pkgs.callPackage npmlock2nix {};
        nodejs = pkgs.nodejs_22;

        devShell = import ./shell.nix {inherit pkgs elixir nodejs;};

        package = import ./package.nix {inherit system pkgs erlangPackages elixir nodejs npm2nix;};
      in {
        packages = package;

        devShells.default = devShell;
      }
    );
}
