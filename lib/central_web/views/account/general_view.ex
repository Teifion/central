defmodule CentralWeb.Account.GeneralView do
  use CentralWeb, :view

  @spec view_colours :: atom
  def view_colours(), do: :info2

  @spec view_colours(String.t()) :: {String.t(), String.t(), String.t()}
  def view_colours("groups"), do: Central.Account.GroupLib.colours()
  def view_colours("user_configs"), do: Central.Config.UserConfigLib.colours()
  def view_colours("reports"), do: Central.Account.ReportLib.colours()
end
