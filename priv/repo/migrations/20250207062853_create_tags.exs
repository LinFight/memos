defmodule Memos.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :title, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:tags, [:title])
  end
end
