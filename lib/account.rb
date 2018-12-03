# frozen_string_literal: true

class Account
  def initialize
    @balance = 0
  end

  attr_reader :balance

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    if @balance >= amount
      @balance -= amount
    else
      @balance
    end
  end
end
