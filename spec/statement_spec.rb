# frozen_string_literal: true

require 'statement'

describe 'Statement' do
  let(:time) { Time.now.strftime('%d/%m/%Y') }
  let(:account) { double :account, transactions: [[Transaction.new(time, 'credit', '10.00', '10.00')], [Transaction.new(time, 'credit', '100.00', '110.00')], [Transaction.new(time, 'debit', '5.00', '105.00')]] }

  let(:statement) { Statement.new(account) }

  it 'prints out the transactions on the account' do
    expect(statement.show).to eq "date || credit || debit || balance\n#{time} ||  || 5.00 || 105.00\n#{time} || 100.00 ||  || 110.00\n#{time} || 10.00 ||  || 10.00"
  end
end
