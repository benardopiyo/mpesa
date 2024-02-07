defmodule Mpesa do
  @initial_bal 1000
  def make_deposit(deposit_amount) do
    @initial_bal + deposit_amount
  end

  # make_withdrawal
  def make_withdrawal(withdrawal_amount) when @initial_bal > withdrawal_amount do

    @initial_bal - withdrawal_amount
  end

  def make_withdrawal(withdrawal_amount) do
    "unlimited funds"
  end

  # defp enter_agentNo(num_agent) do
  #   int(num_agent)
  # end

  # defp enter_storeNo(num_store) do
  #   int(num_store)
  # end

  # send_money
  def send_money(send_amount) when @initial_bal > send_amount do
    @initial_bal - send_amount
  end

  def send_money(send_amount) do
    "unlimited funds"
  end

  # buy_airtime
  def buy_airtime(initial_bal, airtime_amount) when initial_bal > airtime_amount do
    initial_bal - airtime_amount
  end

  def buy_airtime(initial_bal, airtime_amount) do
    "unsuccessful purchase"
  end

  # def enter_receiverNo(num_receiver) do
  #   int(num_receiver)  #10 digit integer
  # end
end
