defmodule Hearkingston.Repo do
  use Ecto.Repo,
    otp_app: :hearkingston,
    adapter: Ecto.Adapters.Postgres
end
