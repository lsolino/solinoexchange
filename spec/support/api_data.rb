RSpec.configure do |config|
  config.before(:each) do   
    stub_request(:get, /currencydatafeed.com/ )
    .with(headers: {
      'Accept'=>'*/*'
    }).to_return(status: 200, body: '
      {
        "status": true,
        "currency": [
            {
                "currency": "USD/BRL",
                "value": "4.18",
                "date": "2020-01-22 12:45:39",
                "type": "original"
            }
        ]
      }', headers: {})

    stub_request(:get, /blockchain.info/ )
    .with(headers: {
      'Accept'=>'*/*'
    }).to_return(status: 200, body: '
      {
        "status": true,
        "currency": [
            {
                "currency": "BRL",
                "value": 35000
            }
        ]
      }', headers: {})
  end
end