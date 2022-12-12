require 'statement'

RSpec.describe 'Statement' do
  it 'prints an empty statement to the console' do
    statement = Statement.new
    expect do
      statement.display([])
    end.to output("\"date || credit || debit || balance\"\n\"  ||  ||  || 0.00\"\n").to_stdout
  end

  it 'prints a deposit transaction to the console' do
    statement = Statement.new
    fake_deposit = double(:deposit, amount: 500, date: "01-12-2022", credit: 'true')
    expect do
      statement.display([fake_deposit])
    end.to output("\"date || credit || debit || balance\"\n\"01-12-2022 || 500.00 ||  || 500.00\"\n").to_stdout
  end

  it 'prints two deposit transactions to the console and shows the correct balance' do
    statement = Statement.new
    fake_deposit_1 = double(:deposit, amount: 500, date: "01-12-2022", credit: 'true')
    fake_deposit_2 = double(:deposit, amount: 800, date: "02-12-2022", credit: 'true')
    expect do
      statement.display([fake_deposit_1, fake_deposit_2])
    end.to output("\"date || credit || debit || balance\"\n\"01-12-2022 || 500.00 ||  || 500.00\"\n\"02-12-2022 || 800.00 ||  || 1300.00\"\n").to_stdout
  end
end