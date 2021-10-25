Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  default_url_options :host => "localhost:3000"

  get '/s/:slug', to: 'shortened_urls#show', as: :short
  resources :shortened_urls, only: [:index, :create, :show]


end
