# frozen_string_literal: true

require 'statement'

describe 'Statement' do
  let(:time) { Time.now.strftime('%d/%m/%Y') }
  let(:account) { double :account, transactions: [[time, 10, '', 10], [time, 100, '', 110], [time, '', 5, 105]] }

  let(:statement) { Statement.new(account) }

  it 'prints out the transactions on the account' do
    expect(statement.show).to eq "date || credit || debit || balance\n03/12/2018 ||  || 5 || 105\n03/12/2018 || 100 ||  || 110\n03/12/2018 || 10 ||  || 10"
  end
end
