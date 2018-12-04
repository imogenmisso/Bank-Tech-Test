# frozen_string_literal: true

# This class is responsible managing transactions
class Account
  def initialize
    @balance = 0
    @transactions = []
  end

  attr_reader :balance, :transactions

  def deposit(amount, time = Time.now.strftime('%d/%m/%Y'))
    @balance += amount
    transaction = Transaction.new(time, "credit", format('%.2f', amount), format('%.2f', @balance))
    @transactions << [transaction]
  end

  def withdraw(amount, time = Time.now.strftime('%d/%m/%Y'))
    if @balance >= amount
      @balance -= amount
      transaction = Transaction.new(time, "debit", format('%.2f', amount), format('%.2f', @balance))
      @transactions << [transaction]
    else
      'Insufficient funds'
    end
  end
end
