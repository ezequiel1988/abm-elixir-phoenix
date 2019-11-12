defmodule HtmlAppWeb.PageController do
  use HtmlAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def celulares(conn, _params) do
    render(conn, "celulares.html")
  end
end
