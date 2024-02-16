defmodule Mpesa do


  def open_account do
    {phone_number, id_number, pin_no} = handle_user_input()
    Agent.start_link(
      fn -> %{phone_number: phone_number, id_number: id_number, pin: pin_no, balance: 0} end,
      name: __MODULE__
    )
  end

  def balance do
    "Your current balance is #{get_current_balance()}"
  end

  def deposit(amount) do
    new_balance = get_current_balance() + amount

    value = %{balance: new_balance}
    update_state(value)
  end

  def withdraw(amount) do
    balance = get_current_balance()

    if balance > amount do
      new_balance = balance - amount
      value = %{balance: new_balance}
      update_state(value)
    else
      "Failed insufficient funds"
    end
  end
  defp handle_user_input do
    IO.puts "You are about to open account with us kindly follow the prompts: \n"

   phone_number = enter_phone_number()
   id_number = enter_id_number()
   pin_number = enter_pin_number()
   {phone_number, id_number, pin_number}
  end
  defp enter_phone_number do
    phone_number = IO.gets("Kindly enter  your Phone Number:\n")
   parse_user_input(phone_number)

  end
  defp enter_id_number do
    id_number = IO.gets("Kindly enter  your ID Number:\n")
     parse_user_input(id_number)

  end
  defp enter_pin_number do
    pin_number = IO.gets("Kindly enter  your Pin Number:\n")
    parse_user_input(pin_number)

  end
  def parse_user_input(user_input) do
    case user_input do
      :eof -> ""
       {:error, _} -> ""
       user_input -> String.trim(user_input)
    end
  end
  defp get_current_balance do
    %{balance: balance} = get_current_state()
    balance
  end

  defp get_current_state do
    Agent.get(__MODULE__, & &1)
  end

  defp update_state(value) do
    state = get_current_state()
    new_state = Map.merge(state, value)
    Agent.update(__MODULE__, fn _ -> new_state end)
  end
end
