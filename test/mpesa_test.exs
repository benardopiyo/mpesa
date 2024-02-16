defmodule MpesaTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  doctest Mpesa

  setup do
    capture_io( ["0700000000", "30000000", "1234"], fn ->
      Mpesa.open_account()
    end)
    []
  end

  test "initial balance is 0" do




    assert Mpesa.balance() == "Your current balance is 0"
  end

  test "deposit/1" do

    assert Mpesa.balance() == "Your current balance is 0"
    Mpesa.deposit(100)
    assert Mpesa.balance() == "Your current balance is 100"
    Mpesa.deposit(200)
    assert Mpesa.balance == "Your current balance is 300"
  end

  test "withdraw/1 with sufficient balance" do

    assert Mpesa.balance() == "Your current balance is 0"
    Mpesa.deposit(100)
    Mpesa.withdraw(50)
    assert Mpesa.balance() == "Your current balance is 50"
  end

  test "withdraw/1 with insufficient balance" do

    assert Mpesa.withdraw(50) == "Failed insufficient funds"

    assert Mpesa.balance() == "Your current balance is 0"
  end
end
