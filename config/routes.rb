# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root 'website#index'

    get '/users', to: 'users#index'
    get '/users/:id', to: 'users#show'

    get '/forum', to: 'forum#index'
    match '/forum/:category_id', to: 'forum#category', as: :forum_category, via: [ :get, :post ]
    match '/forum/:category_id/:subcategory_id', to: 'forum#subcategory', as: :forum_subcategory, via: [ :get, :post ]
    match '/forum/:category_id/:subcategory_id/:topic_id', to: 'forum#topic', as: :forum_topic, via: [ :get, :post ]
  end
end
