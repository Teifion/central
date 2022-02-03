defmodule CentralWeb.Admin.GeneralView do
  use CentralWeb, :view
  use Timex

  @build_time_priv Timex.now()

  def build_time() do
    @build_time_priv
  end

  @spec view_colours :: {String.t(), String.t(), String.t()}
  def view_colours(), do: Central.Admin.AdminLib.colours()

  @spec icon() :: String.t()
  def icon(), do: Central.Admin.AdminLib.icon()

  @spec view_colours(String.t()) :: {String.t(), String.t(), String.t()}
  def view_colours("user"), do: Central.Account.UserLib.colours()
  def view_colours("group"), do: Central.Account.GroupLib.colours()
  def view_colours("reports"), do: Central.Account.ReportLib.colours()
  def view_colours("codes"), do: Central.Account.CodeLib.colours()
  def view_colours("site_config"), do: Central.Config.SiteConfigLib.colours()
  def view_colours("tool"), do: Central.Admin.ToolLib.colours()
end
