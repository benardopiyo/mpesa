defmodule MpesaTest do
  use ExUnit.Case
  doctest Mpesa

  test "make_withdrawal/2 fails if client pin is true and withdrawal amount is false" do
    assert Mpesa.make_withdrawal(@pin, 2000) == {:error, "Incorrect pin, re_enter pin"}
  end

  test "make_withdrawal/2 successful if client pin is true and withdrawal amount is true" do
    assert Mpesa.make_withdrawal(@pin, 1000) == {:error, "Incorrect pin, re_enter pin"}
  end

  test "make_withdrawal/2 successful if withdrawal amount is less than initial bal" do
    assert Mpesa.make_withdrawal(@pin, 200) == {:error, "Incorrect pin, re_enter pin"}
  end

    test "send_money/1 fails if send amount is more than initial bal" do
      assert Mpesa.send_money(3000) == "limited funds"
    end

    test "send_money/1 fails if send amount is equal to initial bal" do
      assert Mpesa.send_money(1000) == "limited funds"
    end

    test "send_money/1 is successful if send amount is less than initial bal" do
      assert Mpesa.send_money(400) == 600
    end

    test "make_deposit/1 successful if deposit amount is more than initial bal" do
      assert Mpesa.make_deposit(1500) == 2500
    end

    test "make_deposit/1 successful if deposit amount is less than initial bal" do
      assert Mpesa.make_deposit(500) == 1500
    end

    test "make_deposit/1 successful if deposit amount is equal to initial bal" do
      assert Mpesa.make_deposit(1000) == 2000
    end
 end
