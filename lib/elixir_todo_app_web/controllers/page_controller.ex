defmodule ElixirTodoAppWeb.PageController do
  use ElixirTodoAppWeb, :controller

  alias ElixirTodoApp.{Schema, Repo}

  import Ecto.Query

  def index(conn, _params) do
    todos =
    Schema.Todo
      |> Repo.all()

    conn
    |> assign(:items, todos)
    |> render("index.html")
  end
end
