Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :messages do
    resources :comments
  end
  # generate a bunch of URLS for our messages controller associated with actions in the controller
  root 'messages#index'
end
