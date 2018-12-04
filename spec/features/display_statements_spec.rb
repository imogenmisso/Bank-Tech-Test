# frozen_string_literal: true

require 'account'
require 'statement'
require 'pry'

feature 'Statement preview' do
  scenario 'User sees a statement of transactions' do
    account = Account.new
    statement = Statement.new(account)
    # Given a client makes a deposit of 1000 on 10-01-2012
    account.deposit(1000, '10/01/2012')
    expect(statement.show).to eq("date || credit || debit || balance\n10/01/2012 || 1000.00 ||  || 1000.00")

    # And a deposit of 2000 on 13-01-2012
    account.deposit(2000, '13/01/2012')
    expect(statement.show).to eq("date || credit || debit || balance\n13/01/2012 || 2000.00 ||  || 3000.00\n10/01/2012 || 1000.00 ||  || 1000.00")

    # And a withdrawal of 500 on 14-01-2012
    account.withdraw(500, '14/01/2012')
    # When she prints her bank statement
    expect(statement.show).to eq("date || credit || debit || balance\n14/01/2012 ||  || 500.00 || 2500.00\n13/01/2012 || 2000.00 ||  || 3000.00\n10/01/2012 || 1000.00 ||  || 1000.00")
  end
end
