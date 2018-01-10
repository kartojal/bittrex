defmodule ExBittrex.Interactor.Market.SellLimit do
  @moduledoc false

  use ExBittrex.Interactor
  alias ExBittrex.Order

  def call(market_name, quantity, rate) do
    params = [
      market: market_name,
      quantity: quantity,
      rate: rate
    ]

    :get
    |> HttpRequest.new("/market/selllimit", params)
    |> Client.send()
    |> format_response()
  end

  defp format_response({:ok, result}) do
    response = Order.new("LIMIT_SELL", result)
    {:ok, response}
  end

  defp format_response({:error, message}), do: {:error, message}
end
