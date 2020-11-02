defmodule ElixirTodoAppWeb.PageController do
  use ElixirTodoAppWeb, :controller

  alias ElixirTodoApp.{Schema, Repo}

  import Ecto.Query
  import Ecto.Changeset

  def index(conn, _params) do
    todos =
      Schema.Todo
      |> Repo.all()

    changeset = Schema.Todo.changeset(%Schema.Todo{}, %{})

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

    %Schema.Todo{}
    |> Schema.Todo.changeset(changeset)
    |> Repo.insert()
    |> case do
      {:ok, _item} ->
        conn
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, changeset} ->
        conn
        |> put_flash(:info, "Error creating item")
        |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def edit_item(conn, %{"todo" => todo} = params) do
    todo_item = Repo.get_by(Schema.Todo, id: params["id"])

    changeset = %{
      title: Map.get(todo, "title"),
      description: Map.get(todo, "description")
    }

    todo_item
    |> Schema.Todo.changeset(changeset)
    |> Repo.update()
    |> case do
      {:ok, _item} ->
        conn
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, changeset} ->
        conn
        |> put_flash(:info, "Error creating item")
        |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def view_edit_item(conn, %{"id" => id}) do
    todo_item = Repo.get_by(Schema.Todo, id: id)

    item = Schema.Todo.changeset(todo_item, %{})

    conn
    |> assign(:item, item)
    |> assign(:todo, todo_item)
    |> render("edit_item.html")
  end
end
