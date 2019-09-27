Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :short_links, only: :create
  get '/:short_url', to: 'short_links#show', as: :short_link
end
