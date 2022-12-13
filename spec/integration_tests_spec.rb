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
      transaction1 = Transaction.new(500, '10-12-2022')
      transaction2 = Transaction.new(300, '12-12-2022')
      account = Account.new
      account.deposit(transaction1)
      account.deposit(transaction2)
      expect(account.transactions).to eq [transaction1, transaction2]
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
    transaction1 = Transaction.new(500, '10-12-2022')
    transaction2 = Transaction.new(300, '12-12-2022')
    account = Account.new
    account.withdraw(transaction1)
    account.withdraw(transaction2)
    expect(account.transactions).to eq [transaction1, transaction2]
  end

  context 'printing a statement' do
    it 'returns an empty statement' do
      account = Account.new
      expect do
        account.print_statement
      end.to output("\"date || credit || debit || balance\"\n\"  ||  ||  || 0.00\"\n").to_stdout
    end

    it 'returns a statement containing a deposit' do
      account = Account.new
      transaction1 = Transaction.new(500, '10-12-2022')
      account.deposit(transaction1)
      expect do
        account.print_statement
      end.to output("\"date || credit || debit || balance\"\n\"10-12-2022 || 500.00 || || 500.00\"\n").to_stdout
    end

    it 'returns a statement containing two deposits' do
      account = Account.new
      transaction1 = Transaction.new(500, '10-12-2022')
      transaction2 = Transaction.new(300, '12-12-2022')
      account.deposit(transaction1)
      account.deposit(transaction2)
      expect do
        account.print_statement
      end.to output("\"date || credit || debit || balance\"\n\"12-12-2022 || 300.00 || || 800.00\"\n\"10-12-2022 || 500.00 || || 500.00\"\n").to_stdout
    end

    it 'returns a statement containing a withdrawal' do
      account = Account.new
      transaction1 = Transaction.new(500, '10-12-2022')
      account.withdraw(transaction1)
      expect do
        account.print_statement
      end.to output("\"date || credit || debit || balance\"\n\"10-12-2022 || || 500.00 || -500.00\"\n").to_stdout
    end

    it 'returns a statement containing withdrawals and deposits' do
      account = Account.new
      transaction1 = Transaction.new(500, '10-12-2022')
      transaction2 = Transaction.new(300, '12-12-2022')
      transaction3 = Transaction.new(100, '12-12-2022')
      account.deposit(transaction1)
      account.withdraw(transaction2)
      account.deposit(transaction3)
      expect do
        account.print_statement
      end.to output("\"date || credit || debit || balance\"\n\"12-12-2022 || 100.00 || || 300.00\"\n\"12-12-2022 || || 300.00 || 200.00\"\n\"10-12-2022 || 500.00 || || 500.00\"\n").to_stdout
    end
  end
end
