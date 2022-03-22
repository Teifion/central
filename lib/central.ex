defmodule Central do
  @moduledoc false


  @spec cache_delete(atom, any) :: :ok | {:error, any}
  def cache_delete(table, keys) when is_list(keys) do
    keys
    |> Enum.each(fn key ->
      ConCache.delete(table, key)
    end)

    Phoenix.PubSub.broadcast(
      Central.PubSub,
      "cluster_hooks",
      {:cluster_hooks, :delete, Node.self(), table, keys}
    )
  end
  def cache_delete(table, key), do: cache_delete(table, [key])
end
