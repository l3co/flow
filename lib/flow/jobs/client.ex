defmodule Flow.Jobs.Client do
  use Ecto.Schema
  import Ecto.Changeset

  @moduledoc """
  Client is a job's owner
  """

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "clients" do
    field :description, :string
    field :logo, :string
    field :name, :string
    has_many :jobs, Flow.Jobs.Job

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:name, :description, :logo])
    |> validate_required([:name, :description, :logo])
  end
end
