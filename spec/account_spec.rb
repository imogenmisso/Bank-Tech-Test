# frozen_string_literal: true

require 'account'

describe 'Account' do
  let(:account) { Account.new }
  let(:time) { Time.now.strftime('%d/%m/%Y') }

  it 'sets the initial balance of the account to zero' do
    expect(account.balance).to eq 0
  end

  context '#deposit' do
    it 'allows users to add money to their account' do
      expect { account.deposit(10) }.to change { account.balance }.by(10)
    end

    it 'records the date that a deposit is made' do
      account.deposit(10, '02/01/2018')
      expect(account.transactions).to eq [['02/01/2018', "10.00", '', "10.00"]]
    end

    it 'sets a default date of today if no date given' do
      account.deposit(10)
      expect(account.transactions).to eq [[time, "10.00", '', "10.00"]]
    end
  end

  context '#withdraw' do
    it 'allows users to withdraw money from their account' do
      account.deposit(5)
      expect { account.withdraw(5) }.to change { account.balance }.by(-5)
    end

    it 'only allows user to withdraw money they have' do
      account.deposit(5)
      expect(account.withdraw(10)).to eq 'Insufficient funds'
    end

    it 'records the date a withdrawal is made' do
      account.deposit(10)
      account.withdraw(5)
      expect(account.transactions).to eq [[time, "10.00", '', "10.00"], [time, '', "5.00", "5.00"]]
    end
  end

  context '#transactions' do
    it 'stores a log of all transactions' do
      account.deposit(100, '03/12/2018')
      account.deposit(2, '04/11/2018')
      account.withdraw(20, '27/10/2018')
      expect(account.transactions).to eq [['03/12/2018', "100.00", '', "100.00"], ['04/11/2018', "2.00", '', "102.00"], ['27/10/2018', '', "20.00", "82.00"]]
    end
  end
end
