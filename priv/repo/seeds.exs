# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Memos.Repo.insert!(%Memos.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Memos.Repo
alias Memos.Resource.{Post, Tag}

Repo.delete_all(Post)

for i <- 1..10 do
  %Post{title: "post title #{i}", body: "post body #{i}"}
  |> Repo.insert!()
end

Repo.delete_all(Tag)

for i <- 1..10 do
  %Tag{title: "tag title #{i}"}
  |> Repo.insert!()
end
