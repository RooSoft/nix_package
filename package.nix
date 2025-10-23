{
  system,
  pkgs,
  erlangPackages,
  elixir,
  ...
}: let
  version = "0.1.0";
  src = ./.;
  mixFodDeps = erlangPackages.fetchMixDeps {
    inherit version src;
    pname = "nix-package-deps";
  };
  translatedPlatform =
    {
      aarch64-darwin = "macos-arm64";
      aarch64-linux = "linux-arm64";
      armv7l-linux = "linux-armv7";
      x86_64-darwin = "macos-x64";
      x86_64-linux = "linux-x64";
    }
    .${
      system
    };
in {
  default = erlangPackages.mixRelease {
    inherit version src mixFodDeps;
    pname = "nix_package";

    postBuild = ''
      ln -sf ${pkgs.tailwindcss}/bin/tailwindcss _build/tailwind-${translatedPlatform}
      ln -sf ${pkgs.esbuild}/bin/esbuild _build/esbuild-${translatedPlatform}

      ${elixir}/bin/mix assets.deploy
      ${elixir}/bin/mix phx.gen.release
    '';
  };
}
