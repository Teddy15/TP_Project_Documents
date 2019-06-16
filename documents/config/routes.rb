Rails.application.routes.draw do
  resources :documents
  devise_for :models
  get '/' => 'documents#smth'
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
