defmodule ExampleWeb.Router do
  defmacro __using__(_opts \\ []) do
    quote do
      import unquote(__MODULE__)
    end
  end


  defmacro example_routes() do
    quote do
      # Standard router stuff goes here
    end
  end
end
