defmodule CentralWeb.Communication.GeneralView do
  use CentralWeb, :view

  def icon(), do: Central.Communication.NotificationLib.icon()
  def view_colours(), do: Central.Communication.NotificationLib.colours()

  def view_colours("posts"), do: Central.Communication.PostLib.colours()
  def view_colours("categories"), do: Central.Communication.CategoryLib.colours()
  def view_colours("comments"), do: Central.Communication.CommentLib.colours()
  def view_colours("files"), do: Central.Communication.BlogFileLib.colours()
end
