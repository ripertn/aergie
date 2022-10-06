defmodule AergieWeb.PageController do
  use AergieWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
