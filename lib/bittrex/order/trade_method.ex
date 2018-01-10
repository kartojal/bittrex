defmodule ExBittrex.Order.TradeMethod do
  alias ExBittrex.Order.TradeMethod

  defstruct [:code]

  def new(%{ImmediateOrCancel: true} = _order) do
    %TradeMethod{
      code: "IOC"
    }
  end

  def new(_order) do
    %TradeMethod{
      code: "GTC"
    }
  end
end
