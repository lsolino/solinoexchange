$(document).ready ->
  $("#source_currency_btc").prop('disabled', true)

  $('#amount_btc').keyup ->
    exchange_btc();

  $('#btn-exchange-btc').click ->
    source_currency_btc = $("#source_currency_btc").val()
    target_currency_btc = $("#target_currency_btc").val()
    $("#source_currency_btc").val(target_currency_btc)
    $("#target_currency_btc").val(source_currency_btc)
    
    if $("#source_currency_btc").prop('disabled')  
        $("#source_currency_btc").prop('disabled', false)
        $("#target_currency_btc").prop('disabled', true)
    else 
        $("#source_currency_btc").prop('disabled', true)
        $("#target_currency_btc").prop('disabled', false)

    exchange_btc();

  exchange_btc = ->
    if $('form').attr('action') == '/convert'
      $.ajax '/convert',
          type: 'GET'
          dataType: 'json'
          data: {
                  source_currency: $("#source_currency_btc").val(),
                  target_currency: $("#target_currency_btc").val(),
                  amount: $("#amount_btc").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result_btc').val(data.value)
        return false;