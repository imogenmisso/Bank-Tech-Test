# frozen_string_literal: true

feature 'Statement preview' do
  scenario 'User sees a statement of transactions' do
    account = Account.new
    statement = Statement.new(account)
    # Given a client makes a deposit of 1000 on 10-01-2012
    account.deposit(1000, '10/01/2012')
    expect(statement.show).to eq("date || credit || debit || balance\n10/01/2012 || 1000 ||  || 1000")

    # And a deposit of 2000 on 13-01-2012
    account.deposit(2000, '13/01/2012')
    expect(statement.show).to eq("date || credit || debit || balance\n13/01/2012 || 2000 ||  || 3000\n10/01/2012 || 1000 ||  || 1000")

    # And a withdrawal of 500 on 14-01-2012
    account.withdraw(500, '14/01/2012')
    # When she prints her bank statement
    expect(statement.show).to eq("date || credit || debit || balance\n14/01/2012 ||  || 500 || 2500\n13/01/2012 || 2000 ||  || 3000\n10/01/2012 || 1000 ||  || 1000")
  end
end
