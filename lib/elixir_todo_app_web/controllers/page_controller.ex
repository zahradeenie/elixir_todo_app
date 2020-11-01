defmodule ElixirTodoAppWeb.PageController do
  use ElixirTodoAppWeb, :controller

  alias ElixirTodoApp.{Schema, Repo}

  import Ecto.Query

  def index(conn, _params) do
    todos =
      Schema.Todo
      |> Repo.all()

    changeset = Schema.Todo.changeset(%Schema.Todo{}, _params)

    conn 
    |> assign(:items, todos)
    |> assign(:changeset, changeset)
    |> render("index.html")
  end

  def create_item(conn, params) do
    todo = Map.get(params, "todo")
    IO.inspect(todo)

    changeset = %{
      title: Map.get(todo, "title"),
      description: Map.get(todo, "description")
    }

    IO.inspect(changeset)

    {:ok, _todo} =
      %Schema.Todo{}
      |> Schema.Todo.changeset(changeset)
      |> Repo.insert()

    conn
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
