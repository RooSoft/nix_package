defmodule NixPackage.Repo do
  use Ecto.Repo,
    otp_app: :nix_package,
    adapter: Ecto.Adapters.Postgres
end
