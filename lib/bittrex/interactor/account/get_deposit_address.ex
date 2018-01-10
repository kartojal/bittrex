defmodule ExBittrex.Interactor.Account.GetDepositAddress do
  @moduledoc false

  use ExBittrex.Interactor
  alias ExBittrex.Account.DepositAddress

  def call(currency) do
    :get
    |> HttpRequest.new("/account/getdepositaddress", currency: currency)
    |> Client.send()
    |> format_response()
  end

  defp format_response({:ok, result}) do
    response = DepositAddress.new(result)
    {:ok, response}
  end

  defp format_response({:error, message}), do: {:error, message}
end
