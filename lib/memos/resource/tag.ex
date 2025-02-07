defmodule Memos.Resource.Tag do
  use Ecto.Schema
  import Ecto.Changeset
  alias Memos.Resource.Post

  schema "tags" do
    field :title, :string

    many_to_many :posts, Post, join_through: "post_tags", on_replace: :delete
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:title])
    |> validate_required([:title])
    |> unique_constraint(:title)
  end
end
