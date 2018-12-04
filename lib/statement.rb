# frozen_string_literal: true

require 'pry'
# This class is responsible for printing all the transactions
class Statement
  def initialize(account)
    @account = account
  end

  def show
    string = "date || credit || debit || balance\n"
    @account.transactions.reverse_each do |transaction|
      string += if transaction[0].type == 'credit'
                  credit_display(transaction)
                else
                  debit_display(transaction)
                end
    end
    string.chomp
  end

  private

  def credit_display(transaction)
    "#{transaction[0].date} || #{transaction[0].amount} ||  || #{transaction[0].balance}\n"
  end

  def debit_display(transaction)
    "#{transaction[0].date} ||  || #{transaction[0].amount} || #{transaction[0].balance}\n"
  end
end
