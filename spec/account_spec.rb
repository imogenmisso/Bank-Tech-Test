# frozen_string_literal: true
require 'Account'

describe 'Account' do

  it 'sets the initial balance of the account to zero' do
    account = Account.new
    expect(account.balance).to eq 0
  end

end
