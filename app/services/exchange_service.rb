require 'rest-client'
require 'json'

class ExchangeService 
  
  def initialize(source_currency, target_currency, amount)
    @source_currency = source_currency
    @target_currency = target_currency
    @amount = amount
  end

  def perform
    begin
      exchange_api_url = Rails.application.credentials[Rails.env.to_sym][:currency_api_url]
      exchange_api_key = Rails.application.credentials[Rails.env.to_sym][:currency_api_key]
      url = "#{exchange_api_url}?token=#{exchange_api_key}&currency=#{@source_currency}/#{@target_currency}"
      response = RestClient.get url
      value = JSON.parse(response.body)['currency'][0]['value'].to_f

      value * @amount
    rescue RestClient::ExceptionWithResponse => exception
      exception.response
    end
  end
end