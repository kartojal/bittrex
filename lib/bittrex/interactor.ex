defmodule ExBittrex.Interactor do
  @moduledoc false

  defmacro __using__(_) do
    quote do
      alias ExBittrex.HttpRequest
      alias ExBittrex.Client
    end
  end
end
