defmodule CentralWeb.Logging.LoggingView do
  use CentralWeb, :view

  def view_colours(), do: Central.Helpers.StylingHelper.colours(:info)
  def icon(), do: "far fa-chart-line"
end
