Rails.application.routes.draw do
  root 'exchanges#index'
  get 'convert', to: 'exchanges#convert'
  get 'bitcoins', to: 'bitcoins#convert'
end
