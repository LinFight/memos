defmodule Memos.Repo do
  use Ecto.Repo,
    otp_app: :memos,
    adapter: Ecto.Adapters.SQLite3
end
