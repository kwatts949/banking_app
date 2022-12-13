require 'account'

RSpec.describe 'Account' do
  it 'initially returns an empty array of transactions' do
    account = Account.new
    expect(account.transactions).to eq []
  end

  context 'making a withdrawal' do
    it 'returns an array of withdrawal objects' do
      account = Account.new
      fake_withdrawal_1 = double(amount: 500, date: "01-12-2022", credit: nil)
      fake_withdrawal_2 = double(amount: 700, date: "02-12-2022", credit: nil)
      account.withdraw(fake_withdrawal_1)
      account.withdraw(fake_withdrawal_2)
      expect(account.transactions).to eq [fake_withdrawal_1, fake_withdrawal_2]
    end
  end

  context 'making a deposit' do
    it 'returns an array of deposit objects' do
      account = Account.new
      fake_deposit_1 = double(amount: 1000, date: "01-12-2022", credit: nil)
      fake_deposit_2 = double(amount: 700, date: "02-12-2022", credit: nil)
      expect(fake_deposit_1).to receive(:credit=).with('true')
      account.deposit(fake_deposit_1)
      expect(fake_deposit_2).to receive(:credit=).with('true')
      account.deposit(fake_deposit_2)
      expect(account.transactions).to eq [fake_deposit_1, fake_deposit_2]
    end
  end

  context 'making a deposit & withdrawal' do
    it 'returns an array of objects' do
      account = Account.new

      fake_deposit_1 = double(amount: 1000, date: "01-12-2022", credit: 'true')
      fake_withdrawal_1 = double(amount: 500, date: "01-12-2022", credit: nil)

      expect(fake_deposit_1).to receive(:credit=).with('true')
      account.deposit(fake_deposit_1)
      account.withdraw(fake_withdrawal_1)
      
      expect(account.transactions).to eq [fake_deposit_1, fake_withdrawal_1]
    end
  end

  context 'printing a statement' do
    it 'returns an empty statement' do
      account = Account.new
      expect do
        account.print_statement
      end.to output( "\"date || credit || debit || balance\"\n\"  ||  ||  || 0.00\"\n").to_stdout
    end

    it 'returns a statement with deposits and withdrawals' do
      account = Account.new

      fake_deposit_1 = double(amount: 1000, date: "01-12-2022", credit: 'true')
      fake_deposit_2 = double(amount: 2000, date: "02-12-2022", credit: 'true')
      fake_withdrawal_1 = double(amount: 500, date: "03-12-2022", credit: nil)

      expect(fake_deposit_1).to receive(:credit=).with('true')
      expect(fake_deposit_2).to receive(:credit=).with('true')

      account.deposit(fake_deposit_1)
      account.deposit(fake_deposit_2)
      account.withdraw(fake_withdrawal_1)

      expect do
        account.print_statement
      end.to output("\"date || credit || debit || balance\"\n\"03-12-2022 || || 500.00 || 2500.00\"\n\"02-12-2022 || 2000.00 || || 3000.00\"\n\"01-12-2022 || 1000.00 || || 1000.00\"\n").to_stdout
    end
  end
end