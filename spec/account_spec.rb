# frozen_string_literal: true

require 'account'

describe 'Account' do
  let(:account) { Account.new }

  it 'sets the initial balance of the account to zero' do
    expect(account.balance).to eq 0
  end

  it 'allows users to add money to their account' do
    expect { account.deposit(10) }.to change { account.balance }.by(10)
  end

  it 'allows users to withdraw money from their account' do
    account.deposit(5)
    expect { account.withdraw(5) }.to change { account.balance }.by(-5)
  end

  it 'only allows user to withdraw money they have' do
    account.deposit(5)
    account.withdraw(10)
    expect(account.balance).to eq 5
  end
end
