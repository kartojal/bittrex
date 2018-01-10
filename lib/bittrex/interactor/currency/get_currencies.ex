defmodule ExBittrex.Interactor.Currency.GetCurrencies do
  @moduledoc false

  use ExBittrex.Interactor
  alias ExBittrex.Currency

  def call do
    :get
    |> HttpRequest.new("/public/getcurrencies")
    |> Client.send()
    |> format_response()
  end

  defp format_response({:ok, result}) do
    response = Enum.map(result, &Currency.new/1)
    {:ok, response}
  end

  defp format_response({:error, message}), do: {:error, message}
end
