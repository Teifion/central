defmodule CentralWeb.Communication.NotificationView do
  use CentralWeb, :view

  def view_colours(), do: Central.Communication.NotificationLib.colours()
  def icon(), do: Central.Communication.NotificationLib.icon()
end
