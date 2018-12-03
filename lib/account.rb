# frozen_string_literal: true

class Account
  def initialize
    @balance = 0
    @transactions = []
  end

  attr_reader :balance, :transactions, :time

  def deposit(amount, time = Time.now.strftime('%d/%m/%Y'))
    @balance += amount
    @time = time
    @transactions << [time, amount, '', balance]
  end

  def withdraw(amount, time = Time.now.strftime('%d/%m/%Y'))
    if @balance >= amount
      @balance -= amount
      @time = time
      @transactions << [time, '', amount, balance]
    else
      'Insufficient funds to make transaction'
    end
  end
end
