Threepo::Application.routes.draw do
  devise_for :users

  root 'designs#index'

  resources :designs
end
