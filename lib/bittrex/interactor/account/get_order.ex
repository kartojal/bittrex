defmodule ExBittrex.Interactor.Account.GetOrder do
  @moduledoc false

  use ExBittrex.Interactor
  alias ExBittrex.Order

  def call(id) do
    :get
    |> HttpRequest.new("/account/getorder", uuid: id)
    |> Client.send()
    |> format_response()
  end

  defp format_response({:ok, result}) do
    response = Order.new(result)
    {:ok, response}
  end

  defp format_response({:error, message}), do: {:error, message}
end
