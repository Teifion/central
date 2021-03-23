defmodule ExampleWeb do
  def view do
    quote do
      use Phoenix.View,
        root: "lib/example_web/templates",
        namespace: ExampleWeb

      use CentralWeb, :view_structure
    end
  end

  def live_view do
    quote do
      use CentralWeb, :live_view_structure
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
