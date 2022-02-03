defmodule CentralWeb.Account.RegistrationView do
  use CentralWeb, :view

  @spec view_colours :: {String.t(), String.t(), String.t()}
  def view_colours, do: Central.Helpers.StylingHelper.colours(:primary)
end
