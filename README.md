# ElixirTodoApp

This is my first full stack application using the Phoenix Framework. No tutorials, no YouTube follow alongs. Just me figuring out routes, functions, pattern matching, forms, error handling and how to read and debug the compiler's error messages (this is a big one for me). The application is deployed on Heroku: https://elixir-todo-list.herokuapp.com/

There are 2 templates: the homepage and a page to edit a todo item

Homepage after creating a todo item:

![Elixir todo list image 1](https://i.imgur.com/aXYnL4z.png)

Edit page to modify a todo item:

![Elixir todo list image 2](https://i.imgur.com/xvZfalw.png)

Homepage after successfully editing a todo item:

![Elixir todo list image 3](https://i.imgur.com/BOTwh1d.png)

Homepage after completing a todo item:

![Elixir todo list image 4](https://i.imgur.com/gAThVM1.png)

## Things to improve

**Error handling**

At the moment I'm just returning a generic error message when the changeset returns an error. It would be better to display the error returned from the changeset to give more useful information to the user.

**Styling**

The purpose of this todo list was to build my confidence in creating a full stack application with the Phoenix framework - focusing on transforming data, understanding changesets, how to display data in the templates, etc. The styling is an afterthought in this. I know it's very ugly so it's listed as a low priority improvement to make.

## To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Build the docker container with `docker-compose up -d`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
