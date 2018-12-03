# frozen_string_literal: true

class Account
  def initialize
    @balance = 0
  end

  attr_reader :balance, :time

  def deposit(amount)
    @balance += amount
    @time = Time.now.strftime("%d/%m/%Y")
  end

  def withdraw(amount)
    if @balance >= amount
      @balance -= amount
      @time = Time.now.strftime("%d/%m/%Y")
    else
      @balance
    end
  end
end
