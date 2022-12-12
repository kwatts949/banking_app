require 'statement'

RSpec.describe 'Statement' do
  xit 'prints the header to the console' do
    statement = Statement.new
    expect(statement.display([])).to eq "date || credit || debit || balance"
  end
end