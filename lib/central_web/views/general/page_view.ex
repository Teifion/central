defmodule CentralWeb.General.PageView do
  use CentralWeb, :view

  def view_colours(), do: Central.Helpers.StylingHelper.colours(:default)
  # def icon(), do: Central.Universe.icon()

  def view_colours("home"), do: view_colours()
  def view_colours("account"), do: view_colours()
  def view_colours("user_configs"), do: Central.Config.UserConfigLib.colours()
end
