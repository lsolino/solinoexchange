require 'spec_helper'
require 'json'
require './app/services/bitcoin_service'
 
describe 'Currency' do
  it 'bitcoin' do
    amount = rand(0..9999)
    res = BitcoinService.new("BRL", amount).perform
    expect(res != 0 || amount == 0).to eql(true)
  end
end