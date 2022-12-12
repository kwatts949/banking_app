require 'statement'

RSpec.describe 'Statement' do

  it 'prints an empty statement to the console' do
    statement = Statement.new
    expect do
      statement.display([])
    end.to output("\"date || credit || debit || balance\"\n\"  ||  ||  || 0.00\"\n").to_stdout
    end

  context 'deposits' do
    it 'prints a deposit transaction to the console' do
      statement = Statement.new
      fake_deposit = double(:deposit, amount: 500, date: "01-12-2022", credit: 'true')
      expect do
        statement.display([fake_deposit])
      end.to output("\"date || credit || debit || balance\"\n\"01-12-2022 || 500.00 || || 500.00\"\n").to_stdout
    end

    it 'prints two deposit transactions to the console and shows the correct balance' do
      statement = Statement.new
      fake_deposit_1 = double(:deposit, amount: 500, date: "01-12-2022", credit: 'true')
      fake_deposit_2 = double(:deposit, amount: 800, date: "02-12-2022", credit: 'true')
      expect do
        statement.display([fake_deposit_1, fake_deposit_2])
      end.to output("\"date || credit || debit || balance\"\n\"02-12-2022 || 800.00 || || 1300.00\"\n\"01-12-2022 || 500.00 || || 500.00\"\n").to_stdout
    end
  end

  context 'withdrawals' do
    it 'prints a single withdrawal to the console' do
      statement = Statement.new
      fake_withdrawal_1 = double(:withdrawal, amount: 500, date: "01-12-2022", credit: nil)
      expect do
        statement.display([fake_withdrawal_1])
      end.to output("\"date || credit || debit || balance\"\n\"01-12-2022 || || 500.00 || -500.00\"\n").to_stdout
    end

    it 'prints two withdrawals to the console & displays the correct balance' do
      statement = Statement.new
      fake_withdrawal_1 = double(:withdrawal, amount: 500, date: "01-12-2022", credit: nil)
      fake_withdrawal_2 = double(:withdrawal, amount: 1000, date: "03-12-2022", credit: nil)
      expect do
        statement.display([fake_withdrawal_1, fake_withdrawal_2])
      end.to output("\"date || credit || debit || balance\"\n\"03-12-2022 || || 1000.00 || -1500.00\"\n\"01-12-2022 || || 500.00 || -500.00\"\n").to_stdout
    end
  end
end