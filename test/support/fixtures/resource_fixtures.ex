defmodule Memos.ResourceFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Memos.Resource` context.
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
      |> Memos.Resource.create_post()

    post
  end

  @doc """
  Generate a unique tag title.
  """
  def unique_tag_title, do: "some title#{System.unique_integer([:positive])}"

  @doc """
  Generate a tag.
  """
  def tag_fixture(attrs \\ %{}) do
    {:ok, tag} =
      attrs
      |> Enum.into(%{
        title: unique_tag_title()
      })
      |> Memos.Resource.create_tag()

    tag
  end
end
