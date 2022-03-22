defmodule Central do
  @moduledoc false


  @spec delete_cache(atom, any) :: :ok | {:error, any}
  def delete_cache(table, keys) when is_list(keys) do
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
  def delete_cache(table, key), do: delete_cache(table, [key])
end
