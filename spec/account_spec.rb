# frozen_string_literal: true
require 'account'

describe 'Account' do

  it 'sets the initial balance of the account to zero' do
    account = Account.new
    expect(account.balance).to eq 0
  end

  it "allows users to add money to their account" do
    account = Account.new
    expect{account.deposit(10)}.to change{account.balance}.by(10)
  end

end
