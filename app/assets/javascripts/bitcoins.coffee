$(document).ready ->

  $('#amount_btc').keyup ->
    exchange_btc();

  exchange_btc = ->
    if $('form').attr('action') == '/convert'
      
      $.ajax '/convert',
          type: 'GET'
          dataType: 'json'
          data: {
            source_currency_btc: $("#source_currency_btc").val(),
            amount_btc: $("#amount_btc").val()
          }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) -> 
            $('#result_btc').val(data.value)
            console.log(data)
        return false;