defmodule ExBittrex.Interactor.OrderBook.GetOrderBook do
  @moduledoc false

  use ExBittrex.Interactor
  alias ExBittrex.{OrderBook}

  def call(market_name, type) do
    params = [market: market_name, type: type]

    :get
    |> HttpRequest.new("/public/getorderbook", params)
    |> Client.send()
    |> format_response(type)
  end

  defp format_response({:ok, result}, "buy") do
    response = OrderBook.new(result, [])
    {:ok, response}
  end

  defp format_response({:ok, result}, "sell") do
    response = OrderBook.new([], result)
    {:ok, response}
  end

  defp format_response({:ok, result}, _type) do
    response = OrderBook.new(result["buy"], result["sell"])
    {:ok, response}
  end

  defp format_response({:error, message}, _type), do: {:error, message}
end
