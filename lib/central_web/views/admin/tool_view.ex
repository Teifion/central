defmodule CentralWeb.Admin.ToolView do
  use CentralWeb, :view

  def view_colours(), do: Central.Admin.ToolLib.colours()
  def icon(), do: Central.Admin.ToolLib.icon()

  def uptime() do
    System.cmd("uptime", [])
    |> elem(0)
    |> String.trim
  end

  def view_colours(_), do: Central.Admin.ToolLib.colours()
end
