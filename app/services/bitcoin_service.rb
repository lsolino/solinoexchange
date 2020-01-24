require 'rest-client'
require 'json'

class BitcoinService 
  
  def initialize(source_currency, amount)
    @source_currency = source_currency
    @amount = amount.to_f
  end

  def perform
    begin
      url = "https://blockchain.info/tobtc?currency=#{@source_currency}&value=#{@amount}"
      response = RestClient.get url
      value = JSON.parse(response.body)['currency'][0]['value'].to_f
    rescue RestClient::ExceptionWithResponse => exception
      exception.response
    end
  end
end