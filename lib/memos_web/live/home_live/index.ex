defmodule MemosWeb.HomeLive.Index do
  use MemosWeb, :live_view

  alias Memos.Resource
  alias Memos.Resource.Tag

  def mount(_params, _session, socket) do
    s =
      socket
      |> stream(:posts, Resource.list_posts())
      |> stream(:tags, Resource.list_tags())

    {:ok, s, layout: false}
  end
end
