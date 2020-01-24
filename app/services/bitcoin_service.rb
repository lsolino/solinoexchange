require 'rest-client'
require 'json'

class BitcoinService 
  
  def initialize(currency, amount)
    @currency = currency
    @amount = amount.to_f
  end

  def perform
    begin
      url = "https://blockchain.info/tobtc?currency=#{@currency}&value=#{@amount}"
      response = RestClient.get url
      value = JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse => exception
      exception.response
    end
  end
end