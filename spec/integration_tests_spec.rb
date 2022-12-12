require 'transaction'
require 'statement'

RSpec.describe 'Integration Tests' do
  context 'making a deposit' do
    it 'returns a single deposit transaction' do
      transaction = Transaction.new(500, '10-12-2022')
      account = Account.new
      account.deposit(transaction)
      expect(account.transactions).to eq [transaction]
    end

    it 'returns a multiple deposit transaction' do
      transaction_1 = Transaction.new(500, '10-12-2022')
      transaction_2 = Transaction.new(300, '12-12-2022')
      account = Account.new
      account.deposit(transaction_1)
      account.deposit(transaction_2)
      expect(account.transactions).to eq [transaction_1, transaction_2]
    end
  end

  context 'making a withdrawal' do
    it 'returns a single withdrawal transaction' do
      transaction = Transaction.new(500, '10-12-2022')
      account = Account.new
      account.withdraw(transaction)
      expect(account.transactions).to eq [transaction]
    end
  end

  it 'returns multiple withdrawal transaction' do
    transaction_1 = Transaction.new(500, '10-12-2022')
    transaction_2 = Transaction.new(300, '12-12-2022')
    account = Account.new
    account.withdraw(transaction_1)
    account.withdraw(transaction_2)
    expect(account.transactions).to eq [transaction_1, transaction_2]
  end

  context 'printing a statement' do
    it 'returns an empty statement' do
      account = Account.new
      expect(account.print_statement).to eq ("date || credit || debit || balance")
    end
  end
end
