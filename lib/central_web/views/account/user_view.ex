defmodule CentralWeb.Account.UserView do
  use CentralWeb, :view

  @spec view_colours :: {String.t(), String.t(), String.t()}
  def view_colours, do: Central.Helpers.StylingHelper.colours(:success)

  @spec icon :: String.t()
  def icon, do: "fas fa-user"

  @spec name :: String.t()
  def name, do: "user"
end
