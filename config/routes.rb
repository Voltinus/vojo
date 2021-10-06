# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root 'website#index'

    get '/users', to: 'users#index'
    get '/users/:id', to: 'users#show'
  end
end
