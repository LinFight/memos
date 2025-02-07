defmodule MemosWeb.HomeLive.Index do
  use MemosWeb, :live_view

  alias Memos.Resource.Post
  alias Memos.Resource.Tag
  alias Memos.Resource

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :posts, Resource.list_posts()), layout: false}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Posts")
    |> assign(:post, nil)
  end
end
