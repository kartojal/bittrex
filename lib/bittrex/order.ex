defmodule ExBittrex.Order do
  alias ExBittrex.Interactor.Order.{CancelOrder}
  alias ExBittrex.Order.{OrderStatus, OrderCondition, TradeMethod}
  alias ExBittrex.{Order, Market}

  defstruct [
    :id,
    :quantity,
    :quantity_remaining,
    :price,
    :type,
    :total,
    :fill_type,
    :limit,
    :commision,
    :price_per_unit,
    :status,
    :condition,
    :market,
    :traded_at,
    :cancelation_initiated,
    :trade_method
  ]

  def cancel_order(order_id) do
    CancelOrder.call(order_id)
  end

  def new(item) do
    item
    |> get_order_type()
    |> new(item)
  end

  def new(type, item) do
    %Order{
      id: get_order_id(item),
      price: get_price(item),
      type: String.upcase(type),
      traded_at: ExBittrex.format_datetime(item["TimeStamp"]),
      quantity: %{
        value: item["Quantity"],
        remaining: item["QuantityRemaining"]
      },
      total: item["Total"],
      fill_type: item["FillType"],
      limit: item["Limit"],
      commision: %{
        paid: item["CommissionPaid"],
        reserved: item["CommissionReserved"],
        reserved_remaining: item["CommissionReserveRemaining"]
      },
      price_per_unit: item["PricePerUnit"],
      status: OrderStatus.new(item),
      condition: OrderCondition.new(item),
      cancelation_initiated: item["CancelInitiated"],
      trade_method: TradeMethod.new(item),
      market: Market.new(item["Exchange"])
    }
  end

  defp get_order_id(item) do
    item["OrderUuid"] || item["Uuid"] || item["uuid"]
  end

  defp get_price(item) do
    item["Rate"] || item["Price"]
  end

  defp get_order_type(item) do
    item["OrderType"] || item["Type"]
  end
end
