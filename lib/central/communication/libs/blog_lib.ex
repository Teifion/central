defmodule Central.Communication.BlogLib do
  @moduledoc false
  use CentralWeb, :library

  @spec colours() :: atom
  def colours(), do: :primary

  @spec icon() :: String.t()
  def icon(), do: "fa-duotone fa-rss"
end
