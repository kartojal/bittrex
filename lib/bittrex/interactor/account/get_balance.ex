defmodule ExBittrex.Interactor.Account.GetBalance do
  @moduledoc false

  use ExBittrex.Interactor
  alias ExBittrex.Account.AccountBalance

  def call(currency) do
    :get
    |> HttpRequest.new("/account/getbalance", currency: currency)
    |> Client.send()
    |> format_response()
  end

  defp format_response({:ok, result}) do
    response = AccountBalance.new(result)
    {:ok, response}
  end

  defp format_response({:error, message}), do: {:error, message}
end
