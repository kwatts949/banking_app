require 'account'

RSpec.describe 'Account' do
  it 'returns an empty array of transactions' do
    account = Account.new
    expect(account.transactions).to eq []
  end
end