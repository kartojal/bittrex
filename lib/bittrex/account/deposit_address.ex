defmodule ExBittrex.Account.DepositAddress do
  alias ExBittrex.Currency
  alias ExBittrex.Account.DepositAddress

  defstruct [:currency, :wallet]

  def new(item) do
    %DepositAddress{
      wallet: item["Address"],
      currency: %Currency{
        name: item["Currency"]
      }
    }
  end
end
