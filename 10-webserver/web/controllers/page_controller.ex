defmodule Webserver.PageController do
  use Webserver.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
