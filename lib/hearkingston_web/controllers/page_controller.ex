defmodule HearkingstonWeb.PageController do
  use HearkingstonWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false, page_title: "(h)EAR Concert and Workshop Series")
  end

  def about(conn, _params) do
    render(conn, :about, layout: false, page_title: "About (h)EAR")
  end

  def ras(conn, _params) do
    render(conn, :ras, layout: false, page_title: "Ras Burnett + Nambi at the Broom Factory")
  end
end
