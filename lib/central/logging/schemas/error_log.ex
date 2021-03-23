defmodule Central.Logging.ErrorLog do
  use CentralWeb, :schema

  schema "error_logs" do
    field :path, :string
    field :method, :string
    field :reason, :string
    field :traceback, :string
    field :hidden, :boolean, default: false
    field :data, :map
    belongs_to :user, Central.Account.User

    timestamps()
  end

  @doc false
  def changeset(struct, params) do
    struct
    |> cast(params, [:path, :reason, :method, :traceback, :hidden, :data, :user_id])
    |> validate_required([:path, :reason, :traceback, :hidden, :data])
  end
end
