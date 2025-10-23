defmodule NixPackageWeb.PageController do
  use NixPackageWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
