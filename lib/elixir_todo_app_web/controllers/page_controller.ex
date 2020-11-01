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

    changeset = %{
      title: Map.get(todo, "title"),
      description: Map.get(todo, "description")
    }

    {:ok, _todo} =
      %Schema.Todo{}
      |> Schema.Todo.changeset(changeset)
      |> Repo.insert()

    conn
    |> redirect(to: Routes.page_path(conn, :index))
  end

  def edit_item(conn, %{"id" => id}) do
    todo_item = Repo.get_by(Schema.Todo, id: id)
    IO.inspect(todo_item)

    changeset = %{
      title: todo_item.title,
      description: todo_item.description
    }

    item = Schema.Todo.changeset(todo_item, changeset)

    conn
    |> assign(:item, item)
    |> render("edit_item.html")
  end
end
