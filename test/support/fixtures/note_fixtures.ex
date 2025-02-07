defmodule Memos.NoteFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Memos.Note` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> Memos.Note.create_post()

    post
  end
end
