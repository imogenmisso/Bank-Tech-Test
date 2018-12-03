# frozen_string_literal: true

class Statement
  def initialize(account = Account.new)
    @account = account
  end

  def show
    string = "date || credit || debit || balance\n"
    @account.transactions.reverse_each do |transaction|
      string += "#{transaction[0]} || #{transaction[1]} || #{transaction[2]} || #{transaction[3]}\n"
    end
    string.chomp
  end
end
