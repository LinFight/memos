defmodule MemosWeb.PostController do
  use MemosWeb, :controller

  alias Memos.Resource
  alias Memos.Resource.Post

  def index(conn, _params) do
    posts = Resource.list_posts()
    render(conn, :index, posts: posts)
  end

  def new(conn, _params) do
    changeset = Resource.change_post(%Post{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    case Resource.create_post(post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: ~p"/posts/#{post}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    post = Resource.get_post!(id)
    render(conn, :show, post: post)
  end

  def edit(conn, %{"id" => id}) do
    post = Resource.get_post!(id)
    changeset = Resource.change_post(post)
    render(conn, :edit, post: post, changeset: changeset)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Resource.get_post!(id)

    case Resource.update_post(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: ~p"/posts/#{post}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, post: post, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Resource.get_post!(id)
    {:ok, _post} = Resource.delete_post(post)

    conn
    |> put_flash(:info, "Post deleted successfully.")
    |> redirect(to: ~p"/posts")
  end
end
