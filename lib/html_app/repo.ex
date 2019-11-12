defmodule HtmlApp.Repo do
  use Ecto.Repo,
    otp_app: :html_app,
    adapter: Ecto.Adapters.Postgres
end
