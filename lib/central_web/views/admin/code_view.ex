defmodule CentralWeb.Admin.CodeView do
  use CentralWeb, :view

  @spec view_colours() :: {String.t(), String.t(), String.t()}
  def view_colours(), do: Central.Account.CodeLib.colours()

  @spec icon() :: String.t()
  def icon(), do: Central.Account.CodeLib.icon()
end
