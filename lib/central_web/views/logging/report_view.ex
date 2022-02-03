defmodule CentralWeb.Logging.ReportView do
  use CentralWeb, :view

  @spec view_colours() :: atom
  def view_colours(), do: :report

  @spec icon() :: String.t()
  def icon(), do: Central.Helpers.StylingHelper.icon(:report)
end
