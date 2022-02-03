defmodule CentralWeb.Admin.ReportView do
  use CentralWeb, :view

  def view_colours, do: Central.Account.ReportLib.colours()
  def icon, do: Central.Account.ReportLib.icon()
end
