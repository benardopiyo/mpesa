defmodule Mpesa do
  @initial_bal 1000
  def make_deposit(deposit_amount) do
    @initial_bal + deposit_amount
  end

  def make_withdrawal(withdrawal_amount) when @initial_bal > withdrawal_amount do

    @initial_bal - withdrawal_amount
  end

  def make_withdrawal(_withdrawal_amount) do
    "unlimited funds"
  end

  def send_money(send_amount) when @initial_bal > send_amount do
    @initial_bal - send_amount
  end

  def send_money(_send_amount) do
    "unlimited funds"
  end


  def buy_airtime(initial_bal, airtime_amount) when initial_bal > airtime_amount do
    initial_bal - airtime_amount
  end

  def buy_airtime(_initial_bal, _airtime_amount) do
    "unsuccessful purchase"
  end

end
