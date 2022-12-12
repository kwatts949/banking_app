require 'transaction'

RSpec.describe 'Transaction' do
  it 'returns a transaction amount' do
    transaction = Transaction.new(500, '10-12-2022')
    expect(transaction.amount).to eq 500
  end
end