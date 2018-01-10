defmodule ExBittrex.Order.OrderStatus do
  alias Bittrex.Order
  alias Bittrex.Order.OrderStatus

  @opened "OPENED"
  @closed "CLOSED"

  defstruct [:name, :at]

  def new(%{"Closed" => closed_at} = _order) do
    %OrderStatus{
      name: @closed,
      at: Bittrex.format_datetime(closed_at)
    }
  end

  def new(%{"Opened" => opened_at} = _order) do
    %OrderStatus{
      name: @opened,
      at: Bittrex.format_datetime(opened_at)
    }
  end

  def new(_), do: nil

  def closed?(%Order{status: %OrderStatus{name: @closed}} = _order), do: true
  def closed?(_order), do: false
end
