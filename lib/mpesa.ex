defmodule Mpesa do
  @initial_bal 1000
  @pin 1234
  def make_deposit(deposit_amount) do
    @initial_bal + deposit_amount
  end

  def make_withdrawal(client_pin, withdrawal_amount) do
    case {client_pin == @pin, @initial_bal >= withdrawal_amount} do
        {true, true} ->
          {:ok, "successful"}
          @initial_bal - withdrawal_amount
          # {:ok, "successful"}
        {false, _} ->
          {:error, "Incorrect pin, re_enter pin"}
        {true, false} ->
          {:error, "limited funds"}
      end
    end

  def send_money(send_amount) when @initial_bal > send_amount do
    @initial_bal - send_amount
  end

  def send_money(_send_amount) do
    "limited funds"
  end


  def buy_airtime(initial_bal, airtime_amount) when initial_bal > airtime_amount do
    initial_bal - airtime_amount
  end

  def buy_airtime(_initial_bal, _airtime_amount) do
    "unsuccessful purchase"
  end
end
