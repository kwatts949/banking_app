require 'transaction'

RSpec.describe 'Transaction' do
  it 'returns a transaction amount' do
    transaction = Transaction.new(500, '10-12-2022')
    expect(transaction.amount).to eq 500
  end

  it 'returns a transaction date' do
    transaction = Transaction.new(500, '10-12-2022')
    expect(transaction.date).to eq '10-12-2022'
  end

  it 'returns a nil credit' do
    transaction = Transaction.new(500, '10-12-2022')
    expect(transaction.credit).to eq nil
  end
end
