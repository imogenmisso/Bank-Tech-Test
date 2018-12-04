# frozen_string_literal: true

require 'statement'

describe 'Statement' do
  let(:time) { Time.now.strftime('%d/%m/%Y') }
  let(:transaction1) { double :transaction1, date: time, type: 'credit', amount: '10.00', balance: '10.00' }
  let(:transaction2) { double :transaction2, date: time, type: 'credit', amount: '100.00', balance: '110.00' }
  let(:transaction3) { double :transaction3, date: time, type: 'debit', amount: '5.00', balance: '105.00' }
  let(:account) { double :account, transactions: [[transaction1], [transaction2], [transaction3]] }

  let(:statement) { Statement.new(account) }

  it 'prints out the transactions on the account' do
    expect(statement.show).to eq "date || credit || debit || balance\n#{time} ||  || 5.00 || 105.00\n#{time} || 100.00 ||  || 110.00\n#{time} || 10.00 ||  || 10.00"
  end
end
