{pkgs, ...}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    elixir
    nodejs

    inotify-tools # required for mix
    sqlite
    litecli
    amp-cli
    tailwindcss_4
    esbuild
  ];

  shellHook = ''
    export MIX_TAILWIND_PATH="$(which tailwindcss)"
    export MIX_TAILWIND_VERSION="$(tailwindcss --help | awk 'NR==1 {print substr($3,2)}')"
    export MIX_ESBUILD_PATH="$(which esbuild)"
    export MIX_ESBUILD_VERSION="$(esbuild --version)"

    export DATABASE_PATH="./liveview_package_prod.db"
    export SECRET_KEY_BASE="sReqDTy2T7k3Mcpr/nUEJ7hvjJPy2zHQaHOifIFIVRJqIxZ2xg8Y6FS8C2iLwEBg"

    export PHX_HOST="0.0.0.0"
    export PORT=4000
  '';
}
