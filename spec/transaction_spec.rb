require 'transaction'

describe 'Transaction' do
  let(:transaction) { Transaction.new("01/12/2018", "credit", 100, 100) }
  let(:time) { Time.now.strftime('%d/%m/%Y') }

  it "is instantiated with a date" do
    expect(transaction.date).to eq "01/12/2018"
  end
  it "is instantiated with a type" do
    expect(transaction.type).to eq "credit"
  end
  it "is instantiated with an amount" do
    expect(transaction.amount).to eq 100
  end
  it "is instantiated with a balance" do
    expect(transaction.balance).to eq 100
  end
  it 'sets a default date of today if no date given' do
    transaction = Transaction.new("credit", 100, 100)
    expect(transaction.date).to eq time
  end
end
