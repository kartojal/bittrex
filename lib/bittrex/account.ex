defmodule ExBittrex.Account do
  alias Bittrex.Interactor.Account.{
    GetBalances,
    GetBalance,
    GetDepositAddress,
    Withdraw,
    GetOrderHistory,
    GetOrder,
    GetWithdrawalHistory,
    GetDepositHistory
  }

  def get_balances do
    GetBalances.call()
  end

  def get_balance(currency) do
    GetBalance.call(currency)
  end

  def get_deposit_address(currency) do
    GetDepositAddress.call(currency)
  end

  def withdraw(currency, quantity, address, paymentid) do
    Withdraw.call(currency, quantity, address, paymentid)
  end

  def get_order_history(market_name) do
    GetOrderHistory.call(market_name)
  end

  def get_order(id) do
    GetOrder.call(id)
  end

  def get_withdrawal_history(currency) do
    GetWithdrawalHistory.call(currency)
  end

  def get_deposit_history(currency) do
    GetDepositHistory.call(currency)
  end
end
