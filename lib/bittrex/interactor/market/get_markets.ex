defmodule ExBittrex.Interactor.Market.GetMarkets do
  @moduledoc false

  use ExBittrex.Interactor
  alias ExBittrex.Market

  def call do
    :get
    |> HttpRequest.new("/public/getmarkets")
    |> Client.send()
    |> format_response()
  end

  defp format_response({:ok, result}) do
    response = Enum.map(result, &Market.new/1)
    {:ok, response}
  end

  defp format_response({:error, message}), do: {:error, message}
end
