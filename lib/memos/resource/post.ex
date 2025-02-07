defmodule Memos.Resource.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Memos.Resource.Tag

  schema "posts" do
    field :title, :string
    field :body, :string

    many_to_many :tags, Tag, join_through: "post_tags", on_replace: :delete

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
