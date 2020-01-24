require 'rails_helper'

RSpec.describe "Exchanges-Bitcoins", type: :request do
  
  describe "GET /bitcoins" do
    it "returns http success" do
      get '/bitcoins'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #convert' do
    before do
      @amount = rand(1..9999)
    end

    it 'returns http success' do
      get '/convert', params: {
        source_currency: "BRL",
        amount: @amount
      }
      expect(response).to have_http_status(200)
    end
  end

end
