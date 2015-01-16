Rails.application.routes.draw do
  root to: "short_urls#new"
  resources :short_urls

  get '/:short' => 'short_urls#redirect_me'

end