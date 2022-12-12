require 'transaction'

RSpec.describe 'Integration Tests' do
  context 'making a deposit' do
    it 'returns a single deposit transaction' do
      transaction = Transaction.new(500, '10-12-2022')
      account = Account.new
      account.deposit(transaction)
      expect(account.transactions).to eq [transaction]
    end
  end
end
