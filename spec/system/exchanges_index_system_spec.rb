require 'rails_helper'
 
RSpec.describe "Exchange Currency Process", :type => :system, js: true do
  # it "show exchanged value" do

  #   visit '/'
    
  #   within("#exchange_form") do
  #     select('EUR', from: 'source_currency')
  #     select('USD', from: 'target_currency')
  #     fill_in 'amount', with: rand(1..9999)
  #   end

  #   click_button 'CONVERTER'
 
  #   expect(page).to have_content("value")
  # end

  it "invert exchange currency" do

    visit '/'

    within("#exchange_form") do
      select('EUR', from: 'source_currency')
      select('USD', from: 'target_currency')
      fill_in 'amount', with: rand(1..9999)
    end

    find('.icon-exchange').click
  
    source_currency = find_field('source_currency').value
    target_currency = find_field('target_currency').value

    expect(source_currency).to eq ('EUR')
    expect(target_currency).to eq ('USD')
  end
end