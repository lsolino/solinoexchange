require 'rest-client'
require 'json'

class BitcoinService 
  
  def initialize(source_currency, amount)
    @source_currency = source_currency
    @amount = amount.to_f
  end

  def perform
    begin
      puts ">>> #{@source_currency}"
      puts ">>> #{@amount}"
      url = "https://blockchain.info/tobtc?currency=#{@source_currency}&value=#{@amount}"
      response = RestClient.get url
      puts ">>> #{response.body}"
      value = JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse => exception
      exception.response
    end
  end
end