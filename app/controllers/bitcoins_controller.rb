class BitcoinsController < ApplicationController

  def index
  end
  
  def convert
    value = BitcoinService.new(
      params[:source_currency_btc], 
      params[:amount_btc]
    ).perform
    
    render json: {value: value}
  end
end
