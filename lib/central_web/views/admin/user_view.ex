defmodule CentralWeb.Admin.UserView do
  use CentralWeb, :view

  def view_colours(), do: Central.Account.UserLib.colours()
  def icon(), do: Central.Account.UserLib.icon()
end
