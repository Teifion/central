defmodule CentralWeb.Logging.GeneralView do
  use CentralWeb, :view

  @spec view_colours() :: atom
  def view_colours(), do: Central.Logging.LoggingLib.colours()

  @spec icon() :: String.t()
  def icon(), do: Central.Logging.LoggingLib.icon()

  @spec view_colours(String.t()) :: atom
  def view_colours("page_view"), do: Central.Logging.PageViewLogLib.colours()
  def view_colours("aggregate"), do: Central.Logging.AggregateViewLogLib.colours()
  def view_colours("audit"), do: Central.Logging.AuditLogLib.colours()
  def view_colours("error"), do: Central.Logging.ErrorLogLib.colours()
  def view_colours("report"), do: :report
end
